-------------------------------------------------------------------------------
-- Elementarist 3.3.2
--
-- Shows the advised spell for an elemental shaman for optimal DPS output.
-------------------------------------------------------------------------------

Elementarist = {Locals = {}}

local L = Elementarist.Locals

Elementarist.versionNumber = '3.3.2';
Elementarist.enabled = true;
Elementarist.playerName = UnitName("player")
Elementarist.playerGUID = UnitGUID("player")
Elementarist.targetGUID = nil
Elementarist.spellHaste = GetCombatRatingBonus(20)
Elementarist.timeSinceLastUpdate = 0
Elementarist.AuraTrackerUpdate = 0
Elementarist.shieldTrackerUpdate = 0
Elementarist.spellPower = GetSpellBonusDamage(4);	-- nature spell bonus
Elementarist.lastBaseGCD = 1.5
Elementarist.lastShockCD = 6
Elementarist.person = {
	["foeCount"]	= 0,
	["friendCount"]	= 0,
	["friend"]  = {},
	["foe"]		= {}
}
Elementarist.auraCooldowns = {}
Elementarist.lastPersonTablePurged = 0.0;
Elementarist.configPanel = nil
Elementarist.prevDB = {}
Elementarist.DPSTable = {}
Elementarist.DebugMode = false
Elementarist.DebugChat = DEFAULT_CHAT_FRAME
Elementarist.inParty = 0
Elementarist.OmniCC = _G['OmniCC']
Elementarist.SpellFlash = _G['SpellFlashAddon'];
Elementarist.SFHistory = {
	["spell"] = nil,
	["misc"] = nil,
	["int"] = nil
}
Elementarist.talent = ""
Elementarist.role = ""
Elementarist.talentUnsure = true
Elementarist.callbacks = {};
Elementarist.tier6Talent = nil
Elementarist.lastSpell = nil
Elementarist.CustomIDs = {
	["Alchemist's Flask Item"] = 75525,
	["Alchemist's Flask Spell"] = 79640,
	["Crystal of Insanity Item"] = 86569,
	["Crystal of Insanity Spell"] = 127230 
}
Elementarist.SpellList = {
	["Ghost Wolf"] = GetSpellInfo(2645),
	["Flame Shock"] = GetSpellInfo(8050),
	["Lightning Bolt"] = GetSpellInfo(403),
	["Lava Burst"] = GetSpellInfo(51505),
	["Chain Lightning"] = GetSpellInfo(421),
	["Thunderstorm"] = GetSpellInfo(51490),
	["Purge"]	= GetSpellInfo(370),
	["Wind Shear"] = GetSpellInfo(57994),
	["Elemental Mastery"] = GetSpellInfo(16166),
	["Earth Shock"] = GetSpellInfo(8042),
	["Searing Totem"] = GetSpellInfo(3599),
	["Magma Totem"] = GetSpellInfo(8190),
	["Lightning Shield"] = GetSpellInfo(324),
	["Unleash Flame"] = GetSpellInfo(73683),
	["Earthquake"] = GetSpellInfo(61882),
	["Elemental Blast"] = GetSpellInfo(117014),
	["Ascendance"] = GetSpellInfo(114049),
	
	-- racials
	["Berserking"] = GetSpellInfo(26297),	-- Troll racial
	["Blood Fury"] = GetSpellInfo(33697),	-- Orc racial
	
	-- other buffs
	["Demonic Pact"] = GetSpellInfo(48090),
	["Alchemist's Flask"] = GetSpellInfo(Elementarist.CustomIDs["Alchemist's Flask Spell"]),
	["Crystal of Insanity"] = GetSpellInfo(Elementarist.CustomIDs["Crystal of Insanity Spell"]),
	["Flask of the Draconic Mind"] = GetSpellInfo(79470),
	["Flask of the Warm Sun"] = GetSpellInfo(105691),
	["Lifeblood"] = GetSpellInfo(55503),
	["AscendanceElementalBuff"] = GetSpellInfo(114050),
	
	-- debuff
	["Unleashed Fury"] = GetSpellInfo(118470),
}
Elementarist.auraCooldownFrame = {
	["main"] = nil
}
Elementarist.textureList = {
	["next"] = nil,
	["next1"] = nil,
	["next2"] = nil,
	["misc"] = nil,
	["int"] = nil,
	["debuff"] = nil,
	["shield"] = nil
}

Elementarist.textList = {
	["dps"] = nil,
	["debuff"] = nil,
	["shield"] = nil
}
Elementarist.Behaviors = {}
Elementarist.CLBehaviors = {}
Elementarist.EleLayout = {}

Elementarist.HostileFilter = {
  ["_DAMAGE"] = true, 
  ["_LEECH"] = true,
  ["_DRAIN"] = true,
  ["_STOLEN"] = true,
  ["_INSTAKILL"] = true,
  ["_INTERRUPT"] = true,
  ["_MISSED"] = true
}

Elementarist.modules = {}

-- Our sneaky frame to watch for events ... checks Elementarist.events[] for the function.  Passes all args.
Elementarist.eventFrame = CreateFrame("Frame")
Elementarist.eventFrame:SetScript("OnEvent", function(this, event, ...)
  Elementarist.events[event](...)
end)

Elementarist.eventFrame:RegisterEvent("ADDON_LOADED");
Elementarist.eventFrame:RegisterEvent("PLAYER_LOGIN");
Elementarist.eventFrame:RegisterEvent("PLAYER_ALIVE");
Elementarist.eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD");

-- Define our Event Handlers here
Elementarist.events = {}

function Elementarist:Debug(statictxt,msg)
	if (Elementarist.DebugMode) and (Elementarist.DebugChat) then
		if (msg) then
			Elementarist.DebugChat:AddMessage( statictxt  .. " : " .. msg)
		else
			Elementarist.DebugChat:AddMessage( statictxt  .. " : " .. "<nil>")
		end
	end
end

function Elementarist:GetDebugFrame()
	for i=1,NUM_CHAT_WINDOWS do
		local windowName = GetChatWindowInfo(i);
		if windowName == "EleDBG" then
			return getglobal("ChatFrame" .. i)
		end
	end
	return DEFAULT_CHAT_FRAME
end

function Elementarist.events.PLAYER_TALENT_UPDATE()
	Elementarist:detectTalent()
	
	Elementarist:ApplySettings()
end

function Elementarist.events.PARTY_MEMBERS_CHANGED()
	Elementarist.inParty = Elementarist:PlayerInParty()
end

function Elementarist.events.PLAYER_ALIVE()
	-- check anything
	Elementarist:detectTalent()
	Elementarist:ApplySettings()
	
	-- Elementarist.eventFrame:UnregisterEvent("PLAYER_ALIVE")
end

function Elementarist.events.PLAYER_ENTERING_WORLD()
	Elementarist:detectTalent()
end

function Elementarist.events.PLAYER_LOGIN()
	Elementarist.playerName = UnitName("player");

	Elementarist.spellHaste = GetCombatRatingBonus(20)
	Elementarist.spellPower = GetSpellBonusDamage(4); 
end

function Elementarist.events.ADDON_LOADED(addon)
	if addon == "OmniCC" then
		Elementarist.OmniCC = _G['OmniCC']
	end
	if addon == "SpellFlash" then
		Elementarist.SpellFlash = _G['SpellFlashAddon']
	end
	if addon ~= "Elementarist" then return end

	-- load defaults, if first start
	Elementarist:InitSettings()
	
	-- Create config page
	Elementarist:CreateConfig()

	-- add slash command
	SlashCmdList["Elementarist"] = function(msg)
		if (msg=='debug') then
			if (Elementarist.DebugMode) then
				Elementarist:Debug("Debug ended", GetTime())
			end
			Elementarist.DebugMode = not ( Elementarist.DebugMode )
			local debugStatus = "disabled"
			if (Elementarist.DebugMode) then
				Elementarist.DebugChat = Elementarist:GetDebugFrame()
				debugStatus = "enabled. Using frame: " .. Elementarist.DebugChat:GetID()
				Elementarist:Debug("Debug started", GetTime())
			end
			DEFAULT_CHAT_FRAME:AddMessage("Elementarist Debug " .. debugStatus)
		else
			InterfaceOptionsFrame_OpenToCategory(getglobal("ElementaristConfigPanel"))
			InterfaceOptionsFrame_OpenToCategory(getglobal("ElementaristConfigPanel"))
			InterfaceOptionsFrame_OpenToCategory(getglobal("ElementaristConfigPanel"))
		end
	end
	SLASH_Elementarist1 = "/Elementarist"
	SLASH_Elementarist2 = "/ele"
	
	-- check if talent is elemental
	Elementarist:detectTalent()

	Elementarist.playerLevel = UnitLevel("player")

	-- Setup behaviors
	Elementarist.Behaviors["1"] = L.BEHAVIOR_KEEP_FS_UP
	Elementarist.Behaviors["2"] = L.BEHAVIOR_FS_BEFORE_LVB
	Elementarist.CLBehaviors["0"] = L.CLSTBEHAVIOR_NONE
	Elementarist.CLBehaviors["1"] = L.CLSTBEHAVIOR_CL_AFTER_LVB
	Elementarist.CLBehaviors["2"] = L.CLSTBEHAVIOR_CL_ON_CD
	Elementarist.EleLayout["1"] = L.LAYOUT_GROW
	Elementarist.EleLayout["2"] = L.LAYOUT_RIGHTTOLEFT
	
	-- Coop with other addons
	Elementarist.OmniCC = _G['OmniCC']
	Elementarist.SpellFlash = _G['SpellFlashAddon']
	
	-- Create GUI
	Elementarist:CreateGUI()
	Elementarist.displayFrame:SetScale(ElementaristDB.scale)

	-- Register for Function Events
	Elementarist.eventFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	Elementarist.eventFrame:RegisterEvent("COMBAT_RATING_UPDATE") -- Monitor the all-mighty haste
	Elementarist.eventFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
	Elementarist.eventFrame:RegisterEvent("PLAYER_REGEN_ENABLED") -- Left combat, clean up all enemy GUIDs
	Elementarist.eventFrame:RegisterEvent("PLAYER_TALENT_UPDATE")
	Elementarist.eventFrame:RegisterEvent("PARTY_MEMBERS_CHANGED")
	
	-- get debug frame
	Elementarist.DebugChat = Elementarist:GetDebugFrame()
end

function Elementarist:RegisterModule(talent)
	Elementarist.modules[talent] = true;
	print (talent .. " Elementarist module registered");
end;

function Elementarist:CallModule( funcName, ... )
	if (Elementarist.modules[Elementarist.talent]) and (Elementarist[Elementarist.talent]) and (Elementarist[Elementarist.talent][funcName]) then
		return Elementarist[Elementarist.talent][funcName](self,...);
	end;
	return false;
end;

function Elementarist:LoadSpells(spellList)
	local k,v;
	
	for k,v in pairs(spellList) do
		Elementarist.SpellList[k] = v;
	end;
end;

function Elementarist:InitSettings()
	if not ElementaristDB then 
		ElementaristDB = {} -- fresh start
	end
	if not ElementaristDB.scale then ElementaristDB.scale = 1 end
	if not ElementaristDB.debuffscale then ElementaristDB.debuffscale = 1 end
	if not ElementaristDB.shieldscale then ElementaristDB.shieldscale = 1 end
	if ElementaristDB.locked == nil then ElementaristDB.locked = false end
	if ElementaristDB.enabled == nil then ElementaristDB.enabled = true end
	if ElementaristDB.disableIfNotEle == nil then ElementaristDB.disableIfNotEle = true end
	if ElementaristDB.disableMini == nil then ElementaristDB.disableMini = false end
	if ElementaristDB.debuffdisabled == nil then ElementaristDB.debuffdisabled = false end
	if ElementaristDB.shielddisabled == nil then ElementaristDB.shielddisabled = false end
	if ElementaristDB.alpha == nil then ElementaristDB.alpha = 0.8 end
	if ElementaristDB.debuffalpha == nil then ElementaristDB.debuffalpha = 1 end
	if ElementaristDB.shieldalpha == nil then ElementaristDB.shieldalpha = 1 end
	if ElementaristDB.Behavior == nil then ElementaristDB.Behavior = Elementarist.Behaviors["1"] end
	if ElementaristDB.CLBehavior == nil then ElementaristDB.CLBehavior = Elementarist.CLBehaviors["0"] end
	if ElementaristDB.ThreatWarning == nil then ElementaristDB.ThreatWarning = true end
	if ElementaristDB.EnableEQ == nil then ElementaristDB.EnableEQ = false end
	if not ElementaristDB.x then ElementaristDB.x = -200 end
	if not ElementaristDB.y then ElementaristDB.y = -200 end
	if not ElementaristDB.relativePoint then ElementaristDB.relativePoint = "CENTER" end
	if not ElementaristDB.debuffx then ElementaristDB.debuffx = -200 end
	if not ElementaristDB.debuffy then ElementaristDB.debuffy = -100 end
	if not ElementaristDB.debuffrelativePoint then ElementaristDB.debuffrelativePoint = "CENTER" end
	if not ElementaristDB.shieldrelativePoint then ElementaristDB.shieldrelativePoint = "CENTER" end
end

function Elementarist:detectTalent()
	local spec = GetSpecialization()
	local _,playerClass;
	local talent = "";

	_,playerClass = UnitClass("player")

	if playerClass ~= "SHAMAN" then
		talent = "";
		Elementarist.enabled = false;
		return;
	end
	if (spec == 1) then
		talent = "elemental"
	end
	if (spec == 2) then
		talent = "enhancement"
	end
	if (spec == 3) then
		talent = "restoration"
	end

	_, Elementarist.tier6Talent = GetTalentRowSelectionInfo(6)
	
	if (talent ~= "") and (talent ~= Elementarist.talent) then
		if (Elementarist.modules) and (ElementaristDB.modules) and (Elementarist.modules[talent]) and (ElementaristDB.modules[talent]) and (Elementarist[talent].Initialize) then
			Elementarist.callbacks = {};
			Elementarist[talent]:Initialize();
		end;
		Elementarist.talent = talent;
	end;

	if (spec == nil) or (talent == "") then
		Elementarist.talentUnsure = true
	else
		Elementarist.talentUnsure = false
	end
end

function Elementarist:PlayerInParty()
	if (IsInRaid()) then
		return 2
	elseif (GetNumGroupMembers()>0) then
		return 1
	else
		return 0
	end
end

function Elementarist:RemoveFromTables(guid)
	if (Elementarist.person["friend"][guid]) and (Elementarist.person["friend"][guid] ~= 0) then
		Elementarist.person["friend"][guid] = 0
		Elementarist.person["friendCount"] = Elementarist.person["friendCount"] - 1
	end
	if (Elementarist.person["foe"][guid]) and (Elementarist.person["foe"][guid] ~= 0) then
		Elementarist.person["foe"][guid] = 0
		Elementarist.person["foeCount"] = Elementarist.person["foeCount"] - 1
		Elementarist:Debug('Enemy died:', Elementarist.person["foeCount"] .. " " .. guid)
	end
	if (Elementarist.auraCooldowns[guid]) then
		Elementarist.auraCooldowns[guid]=nil
		Elementarist:UpdateAuraTracker()
	end
end

function Elementarist:PurgeDebuffTable()
	if (Elementarist.auraCooldowns["0"]) then
		local tmp = Elementarist.auraCooldowns["0"];
		Elementarist.auraCooldowns = {
			["0"] = tmp
		};
	else
		Elementarist.auraCooldowns = {};
	end;
	Elementarist:UpdateAuraTracker()
end

function Elementarist:PurgePersonTable()
	for i,v in pairs(Elementarist.person["foe"]) do
		if ( ( GetTime() - Elementarist.person["foe"][i] ) > 3) then
			-- no activity from that unit in last 2 seconds, remove it
			if ( Elementarist.person["foe"][i] ~= 0) then
				Elementarist.person["foe"][i] = 0	-- mark as inactive
				Elementarist.person["foeCount"] = Elementarist.person["foeCount"] - 1
				Elementarist:Debug('Enemy removed:', Elementarist.person["foeCount"])
			end
		end
	end
	for i,v in pairs(Elementarist.person["friend"]) do
		if ( ( GetTime() - Elementarist.person["friend"][i] ) > 3) then
			-- no activity from that unit in last 2 seconds, remove it
			if ( Elementarist.person["friend"][i] ~= 0 ) then
				Elementarist.person["friend"][i] = 0	-- mark as inactive
				Elementarist.person["friendCount"] = Elementarist.person["friendCount"] - 1
				Elementarist:Debug('Friend removed:', Elementarist.person["friendCount"])
			end
		end
	end
	Elementarist.lastPersonTablePurged = GetTime()
end

function Elementarist:CountPerson(time, event, sguid, sname, sflags, dguid, dname, dflags)
	local suffix = event:match(".+(_.-)$")
	if Elementarist.HostileFilter[suffix] then
		local stype = 0;
		local dtype = 0;
		
		if (sguid) and (sguid:sub(5,5)) and (tonumber(sguid:sub(5,5), 16)) then
			stype = (tonumber(sguid:sub(5,5), 16)) % 8;
		end
		if (dguid) and (dguid:sub(5,5)) and (tonumber(dguid:sub(5,5), 16)) then
			dtype = (tonumber(dguid:sub(5,5), 16)) % 8;
		end
		if (bit.band(dflags, COMBATLOG_OBJECT_REACTION_HOSTILE) == COMBATLOG_OBJECT_REACTION_HOSTILE) and (bit.band(dflags, COMBATLOG_OBJECT_AFFILIATION_OUTSIDER) == COMBATLOG_OBJECT_AFFILIATION_OUTSIDER) and ((dtype==0) or (dtype==3)) then
			if ((not Elementarist.person["foe"][dguid]) or (Elementarist.person["foe"][dguid]==0)) then
				Elementarist.person["foeCount"] = Elementarist.person["foeCount"] + 1
				Elementarist:Debug('Enemy added', Elementarist.person["foeCount"] .. " " .. dguid .. " " .. dflags)
			end
			Elementarist.person["foe"][dguid] = GetTime()
    	elseif (bit.band(sflags, COMBATLOG_OBJECT_REACTION_HOSTILE) == COMBATLOG_OBJECT_REACTION_HOSTILE) and (bit.band(sflags, COMBATLOG_OBJECT_AFFILIATION_OUTSIDER) == COMBATLOG_OBJECT_AFFILIATION_OUTSIDER) and ((stype==0) or (stype==3)) then
			if ((not Elementarist.person["foe"][sguid]) or (Elementarist.person["foe"][sguid]==0)) then
				Elementarist.person["foeCount"] = Elementarist.person["foeCount"] + 1
				Elementarist:Debug('Enemy added', Elementarist.person["foeCount"] .. " " .. sguid .. " flags: " .. dflags)
			end
			Elementarist.person["foe"][sguid] = GetTime()
		end
		if (bit.band(dflags, COMBATLOG_OBJECT_REACTION_FRIENDLY) == COMBATLOG_OBJECT_REACTION_FRIENDLY) and ((dtype==0) or (dtype==3)) then
			if ((not Elementarist.person["friend"][dguid]) or (Elementarist.person["friend"][dguid]==0)) then
				Elementarist.person["friendCount"] = Elementarist.person["friendCount"] + 1
				Elementarist:Debug('Friend added', Elementarist.person["friendCount"] .. " " .. dguid .. " flags: " .. dflags)
			end
			Elementarist.person["friend"][dguid] = GetTime()
    	elseif (bit.band(sflags, COMBATLOG_OBJECT_REACTION_FRIENDLY) == COMBATLOG_OBJECT_REACTION_FRIENDLY) and ((stype==0) or (stype==3)) then
			if ((not Elementarist.person["friend"][sguid]) or (Elementarist.person["friend"][sguid]==0)) then
				Elementarist.person["friendCount"] = Elementarist.person["friendCount"] + 1
				Elementarist:Debug('Friend added', Elementarist.person["friendCount"] .. " " .. sguid .. " " .. sflags)
			end
			Elementarist.person["friend"][sguid] = GetTime()
		end
	end
	if (Elementarist.lastPersonTablePurged < (GetTime() - 3)) and (Elementarist.person["foeCount"]>0) then
		Elementarist:PurgePersonTable()
	end
	--
	-- Elementarist:Debug('Enemy count:', Elementarist.person["foeCount"])
	-- Elementarist:Debug('Friend count:', Elementarist.person["friendCount"])
end

function Elementarist.HighDMGFormat(dmg_amount)
	if (dmg_amount >= 10000) then
		return(format('%.1f',dmg_amount/1000) .. "K")
	else
		return(format('%.f',dmg_amount))
	end
end

function Elementarist.events.COMBAT_LOG_EVENT_UNFILTERED(timestamp, event, hideCaster, srcGUID, srcName, srcFlags, srcRaidFlags, dstGUID, dstName, dstFlags, dstRaidFlags, spellId, spellName, spellSchool, damage, ...)
	if Elementarist.isEnabled() then
		if srcName == Elementarist.playerName then
			if (srcGUID == Elementarist.playerGUID) and (spellName==Elementarist.trackAura) and (Elementarist.auraCooldowns[dstGUID]) then
				Elementarist.auraCooldowns[dstGUID]["action"] = GetTime()
			end
			if (event=="SPELL_CAST_START") then
				Elementarist.SFHistory.spell = nil
				Elementarist.SFHistory.misc = nil
				Elementarist.SFHistory.int = nil
			end
			Elementarist:DecideSpells()
			-- calculate DPS
			if (event=="SPELL_CAST_SUCCESS") then
				Elementarist.lastSpell = spellName
				-- aura track if needed
				if (spellName == Elementarist.trackAura) then
					-- this spell needs to be tracked in aura tracker
					if (dstGUID) and (not Elementarist.auraCooldowns[dstGUID]) then
						Elementarist.auraCooldowns[dstGUID] = {}
					end
					Elementarist.auraCooldowns[dstGUID]["start"] = GetTime()
					Elementarist.auraCooldowns[dstGUID]["duration"] = Elementarist.trackDuration;
					Elementarist.auraCooldowns[dstGUID]["action"] = GetTime()
				end;
			end
			-- main Aura track if neede
			if (Elementarist.callbacks.COMBAT_LOG) then
				Elementarist.callbacks:COMBAT_LOG(event,spellName,srcGUID,dstGUID);
			end;
			-- Caculate DPS on the target
			if ((event=="SPELL_DAMAGE") or (event=="SPELL_PERIODIC_DAMAGE")) then
				if (not Elementarist.DPSTable[dstGUID]) then
					Elementarist.DPSTable[dstGUID] = {
						["time"] = GetTime(),
						["amount"] = 0,
					}
				end
				
				Elementarist.DPSTable[dstGUID]["amount"] = Elementarist.DPSTable[dstGUID]["amount"] + damage
				local dps_txt = ""
				if (dstGUID == Elementarist.targetGUID) and (Elementarist.DPSTable[Elementarist.targetGUID]) then
					local dps_sec = GetTime() - Elementarist.DPSTable[dstGUID]["time"]
					if (dps_sec > 5) then
						dps_txt = format('%.f',(Elementarist.DPSTable[dstGUID]["amount"] / dps_sec))
					end
					local threat_txt = ""
					local _, status, threatpct, _, _ = UnitDetailedThreatSituation("player", "target")
					if (status) then
						if (threatpct<80) then
							threat_txt = format("%.f",threatpct) .. " %"
							Elementarist.cooldownFrame:SetReverse(false)
							if (ElementaristDB.ThreatWarning) and (Elementarist.inParty>0) and (threatpct>70) then
								RaidNotice_AddMessage(RaidBossEmoteFrame, L.THREAT_WARNING_PREFIX .. format("%.f",threatpct) .. L.THREAT_WARNING_SUFFIX, ChatTypeInfo["RAID_WARNING"])
							end
						else
							threat_txt = "|cffff0000" .. format("%.f",threatpct) .. " %|r"
							if (ElementaristDB.ThreatWarning) and (Elementarist.inParty>0) then
								RaidNotice_AddMessage(RaidBossEmoteFrame, "|cffff0000" .. L.THREAT_WARNING_PREFIX .. format("%.f",threatpct) ..  L.THREAT_WARNING_SUFFIX .. "|r", ChatTypeInfo["RAID_WARNING"])
							end
							Elementarist.cooldownFrame:SetReverse((Elementarist.person["friendCount"]>1) and (Elementarist.inParty>0))
						end
					end
					dps_txt = dps_txt .. "|n" .. threat_txt
					Elementarist.textList["dps"]:SetText(dps_txt)
				end
			end
		else
			-- if unit died, remove if from friend and foe tables
			if (event=="UNIT_DIED") or (event=="UNIT_DESTROYED") then
				Elementarist:RemoveFromTables(dstGUID);
			end
			-- count enemies if player in combat
			if (UnitAffectingCombat("player")) then
				-- enemy count for CL advise and multiple player in combat (for aggro warning)
				Elementarist:CountPerson(timestamp, event, srcGUID, srcName, srcFlags, dstGUID, dstName, dstFlags)
			end
		end
	end
end

function Elementarist.events.COMBAT_RATING_UPDATE(unit)
	if unit == "player" then
    	Elementarist.spellHaste = GetCombatRatingBonus(20) -- update spell haste
		Elementarist.spellPower = GetSpellBonusDamage(4);	
	end
end

function Elementarist.events.PLAYER_TARGET_CHANGED(...) 
	Elementarist.targetGUID = UnitGUID("target")
	Elementarist.inParty = Elementarist:PlayerInParty()

	if (ElementaristDB.disableIfNotEle) and (not Elementarist:isEnabled()) then
		Elementarist:detectTalent()
		if Elementarist:isEnabled() then
			Elementarist:ApplySettings()
		end
	end
	if (not Elementarist.targetGUID) then
		local threat_txt = ""
		local _, status, threatpct, _, _ = UnitDetailedThreatSituation("player", "target")
		if (status) then
			if (threatpct<80) then
				threat_txt = format("%.f",threatpct) .. " %"
				Elementarist.cooldownFrame:SetReverse(false)
			else
				threat_txt = "|cffff0000" .. format("%.f",threatpct) .. " %|r"
				Elementarist.cooldownFrame:SetReverse((Elementarist.person["friendCount"]>1) and (Elementarist.inParty>0))
			end
		end
		Elementarist.textList["dps"]:SetText(threat_txt)
	end
	Elementarist:DecideSpells()
end

function Elementarist.events.PLAYER_REGEN_ENABLED(...)
	-- left combat
	Elementarist.person["friend"] = {}
	Elementarist.person["friendCount"] = 0
	Elementarist.person["foe"] = {}
	Elementarist.person["foeCount"] = 0
	Elementarist.DPSTable = {}
	Elementarist.textList["dps"]:SetText("")
	Elementarist.textList["debuff"]:SetText("")
	Elementarist.cooldownFrame:SetReverse(false)
	Elementarist:PurgePersonTable()
	Elementarist:PurgeDebuffTable()
end

function Elementarist:isEnabled()
	if (Elementarist.talentUnsure) then
		Elementarist:detectTalent()
	end
	return (
		Elementarist.enabled and
		ElementaristDB.enabled and 
		ElementaristDB.modules[Elementarist.talent]
	)
end

function Elementarist:UpdateShieldTracker()
	local shieldName = Elementarist:CallModule("ShieldName");
	
	local name, _, icon, count, _, d, e = Elementarist:hasBuff("player",Elementarist.SpellList[ shieldName ])

	Elementarist.shieldTrackerUpdate = GetTime()
	if (name) then
		Elementarist:SetTexture(Elementarist.textureList["shield"],icon)
		Elementarist.textList["shield"]:SetText(format('%.0f', count))
		Elementarist.shieldCooldownFrame:SetCooldown( e-d, d)
	else
		Elementarist:SetTexture(Elementarist.textureList["shield"],"")
		Elementarist.textList["shield"]:SetText("")
		Elementarist.shieldCooldownFrame:SetCooldown(0, 0)
	end
end

function Elementarist:UpdateAuraTracker()
	if (not Elementarist.trackAura) then
		return;
	end;
	
	Elementarist:CallModule( "UpdateAuraTracker" );
	
	local name,tguid,icon,d,e;
	if (not Elementarist.callbacks.COMBAT_LOG) then
		name, _, icon, _, _, d, e = Elementarist:hasAura("target",Elementarist.trackAura,"player",Elementarist.trackFilter)
		tguid = UnitGUID("target");
	end;

	Elementarist.AuraTrackerUpdate = GetTime()
	if (name) then
		if (tguid) and (not Elementarist.auraCooldowns[tguid]) then
			Elementarist.auraCooldowns[tguid] = {}
		end
		Elementarist.auraCooldowns[tguid]["start"] = e-d
		Elementarist.auraCooldowns[tguid]["duration"] = d
		Elementarist.auraCooldowns[tguid]["action"] = GetTime()
	else
		_, _, icon = GetSpellInfo(Elementarist.trackAura)
	end

	-- update mini frames
	local m = 1
	for i,v in pairs(Elementarist.auraCooldowns) do
		if (i ~= "0") then
			if (not v["start"]) then
				v = {}
			else
				if ( (v["start"] + v["duration"]) > GetTime() ) and (i ~= tguid) and (m <= 10) and (v["action"]>GetTime() - 4) then
					Elementarist:SetTexture(Elementarist.textureList["debuff_" .. tostring(m)],icon)
					Elementarist.auraCooldownFrame["mini_" .. tostring(m)]:SetCooldown( v["start"], v["duration"])
					m = m + 1
				end
			end;
		end;
	end
	for i=m,10,1 do
		Elementarist:SetTexture(Elementarist.textureList["debuff_" .. tostring(m)],"")
		Elementarist.auraCooldownFrame["mini_" .. tostring(m)]:SetCooldown( 0, 0)
	end

	-- update main frame
	if (Elementarist.callbacks.COMBAT_LOG == nil) then
		if (name) then
			Elementarist:SetTexture(Elementarist.textureList["debuff"],icon)
			if (not Elementarist.OmniCC) then
				Elementarist.textList["debuff"]:SetText(format('%.1f', (e - GetTime())))
			end
			Elementarist.auraCooldownFrame["main"]:SetCooldown( e-d, d)
		else
			Elementarist:SetTexture(Elementarist.textureList["debuff"],"")
			Elementarist.textList["debuff"]:SetText("")
			Elementarist.auraCooldownFrame["main"]:SetCooldown(0, 0)
			m = m - 1
		end
	end;
end

function Elementarist:GetItemCooldownRemaining(itemID)
    local s, d, _ = GetItemCooldown(itemID)
    if (d) and (d>0) then
        d = s - GetTime() + d
    end

    return d
end

function Elementarist:GetSpellCooldownRemaining(spell)
	local s, d, _ = GetSpellCooldown(spell)
	if (d) and (d>0) then
		d = s - GetTime() + d
	end

	return d
end

function Elementarist:hasGlyph(glyph)
	local i, _, enabled, glyphSpellID;
	
	for i = 1, NUM_GLYPH_SLOTS do
		enabled, _, _, glyphSpellID = GetGlyphSocketInfo(i);
		if ( enabled ) then 
			if (glyph == GetSpellInfo( glyphSpellID ) ) then
				return true;
			end
		end
	end
	return false;
end

function Elementarist:hasAura(unit, spellName, casterUnit, filter)
	local i = 1;
	while true do
		local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable = UnitAura(unit, i, filter);
		if not name then
			break;
		end
		if (name) and (spellName) then
			if string.match(name, spellName) and ((unitCaster == casterUnit) or (casterUnit == nil)) then
				return name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable;
			end
		end
		i = i + 1;
	end
end;

function Elementarist:hasDeBuff(unit, spellName, casterUnit)
	local i = 1;
	while true do
		local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable = UnitDebuff(unit, i);
		if not name then
			break;
		end
		if (name) and (spellName) then
			if string.match(name, spellName) and ((unitCaster == casterUnit) or (casterUnit == nil)) then
				return name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable;
			end
		end
		i = i + 1;
	end
end

function Elementarist:hasBuff(unit, spellName, stealableOnly, getByID)
	local i = 1;
	while true do
		local name, rank, icon, count, buffType, duration, expirationTime, source, isStealable, _, spellId = UnitBuff(unit, i);
		if not name then
			break;
		end
		if (not getByID) and (name) and (spellName) then
			if string.match(name, spellName) then
				if (not stealableOnly) or (isStealable) then
					return name, rank, icon, count, buffType, duration, expirationTime, unitCaster, isStealable;
				end
			end
		else
			if (getByID == spellId) then
				return name, rank, icon, count, buffType, duration, expirationTime, unitCaster, isStealable;
			end
		end
		i = i + 1;
	end
end

function Elementarist:hasTotem(unit, spellName)
	local i = 1;
	while true do
		local name, rank, icon, count, buffType, duration, expirationTime, source, isStealable = UnitBuff(unit, i);
		if not name then
			break;
		end
		if (string.match(name, spellName) or (string.match(icon, spellName))) and (expirationTime==0) then
	   		return name, rank, icon, count, buffType, duration, expirationTime, unitCaster, isStealable;
		end
		i = i + 1;
	end
end

function Elementarist:SpellAvailable(spell)
	if (not spell) then
		return false
	end
	if (IsUsableSpell(spell)) then
		return true
	else
		return false
	end
end

function Elementarist:NextSpell(...)
	return Elementarist:CallModule("NextSpell", ...);
end

function Elementarist:MiscSpell(...)
	return Elementarist:CallModule("MiscSpell", ...);
end

function Elementarist:IntSpell(...)
	return Elementarist:CallModule("IntSpell", ...);
end

function Elementarist:FlashSpell(spell,spelltype)
	local color = "White"
	if (Elementarist.SpellFlash) and (Elementarist.SFHistory[spelltype] ~= spell) and (Elementarist.SpellFlash.Flashable(spell)) then
		if (spelltype == "int") then
			color = "Aqua"
		end
		if (spelltype == "misc") then
			color = "Green"
		end
		Elementarist.SpellFlash.Flash(spell,color)
		Elementarist.SFHistory.spell=spell
	end
end

function Elementarist:DecideSpells()
	if (not Elementarist.enabled) then
		return;
	end
	
	Elementarist.timeSinceLastUpdate = 0;
	local currentTime = GetTime()

	local guid = UnitGUID("target")
	local guid = UnitGUID("target")
	if  (UnitName("target") == nil) or (UnitCanAttack("player","target") == nil) or (UnitHealth("target") == 0) then
		guid = nil
	end

	if (UnitInVehicle("player") and HasVehicleActionBar()) then
		-- player is in a "vehicle" don't suggest spell
		Elementarist:SetTexture(Elementarist.textureList["next"],"")
		Elementarist:SetTexture(Elementarist.textureList["next1"],"")
		Elementarist:SetTexture(Elementarist.textureList["next2"],"")
		Elementarist:SetTexture(Elementarist.textureList["misc"],"")
		Elementarist:SetTexture(Elementarist.textureList["int"],"")
	
		return
	end

	if (guid == nil) and (Elementarist.role == "DPS") then
		Elementarist:SetTexture(Elementarist.textureList["next"],"")
		Elementarist:SetTexture(Elementarist.textureList["next1"],"")
		Elementarist:SetTexture(Elementarist.textureList["next2"],"")
		Elementarist:SetTexture(Elementarist.textureList["misc"],"")
		Elementarist:SetTexture(Elementarist.textureList["int"],"")
	
		return
	end 
  	if (UnitHealth("target") == 0) and (Elementarist.role == "DPS") then
		Elementarist:SetTexture(Elementarist.textureList["next"],"")
		Elementarist:SetTexture(Elementarist.textureList["next1"],"")
		Elementarist:SetTexture(Elementarist.textureList["next2"],"")

		return
  	end

	local spell = ""
	spell = Elementarist:NextSpell()
	if (spell) then
		Elementarist:FlashSpell(spell,"spell")
		local d = Elementarist:GetSpellCooldownRemaining(spell)
		if (d) and (d>0) then
			local cdStart = currentTime - Elementarist.lastBaseGCD + d  -- should be less then the base gcd if we are suggesting it
			if (cdStart) and (Elementarist.lastBaseGCD) then
				Elementarist.cooldownFrame:SetCooldown(cdStart, Elementarist.lastBaseGCD)
			end
		end
		Elementarist:SetTexture(Elementarist.textureList["next"],GetSpellTexture(spell))
	
		local _,_,_,ct1=GetSpellInfo(spell)
		if (not ct1) then
			ct1 = 0
		else
			ct1 = (ct1 / 1000)
		end
		local spell1 = Elementarist:NextSpell(ct1,spell)
		Elementarist:SetTexture(Elementarist.textureList["next1"],GetSpellTexture(spell1))

		local _,_,_,ct2=GetSpellInfo(spell1)
		if (not ct2) then
			ct2 = 0
		else
			ct2 = (ct2 / 1000)
		end
		if (not ct2) or (ct2 < Elementarist.lastBaseGCD) then
			ct2 = Elementarist.lastBaseGCD
		end
		local spell2 = Elementarist:NextSpell(ct1+ct2,spell,spell1)
		Elementarist:SetTexture(Elementarist.textureList["next2"],GetSpellTexture(spell2))
	end

	if (not ElementaristDB.disableMini) then
		local icon

		spell,icon = Elementarist:MiscSpell()
		Elementarist:FlashSpell(spell,"misc")

		if (icon) then
			Elementarist:SetTexture(Elementarist.textureList["misc"],icon)
		else
			if (spell) then
				Elementarist:SetTexture(Elementarist.textureList["misc"],GetSpellTexture(spell))
			end
		end

		spell = Elementarist:IntSpell()
		Elementarist:FlashSpell(spell,"int")
		Elementarist:SetTexture(Elementarist.textureList["int"],GetSpellTexture(spell))
	end
end

function Elementarist:OnUpdate(elapsed)
	if (Elementarist:isEnabled()) then
		Elementarist.timeSinceLastUpdate = Elementarist.timeSinceLastUpdate + elapsed 
		
		if (Elementarist.timeSinceLastUpdate > (1.5 - (1.5 * Elementarist.spellHaste * .01)) * 0.3) then
			Elementarist:DecideSpells()
		end
		if (not ElementaristDB.debuffdisabled) then
			Elementarist.AuraTrackerUpdate = Elementarist.AuraTrackerUpdate + elapsed 
			if (Elementarist.AuraTrackerUpdate >= 1) then
				Elementarist:UpdateAuraTracker()
			end
		end
		if (not ElementaristDB.shielddisabled) then
			Elementarist.shieldTrackerUpdate = Elementarist.shieldTrackerUpdate + elapsed 
			if (Elementarist.shieldTrackerUpdate >= 1) then
				Elementarist:UpdateShieldTracker()
			end
		end
	end
end
