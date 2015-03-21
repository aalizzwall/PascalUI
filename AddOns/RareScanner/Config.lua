-----------------------------------------------------------------------
-- AddOn namespace.
-----------------------------------------------------------------------
local ADDON_NAME, private = ...

local LibStub = _G.LibStub

local RareScanner = LibStub("AceAddon-3.0"):GetAddon("RareScanner")
local AL = LibStub("AceLocale-3.0"):GetLocale("RareScanner", false)

-----------------------------------------------------------------------
-- Config option functions.
-----------------------------------------------------------------------
local general_options

private.SOUNDS = {
	["Female BloodElf Beg"] = "Sound\\Character\\BloodElf\\BloodElfFemaleBeg01.wav",
	["Achievement Sound"] = "Sound\\spells\\achievmentsound1.ogg",
	["Alarm Clock"] = "Sound\\interface\\alarmclockwarning2.ogg",
	["Boat Docking"] = "Sound\\doodad\\boatdockedwarning.ogg",
	["Siege Engineer Weapon"] = "Sound\\doodad\\fx_ograid_siege_weaponmachine_warning.ogg",
	["PVP Alliance"] = "Sound\\spells\\pvpwarningalliance.ogg",
	["PVP Horde"] = "Sound\\spells\\pvpwarninghorde.ogg",
	["Ready Check"] = "Sound\\interface\\levelup2.ogg",
}

local function GetGeneralOptions()
	if not general_options then
		local db = private.db

		general_options = {
			type = "group",
			order = 1,
			name = _G.GENERAL_LABEL,
			handler = RareScanner,
			desc = AL["GENERAL_OPTIONS"],
			args = {
				scanRares = {
					order = 0,
					name = AL["ENABLE_SCAN_RARES"],
					desc = AL["ENABLE_SCAN_RARES_DESC"],
					type = "toggle",
					get = function() return db.general.scanRares end,
					set = function(_, value)
						db.general.scanRares = value
					end,
					width = "full",
				},
				scanContainers = {
					order = 1,
					name = AL["ENABLE_SCAN_CONTAINERS"],
					desc = AL["ENABLE_SCAN_CONTAINERS_DESC"],
					type = "toggle",
					get = function() return db.general.scanContainers end,
					set = function(_, value)
						db.general.scanContainers = value
					end,
					width = "full",
				},
				scanEvents = {
					order = 2,
					name = AL["ENABLE_SCAN_EVENTS"],
					desc = AL["ENABLE_SCAN_EVENTS_DESC"],
					type = "toggle",
					get = function() return db.general.scanEvents end,
					set = function(_, value)
						db.general.scanEvents = value
					end,
					width = "full",
				},
			},
		}
	end
	
	return general_options
end

local sound_options

local function GetSoundOptions()
	if not sound_options then
		local db = private.db

		sound_options = {
			type = "group",
			order = 2,
			name = AL["SOUND"],
			handler = RareScanner,
			desc = AL["SOUND_OPTIONS"],
			args = {
				soundPlayed = {
					order = 0,
					type = "select",
					dialogControl = 'LSM30_Sound',
					name = AL["ALARM_SOUND"],
					desc = AL["ALARM_SOUND_DESC"],
					values = private.SOUNDS,
					get = function() return db.sound.soundPlayed end,
					set = function(_, value)
						db.sound.soundPlayed = value
					end,
				},
			},
		}
	end
	
	return sound_options
end

local display_options

local function GetDisplayOptions()
	if not display_options then
		local db = private.db

		display_options = {
			type = "group",
			order = 3,
			name = AL["DISPLAY"],
			handler = RareScanner,
			desc = AL["DISPLAY_OPTIONS"],
			args = {
				displayButton = {
					order = 0,
					type = "toggle",
					name = AL["DISPLAY_BUTTON"],
					desc = AL["DISPLAY_BUTTON_DESC"],
					get = function() return db.display.displayButton end,
					set = function(_, value)
						db.display.displayButton = value
					end,
					width = "full",
				},
				autoHideButton = {
					order = 1,
					type = "range",
					name = AL["AUTO_HIDE_BUTTON"],
					desc = AL["AUTO_HIDE_BUTTON_DESC"],
					min	= 0,
					max	= 30,
					step	= 5,
					bigStep = 5,
					get = function() return db.display.autoHideButton end,
					set = function(_, value)
						db.display.autoHideButton = value
					end,
					width = "full",
				},
				displayChatMessage = {
					order = 2,
					type = "toggle",
					name = AL["SHOW_CHAT_ALERT"],
					desc = AL["SHOW_CHAT_ALERT_DESC"],
					get = function() return db.display.displayChatMessage end,
					set = function(_, value)
						db.display.displayChatMessage = value
					end,
					width = "full",
				},
			},
		}
	end
	
	return display_options
end

function RareScanner:SetupOptions()
	local ACFG = LibStub("AceConfig-3.0")
	ACFG:RegisterOptionsTable("RareScanner General", GetGeneralOptions)
	ACFG:RegisterOptionsTable("RareScanner Sound", GetSoundOptions)
	ACFG:RegisterOptionsTable("RareScanner Display", GetDisplayOptions)

	local ACD = LibStub("AceConfigDialog-3.0")
	ACD:AddToBlizOptions("RareScanner General", _G.GENERAL_LABEL, "RareScanner")
	ACD:AddToBlizOptions("RareScanner Sound", AL["SOUND"], "RareScanner")
	ACD:AddToBlizOptions("RareScanner Display", AL["DISPLAY"], "RareScanner")
end
