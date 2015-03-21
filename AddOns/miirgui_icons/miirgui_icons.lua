--[[Setting up the icon-function]]

		local function Icon(arg1, arg2, arg3, arg4, arg5)
		local f = CreateFrame("Frame",nil,arg1)
		f:SetFrameStrata(arg5)
		f:SetWidth(64) 
		f:SetHeight(64)
		local t = f:CreateTexture(nil,"BACKGROUND")
		t:SetTexture("Interface\\AddOns\\miirGui\\gfx\\"..arg2)
		t:SetAllPoints(f)
		f.texture = t
		f:SetPoint("Topleft",arg3,arg4)
		f:Show() 
		end
		
--[[Setting up the non onload-icons]]
		Icon(DressUpFrame, "dress", 5, -4, "Medium")
		Icon(OpenMailFrame, "mail", -8, 9, "Medium")
		Icon(SendMailFrame, "mail", -8, 9, "Medium")
		Icon(ItemTextFrame, "mail", -8, 9, "Medium")
		Icon(BankFrame, "bank", -8, 9, "Medium")
		Icon(PVEFrame, "lfg", -8, 9, "Medium")
		Icon(FriendsFrame, "friends", -8, 9, "Medium") 
		Icon(MerchantFrame, "merchant", -8, 9, "Medium")
		Icon(TabardFrame, "tabard", -8, 9, "Medium") 
		Icon(RaidBrowserFrame, "lfg", -8,9, "Medium")

		SpellBookFramePortrait:Hide()
		CharacterFramePortrait:Hide()

		
		local class  = select(2,UnitClass("player"))
			if class == "WARLOCK" then
				Icon(SpellBookFrame, "class_icons\\warlock", -8, 9, "Medium")
				Icon(CharacterFrame, "class_icons\\warlock", -8, 9, "Medium")
			elseif class == "WARRIOR" then
				Icon(SpellBookFrame, "class_icons\\warrior", -8, 9, "Medium")
				Icon(CharacterFrame, "class_icons\\warrior", -8, 9, "Medium")
			elseif class == "SHAMAN" then
				Icon(SpellBookFrame, "class_icons\\shaman", -8, 9, "Medium")
				Icon(CharacterFrame, "class_icons\\shaman", -8, 9, "Medium")
			elseif class == "ROGUE" then
				Icon(SpellBookFrame, "class_icons\\rogue", -8, 9, "Medium")
				Icon(CharacterFrame, "class_icons\\rogue", -8, 9, "Medium")		
			elseif class == "PRIEST" then
				Icon(SpellBookFrame, "class_icons\\priest", -8, 9, "Medium")
				Icon(CharacterFrame, "class_icons\\priest", -8, 9, "Medium")
			elseif class == "PALADIN" then
				Icon(SpellBookFrame, "class_icons\\paladin", -8, 9, "Medium")
				Icon(CharacterFrame, "class_icons\\paladin", -8, 9, "Medium")
			elseif class == "DRUID" then
				Icon(SpellBookFrame, "class_icons\\druid", -8, 9, "Medium")
				Icon(CharacterFrame, "class_icons\\druid", -8, 9, "Medium")
			elseif class == "HUNTER" then
				Icon(SpellBookFrame, "class_icons\\hunter", -8, 9, "Medium")
				Icon(CharacterFrame, "class_icons\\hunter", -8, 9, "Medium")	
			elseif class == "MAGE" then
				Icon(SpellBookFrame, "class_icons\\mage", -8, 9, "Medium")
				Icon(CharacterFrame, "class_icons\\mage", -8, 9, "Medium")
			elseif class == "DEATHKNIGHT" then
				Icon(SpellBookFrame, "class_icons\\deathknight", -8, 9, "Medium")
				Icon(CharacterFrame, "class_icons\\deathknight", -8, 9, "Medium")
			elseif class == "MONK" then
				Icon(SpellBookFrame, "class_icons\\monk", -8, 9, "Medium")
				Icon(CharacterFrame, "class_icons\\monk", -8, 9, "Medium")
			end

--[[Registering Events]]

			local frame = CreateFrame("FRAME");
			frame:RegisterEvent("ADDON_LOADED")
			function frame:OnEvent(event, arg1)
				if event == "ADDON_LOADED" and arg1 == "Blizzard_TradeSkillUI" then	
					Icon(TradeSkillFrame, "trade", -8, 9, "Medium")	
				elseif event == "ADDON_LOADED" and arg1 == "Blizzard_ItemAlterationUI" then
					Icon(TransmogrifyFrame, "trans", -8, 9, "High")			
				elseif event == "ADDON_LOADED" and arg1 == "Blizzard_ReforgingUI" then			
					Icon(ReforgingFrame, "reforging", -8, 9, "Medium")				
				elseif event == "ADDON_LOADED" and arg1 == "Blizzard_EncounterJournal"  then
					Icon(EncounterJournal, "journal", -8, 9, "Medium")	
				elseif event == "ADDON_LOADED" and arg1 == "Blizzard_PetJournal" then				
					Icon(PetJournalParent, "mounts", -8, 9, "HIGH")
				elseif event == "ADDON_LOADED" and arg1 == "Blizzard_ArchaeologyUI" then		
					Icon(ArchaeologyFrame, "arch", -8, 9, "Medium")
				elseif event == "ADDON_LOADED" and arg1 == "Blizzard_LookingForGuildUI" then
					Icon(LookingForGuildFrame, "lfgu", -8, 9, "Medium")
				elseif event == "ADDON_LOADED" and arg1 == "Blizzard_MacroUI" then
					Icon(MacroFrame, "macro", -8, 9, "Medium")		
				end
			end
				
	frame:SetScript("OnEvent", frame.OnEvent);