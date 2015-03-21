local L = Elementarist.Locals;

Elementarist:RegisterModule("elemental");

Elementarist.elemental = {
	["Configuration"] = {
		["Behavior"] = {
			["type"]	= "DropDown",
			["label"]	=	L.CONFIG_BEHAVIOR,
			["options"]	= {
				{text	=	L.BEHAVIOR_KEEP_FS_UP},
				{text	=	L.BEHAVIOR_FS_BEFORE_LVB}
			}
		},
		["EnableEQ"] = {
			["type"]	=	"CheckBox",
			["label"]	=	L.CONFIG_ENABLE_EQ_SPELL
		},
		["ShowHealingStream"] = {
			["type"]	=	"CheckBox",
			["label"]	=	L.CONFIG_ENABLE_HS_TOTEM
		}
	};
	Initialize = function(self)
		Elementarist:LoadSpells({
			["Glyph of Flame Shock"] = GetSpellInfo(55447),
			["Healing Stream Totem"] = GetSpellInfo(5394),
		});

		Elementarist.role = "DPS";
		Elementarist.trackAura = Elementarist.SpellList["Flame Shock"];
		Elementarist.trackFilter = "PLAYER|HARMFUL";
		Elementarist.trackDuration = 24;
		if (Elementarist:hasGlyph(Elementarist.SpellList["Glyph of Flame Shock"])) then
			Elementarist.trackDuration = Elementarist.trackDuration * 1.25;
		end
	end;
	NextSpell = function(self,timeshift,exspell1,exspell2)
		local guid = UnitGUID("target")
		local currentTime = GetTime()
		local s,d,e
		local name, fsExpiration, unitCaster
		local lastSpell
		local _
		
		if (exspell1) then
			if (exspell2) then
				lastSpell = exspell2
			else
				lastSpell = exspell1
			end
		else
			lastSpell = Elementarist.lastSpell
		end
		
		Elementarist.lastBaseGCD = 1.5 - (1.5 * Elementarist.spellHaste * .01)
		
		local flameshockavail = false
		local LvBct = 2 - (2 * Elementarist.spellHaste * .01)
		
		-- check Shock CD
		local s, d = GetSpellCooldown(Elementarist.SpellList["Flame Shock"])
		if (d) and (d>0) and (s == 0) then
			Elementarist.lastShockCD = d
		end
		local s, d = GetSpellCooldown(Elementarist.SpellList["Earth Shock"])
		if (d) and (d>0) and (s == 0) then
			Elementarist.lastShockCD = d
		end
		
		-- if target is dead, return ""
		if (UnitHealth("target")<=0) then
			return ""
		end
		
		if (not timeshift) then
			timeshift = 0
		end
		
		-- check current spell
		local spellInCast, _, _, _, sICstartTime, sICendTime = UnitCastingInfo("player")
		if (spellInCast) then
			if ( (sICendTime - sICstartTime) / 1000 ) < Elementarist.lastBaseGCD then
				sICendTime = sICstartTime + (Elementarist.lastBaseGCD * 1000)
			end
			timeshift = timeshift + (sICendTime / 1000) - GetTime()
		else
			-- no spell in cast, check global cd via Ghost Wolf
			if (Elementarist.SpellList["Ghost Wolf"]) then
				local ftcd = Elementarist:GetSpellCooldownRemaining(Elementarist.SpellList["Ghost Wolf"])
				if (ftcd) then
					timeshift = timeshift + Elementarist:GetSpellCooldownRemaining(Elementarist.SpellList["Ghost Wolf"])
				else
					timeshift = timeshift + Elementarist.lastBaseGCD
				end
			else
				timeshift = timeshift + Elementarist.lastBaseGCD
			end
		end

		-- if Tier6 talent is Unleashed Fury Unleash Flame
		if (Elementarist.tier6Talent == 21773) then
			if (exspell1 ~= Elementarist.SpellList["Unleash Flame"]) and (exspell2 ~= Elementarist.SpellList["Unleash Flame"]) then
				e = Elementarist:GetSpellCooldownRemaining(Elementarist.SpellList["Unleash Flame"])
				if (e-timeshift <= 0) then
					return Elementarist.SpellList["Unleash Flame"];
				end
			end
		end

		-- check if Flame shock applied on target first
		name, _, _, _, _, _, fsExpiration, unitCaster = Elementarist:hasDeBuff("target", Elementarist.SpellList["Flame Shock"], "player");
		if (not fsExpiration) then
			fsExpiration = 0
		end
		if (exspell1 ~= Elementarist.SpellList["Flame Shock"]) and (exspell2 ~= Elementarist.SpellList["Flame Shock"]) and (exspell1 ~= Elementarist.SpellList["Earth Shock"]) and (exspell2 ~= Elementarist.SpellList["Earth Shock"]) then
			if IsSpellInRange(Elementarist.SpellList["Flame Shock"], "target") == 1 then
				d = Elementarist:GetSpellCooldownRemaining(Elementarist.SpellList["Flame Shock"])
				if ((d - timeshift) <= 0) then
					flameshockavail = true
					local doFS = false
					if (unitCaster ~= "player") then	-- fs debuff is not casted by the player
						name = false
						fsExpiration = 0
					end
					if (not name) then 	-- no fs debuff on target
						fsExpiration = 0
					end
					if (ElementaristDB.Behavior == Elementarist.Behaviors["1"]) then
						doFS = true
					else	-- if fs before lvb, check lvb cd
						d = Elementarist:GetSpellCooldownRemaining(Elementarist.SpellList["Lava Burst"])
						if (d) and (d <= (timeshift + Elementarist.lastBaseGCD)) then
							doFS = true
						end
					end
					if (doFS) and ((fsExpiration - GetTime() - timeshift) < 0) then
						return Elementarist.SpellList["Flame Shock"]
					end
				end
			end
		end
	
		-- Lava Burst if not on Cooldown
		local ascendance, _, _, _, _, _, ascendanceExp = Elementarist:hasBuff("player",Elementarist.SpellList["AscendanceElementalBuff"]);
		if (ascendance == nil) then
			ascendanceExp = 0
		end
		if (
			((exspell1 ~= Elementarist.SpellList["Lava Burst"]) and (exspell2 ~= Elementarist.SpellList["Lava Burst"]))
			or
			((ascendanceExp-GetTime()-timeshift) > 0)
		) then
			if (IsSpellInRange(Elementarist.SpellList["Flame Shock"], "target") == 1) and
			(
				((fsExpiration~=0) and ((fsExpiration-GetTime()-timeshift) > LvBct)) or 
				(exspell1 == Elementarist.SpellList["Flame Shock"]) or 
				(exspell2 == Elementarist.SpellList["Flame Shock"])
			) then
				if (((Elementarist.SpellList["Lava Burst"]) ~= spellInCast) or (ascendance ~= nil)) then
					d = Elementarist:GetSpellCooldownRemaining(Elementarist.SpellList["Lava Burst"])
					if ((d-timeshift) <= 0) or ((ascendanceExp-GetTime()-timeshift) > 0) then
						return Elementarist.SpellList["Lava Burst"]
					end
				end
			end
		end
	
		-- if Tier6 talent is Elemental Blast use it
		if (Elementarist.tier6Talent == 19267) then
			if (
				(exspell1 ~= Elementarist.SpellList["Elemental Blast"]) and
				(exspell2 ~= Elementarist.SpellList["Elemental Blast"]) and
				(IsSpellInRange(Elementarist.SpellList["Elemental Blast"], "target") == 1) and 
				(Elementarist.SpellList["Elemental Blast"] ~= spellInCast)
			) then
				d = Elementarist:GetSpellCooldownRemaining(Elementarist.SpellList["Elemental Blast"])
				if ((d - timeshift) <= 0) then
					return Elementarist.SpellList["Elemental Blast"]
				end
			end
		end

		-- Earth shock if Lightning Shield count >=14 and not on cd, and FS debuff remaining > FS cooldown, or FS debuff remaining between FS and FS cd + 2sec and LS count>=5
		if ( (exspell1 ~= Elementarist.SpellList["Earth Shock"]) and (exspell2 ~= Elementarist.SpellList["Earth Shock"]) and (exspell1 ~= Elementarist.SpellList["Flame Shock"]) and (exspell2 ~= Elementarist.SpellList["Flame Shock"]) ) then
			if ( (fsExpiration - GetTime() - timeshift) > Elementarist.lastShockCD ) then
				d = Elementarist:GetSpellCooldownRemaining(Elementarist.SpellList["Earth Shock"])
				local _, _, _, lscount = Elementarist:hasBuff("player",Elementarist.SpellList["Lightning Shield"])
				if (
					( (d) and ((d-timeshift) <= 0) and (lscount) ) and (	-- Earth Shock is available, and has lightning shield
						(lscount>=14) or 														-- Lightning shield has 14 charge
						( (lscount>=12) and ( (fsExpiration - GetTime() - timeshift) < Elementarist.lastShockCD + 2 ) )	-- or, has 12 or more charges but FS expiration within 2 secs to FS CD
					)
				) then
					return Elementarist.SpellList["Earth Shock"]
				end
			end
		end

		-- otherwise lightning bolt
		if IsSpellInRange(Elementarist.SpellList["Lightning Bolt"], "target") == 1 then
			return Elementarist.SpellList["Lightning Bolt"]
		end
		
		-- if nothing works, try flameshock again
		if flameshockavail then
			return Elementarist.SpellList["Flame Shock"]
		end
		
		return ""
	end;
	MiscSpell = function(self)
		-- Miscelaneous spell order:
		-- Lightning Shield
		-- Searing Totem
		-- Elemental Mastery
		-- Berserking troll racial (if available)
		-- Blood Fury orc racial
		-- Lifeblood Herbalism spell
	
		local d, e
		local name, expirationTime, _, name2, exp2
		
		-- Alchemy Flask of Enhancement
		if (GetItemCount(Elementarist.CustomIDs["Alchemist's Flask Item"]) ~= 0) or (GetItemCount(Elementarist.CustomIDs["Crystal of Insanity Item"]) ~= 0) then
			name = Elementarist:hasBuff("player", Elementarist.SpellList["Flask of the Warm Sun"]);
			if (name == nil) then
				name = Elementarist:hasBuff("player", Elementarist.SpellList["Flask of the Draconic Mind"]);
			end
			if (name == nil) then
				name, _, _, _, _, _, expirationTime = Elementarist:hasBuff("player", Elementarist.SpellList["Crystal of Insanity"], false, Elementarist.CustomIDs["Crystal of Insanity Spell"]);
				name2, _, _, _, _, _, exp2 = Elementarist:hasBuff("player", Elementarist.SpellList["Alchemist's Flask"], false, Elementarist.CustomIDs["Alchemist's Flask Spell"]);
				
				if ((name == nil) and (name2 == nil)) or (((name ~= nil) and (expirationTime<2)) or ((name2 ~= nil) and (exp2<2))) then
					if (GetItemCount(Elementarist.CustomIDs["Crystal of Insanity Item"]) ~= 0) then
						local itemCooldown = Elementarist:GetItemCooldownRemaining(Elementarist.CustomIDs["Crystal of Insanity Item"]);
						if ((name == nil) or (expirationTime < 2)) and (itemCooldown < 1) then
							return nil,GetItemIcon(Elementarist.CustomIDs["Crystal of Insanity Item"])
						end
					elseif (GetItemCount(Elementarist.CustomIDs["Alchemist's Flask Item"]) ~= 0) then
						local itemCooldown = Elementarist:GetItemCooldownRemaining(Elementarist.CustomIDs["Alchemist's Flask Item"]);
						if ((name == nil) or (expirationTime < 2)) and (itemCooldown < 1) then
							return nil,GetItemIcon(Elementarist.CustomIDs["Alchemist's Flask Item"])
						end
					end
				end
			end
		end

		-- Lightning Shield
		if Elementarist:SpellAvailable(Elementarist.SpellList["Lightning Shield"]) then
			name, _, _, _, _, _, expirationTime = Elementarist:hasBuff("player", Elementarist.SpellList["Lightning Shield"]);
			if (name == nil) or (expirationTime < 1) then
				return Elementarist.SpellList["Lightning Shield"]
			end
		end

		-- Searing Totem
		if Elementarist:SpellAvailable(Elementarist.SpellList["Searing Totem"]) then
			local haveFireTotem,fireTotemName,_,_ = GetTotemInfo(1)
			if (fireTotemName == "") then
				-- no fire totem
				return Elementarist.SpellList["Searing Totem"]
			end
		end

		-- Healing Stream Totem
		if (ElementaristDB.ShowHealingStream) and (Elementarist:SpellAvailable(Elementarist.SpellList["Healing Stream Totem"])) then
			local haveWaterTotem,waterTotemName,_,_ = GetTotemInfo(3)
			if (waterTotemName == "") then
				e = Elementarist:GetSpellCooldownRemaining(Elementarist.SpellList["Healing Stream Totem"]);
				if (e < 1) then
					return Elementarist.SpellList["Healing Stream Totem"];
				end;
			end
		end

		-- Elemental Mastery
		if Elementarist:SpellAvailable(Elementarist.SpellList["Elemental Mastery"]) then
			d = Elementarist:GetSpellCooldownRemaining(Elementarist.SpellList["Elemental Mastery"])
			if d <= 0.5 then
				return Elementarist.SpellList["Elemental Mastery"]
			end
		end
	
		-- Ascendance
		if Elementarist:SpellAvailable(Elementarist.SpellList["Ascendance"]) then
			name = Elementarist:hasBuff("player",Elementarist.SpellList["AscendanceElementalBuff"])
			if (name == nil) then
				d = Elementarist:GetSpellCooldownRemaining(Elementarist.SpellList["Ascendance"])
				if d <= 0.5 then
					return Elementarist.SpellList["Ascendance"]
				end
			end
		end

		-- Berserking
		if Elementarist:SpellAvailable(Elementarist.SpellList["Berserking"]) then
			d = Elementarist:GetSpellCooldownRemaining(Elementarist.SpellList["Berserking"])
			if d <= 0.5 then
				return Elementarist.SpellList["Berserking"]
			end
		end
	
		-- Blood Fury
		if Elementarist:SpellAvailable(Elementarist.SpellList["Blood Fury"]) then
			d = Elementarist:GetSpellCooldownRemaining(Elementarist.SpellList["Blood Fury"])
			if d <= 0.5 then
				return Elementarist.SpellList["Blood Fury"]
			end
		end
	
		-- Lifeblood
		if Elementarist:SpellAvailable(Elementarist.SpellList["Lifeblood"]) then
			d = Elementarist:GetSpellCooldownRemaining(Elementarist.SpellList["Lifeblood"])
			if d <= 0.5 then
				return Elementarist.SpellList["Lifeblood"]
			end
		end
	
		return ""
	end;
	IntSpell = function(self)
		-- interruptions, mana recharge wia thunderstorm, purge, and AoE on target
		local d
		
		if Elementarist:SpellAvailable(Elementarist.SpellList["Wind Shear"]) then
			if IsSpellInRange(Elementarist.SpellList["Wind Shear"], "target") == 1 then
				local _, status, threatpct, _, _ = UnitDetailedThreatSituation("player", "target")
				if ((UnitCastingInfo("target")) or (UnitChannelInfo("target"))) or ((status) and (threatpct>80) and (Elementarist.person["friendCount"]>1) and (Elementarist.inParty>0)) then
					d = Elementarist:GetSpellCooldownRemaining(Elementarist.SpellList["Wind Shear"])
					if (d) and (d<0.5) and (IsSpellInRange(Elementarist.SpellList["Wind Shear"], "target") ) then
						return Elementarist.SpellList["Wind Shear"]
					end
				end
			
				if (UnitChannelInfo("target")) then
					d = Elementarist:GetSpellCooldownRemaining(Elementarist.SpellList["Wind Shear"])
					if (d<0.5) and (interruptable) and (IsSpellInRange(Elementarist.SpellList["Wind Shear"], "target") ) then
						return Elementarist.SpellList["Wind Shear"]
					end
				end
			end
		end

		-- check if mana is below 70% and Thunderstorm available
		if Elementarist:SpellAvailable(Elementarist.SpellList["Thunderstorm"]) then
			d = GetSpellCooldown(Elementarist.SpellList["Thunderstorm"])
			if (d) and ((UnitPower("player",0) / UnitPowerMax("player",0)) < 0.7) and (d < 0.5) then
				return Elementarist.SpellList["Thunderstorm"]
			end
		end

		-- if >=4 foes are available, and Earthquake not on cd
		if (ElementaristDB.EnableEQ) then
			if (Elementarist.person["foeCount"]>=4) then
				d = Elementarist:GetSpellCooldownRemaining(Elementarist.SpellList["Earthquake"])
				if (d) and (d<0.5) then
					return Elementarist.SpellList["Earthquake"]
				end
			end
		end

		-- check if purgeable buff is on target (not sure if this is ok)
		if Elementarist:SpellAvailable(Elementarist.SpellList["Purge"]) then
			if IsSpellInRange(Elementarist.SpellList["Purge"], "target") == 1 then
				if (Elementarist:hasBuff("target", ".", 1)) then
					d = Elementarist:GetSpellCooldownRemaining(Elementarist.SpellList["Purge"])
					if (d) and (d<0.5) then
						return Elementarist.SpellList["Purge"]
					end
				end
			end
		end

		-- Lava Beam if there are multiple targets, (count in a dirty way from combat log, not to accurate!!!)
		if Elementarist:SpellAvailable(Elementarist.SpellList["Lava Beam"]) then
			if (Elementarist.person["foeCount"]>2) then
				if IsSpellInRange(Elementarist.SpellList["Lava Beam"], "target") == 1 then
					d = Elementarist:GetSpellCooldownRemaining(Elementarist.SpellList["Lava Beam"])
					if (d) and (d<0.5) then
						return Elementarist.SpellList["Lava Beam"]
					end
				end
			end
		end

		-- CL if there are multiple targets, (count in a dirty way from combat log, not to accurate!!!)
		if (exspell1 ~= Elementarist.SpellList["Chain Lightning"]) and (exspell2 ~= Elementarist.SpellList["Chain Lightning"]) then
			if (Elementarist.person["foeCount"]>2) then
				if IsSpellInRange(Elementarist.SpellList["Chain Lightning"], "target") == 1 then
					if ((Elementarist.SpellList["Chain Lightning"]) ~= spellInCast) then
						d = Elementarist:GetSpellCooldownRemaining(Elementarist.SpellList["Chain Lightning"])
						if (d) and (d<0.5) then
							return Elementarist.SpellList["Chain Lightning"]
						end
					end
				end
			end
		end
	
		return ""
	end;
	ShieldName = function(self)
		return "Lightning Shield";
	end;

};
