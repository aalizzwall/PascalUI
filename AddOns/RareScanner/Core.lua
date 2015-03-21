-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local LibStub = _G.LibStub

local ADDON_NAME, private = ...
local RareScanner = LibStub("AceAddon-3.0"):NewAddon("RareScanner")

-- Locales
local AL = LibStub("AceLocale-3.0"):GetLocale("RareScanner");

-- Settings
local PROFILE_DEFAULTS = {
	profile = {
		general = {
			scanRares = true,
			scanContainers = true,
			scanEvents = true,
		},
		sound = {
			soundPlayed = "Siege Engineer Weapon",
		},
		display = {
			displayButton = true,
			autoHideButton = 0,
			displayChatMessage = true,
		}
	},
}
-- Main button
local scanner_button = _G.CreateFrame("Button", "scanner_button", UIParent, "SecureActionButtonTemplate,SecureHandlerShowHideTemplate")
scanner_button:Hide();
scanner_button:SetFrameStrata("FULLSCREEN_DIALOG")
scanner_button:SetSize(200, 50)
scanner_button:SetScale(1.25)
-- Macro in order to target onclck
scanner_button:SetAttribute("type", "macro")

-- Textures
scanner_button:SetNormalTexture([[Interface\AchievementFrame\UI-Achievement-Parchment-Horizontal-Desaturated]])
scanner_button:SetBackdrop({
	tile = true,
	edgeSize = 16,
	edgeFile = [[Interface\Tooltips\UI-Tooltip-Border]]
})

scanner_button:SetBackdropBorderColor(0, 0, 0) -- Black

-- Effects hover
scanner_button:SetScript("OnEnter", function(self)
	self:SetBackdropBorderColor(0.9, 0.9, 0.9) -- White
end)

scanner_button:SetScript("OnLeave", function(self)
	self:SetBackdropBorderColor(0, 0, 0) -- Black
end)

-- Main frame position
scanner_button:SetPoint("BOTTOM", UIParent, 0, 128)

-- Model view
scanner_button.ModelView = _G.CreateFrame("PlayerModel", "mxpplayermodel", scanner_button)
scanner_button.ModelView:SetPoint("BOTTOMLEFT", scanner_button, "TOPLEFT", 0, -2) -- bottom left corner 2px separation from scanner_button's top left corner
scanner_button.ModelView:SetPoint("RIGHT")
scanner_button.ModelView:SetHeight(120)
scanner_button.ModelView:SetScale(1.25)

local Background = scanner_button:GetNormalTexture()
Background:SetDrawLayer("BACKGROUND")
Background:ClearAllPoints()
Background:SetPoint("BOTTOMLEFT", 3, 3)
Background:SetPoint("TOPRIGHT", -3, -3)
Background:SetTexCoord(0, 1, 0, 0.25)

-- Title
local TitleBackground = scanner_button:CreateTexture(nil, "BORDER")
TitleBackground:SetTexture([[Interface\AchievementFrame\UI-Achievement-RecentHeader]])
TitleBackground:SetPoint("TOPRIGHT", 0, -7)
TitleBackground:SetPoint("LEFT", 5, 0)
TitleBackground:SetSize(180, 18)
TitleBackground:SetTexCoord(0, 1, 0, 1)
TitleBackground:SetAlpha(0.8)

scanner_button.Title = scanner_button:CreateFontString(nil, "OVERLAY", "GameFontHighlightMedium", 1)
scanner_button.Title:SetPoint("TOPLEFT", TitleBackground, 0, 0)
scanner_button.Title:SetPoint("RIGHT", TitleBackground)
scanner_button.Title:SetText("TESTING")
scanner_button:SetFontString(scanner_button.Title)

local Description = scanner_button:CreateFontString(nil, "OVERLAY", "SystemFont_Tiny")
Description:SetPoint("BOTTOMLEFT", TitleBackground)
Description:SetPoint("RIGHT", -8, 0)
Description:SetTextHeight(6)
Description:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)

scanner_button.Description_text = scanner_button:CreateFontString(nil, "OVERLAY", "GameFontWhiteTiny")
scanner_button.Description_text:SetPoint("TOPLEFT", Description, "BOTTOMLEFT", 0, -4)
scanner_button.Description_text:SetPoint("RIGHT", Description)

-- Mouse events
scanner_button:SetMovable(true)
scanner_button:SetUserPlaced(true)
scanner_button:SetClampedToScreen(true)
scanner_button:RegisterForDrag("LeftButton")
scanner_button:SetScript("OnDragStart", scanner_button.StartMoving)
scanner_button:SetScript("OnDragStop", scanner_button.StopMovingOrSizing)

-- Vignette events
scanner_button:RegisterEvent("VIGNETTE_ADDED")

-- Out of combat events
local pendingToShow
local nameToShow
local foundDisplayId
scanner_button:RegisterEvent("PLAYER_REGEN_ENABLED")

-- Captures all events
scanner_button:SetScript("OnEvent", function(self, event, instanceid)
	if event == "VIGNETTE_ADDED" then
		self:CheckNotificationCache(self, instanceid)
	elseif event == "PLAYER_REGEN_ENABLED" then
		if pendingToShow then
			self:ShowButton(self, nameToShow, foundDisplayId)
			pendingToShow = nil
		end
	else
		return
	end
end)

-- Checks if the rare has been found already in the last 5 minutes
local already_notified = {}
function scanner_button:CheckNotificationCache(self, id)
	-- Get viggnette data
	local x, y, name, iconid = C_Vignettes.GetVignetteInfoFromInstanceID(id)

	-- Options disabled/enabled
	if iconid then
		if iconid == 40 and not private.db.general.scanContainers then
			return
		elseif iconid == 41 and not private.db.general.scanRares then
			return
		elseif iconid == 42 and not private.db.general.scanEvents then
			return
		end
	end
	
	-- Check if we have found the NPC in the last 5 minutes
	if already_notified[id] then
		return
	else
		-- print("|cffff0000The vignette with ID "..id.." won't be scanned for the next 5 minutes")
		already_notified[id] = true
	end
	
	-- Play de sound
	PlaySoundFile(private.SOUNDS[private.db.sound.soundPlayed], "Master")
	
	-- displayId for the NPC found
	local idFound
	
	-- If couldn't fetch name
	if not name then
		RaidNotice_AddMessage(RaidWarningFrame, AL["ALARM_MESSAGE"], ChatTypeInfo["RAID_WARNING"])
		self.Title:SetText(AL["CHECK_MAP"])
		self.Description_text:SetText(AL["UNKNOWN_TARGET"])
	else
		RaidNotice_AddMessage(RaidWarningFrame, name..AL["JUST_SPAWNED"], ChatTypeInfo["RAID_WARNING"])
		self.Title:SetText(name)
		
		-- Depending in the vignnette found show one message or another
		if iconid then
			-- print("Found next iconid "..iconid)
			if iconid == 40 or iconid == 42 then --40 object and 42 event
				self.Description_text:SetText(AL["NOT_TARGETEABLE"])
			else
				self.Description_text:SetText(AL["CLICK_TARGET"])
			end
		end
		
		-- Extract NPC id from database
		idFound = AL[name]
		
		-- With the NPC id extracts the Display id
		local displayId = private.NPC_DISPLAY_IDS[idFound]
		
		-- If NPC identified properly show its model and 
		-- setup target button
		if displayId and displayID ~= 0 then
			-- print("Found NPC with ID "..idFound.." and DisplayID "..displayId)
			self.ModelView:SetDisplayInfo(displayId)
		else
			idFound = nil
		end
		
		-- Print message in chat if user wants
		if private.db.display.displayChatMessage then
			print(name..AL["JUST_SPAWNED"].." "..AL["CHECK_MAP"])
		end
	end
	
	-- Show button if user wants
	if private.db.display.displayButton then	
		-- Wow API doesnt allow to call Show() (protected function) if you are under attack, so
		-- we check if this is the situation to avoid it and show the frames
		-- once the battle is over (pendingToShow)
		if not InCombatLockdown() then
			-- show button
			self:ShowButton(self, name, idFound)
		else
			nameToShow = name;
			foundDisplayId = idFound
			pendingToShow = true
		end
	end
	
	-- delete found rares after 5 minutes
	local timer = 0
	local checker = CreateFrame("Frame")
	checker:Show()

	checker:SetScript("OnUpdate", function(self, elapsed)
		timer = timer + elapsed

		if timer >= 350 then
			-- print("|cffff0000The vignette with ID "..id.." is added to the scan list")
			already_notified[id] = false
			self:SetScript("OnUpdate", nil)
		end
	end)
end

-- Show action
local checker = CreateFrame("Frame")
function scanner_button:ShowButton(self, name, idFound)
	-- focus target
	if name and idFound then
		self:SetAttribute("macrotext", "/cleartarget\n/targetexact " ..name)
		self.ModelView:Show()
	else
		self:SetAttribute("macrotext", private.macrotext)
		self.ModelView:ClearModel()
		self.ModelView:Hide()
	end
	
	-- show button
	self:Show()
	
	-- set the time to auto hide
	if private.db.display.autoHideButton ~= 0 then
		local timer = 0
		local timeMilis = private.db.display.autoHideButton 
		-- print("AUTOHIDE TIMER SET TO "..timeMilis.."sec")

		-- New window, stop previous timer if there was one
		checker:SetScript("OnUpdate", nil)
		checker:Show()
	
		-- Set new timer
		checker:SetScript("OnUpdate", function(self, elapsed)
			timer = timer + elapsed

			if timer >= timeMilis then
				scanner_button.ModelView:ClearModel()
				scanner_button.ModelView:Hide()
				scanner_button:Hide()
				self:SetScript("OnUpdate", nil)
			end
		end)
	end	
end

-- Close button
local CloseButton = _G.CreateFrame("Button", "CloseButton", scanner_button, "UIPanelCloseButton")
CloseButton:SetPoint("BOTTOMRIGHT")
CloseButton:SetSize(32, 32)
CloseButton:SetScale(0.8)
CloseButton:SetHitRectInsets(8, 8, 8, 8)

-- Load settings onInitialize
function RareScanner:OnInitialize() 
	self.db = LibStub("AceDB-3.0"):New("RareScannerDB", PROFILE_DEFAULTS, true)
	
	-- Adds about panel to wow options
	local about_panel = LibStub:GetLibrary("LibAboutPanel", true)
	if about_panel then
		self.optionsFrame = about_panel.new(nil, "RareScanner")
	end
	
	self:SetupOptions()
	private.db = self.db.profile
end