local L = Elementarist.Locals;

Elementarist:RegisterModule("restoration");

Elementarist.restoration = {
	["Configuration"] = {
		["ShowSearingTotem"] = {
			["type"]	=	"CheckBox",
			["label"]	=	L.CONFIG_ENABLE_SEARING_TOTEM
		}
	};
	Initialize = function(self)
		Elementarist:LoadSpells({
			["Healing Wave"] = GetSpellInfo(77472),
			["Healing Surge"] = GetSpellInfo(8004),
			["Riptide"] = GetSpellInfo(61295),
			["Water Shield"] = GetSpellInfo(52127),
			["Tidal Waves"] = GetSpellInfo(53390),
			
			["Flask of the Warm Sun"] = GetSpellInfo(105691),
			["Flask of Falling Leaves"] = GetSpellInfo(105693),
			["Healing Stream Totem"] = GetSpellInfo(5394),
			["Earth Shield"] = GetSpellInfo(974),
			["Healing Rain"] = GetSpellInfo(73921),
			["Healing Tide Totem"]	= GetSpellInfo(108280),
			["Spirit Link Totem"] = GetSpellInfo(98008),
		});
		Elementarist.role = "heal";
		Elementarist.trackAura = Elementarist.SpellList["Riptide"];
		Elementarist.trackFilter = "PLAYER|HELPFUL";
		Elementarist.trackDuration = 18;
		Elementarist.callbacks = {
			["COMBAT_LOG"] = function(self,event,spellName,srcGUID,dstGUID)
			
				if (Elementarist.auraCooldowns["0"]) and (Elementarist.auraCooldowns["0"].seen) and ((GetTime() - Elementarist.auraCooldowns["0"].seen)> 60 ) then
					Elementarist.auraCooldowns["0"] = {};
					Elementarist:SetTexture(Elementarist.textureList["debuff"],"");
					Elementarist.textList['debuff']:SetText("");
				end;
				if (spellName == Elementarist.SpellList["Riptide"]) then
					if (event=="SPELL_AURA_REMOVED") then
						Elementarist.auraCooldowns[dstGUID] = {};
					end;
				end;
				if (Elementarist.auraCooldowns["0"]) and (Elementarist.auraCooldowns["0"].guid) and (dstGUID == Elementarist.auraCooldowns["0"].guid) then
					Elementarist.auraCooldowns["0"].seend = GetTime();
				end;
				if (spellName == Elementarist.SpellList["Earth Shield"]) then	
					if (srcGUID == Elementarist.playerGUID) then
						if (not Elementarist.auraCooldowns["0"]) then
							Elementarist.auraCooldowns["0"] = {}
						end;
						if (event=="SPELL_CAST_SUCCESS") then
							Elementarist.auraCooldowns["0"].charges = 9;
							Elementarist.auraCooldowns["0"].guid = dstGUID;
							Elementarist.auraCooldowns["0"].seen = GetTime();
							Elementarist:SetTexture(Elementarist.textureList["debuff"],select(3, GetSpellInfo(Elementarist.SpellList["Earth Shield"])));
							Elementarist.textureList["debuff"]:Show();
							Elementarist.textList['debuff']:SetText( Elementarist.auraCooldowns["0"].charges );
						end;
						if (event=="SPELL_HEAL") and (Elementarist.auraCooldowns["0"]) and (Elementarist.auraCooldowns["0"].charges) then
							Elementarist.auraCooldowns["0"].charges = Elementarist.auraCooldowns["0"].charges - 1;
							Elementarist.auraCooldowns["0"].seen = GetTime();
						end;
						if (Elementarist.auraCooldowns["0"]) and (Elementarist.auraCooldowns["0"].charges) then
							Elementarist.textList['debuff']:SetText( Elementarist.auraCooldowns["0"].charges );
						end;
						if (event=="SPELL_AURA_REMOVED") then
							Elementarist.auraCooldowns["0"] = {};
							Elementarist:SetTexture(Elementarist.textureList["debuff"],"");
							Elementarist.textList['debuff']:SetText("");
						end;
					end;
				end;
			end;
		};
	end;
	UpdateBuffs = function(self,unitID)
		local name,count,d,e;
		local guid = UnitGUID(unitID);

		name, _, _, _, _, d, e = Elementarist:hasAura(unitID,Elementarist.trackAura,"player",Elementarist.trackFilter);
		if (name) then
			if (not Elementarist.auraCooldowns[ guid ]) then
				Elementarist.auraCooldowns[ guid ] = {};
			end;
			Elementarist.auraCooldowns[ guid ]["start"] = e-d;
			Elementarist.auraCooldowns[ guid ]["duration"] = d;
			Elementarist.auraCooldowns[ guid ]["action"] = GetTime();
		end;
		-- refresh earth shield
		name, _, _, count, _, d, e = Elementarist:hasAura( unitID, Elementarist.SpellList["Earth Shield"], "player", Elementarist.trackFilter);
		if (name) then
			if (not Elementarist.auraCooldowns["0"]) then
				Elementarist.auraCooldowns["0"] = {}
			end;
			if (not Elementarist.auraCooldowns["0"]) or (not Elementarist.auraCooldowns["0"].charges) or (Elementarist.auraCooldowns["0"].charges ~= count) then
				Elementarist:SetTexture(Elementarist.textureList["debuff"],select(3, GetSpellInfo(Elementarist.SpellList["Earth Shield"])));
				if ( count == 0 ) then
					Elementarist.textureList["debuff"]:SetTexture(Elementarist.textureList["debuff"],"");
					Elementarist.textList['debuff']:SetText("");
				else
					Elementarist.textureList["debuff"]:Show();
					Elementarist.textList['debuff']:SetText( count );
				end
			end;
			Elementarist.auraCooldowns["0"].charges = count;
			Elementarist.auraCooldowns["0"].seen = GetTime();
			Elementarist.auraCooldowns["0"].guid = guid;
		else
			if ((Elementarist.auraCooldowns["0"] ) and (Elementarist.auraCooldowns["0"].guid) and (Elementarist.auraCooldowns["0"].guid == guid)) then
				Elementarist.auraCooldowns["0"] = {};
				Elementarist:SetTexture(Elementarist.textureList["debuff"],"");
				Elementarist.textList['debuff']:SetText("");
			end
		end
	end;

	UpdateAuraTracker = function(self)
		-- check all friendly units and refresh buff durations (Riptide and Earth Shield)
		local _,i,friendGUID,name,count,d,e,groupType;

		if (Elementarist.inParty == 2) then
			groupType = "raid";
		elseif (Elementarist.inParty == 1) then
			groupType = "party";
		end;
		if (groupType) then
			for i=1,GetNumGroupMembers() do
				Elementarist.restoration:UpdateBuffs( groupType .. i );
			end;
		end;
		-- check player
		Elementarist.restoration:UpdateBuffs( "player" );
	end;

	NextSpell = function(self,timeshift,exspell1,exspell2)
		local i, count, e;

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

		-- Earth Shield, if not known
		if (not Elementarist.auraCooldowns["0"]) or (not Elementarist.auraCooldowns["0"].charges) or (Elementarist.auraCooldowns["0"].charges == 0) then
			if (exspell1 ~= Elementarist.SpellList["Earth Shield"]) and (exspell2 ~= Elementarist.SpellList["Earth Shield"]) then
				return Elementarist.SpellList["Earth Shield"];
			end;
		end;

		-- Riptide, if found on noone
		if (not Elementarist.auraCooldowns["0"]) or (not Elementarist.auraCooldowns["0"].charges) or (Elementarist.auraCooldowns["0"].charges == 0) then
			if (exspell1 ~= Elementarist.SpellList["Riptide"]) and (exspell2 ~= Elementarist.SpellList["Riptide"]) then
				count = 0;
				for i in pairs(Elementarist.auraCooldowns) do
					if (i ~= "0") then
						count = count + 1;
					end;
				end;
				if (count == 0) then
					e = Elementarist:GetSpellCooldownRemaining(Elementarist.SpellList["Riptide"])
					if (e) and (e-timeshift <= 0) then
						return Elementarist.SpellList["Riptide"];
					end
				end;
			end;
		end;
		
		-- Healing Rain
		if (exspell1 ~= Elementarist.SpellList["Healing Rain"]) and (exspell2 ~= Elementarist.SpellList["Healing Rain"]) then
			e = Elementarist:GetSpellCooldownRemaining(Elementarist.SpellList["Healing Rain"]);
			if (e) and (e-timeshift <= 0) then
				return Elementarist.SpellList["Healing Rain"];
			end;
		end;
		
		-- Healing Tide Totem
		if (exspell1 ~= Elementarist.SpellList["Healing Tide Totem"]) and (exspell2 ~= Elementarist.SpellList["Healing Tide Totem"]) then
			e = Elementarist:GetSpellCooldownRemaining(Elementarist.SpellList["Healing Tide Totem"]);
			if (e) and (e-timeshift <= 0) then
				return Elementarist.SpellList["Healing Tide Totem"];
			end;
		end;

		-- Spirit Link Totem
		if (exspell1 ~= Elementarist.SpellList["Spirit Link Totem"]) and (exspell2 ~= Elementarist.SpellList["Spirit Link Totem"]) then
			e = Elementarist:GetSpellCooldownRemaining(Elementarist.SpellList["Spirit Link Totem"]);
			if (e) and (e-timeshift <= 0) then
				return Elementarist.SpellList["Spirit Link Totem"];
			end;
		end;

		return ""
	end;
	
	MiscSpell = function(self)
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
	
		-- Water Shield
		if Elementarist:SpellAvailable(Elementarist.SpellList["Water Shield"]) then
			name, _, _, _, _, _, expirationTime = Elementarist:hasBuff("player", Elementarist.SpellList["Water Shield"]);
			if (name == nil) or (expirationTime < 1) then
				return Elementarist.SpellList["Water Shield"]
			end
		end

		-- Healing Stream Totem
		if Elementarist:SpellAvailable(Elementarist.SpellList["Healing Stream Totem"]) then
			local haveWaterTotem,waterTotemName,_,_ = GetTotemInfo(3)
			if (waterTotemName == "") then
				e = Elementarist:GetSpellCooldownRemaining(Elementarist.SpellList["Healing Stream Totem"]);
				if (e) and (e < 1) then
					return Elementarist.SpellList["Healing Stream Totem"];
				end;
			end
		end

		-- Searing Totem
		if (ElementaristDB.ShowSearingTotem) and (Elementarist:SpellAvailable(Elementarist.SpellList["Searing Totem"])) then
			local haveFireTotem,fireTotemName,_,_ = GetTotemInfo(1)
			if (fireTotemName == "") then
				-- no fire totem
				return Elementarist.SpellList["Searing Totem"]
			end
		end

		return ""
	end;
	IntSpell = function(self)
	
		return ""
	end;
	ShieldName = function(Self)
		return "Tidal Waves";
	end;
};
