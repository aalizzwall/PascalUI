		local _, miirgui = ...
		glv()

			--[[Setting up the border-functions]]

		local function Border(arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8)																								
			local Border = CreateFrame("Frame", "nil", arg1)
			Border:SetSize(arg2, arg3)
			Border:SetFrameStrata(arg8)
			Border:SetPoint(arg4,arg5,arg6)
			Border:SetBackdrop({
			bgFile = "",
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
			edgeSize = arg7,
			})
			Border:SetBackdropColor(0, 0, 0, 0)
			Border:SetBackdropBorderColor(1, 1, 1)	
		end

			--[[Registering Events]]

		local frame = CreateFrame("FRAME");																					
		frame:RegisterEvent("ADDON_LOADED")
		function frame:OnEvent(event, arg1)

			--[[EncounterJournalFrame Changes]]

		if event == "ADDON_LOADED" and arg1 == "Blizzard_EncounterJournal"  then

			EncounterJournalEncounterFrameInfoInstanceButtonIcon:SetTexCoord(0, 1, 0, 1)
			InstanceTitle= select(2,EncounterJournalInstanceSelect:GetRegions())
			InstanceTitle:SetFont(unpack(miirgui.huge))
			InstanceTitle:SetShadowColor(0,0,0,0)
			InstanceTitle:SetTextColor(unpack(miirgui.Color))
			EncounterJournalEncounterFrameInfoInstanceTitle:SetFont(unpack(miirgui.huge))
			EncounterJournalEncounterFrameInfoInstanceTitle:SetShadowColor(0,0,0,0)
			EncounterJournalEncounterFrameInfoInstanceTitle:SetTextColor(unpack(miirgui.Color))
			EncounterJournalEncounterFrameInfoOverviewScrollFrameScrollBarTrack:Hide()
			EncounterJournalEncounterFrameInfoOverviewScrollFrameScrollChildLoreDescription:SetTextColor(1, 1, 1)
			EncounterJournalEncounterFrameInfoOverviewScrollFrameScrollChildLoreDescription:SetShadowColor(0,0,0,0)
			EncounterJournalEncounterFrameInfoOverviewScrollFrameScrollChildLoreDescription:SetFont(unpack(miirgui.medium))
			EncounterJournalEncounterFrameInfoOverviewScrollFrameScrollChild.overviewDescription.Text:SetTextColor(1, 1, 1)
			EncounterJournalEncounterFrameInfoOverviewScrollFrameScrollChild.overviewDescription.Text:SetShadowColor(0,0,0,0)
			EncounterJournalEncounterFrameInfoOverviewScrollFrameScrollChild.overviewDescription.Text:SetFont(unpack(miirgui.medium))
			EncounterJournalEncounterFrameInfoOverviewScrollFrameScrollChildTitle:SetTextColor(unpack(miirgui.Color))
			EncounterJournalEncounterFrameInfoOverviewScrollFrameScrollChildTitle:SetShadowColor(0,0,0,0)
			EncounterJournalEncounterFrameInfoOverviewScrollFrameScrollChildTitle:SetFont(unpack(miirgui.medium))
			EncounterJournalPortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			EncounterJournalInstanceSelectScrollFrameScrollBarTrack:Hide()
			EncounterJournalInstanceSelectBG:Hide()
			EncounterJournalEncounterFrameInfoDetailsScrollFrameScrollBarTrack:Hide()
			EncounterJournalEncounterFrameInstanceFrameLoreScrollFrameScrollBarTrack:Hide()
			EncounterJournalEncounterFrameInfoBossesScrollFrameScrollBarTrack:Hide()
			EncounterJournalEncounterFrameInfoLootScrollFrameScrollBarTrack:Hide()
			Border(EncounterJournalEncounterFrameInstanceFrame,340,266,"Center",3,34,12,"MEDIUM")
			Border(EncounterJournalInstanceSelect,794	,388,"Center",1,-22,12,"HIGH")
			for i = 1, 9 do
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."ArmorClass"]:SetTextColor(1, 1, 1,1)
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."ArmorClass"]:SetShadowColor(0,0,0,0)
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."ArmorClass"]:SetFont(unpack(miirgui.medium))
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."Slot"]:SetTextColor(1, 1, 1,1)
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."Slot"]:SetShadowColor(0,0,0,0)
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."Slot"]:SetFont(unpack(miirgui.medium))
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."Boss"]:SetTextColor(1, 1, 1,1)
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."Boss"]:SetShadowColor(0,0,0,0)
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."Boss"]:SetFont(unpack(miirgui.medium))
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."Name"]:SetTextColor(1, 1, 1,1)
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."Name"]:SetShadowColor(0,0,0,0)
				_G["EncounterJournalEncounterFrameInfoLootScrollFrameButton"..i.."Name"]:SetFont(unpack(miirgui.medium))
			end
			_G["EncounterJournalEncounterFrameInstanceFrameLoreScrollFrameScrollChildLore"]:SetTextColor(1, 1, 1,1)
			_G["EncounterJournalEncounterFrameInstanceFrameLoreScrollFrameScrollChildLore"]:SetShadowColor(0,0,0,0)
			_G["EncounterJournalEncounterFrameInstanceFrameLoreScrollFrameScrollChildLore"]:SetFont(unpack(miirgui.medium)) 
			_G["EncounterJournalEncounterFrameInfoDetailsScrollFrameScrollChildDescription"]:SetTextColor(1, 1, 1,1)
			_G["EncounterJournalEncounterFrameInfoDetailsScrollFrameScrollChildDescription"]:SetShadowColor(0,0,0,0)
			_G["EncounterJournalEncounterFrameInfoDetailsScrollFrameScrollChildDescription"]:SetFont(unpack(miirgui.medium)) 
			_G["EncounterJournalEncounterFrameInfoEncounterTitle"]:SetTextColor(unpack(miirgui.Color))
			_G["EncounterJournalEncounterFrameInfoEncounterTitle"]:SetFont(unpack(miirgui.medium))   
			_G["EncounterJournalEncounterFrameInfoEncounterTitle"]:SetShadowColor(0,0,0,0)      

			local function miirgui_EncounterJournal_UpdateButtonState(self)
				local oldtex = self.textures.expanded;
				if self:GetParent().expanded then
					self.tex = self.textures.expanded;
					oldtex = self.textures.collapsed;
					self.expandedIcon:SetTextColor(unpack(miirgui.Color));
					self.expandedIcon:SetFont(unpack(miirgui.small))
					self.expandedIcon:SetShadowColor(0,0,0,0)
					self.title:SetTextColor(unpack(miirgui.Color));
					self.title:SetFont(unpack(miirgui.medium))
					self.title:SetShadowColor(0,0,0,0)
				else
					self.tex = self.textures.collapsed;
					self.expandedIcon:SetTextColor(unpack(miirgui.Color));
					self.expandedIcon:SetFont(unpack(miirgui.small))
					self.expandedIcon:SetShadowColor(0,0,0,0)
					self.title:SetTextColor(unpack(miirgui.Color));
					self.title:SetFont(unpack(miirgui.medium))
					self.title:SetShadowColor(0,0,0,0)
				end
			end

			hooksecurefunc("EncounterJournal_UpdateButtonState",miirgui_EncounterJournal_UpdateButtonState)

			local function miirgui_EncounterJournal_SetBullets(object, description, hideBullets)
				local parent = object:GetParent();
				local desc = string.match(description, "(.-)\$bullet;");
				local bullets = {}
				for v in string.gmatch(description,"\$bullet;([^$]+)") do
					tinsert(bullets, v);
				end
				local k = 1;
				local skipped = 0;
				for j = 1,#bullets do
					local text = bullets[j];
					if (text and text ~= "") then
						local bullet;
						bullet = parent.Bullets and parent.Bullets[k];
						bullet:ClearAllPoints();
						if (k == 1) then
							if (parent.button) then
								bullet:SetPoint("TOPLEFT", parent.button, "BOTTOMLEFT", 13, -9 - object:GetHeight());
							else
								bullet:SetPoint("TOPLEFT", parent, "TOPLEFT", 13, -9 - object:GetHeight());
							end
						else
							bullet:SetPoint("TOP", parent.Bullets[k-1], "BOTTOM", 0, 0);
						end
						bullet.Text:SetText(text);
						bullet.Text:SetTextColor(1,1,1,1)
						bullet.Text:SetShadowColor(0,0,0,0)
						bullet.Text:SetFont(unpack(miirgui.medium));
						if (bullet.Text:GetContentHeight() ~= 0) then
							bullet:SetHeight(bullet.Text:GetContentHeight());
						end
						if (hideBullets) then
							bullet:Hide();
						else
							bullet:Show();
						end
						k = k + 1;
					else
						skipped = skipped + 1;
					end
				end
			
			end

			hooksecurefunc("EncounterJournal_SetBullets",miirgui_EncounterJournal_SetBullets)

			local function miirgui_EncounterJournal_ToggleHeaders()
				for i = 1, 50 do
					if _G["EncounterJournalInfoHeader"..i] then  
						_G["EncounterJournalInfoHeader"..i].description:SetTextColor(1, 1, 1,1)
						_G["EncounterJournalInfoHeader"..i].description:SetShadowColor(0,0,0,0)
						_G["EncounterJournalInfoHeader"..i].description:SetFont(unpack(miirgui.medium))
						_G["EncounterJournalInfoHeader"..i].button.expandedIcon:SetTextColor(unpack(miirgui.Color));
						_G["EncounterJournalInfoHeader"..i].button.expandedIcon:SetShadowColor(0,0,0,0)
						_G["EncounterJournalInfoHeader"..i].button.expandedIcon:SetFont(unpack(miirgui.small))      
					end
				end    
			end

			hooksecurefunc("EncounterJournal_ToggleHeaders", miirgui_EncounterJournal_ToggleHeaders)

			local function miirgui_EncounterJournal_DisplayInstance(instanceID, noButton)
				local self = EncounterJournal.encounter;
				local iname, description, bgImage, _, loreImage, buttonImage = EJ_GetInstanceInfo();
				self.instance.title:SetTextColor(1,1,1,1)
				self.instance.title:SetFont(unpack(miirgui.huge))
				self.info.instanceButton.instanceID = instanceID;
				self.info.instanceButton.icon:Hide()

					local f = CreateFrame("Frame",nil,EncounterJournalEncounterFrameInfoInstanceButton)
					f:SetFrameStrata("Medium")
					f:SetWidth(36) -- Set these to whatever height/width is needed 
					f:SetHeight(36) -- for your Texture
					local t = f:CreateTexture(nil,"HIGH")
					t:SetTexture(buttonImage)
					t:SetAllPoints(f)
					f.texture = t
					f:SetPoint("CENTER",1,0)
					f:Show()

				local bossIndex = 1;
				local name, description, bossID, _, link = EJ_GetEncounterInfoByIndex(bossIndex);
				local bossButton;
				while bossID do
					bossButton = _G["EncounterJournalBossButton"..bossIndex];
					bossButton:SetText(name);
					bossButton:GetFontString():SetTextColor(1,1,1,1)
					bossButton:GetFontString():SetFont(unpack(miirgui.medium))
					bossButton:GetFontString():SetShadowColor(0,0,0,0)
					bossButton:Show();
					bossIndex = bossIndex + 1;
					name, description, bossID, _, link = EJ_GetEncounterInfoByIndex(bossIndex);
				end
			end

			hooksecurefunc("EncounterJournal_DisplayInstance", miirgui_EncounterJournal_DisplayInstance)

			local function miirgui_EncounterJournal_DisplayEncounter()
				local id, name, displayInfo, iconImage;
				for i=1,9 do 
					id, name, description, displayInfo, iconImage = EJ_GetCreatureInfo(i);
						if id then
						local button = EncounterJournal_GetCreatureButton(i);
						button.creature:SetTexCoord(0.13, 0.83, 0.13, 0.83);
						SetPortraitTexture(button.creature, displayInfo);
						end
				end
			end

			hooksecurefunc("EncounterJournal_DisplayEncounter",miirgui_EncounterJournal_DisplayEncounter)

			--[[TradeSkillFrame Changes]]

		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_TradeSkillUI" then

		local loaded = LoadAddOn("BiggerTradeskillUI")
		if not loaded then

				local tsdw = IsAddOnLoaded("TradeSkillDW")
				if tsdw == true then
					local tsdwb = CreateFrame("Frame", "nil",TradeSkillFrame)
					tsdwb:SetFrameStrata("MEDIUM")
					tsdwb:SetPoint("Topleft",TradeSkillFrame,4,-80)
					tsdwb:SetPoint("BottomRight",TradeSkillFrame,-6,24)
					tsdwb:SetBackdrop({
					bgFile = "",
					edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
					edgeSize = 14,})
					tsdwb:SetBackdropColor(0, 0, 0, 0)
					tsdwb:SetBackdropBorderColor(1, 1, 1)	

				else
					Border(TradeSkillFrame,330,320,"Center",-1,-28,14,"Medium")
				end
		else
			Border(TradeSkillFrame,546,420,"Center",-1,-28,12,"Medium")
			BTSUiTexDetailBackground:Hide()
		end
		TradeSkillFramePortrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)


			--[[GuildControlUI Changes]]

		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_GuildControlUI" then

			GuildControlUIHbar:Hide()
			GuildControlUITopBg:Hide()
			for i =1,8 do
				hideit= select(i,GuildControlUIRankBankFrameInset:GetRegions())
				hideit:Hide()
			end

--[[BlackMarket Changes]]

		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_BlackMarketUI" then
			Top= select(11,BlackMarketFrame:GetRegions() )
			Top:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock")
			BlackMarketScrollFrameScrollBarTrack:Hide()
			for i=12,21 do
				hideit= select(i,BlackMarketFrame:GetRegions() )
				hideit:Hide()
			end
			hideit= select(9,BlackMarketFrame:GetChildren() )
			for i=1,8 do 
				hideit2 = select(i,hideit:GetRegions() )
				hideit2:Hide()
			end
			Border(BlackMarketFrame,612,412,"Center",-116,-21,14,"MEDIUM")
			hooksecurefunc("BlackMarketScrollFrame_Update",function()
				items= C_BlackMarket.GetNumItems()
				for i=1,items do
					fixitleft= select(1,_G["BlackMarketScrollFrameButton"..i]:GetRegions() )
					fixitleft:ClearAllPoints()
					fixitleft:SetPoint("Left",34,3)
					fixitleft:SetHeight(36)
					fixitright= select(2,_G["BlackMarketScrollFrameButton"..i]:GetRegions() )
					fixitright:SetHeight(36)
					fixitright:ClearAllPoints()
					fixitright:SetPoint("Right",0,3)
					fixitmiddle= select(3,_G["BlackMarketScrollFrameButton"..i]:GetRegions() )
					fixitmiddle:SetHeight(36)
				end
			end)

--[[GuildFrame Changes]]

		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_GuildUI" then

			GuildInfoDetailsFrameScrollBarTrack:SetAlpha(0)
			GuildNewsContainerScrollBarTrack:SetAlpha(0)
			GuildPerksContainerScrollBarTrack:Hide()
			GuildLogScrollFrameScrollBarTrack:Hide()
			Emblem1 = select(1, GuildPointFrame:GetRegions())
			Emblem1:Hide()
			Emblem2 = select(4, GuildPointFrame:GetRegions())
			Emblem2:Hide()
			GuildTextEditScrollFrameScrollBarTrack:Hide()
			
			local FixPerksBG= CreateFrame("Frame","miirgui_GuildPerksFrame",GuildPerksFrame)
			FixPerksBG:SetFrameStrata("Medium")
			FixPerksBG:SetWidth(323) 
			FixPerksBG:SetHeight(323)
			local FixPerksBGtexture = FixPerksBG:CreateTexture(nil,"BACKGROUND")
			FixPerksBGtexture:SetTexture("Interface\\FrameGeneral\\UI-Background-Marble.blp")
			FixPerksBGtexture:SetAllPoints(FixPerksBG)
			FixPerksBG.texture = FixPerksBGtexture
			FixPerksBG:SetPoint("Center",-1,-6)
			FixPerksBG:Show()
			
			Border(GuildRosterFrame,330,310,"Center",-1,-32,14,"Medium")
			Border(GuildPerksFrame,330,330,"Center",-1,-6,12,"Medium")
			Border(GuildInfoFrameRecruitment,330,336,"Center",-1,0,12,"Medium")
			Border(GuildInfoFrameApplicants,330,336,"Center",-1,0,12,"Medium")

			--[[GuildBankFrame Changes]]

		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_GuildBankUI" then

			GuildBankFrameBlackBG:Hide()
			GuildBankEmblemFrame:Hide()
			Border(GuildBankFrame,720,316,"Center",1,0,14,"MEDIUM")
			local c = CreateFrame("Frame",GuildBankBackground,GuildBankFrame)
			c:SetFrameStrata("Low")
			local ct = c:CreateTexture(nil,"BACKGROUND")
			ct:SetTexture("Interface\\FrameGeneral\\UI-Background-Marble.blp")
			ct:SetAllPoints(c)
			c.texture = ct
			c:SetPoint("Topleft",0,0)
			c:SetPoint("Bottomright",0,0)
			c:Show()

			local function miirgui_GuildBankFrame_Update()
				local tab = GetCurrentGuildBankTab();
				local button, index, column;
				local texture, itemCount, locked, isFiltered, quality;
				for i=1, MAX_GUILDBANK_SLOTS_PER_TAB do
					index = mod(i, NUM_SLOTS_PER_GUILDBANK_GROUP);
					if ( index == 0 ) then
						index = NUM_SLOTS_PER_GUILDBANK_GROUP;
					end
				column = ceil((i-0.5)/NUM_SLOTS_PER_GUILDBANK_GROUP);
				button = _G["GuildBankColumn"..column.."Button"..index];
				button:SetID(i);
				texture, itemCount, locked, isFiltered, quality = GetGuildBankItemInfo(tab, i);
					if (quality and quality >= LE_ITEM_QUALITY_COMMON and BAG_ITEM_QUALITY_COLORS[quality]) then
						button.IconBorder:SetTexture("Interface\\Containerframe\\quality.blp")
						button.IconBorder:Show();
						button.IconBorder:SetVertexColor(BAG_ITEM_QUALITY_COLORS[quality].r, BAG_ITEM_QUALITY_COLORS[quality].g, BAG_ITEM_QUALITY_COLORS[quality].b);
						button.Count:ClearAllPoints()
						button.Count:SetPoint("Center", 0, -11)
					end
				end
			end

			hooksecurefunc("GuildBankFrame_Update", miirgui_GuildBankFrame_Update)

			--[[PetJournalFrame Changes]]	

		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_PetJournal" then
			for i=1,11 do
			_G["MountJournalListScrollFrameButton"..i.."Favorite"]:ClearAllPoints()
			_G["MountJournalListScrollFrameButton"..i.."Favorite"]:SetPoint("Right", -5, 0)
			end
			MountJournalSummonRandomFavoriteButtonBorder:Hide()
			PetJournalParentPortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			PetJournalTutorialButton:Hide()
			MountJournalListScrollFrameScrollBarBG:Hide()																								
			PetJournalListScrollFrameScrollBarBG:Hide()				
			PetJournalLoadoutPet2BG:Hide()
			PetJournalLoadoutPet3BG:Hide()
			PetJournalLoadoutPet1PetTypeIcon:SetBlendMode("Add")
			PetJournalLoadoutPet2PetTypeIcon:SetBlendMode("Add")
			PetJournalLoadoutPet3PetTypeIcon:SetBlendMode("Add")
			PetJournalPetCardBG:Hide()
			PetJournalLoadoutBorder:Hide()
			PetJournalLoadoutPet1BG:Hide()
			PetJournalLoadoutPet2BG:Hide()
			PetJournalLoadoutPet3BG:Hide()
			PetJournalHealPetButtonBorder:Hide()
			ToyBoxIconsFrameBackgroundTile:SetDesaturated(1)
			ToyBoxIconsFrameOverlayShadowTopLeft:Hide()
			ToyBoxIconsFrameOverlayShadowTop:Hide()
			ToyBoxIconsFrameOverlayShadowTopRight:Hide()
			ToyBoxIconsFrameOverlayShadowRight:Hide()
			ToyBoxIconsFrameOverlayShadowLeft:Hide()
			ToyBoxIconsFrameOverlayShadowBottomLeft:Hide()
			ToyBoxIconsFrameOverlayShadowBottomRight:Hide()
			ToyBoxIconsFrameOverlayShadowBottom:Hide()
			ToyBoxIconsFrameBGCornerFilagreeBottomLeft:Hide()
			ToyBoxIconsFrameBGCornerFilagreeBottomRight:Hide()
			ToyBoxIconsFrameBGCornerTopLeft:Hide()
			ToyBoxIconsFrameBGCornerTopRight:Hide()
			ToyBoxIconsFrameBGCornerBottomRight:Hide()
			ToyBoxIconsFrameBGCornerBottomLeft:Hide()
			ToyBoxIconsFrameShadowLineTop:Hide()
			ToyBoxIconsFrameShadowLineBottom:Hide()
			ToyBoxIconsFrameShadowCornerTopRight:Hide()
			ToyBoxIconsFrameShadowCornerTopLeft:Hide()
			ToyBoxIconsFrameShadowCornerLeft:Hide()
			ToyBoxIconsFrameShadowCornerRight:Hide()
			ToyBoxIconsFrameShadowCornerBottomLeft:Hide()
			ToyBoxIconsFrameShadowCornerBottomRight:Hide()
			ToyBoxIconsFrameShadowCornerTop:Hide()
			ToyBoxIconsFrameShadowCornerBottom:Hide()
			ToyBoxIconsFrameWatermarkToy:Hide()
			ToyBoxPageText:SetFont(unpack(miirgui.medium))
			ToyBoxPageText:SetShadowColor(0,0,0,0)
			ToyBoxPageText:SetTextColor(1, 1, 1,1)
			Border(PetJournalParent,264,522,"Left",2,-17,14,"HIGH")
			Border(MountJournal,414,522,"Center",139,-17,12,"HIGH")
			Border(PetJournalPetCard,414,174,"TopLeft",-4,4,14,"HIGH")
			Border(PetJournalLoadoutPet2,414,108,"TopLeft",-8,0,14,"HIGH")
			Border(PetJournalLoadoutPet1,414,334,"TopLeft",-8,6,14,"HIGH")
			Border(ToyBoxIconsFrame,696,544,"Center",0,0,12,"HIGH")
			Border(MountJournal.MountDisplay.InfoButton,42,42,"Center",-66,-20,14,"HIGH")
			Border(MountJournalListScrollFrameButton1,42,42,"Left",-44,0,14,"HIGH")
			Border(MountJournalListScrollFrameButton2,42,42,"Left",-44,0,14,"HIGH")
			Border(MountJournalListScrollFrameButton3,42,42,"Left",-44,0,14,"HIGH")
			Border(MountJournalListScrollFrameButton4,42,42,"Left",-44,0,14,"HIGH")
			Border(MountJournalListScrollFrameButton5,42,42,"Left",-44,0,14,"HIGH")
			Border(MountJournalListScrollFrameButton6,42,42,"Left",-44,0,14,"HIGH")
			Border(MountJournalListScrollFrameButton7,42,42,"Left",-44,0,14,"HIGH")
			Border(MountJournalListScrollFrameButton8,42,42,"Left",-44,0,14,"HIGH")
			Border(MountJournalListScrollFrameButton9,42,42,"Left",-44,0,14,"HIGH")
			Border(MountJournalListScrollFrameButton10,42,42,"Left",-44,0,14,"HIGH")
			Border(MountJournalListScrollFrameButton11,42,42,"Left",-44,0,14,"HIGH")

			local function miirgui_ToySpellButton_UpdateButton(self)
				local itemIndex = (ToyBox_GetCurrentPage() - 1) * 18 + self:GetID();
				local name = self:GetName();
				local toyString = _G[name.."ToyName"];
				local slotFrameCollected = _G[name.."SlotFrameCollected"];
				local slotFrameUncollected = _G[name.."SlotFrameUncollected"];
				local itemID, toyName, icon = C_ToyBox.GetToyInfo(self.itemID);
				toyString:SetText(toyName);	
				toyString:Show();
				if (PlayerHasToy(self.itemID)) then
					toyString:SetTextColor(unpack(miirgui.Color));
					toyString:SetShadowColor(0, 0, 0, 1);
					toyString:SetFont(unpack(miirgui.small))
					slotFrameCollected:Show()
					slotFrameCollected:SetTexture("Interface\\Buttons\\UI-Quickslot")
					slotFrameCollected:SetHeight(74)
					slotFrameCollected:SetWidth(74)
				else
					toyString:SetTextColor(1, 1, 1, 1);
					toyString:SetFont(unpack(miirgui.small))
					toyString:SetShadowColor(0, 0, 0, 0);
					slotFrameUncollected:SetDesaturated(true)
					slotFrameUncollected:SetTexture("Interface\\Buttons\\UI-Quickslot")
					slotFrameUncollected:SetHeight(74)
					slotFrameUncollected:SetWidth(74)
					slotFrameUncollected:Show();
				end
			end

			hooksecurefunc("ToySpellButton_UpdateButton",miirgui_ToySpellButton_UpdateButton)

			local function miirgui_PetJournal_UpdatePetLoadOut()
				local rarityaddon = IsAddOnLoaded("Rarity")
				if rarityaddon == true then
				else
					for i=1,3 do
						local loadoutPlate = PetJournal.Loadout["Pet"..i];
						local petID, ability1ID, ability2ID, ability3ID, locked = C_PetJournal.GetPetLoadOutInfo(i);
							loadoutPlate.level:SetTextColor(1,1,1,1)
							loadoutPlate.level:SetFont(unpack(miirgui.small))
							local health, maxHealth, attack, speed, rarity = C_PetJournal.GetPetStats(petID);
							loadoutPlate.qualityBorder:SetTexture("Interface\\Containerframe\\quality.blp")
							loadoutPlate.qualityBorder:SetVertexColor(ITEM_QUALITY_COLORS[rarity-1].r, ITEM_QUALITY_COLORS[rarity-1].g, ITEM_QUALITY_COLORS[rarity-1].b);
					end 
				end
			end

			hooksecurefunc("PetJournal_UpdatePetLoadOut",miirgui_PetJournal_UpdatePetLoadOut)

			local function miirgui_PetJournal_UpdatePetCard(self)
				local speciesID, customName, level, name, icon, petType, creatureID, xp, maxXp, displayID, isFavorite, sourceText, description, isWild, canBattle, tradable, unique;
				if PetJournalPetCard.petID then
					speciesID, customName, level, xp, maxXp, displayID, isFavorite, name, icon, petType, creatureID, sourceText, description, isWild, canBattle, tradable, unique = C_PetJournal.GetPetInfoByPetID(PetJournalPetCard.petID);
					self.PetInfo.level:SetText(level);
					self.PetInfo.level:SetTextColor(1,1,1,1)
					self.PetInfo.level:SetFont(unpack(miirgui.small))
					self.PetInfo.qualityBorder:SetTexture("Interface\\Containerframe\\quality.blp")
					
						if petType == 1 then --humanoid
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\humanoid.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 2 then --dragonkin
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\dragon.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 3 then --flying
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\flying.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 4 then --undead
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\undead.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 5 then --critter
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\critter.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 6 then --magical
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\magical.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 7 then --elemental
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\elemental.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 8 then --brock lesnar
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\beast.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 9 then --aquatic
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\water.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 10 then --mechanical
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\mechanical.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					end
				else
					speciesID = PetJournalPetCard.speciesID;
					_,_, petType= C_PetJournal.GetPetInfoBySpeciesID(PetJournalPetCard.speciesID);
				if petType == 1 then --humanoid
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\humanoid.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 2 then --dragonkin
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\dragon.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 3 then --flying
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\flying.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 4 then --undead
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\undead.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 5 then --critter
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\critter.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 6 then --magical
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\magical.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 7 then --elemental
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\elemental.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 8 then --brock lesnar
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\beast.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 9 then --aquatic
						self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\water.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
					elseif petType == 10 then --mechanical
											self.TypeInfo.typeIcon:SetTexture("Interface\\PetBattles\\mechanical.blp")
						self.TypeInfo.typeIcon:SetHeight(32)
						self.TypeInfo.typeIcon:SetWidth(32)
						self.TypeInfo.typeIcon:SetTexCoord(0,1,0,1)
				end
				end
			end

			hooksecurefunc("PetJournal_UpdatePetCard",miirgui_PetJournal_UpdatePetCard)

			local function miirgui_PetJournal_UpdatePetList()
				local scrollFrame = PetJournal.listScroll;
				local offset = HybridScrollFrame_GetOffset(scrollFrame);
				local petButtons = scrollFrame.buttons;
				local pet, index;
				local numPets, numOwned = C_PetJournal.GetNumPets();
				PetJournal.PetCount.Count:SetText(numOwned);
				local summonedPetID = C_PetJournal.GetSummonedPetGUID();
				for i = 1,#petButtons do
					pet = petButtons[i];
					index = offset + i;
					if index <= numPets then
						local petID, speciesID, isOwned, customName, level, favorite, isRevoked, name, icon, petType, creatureID, sourceText, description, isWildPet, canBattle = C_PetJournal.GetPetInfoByIndex(index);
						if isOwned then
							local health, maxHealth, attack, speed, rarity = C_PetJournal.GetPetStats(petID);
							pet.dragButton.level:SetTextColor(1,1,1,1)
							pet.dragButton.level:SetFont(unpack(miirgui.small))
							pet.iconBorder:SetTexture("Interface\\Containerframe\\quality.blp")
							pet.iconBorder:SetVertexColor(ITEM_QUALITY_COLORS[rarity-1].r, ITEM_QUALITY_COLORS[rarity-1].g, ITEM_QUALITY_COLORS[rarity-1].b);
						end
					end
				end
							for i=1,11 do
			_G["PetJournalListScrollFrameButton"..i.."PetTypeIcon"]:SetHeight(33)
			_G["PetJournalListScrollFrameButton"..i.."PetTypeIcon"]:SetWidth(66)
			_G["PetJournalListScrollFrameButton"..i.."PetTypeIcon"]:ClearAllPoints()
			_G["PetJournalListScrollFrameButton"..i.."PetTypeIcon"]:SetPoint("Right", -4, 0)
			end
			end

			hooksecurefunc("PetJournal_UpdatePetList",miirgui_PetJournal_UpdatePetList)

			--[[ItemSocktingFrame Changes]]

		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_ItemSocketingUI" then
		
			for i=19,27 do
				hideit= select(i,ItemSocketingFrame:GetRegions() )
				hideit:Hide()
			end
			for i=36,37 do
				hideit= select(i,ItemSocketingFrame:GetRegions() )
				hideit:Hide()
			end
			for i=46,51 do
				hideit= select(i,ItemSocketingFrame:GetRegions() )
				hideit:Hide()
			end
			for i=40,50 do
				hideit= select(i,ItemSocketingFrame:GetRegions() )
				hideit:Hide()
			end
			ItemSocketingFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			Border(ItemSocketingFrameInset,304,276,"TopLeft",12,-12,12,"MEDIUM")

			--[[ArchaeologyFrame Changes]]

		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_ArchaeologyUI" then

			ArchaeologyFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			ArchaeologyFrameHelpPageTitle:SetTextColor(unpack(miirgui.Color))
			ArchaeologyFrameHelpPageTitle:SetFont(unpack(miirgui.medium))
			ArchaeologyFrameHelpPageTitle:SetShadowColor(0,0,0,0)
			ArchaeologyFrameHelpPageDigTitle:SetTextColor(unpack(miirgui.Color))
			ArchaeologyFrameHelpPageDigTitle:SetFont(unpack(miirgui.medium))
			ArchaeologyFrameHelpPageDigTitle:SetShadowColor(0,0,0,0)
			ArchaeologyFrameHelpPageHelpScrollHelpText:SetTextColor(1,1,1,1)
			ArchaeologyFrameHelpPageHelpScrollHelpText:SetFont(unpack(miirgui.medium))
			ArchaeologyFrameHelpPageHelpScrollHelpText:SetShadowColor(0,0,0,0)
			ArchaeologyFrameSummaryPageTitle:SetTextColor(unpack(miirgui.Color))
			ArchaeologyFrameSummaryPageTitle:SetFont(unpack(miirgui.medium))
			ArchaeologyFrameSummaryPageTitle:SetShadowColor(0,0,0,0)
			ArchaeologyFrameCompletedPageTitle:SetTextColor(unpack(miirgui.Color))
			ArchaeologyFrameCompletedPageTitle:SetFont(unpack(miirgui.medium))
			ArchaeologyFrameCompletedPageTitle:SetShadowColor(0,0,0,0)
			ArchaeologyFrameCompletedPageTitleMid:SetTextColor(unpack(miirgui.Color))
			ArchaeologyFrameCompletedPageTitleMid:SetFont(unpack(miirgui.medium))
			ArchaeologyFrameCompletedPageTitleMid:SetShadowColor(0,0,0,0)
			nothingcompleted=select(1,ArchaeologyFrameCompletedPage:GetRegions())
			nothingcompleted:SetFont(unpack(miirgui.medium))
			nothingcompleted:SetTextColor(1,1,1,1)
			nothingcompleted:SetShadowColor(0,0,0,0)
			for i= 1, 12 do
				DiggingRace= _G["ArchaeologyFrameSummaryPageRace"..i]
				DiggingRaceProgress = select(1,DiggingRace:GetRegions())
				DiggingRaceProgress:SetTextColor(1,1,1,1)	
				DiggingRaceProgress:SetFont(unpack(miirgui.medium))
				DiggingRaceProgress:SetShadowColor(0,0,0,0)	
			end
			ArchaeologyFrameArtifactPageHistoryTitle:SetTextColor(unpack(miirgui.Color))
			ArchaeologyFrameArtifactPageHistoryTitle:SetFont(unpack(miirgui.medium))
			ArchaeologyFrameArtifactPageHistoryTitle:SetShadowColor(0,0,0,0)
			ArchaeologyFrameArtifactPageHistoryScrollChildText:SetTextColor(1,1,1,1)	
			ArchaeologyFrameArtifactPageHistoryScrollChildText:SetFont(unpack(miirgui.medium))
			ArchaeologyFrameArtifactPageHistoryScrollChildText:SetShadowColor(0,0,0,0)
			ArchaeologyFrameCompletedPageTitleTop:SetTextColor(unpack(miirgui.Color))
			ArchaeologyFrameCompletedPageTitleTop:SetFont(unpack(miirgui.medium))
			ArchaeologyFrameCompletedPageTitleTop:SetShadowColor(0,0,0,0)
			for i= 1,12 do
				ArtifactNumber= _G["ArchaeologyFrameCompletedPageArtifact"..i]
				ArtifactBg=select(2,ArtifactNumber:GetRegions())
				ArtifactBg:Hide()
				ArtifactName=select(4,ArtifactNumber:GetRegions())
				ArtifactName:SetTextColor(1,1,1,1)	
				ArtifactName:SetFont(unpack(miirgui.medium))
				ArtifactName:SetShadowColor(0,0,0,0)
				ArtifactSubText=select(5,ArtifactNumber:GetRegions())
				ArtifactSubText:SetTextColor(1,1,1,1)
				ArtifactSubText:SetFont(unpack(miirgui.small))
				ArtifactSubText:SetShadowColor(0,0,0,0)
			end
			ArchaeologyFrameCompletedPagePageText:SetTextColor(1,1,1,1)	
			ArchaeologyFrameCompletedPagePageText:SetFont(unpack(miirgui.medium))
			ArchaeologyFrameCompletedPagePageText:SetShadowColor(0,0,0,0)
			ArchaeologyFrameRankBarBar:SetVertexColor(unpack(miirgui.Color))
			ArchaeologyFrameArtifactPageArtifactName:SetTextColor(unpack(miirgui.Color))
			ArchaeologyFrameArtifactPageArtifactName:SetFont(unpack(miirgui.medium))
			ArchaeologyFrameArtifactPageArtifactName:SetShadowColor(0,0,0,0)
			ArchaeologyFrameArtifactPageArtifactSubText:SetTextColor(1,1,1,1)
			ArchaeologyFrameArtifactPageArtifactSubText:SetFont(unpack(miirgui.small))
			ArchaeologyFrameArtifactPageArtifactSubText:SetShadowColor(0,0,0,0)
			ArchaeologyFrameSummaryPagePageText:SetTextColor(1,1,1,1)
			ArchaeologyFrameSummaryPagePageText:SetShadowColor(0,0,0,0)
			ArchaeologyFrameSummaryPagePageText:SetFont(unpack(miirgui.small))
			ArchaeologyFrameArtifactPageRaceBG:SetDesaturated(0)

			hooksecurefunc("ArchaeologyFrame_CurrentArtifactUpdate", function(self)
			ArchaeologyFrameArtifactPageRaceBG:SetDesaturated(0)
			end)

			--[[AuctionFrame Changes]]

		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_AuctionUI" then

			local function miirgui_AuctionFrameAuctions_Update()
				local offset = FauxScrollFrame_GetOffset(AuctionsScrollFrame);
				local index;
				for i=1, NUM_AUCTIONS_TO_DISPLAY do
					index = offset + i + (NUM_AUCTION_ITEMS_PER_PAGE * AuctionFrameAuctions.page);
					auction = _G["AuctionsButton"..i];
					buttonName = "AuctionsButton"..i;
					button = _G[buttonName];
					local itemButton = _G[buttonName.."Item"];
					if (quality) then
						itemButton.IconBorder:Hide();
					else
						itemButton.IconBorder:Hide();
					end
					for i=1,9 do
						_G["AuctionsButton"..i.."Middle"] = select (4, _G["AuctionsButton"..i]:GetRegions())
						_G["AuctionsButton"..i.."Middle"]:SetHeight(36)
						_G["AuctionsButton"..i.."Left"]:SetHeight(36)
						_G["AuctionsButton"..i.."Left"]:ClearAllPoints()
						_G["AuctionsButton"..i.."Left"]:SetPoint("Left",34,3.5)
						_G["AuctionsButton"..i.."Right"]:SetHeight(36)
						_G["AuctionsButton"..i.."Right"]:ClearAllPoints()
						_G["AuctionsButton"..i.."Right"]:SetPoint("Right",0,3.5)
						_G["AuctionsButton"..i.."Highlight"]:ClearAllPoints()
						_G["AuctionsButton"..i.."Highlight"]:SetPoint("Topleft",35,2)
						_G["AuctionsButton"..i.."Highlight"]:SetHeight(34)
						_G["AuctionsButton"..i.."ItemCount"]:ClearAllPoints()
						_G["AuctionsButton"..i.."ItemCount"]:SetPoint("Center", 0, -7)
					end
				end
			end

			hooksecurefunc("AuctionFrameAuctions_Update",miirgui_AuctionFrameAuctions_Update)

			local function miirgui_AuctionFrameBid_Update()
				local button, buttonName;
				local index;
					for i=1, 9 do
						button = _G["BidButton"..i];
						buttonName = "BidButton"..i;
						local itemButton = _G[buttonName.."Item"];
						itemButton.IconBorder:Hide();
					end
					for i=1,9 do
						_G["BidButton"..i.."Middle"] = select (6, _G["BidButton"..i]:GetRegions())
						_G["BidButton"..i.."Middle"]:SetHeight(36)
						_G["BidButton"..i.."Left"]:SetHeight(36)
						_G["BidButton"..i.."Left"]:ClearAllPoints()
						_G["BidButton"..i.."Left"]:SetPoint("Left",34,3.5)
						_G["BidButton"..i.."Right"]:SetHeight(36)
						_G["BidButton"..i.."Right"]:ClearAllPoints()
						_G["BidButton"..i.."Right"]:SetPoint("Right",0,3.5)
						_G["BidButton"..i.."Highlight"]:ClearAllPoints()
						_G["BidButton"..i.."Highlight"]:SetPoint("Topleft",35,2)
						_G["BidButton"..i.."Highlight"]:SetHeight(34)
						_G["BidButton"..i.."ItemCount"]:ClearAllPoints()
						_G["BidButton"..i.."ItemCount"]:SetPoint("Center", 0, -7)
				end
			end

			hooksecurefunc("AuctionFrameBid_Update",miirgui_AuctionFrameBid_Update)

			local function miirgui_AuctionFrameBrowse_Update()
				for i = 1,8 do
					QualityTexture= select(4,_G["BrowseButton"..i.."Item"]:GetRegions() )
					QualityTexture:SetAlpha(0)
					_G["BrowseButton"..i.."Middle"] = select (5, _G["BrowseButton"..i]:GetRegions())
					_G["BrowseButton"..i.."Middle"]:SetHeight(36)
					_G["BrowseButton"..i.."Left"]:SetHeight(36)
					_G["BrowseButton"..i.."Left"]:ClearAllPoints()
					_G["BrowseButton"..i.."Left"]:SetPoint("Left",34,3.5)
					_G["BrowseButton"..i.."Right"]:SetHeight(36)
					_G["BrowseButton"..i.."Right"]:ClearAllPoints()
					_G["BrowseButton"..i.."Right"]:SetPoint("Right",0,3.5)
					_G["BrowseButton"..i.."Highlight"]:ClearAllPoints()
					_G["BrowseButton"..i.."Highlight"]:SetPoint("Topleft",35,2)
					_G["BrowseButton"..i.."Highlight"]:SetHeight(34)
					_G["BrowseButton"..i.."ItemCount"]:ClearAllPoints()
					_G["BrowseButton"..i.."ItemCount"]:SetPoint("Center", 0, -7)
				end
			end

			hooksecurefunc("AuctionFrameBrowse_Update",miirgui_AuctionFrameBrowse_Update)

			--[[LookingForGuildFrame Changes]]

		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_LookingForGuildUI" then

			LookingForGuildFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)

			--[[MacroFrame Changes]]

		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_MacroUI" then

			for i=19,21 do
				hideit= select(i,MacroFrame:GetRegions() )
				hideit:Hide() 
			end
			MacroFramePortraitmiirgui=select(18,MacroFrame:GetRegions())
			MacroFramePortraitmiirgui:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			MacroFramePortraitmiirgui:SetPoint("Topleft",-8,9)
			MacroFramePortraitmiirgui:SetWidth(64)
			MacroFramePortraitmiirgui:SetHeight(64)

			--[[InspectFrame Changes]]

		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_InspectUI" then

			local function miirgui_InspectPaperDollItemSlotButton_Update(button)
				headquality= select(5,InspectHeadSlot:GetRegions() )
				headquality:SetTexture("Interface\\Containerframe\\quality.blp")
				neckquality= select(5,InspectNeckSlot:GetRegions() )
				neckquality:SetTexture("Interface\\Containerframe\\quality.blp")
				shoulderquality= select(5,InspectShoulderSlot:GetRegions() )
				shoulderquality:SetTexture("Interface\\Containerframe\\quality.blp")
				backquality= select(5,InspectBackSlot:GetRegions() )
				backquality:SetTexture("Interface\\Containerframe\\quality.blp")
				chestquality= select(5,InspectChestSlot:GetRegions() )
				chestquality:SetTexture("Interface\\Containerframe\\quality.blp")
				shirtquality= select(5,InspectShirtSlot:GetRegions() )
				shirtquality:SetTexture("Interface\\Containerframe\\quality.blp")
				tabardquality= select(5,InspectTabardSlot:GetRegions() )
				tabardquality:SetTexture("Interface\\Containerframe\\quality.blp")
				wristquality= select(5,InspectWristSlot:GetRegions() )
				wristquality:SetTexture("Interface\\Containerframe\\quality.blp")
				handquality= select(5,InspectHandsSlot:GetRegions() )
				handquality:SetTexture("Interface\\Containerframe\\quality.blp")
				waistquality= select(5,InspectWaistSlot:GetRegions() )
				waistquality:SetTexture("Interface\\Containerframe\\quality.blp")
				legquality= select(5,InspectLegsSlot:GetRegions() )
				legquality:SetTexture("Interface\\Containerframe\\quality.blp")
				feetquality= select(5,InspectFeetSlot:GetRegions() )
				feetquality:SetTexture("Interface\\Containerframe\\quality.blp")
				finger0quality= select(5,InspectFinger0Slot:GetRegions() )
				finger0quality:SetTexture("Interface\\Containerframe\\quality.blp")
				finger1quality= select(5,InspectFinger1Slot:GetRegions() )
				finger1quality:SetTexture("Interface\\Containerframe\\quality.blp")
				trinket0quality= select(5,InspectTrinket0Slot:GetRegions() )
				trinket0quality:SetTexture("Interface\\Containerframe\\quality.blp")
				trinket1quality= select(5,InspectTrinket1Slot:GetRegions() )
				trinket1quality:SetTexture("Interface\\Containerframe\\quality.blp")
				mainhandquality= select(5,InspectMainHandSlot:GetRegions() )
				mainhandquality:SetTexture("Interface\\Containerframe\\quality.blp")
				offhandquality= select(5,InspectSecondaryHandSlot:GetRegions() )
				offhandquality:SetTexture("Interface\\Containerframe\\quality.blp")
			end

			hooksecurefunc("InspectPaperDollItemSlotButton_Update",miirgui_InspectPaperDollItemSlotButton_Update)

			InspectFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			SpecializationRing:Hide()
			SpecializationSpecIcon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			for i=1,6 do
				_G["InspectGlyphsGlyph"..i.."Ring"]:Hide()
				_G["InspectGlyphsGlyph"..i.."Glyph"]:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			end
			InspectGuildFrameBG:Hide()
			Border(InspectGlyphsGlyph1,48,48,"Center",0,0,14,"Medium")	
			Border(InspectGlyphsGlyph5,48,48,"Center",0,0,14,"Medium")	
			Border(InspectGlyphsGlyph3,48,48,"Center",0,0,14,"Medium")	
			Border(InspectGlyphsGlyph2,64,64,"Center",0,0,14,"Medium")
			Border(InspectGlyphsGlyph4,64,64,"Center",0,0,14,"Medium")
			Border(InspectGlyphsGlyph6,64,64,"Center",0,0,14,"Medium")	
			Border(Specialization,76,76,"TOPLEFT",16,-14,14,"Medium")
			Border(InspectGuildFrame,330,340,"LEFT",4,-18,14,"Medium")	

			--[[TrainerFrame Changes]]

		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_TrainerUI" then

			ClassTrainerFramePortrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)

			--[[ChallengesFrame Changes]]

		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_ChallengesUI" then

			ChallengesFrameDetailsLine1:Hide()
			ChallengesFrameDetailsLine2:Hide()
			ChallengeBG= select(1,ChallengesFrameDetails:GetRegions() )
			ChallengeBG:Hide() 
			Border(ChallengesFrameDetails,340,34,"Center",-2,20,14,"HIGH")
			Border(ChallengesFrameRewardRow1,340,34,"Center",0,0,12,"MEDIUM")
			Border(ChallengesFrameRewardRow2,340,34,"Center",0,0,12,"MEDIUM")
			Border(ChallengesFrameRewardRow3,340,34,"Center",0,0,12,"MEDIUM")

			--[[TalentFrame Changes]]

		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_TalentUI" then

			for i=1,4 do
				_G["PlayerTalentFrameSpecializationSpecButton"..i.."Ring"]:Hide()
				_G["PlayerTalentFrameSpecializationSpecButton"..i.."SpecIcon"]:SetTexCoord(0.85, 0.15, 0.15, 0.85)
				_G["PlayerTalentFrameSpecializationSpecButton"..i.."SpecIcon"]:SetWidth(42)
				_G["PlayerTalentFrameSpecializationSpecButton"..i.."SpecIcon"]:SetHeight(42)
			end
			for i=1,3 do
				_G["PlayerTalentFramePetSpecializationSpecButton"..i.."Ring"]:Hide()
				_G["PlayerTalentFramePetSpecializationSpecButton"..i.."SpecIcon"]:SetTexCoord(0.85, 0.15, 0.15, 0.85)
				_G["PlayerTalentFramePetSpecializationSpecButton"..i.."SpecIcon"]:SetWidth(42)
				_G["PlayerTalentFramePetSpecializationSpecButton"..i.."SpecIcon"]:SetHeight(42)
			end
			PlayerTalentFramePetSpecializationSpellScrollFrameScrollChildRing:Hide()
			PlayerTalentFramePetSpecializationSpellScrollFrameScrollChildSpecIcon:SetTexCoord(0.85, 0.15, 0.15, 0.85)	
			PlayerTalentFramePetSpecializationSpellScrollFrameScrollChildAbility1Ring:Hide()	
			PlayerTalentFramePetSpecializationSpellScrollFrameScrollChildAbility1Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)	
			PlayerTalentFrameSpecializationSpellScrollFrameScrollChildRing:Hide()
			PlayerTalentFrameSpecializationSpellScrollFrameScrollChildSpecIcon:SetTexCoord(0.85, 0.15, 0.15, 0.85)	
			PlayerTalentFrameSpecializationSpellScrollFrameScrollChildAbility1Ring:Hide()	
			PlayerTalentFrameSpecializationSpellScrollFrameScrollChildAbility1Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)	
			PlayerTalentFrameTalentsTutorialButton:Hide()
			PlayerTalentFrameSpecializationTutorialButton:Hide()	
			PlayerTalentFramePetSpecializationTutorialButton:Hide()	
			PlayerTalentFramePortrait:SetWidth(64)
			PlayerTalentFramePortrait:SetHeight(64)
			PlayerTalentFramePortrait:SetPoint("Topleft",-8,9)
			PlayerTalentFrameHoritontal = select(13,PlayerTalentFrameSpecializationSpellScrollFrameScrollChild:GetRegions())
			PlayerTalentFrameHoritontal:SetTexture(0.78,0.78,0.78,0)
			PlayerTalentFrameTintage = select(1,PlayerTalentFrameSpecializationSpellScrollFrameScrollChild:GetRegions())
			PlayerTalentFrameTintage:SetTexture(0,0,0,0)		
			PlayerTalentFramePetHoritontal = select(13,PlayerTalentFramePetSpecializationSpellScrollFrameScrollChild:GetRegions())
			PlayerTalentFramePetHoritontal:SetTexture(0.78,0.78,0.78,0)
			PlayerTalentFramePetTintage = select(1,PlayerTalentFramePetSpecializationSpellScrollFrameScrollChild:GetRegions())
			PlayerTalentFramePetTintage:SetTexture(0,0,0,0)	
			PlayerSpecTab1Icon=select(2,PlayerSpecTab1:GetRegions())
			PlayerSpecTab1Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			PlayerSpecTab2Icon=select(2,PlayerSpecTab2:GetRegions())
			PlayerSpecTab2Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			Border(PlayerTalentFrameSpecializationSpellScrollFrame,414,414,"Center",0,-2,14,"MEDIUM")	
			Border(PlayerTalentFramePetSpecializationSpellScrollFrame,414,414,"Center",0,-2,14,"MEDIUM")	
			Border(PlayerTalentFramePetSpecializationSpecButton1,46,46,"Left",14,0,14,"MEDIUM")
			Border(PlayerTalentFramePetSpecializationSpecButton2,46,46,"Left",14,0,14,"MEDIUM")
			Border(PlayerTalentFramePetSpecializationSpecButton3,46,46,"Left",14,0,14,"MEDIUM")	
			Border(PlayerTalentFrameSpecializationSpecButton1,46,46,"Left",14,0,14,"MEDIUM")
			Border(PlayerTalentFrameSpecializationSpecButton2,46,46,"Left",14,0,14,"MEDIUM")
			Border(PlayerTalentFrameSpecializationSpecButton3,46,46,"Left",14,0,14,"MEDIUM")	
			Border(PlayerTalentFrameSpecializationSpellScrollFrameScrollChild,76,76,"TopLeft",16,-14,14,"MEDIUM")		
			Border(PlayerTalentFrameSpecializationSpellScrollFrameScrollChildAbility1,58,58,"Center",0,0,14,"MEDIUM")	
			Border(PlayerTalentFramePetSpecializationSpellScrollFrameScrollChild,76,76,"TopLeft",16,-14,14,"MEDIUM")		
			Border(PlayerTalentFramePetSpecializationSpellScrollFrameScrollChildAbility1,58,58,"Center",0,0,14,"MEDIUM")
			Border(PlayerTalentFrameTalents,640,384,"Center",0,0,14,"Medium")	

			local function miirgui_PlayerTalentFrame_CreateSpecSpellButton(frame, index)
				local scrollChild = frame.spellsScroll.child;
				local name = scrollChild:GetName() .. "Ability" .. index;
				local button = _G[name];
				child1,child2 = _G[name]:GetRegions();
				child1:Hide()
				child2:SetTexCoord(0.85, 0.15, 0.15, 0.85)
				Border(_G[name],58,58,"Center",0,0,14,"MEDIUM")
			end

			hooksecurefunc("PlayerTalentFrame_CreateSpecSpellButton", miirgui_PlayerTalentFrame_CreateSpecSpellButton)

			local function miirgui_PlayerTalentFrame_UpdateSpecFrame(self, spec)
				for i=1,4 do
				_G["PlayerTalentFrameSpecializationSpellScrollFrameScrollChildAbility"..i.."SubText"]:SetTextColor(1, 1, 1,1)
				_G["PlayerTalentFrameSpecializationSpellScrollFrameScrollChildAbility"..i.."SubText"]:SetShadowColor(0,0,0,0)
				_G["PlayerTalentFrameSpecializationSpellScrollFrameScrollChildAbility"..i.."SubText"]:SetFont(unpack(miirgui.small))
				end
			end

			hooksecurefunc("PlayerTalentFrame_UpdateSpecFrame",miirgui_PlayerTalentFrame_UpdateSpecFrame)

			--[[ItemAlterationFrame Changes]]

		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_ItemAlterationUI" then

			TransmogrifyArtFrameCornerTL:Hide()
			TransmogrifyArtFrameCornerTR:Hide()
			TransmogrifyArtFrameCornerBL:Hide()
			TransmogrifyArtFrameCornerBR:Hide()
			TransmogrifyArtFrameLeftEdge:Hide()
			TransmogrifyArtFrameRightEdge:Hide()
			TransmogrifyArtFrameTopEdge:Hide()
			TransmogrifyArtFrameBottomEdge:Hide()
			TransmogrifyFrameHeadSlotGrabber:Hide()
			TransmogrifyFrameShoulderSlotGrabber:Hide()
			TransmogrifyFrameBackSlotGrabber:Hide()
			TransmogrifyFrameChestSlotGrabber:Hide()
			TransmogrifyFrameWristSlotGrabber:Hide()
			TransmogrifyFrameMainHandSlotGrabber:Hide()
			TransmogrifyFrameSecondaryHandSlotGrabber:Hide()
			TransmogrifyFrameHandsSlotGrabber:Hide()
			TransmogrifyFrameWaistSlotGrabber:Hide()
			TransmogrifyFrameLegsSlotGrabber:Hide()
			TransmogrifyFrameFeetSlotGrabber:Hide()
			TransmogrifyArtFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			TransmogrifyModelFrameFix1 = select(2,TransmogrifyModelFrame:GetRegions())
			TransmogrifyModelFrameFix1:SetTexture(0,0,0,0)
			TransmogrifyModelFrameFix2 = select(1,TransmogrifyFrameButtonFrame:GetRegions())
			TransmogrifyModelFrameFix2:SetTexture(0,0,0,0)
			TranmogrifyArtFrameFix1 = select(23,TransmogrifyArtFrame:GetRegions())
			TranmogrifyArtFrameFix1:SetTexture(0,0,0,0)
			local c = CreateFrame("Frame",miirgui_TransmogrifyBackground,TransmogrifyFrame)
			c:SetFrameStrata("Low")
			local ct = c:CreateTexture(nil,"BACKGROUND")
			ct:SetTexture("Interface\\FrameGeneral\\UI-Background-Marble.blp")
			ct:SetAllPoints(c)
			c.texture = ct
			c:SetPoint("Topleft",0,0)
			c:SetPoint("Bottomright",0,0)
			c:Show()

			--[[VoidStorageFrame Changes]]

		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_VoidStorageUI" then

			local function miirgui_VoidStorage_ItemsUpdate(doDeposit, doContents)
			local self = VoidStorageFrame;
			local button;
				if ( doContents ) then
					for i = 1, 9 do
						local itemID, textureName, quality = GetVoidTransferWithdrawalInfo(i);
						button = _G["VoidStorageWithdrawButton"..i];
						button.icon:SetTexture(textureName);
						if (quality and quality > LE_ITEM_QUALITY_COMMON and BAG_ITEM_QUALITY_COLORS[quality]) then
							button.IconBorder:SetTexture("Interface\\Containerframe\\quality.blp")
							button.IconBorder:Show();
							button.IconBorder:SetVertexColor(BAG_ITEM_QUALITY_COLORS[quality].r, BAG_ITEM_QUALITY_COLORS[quality].g, BAG_ITEM_QUALITY_COLORS[quality].b);
						end
					end
				end
				if ( doDeposit ) then
					for i = 1, 9 do
						local itemID, textureName, quality = GetVoidTransferDepositInfo(i);
						button = _G["VoidStorageDepositButton"..i];
						button.icon:SetTexture(textureName);
						if (quality and quality > LE_ITEM_QUALITY_COMMON and BAG_ITEM_QUALITY_COLORS[quality]) then
							button.IconBorder:SetTexture("Interface\\Containerframe\\quality.blp")
							button.IconBorder:Show();
							button.IconBorder:SetVertexColor(BAG_ITEM_QUALITY_COLORS[quality].r, BAG_ITEM_QUALITY_COLORS[quality].g, BAG_ITEM_QUALITY_COLORS[quality].b);
						end
					end
				end
				for i = 1, 80 do
					local itemID, textureName, locked, recentDeposit, isFiltered, quality = GetVoidItemInfo(self.page, i);
					button = _G["VoidStorageStorageButton"..i];
					button.icon:SetTexture(textureName);
					if (quality and quality > LE_ITEM_QUALITY_COMMON and BAG_ITEM_QUALITY_COLORS[quality]) then
						button.IconBorder:SetTexture("Interface\\Containerframe\\quality.blp")
						button.IconBorder:Show();
						button.IconBorder:SetVertexColor(BAG_ITEM_QUALITY_COLORS[quality].r, BAG_ITEM_QUALITY_COLORS[quality].g, BAG_ITEM_QUALITY_COLORS[quality].b);
					end
				end
			end

			hooksecurefunc("VoidStorage_ItemsUpdate", miirgui_VoidStorage_ItemsUpdate)

			VoidStoragePurchaseFrameCornerTL:Hide()
			VoidStoragePurchaseFrameCornerTR:Hide()
			VoidStoragePurchaseFrameCornerBL:Hide()
			VoidStoragePurchaseFrameCornerBR:Hide()
			VoidStoragePurchaseFrameLeftEdge:Hide()
			VoidStoragePurchaseFrameRightEdge:Hide()
			VoidStoragePurchaseFrameTopEdge:Hide()
			VoidStoragePurchaseFrameBottomEdge:Hide()
			arrow= select(12,VoidStorageDepositFrame:GetRegions() )
			arrow:Hide()
			arrow2= select(12,VoidStorageWithdrawFrame:GetRegions() )
			arrow2:Hide()
			VoidStorageBorderFrameLeftEdge:Hide()
			VoidStorageBorderFrameRightEdge:Hide()
			VoidStorageBorderFrameTopEdge:Hide()
			VoidStorageBorderFrameBottomEdge:Hide()
			VoidStorageBorderFrameHeader:Hide()
			VoidStorageBorderFrameCornerTL:Hide()
			VoidStorageBorderFrameCornerTR:Hide()
			VoidStorageBorderFrameCornerBL:Hide()
			VoidStorageBorderFrameCornerBR:Hide()
			VoidStorageDepositFrameBg:Hide()
			VoidStorageWithdrawFrameBg:Hide()
			VoidStorageStorageFrameLine1:Hide()
			VoidStorageStorageFrameLine1:SetWidth(1)
			VoidStorageStorageFrameLine2:Hide()
			VoidStorageStorageFrameLine2:SetWidth(1)
			VoidStorageStorageFrameLine3:Hide()
			VoidStorageStorageFrameLine3:SetWidth(1)
			VoidStorageStorageFrameLine4:Hide()
			VoidStorageStorageFrameLine4:SetWidth(1)
			VoidStoragePurchaseTintage = select (2,VoidStoragePurchaseFrame:GetRegions())
			VoidStoragePurchaseTintage:Hide()
			VoidStorageFrameFix1 = select (2,VoidStorageFrame:GetRegions())
			VoidStorageFrameFix1:SetTexture(1,1,1,0)
			Border(VoidStoragePurchaseFrame,496,184,"Center",0,0,14,"MEDIUM")
			Portrait1= select(4,VoidStorageFrame.Page1:GetRegions() )
			Portrait1:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			Portrait2= select(4,VoidStorageFrame.Page2:GetRegions() )
			Portrait2:SetTexCoord(0.85, 0.15, 0.15, 0.85)

			--[[AchievementFrame Changes]]	

		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_AchievementUI" then

			for i=1,12 do
				_G["AchievementFrameSummaryCategoriesCategory"..i.."FillBar"]:Hide()
				_G["AchievementFrameSummaryCategoriesCategory"..i.."Bar"]:SetVertexColor(unpack(miirgui.Color))
			end

			local kids = {AchievementFrameComparisonSummaryFriend:GetRegions() };
			for _, child in ipairs(kids) do
				child:Hide()
			end

			local kids = {AchievementFrameComparisonSummaryPlayer:GetRegions() };
			for _, child in ipairs(kids) do
				child:Hide()
			end

			AchievementFrameWoodBorderTopLeft:Hide()
			AchievementFrameWoodBorderTopRight:Hide()
			AchievementFrameWoodBorderBottomLeft:Hide()
			AchievementFrameWoodBorderBottomRight:Hide()
			AchievementFrameWaterMark:Hide()
			AchievementFrameComparisonWatermark:Hide()

			hooksecurefunc("AchievementFrame_ToggleAchievementFrame",function(toggleStatFrame)
			for i=1,8 do
				tint= select(i,AchievementFrameCategories:GetRegions() )
				tint:SetVertexColor(1,1,1,1)
			end
			end)

			AchievementFrameComparisonSummaryPlayerStatusBarFillBar:Hide()
			AchievementFrameComparisonSummaryPlayerStatusBarBar:SetVertexColor(unpack(miirgui.Color))
			AchievementFrameComparisonSummaryFriendStatusBarFillBar:Hide()
			AchievementFrameComparisonSummaryFriendStatusBarBar:SetVertexColor(unpack(miirgui.Color))
			AchievementFrameSummaryCategoriesStatusBarFillBar:Hide()
			AchievementFrameSummaryCategoriesStatusBarBar:SetVertexColor(unpack(miirgui.Color))
			AchievementFrameAchievementsContainerScrollBarBG:Hide()
			AchievementFrameStatsContainerScrollBarBG:Hide()
			AchievementFrameComparisonStatsContainerScrollBarBG:Hide()
			AchievementFrameComparisonDark:SetAlpha(0)
			AchievementFrameCategoriesContainerScrollBarBG:SetAlpha(0)
			AchievementFrameComparisonContainerScrollBarBG:SetAlpha(0)
			Border(AchievementFrameSummary,530,462,"Center",0,0,14,"HIGH")

			FuglyGreenBorder1 = select(3,AchievementFrameStats:GetChildren())
			FuglyGreenBorder1:SetBackdrop({
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
			edgeSize = 14,
			})
			FuglyGreenBorder1:SetBackdropBorderColor(1, 1, 1,1)	

			FuglyGreenBorder2 = select(2,AchievementFrameAchievements:GetChildren())
			FuglyGreenBorder2:SetBackdrop({
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
			edgeSize = 14,
			})
			FuglyGreenBorder2:SetBackdropBorderColor(1, 1, 1,1)	

			FuglyGreenBorder3 = select(5,AchievementFrameComparison:GetChildren())
			FuglyGreenBorder3:SetBackdrop({
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
			edgeSize = 14,
			})
			FuglyGreenBorder3:SetBackdropBorderColor(1, 1, 1,1)	

			AchievementFrameCategories:SetBackdrop({
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
			edgeSize = 14,
			})


			local function miirgui_AchievementAlertFrame_ShowAlert()
				if(AchievementAlertFrame1) then
					AchievementAlertFrame1ShieldIcon:SetTexture("Interface\\Achievementframe\\miirgui_shield.blp")
					AchievementAlertFrame1GuildBanner:Hide()
					AchievementAlertFrame1GuildBorder:Hide()
					AchievementAlertFrame1Background:Hide()
					AchievementAlertFrame1:SetFrameStrata("TOOLTIP")
										
					Border(AchievementAlertFrame1Icon,52,52,"Center",0,3,14,"Tooltip")
					local ididit = CreateFrame("Frame", "nil",AchievementAlertFrame1)
					ididit:SetFrameStrata("HIGH")
					ididit:SetPoint("TOPLEFT",AchievementAlertFrame1Icon,83,-34)
					ididit:SetPoint("BOTTOMRIGHT",AchievementAlertFrame1Icon,200,40)
					ididit:SetBackdrop({
					bgFile = "Interface\\FrameGeneral\\UI-Background-Rock.blp",
					edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
					edgeSize = 14,insets = { left = 3, right = 3, top =3, bottom = 3 }})
					ididit:SetBackdropColor(1, 1, 1, 1)
					ididit:SetBackdropBorderColor(1, 1, 1,1)
					
					AchievementAlertFrame1ShieldPoints:SetTextColor(1,1,1,1)
					AchievementAlertFrame1ShieldPoints:SetFont(unpack(miirgui.medium))
					AchievementAlertFrame1ShieldPoints:SetShadowColor(0,0,0,0)
					AchievementAlertFrame1Unlocked:SetTextColor(unpack(miirgui.Color))
					AchievementAlertFrame1Unlocked:SetFont(unpack(miirgui.small))
					AchievementAlertFrame1Unlocked:SetShadowColor(0,0,0,0)
					AchievementAlertFrame1Name:SetTextColor(1,1,1,1)
					AchievementAlertFrame1Name:SetFont(unpack(miirgui.medium))
					AchievementAlertFrame1Name:SetShadowColor(0,0,0,0)
					AchievementAlertFrame1GuildName:SetTextColor(1,1,1,1)
					AchievementAlertFrame1GuildName:SetFont(unpack(miirgui.medium))
					AchievementAlertFrame1GuildName:SetShadowColor(0,0,0,0)
				end  
				if (AchievementAlertFrame2) then 
					AchievementAlertFrame2ShieldIcon:SetTexture("Interface\\Achievementframe\\miirgui_shield.blp")
					AchievementAlertFrame2GuildBanner:Hide()
					AchievementAlertFrame2GuildBorder:Hide()
					AchievementAlertFrame2Background:Hide()
					AchievementAlertFrame2:SetFrameStrata("TOOLTIP")

					Border(AchievementAlertFrame2Icon,52,52,"Center",0,3,14,"Tooltip")
					local ididit2 = CreateFrame("Frame", "nil",AchievementAlertFrame2)
					ididit2:SetFrameStrata("HIGH")
					ididit2:SetPoint("TOPLEFT",AchievementAlertFrame2Icon,83,-34)
					ididit2:SetPoint("BOTTOMRIGHT",AchievementAlertFrame2Icon,200,40)
					ididit2:SetBackdrop({
					bgFile = "Interface\\FrameGeneral\\UI-Background-Rock.blp",
					edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
					edgeSize = 14,insets = { left = 3, right = 3, top =3, bottom = 3 }})
					ididit2:SetBackdropColor(1, 1, 1, 1)
					ididit2:SetBackdropBorderColor(1, 1, 1,1)
					
					AchievementAlertFrame2ShieldPoints:SetTextColor(1,1,1,1)
					AchievementAlertFrame2ShieldPoints:SetFont(unpack(miirgui.medium))
					AchievementAlertFrame2ShieldPoints:SetShadowColor(0,0,0,0)
					AchievementAlertFrame2Unlocked:SetTextColor(unpack(miirgui.Color))
					AchievementAlertFrame2Unlocked:SetFont(unpack(miirgui.small))
					AchievementAlertFrame2Unlocked:SetShadowColor(0,0,0,0)
					AchievementAlertFrame2Name:SetTextColor(1,1,1,1)
					AchievementAlertFrame2Name:SetFont(unpack(miirgui.medium))
					AchievementAlertFrame2Name:SetShadowColor(0,0,0,0)
					AchievementAlertFrame2GuildName:SetTextColor(1,1,1,1)
					AchievementAlertFrame2GuildName:SetFont(unpack(miirgui.medium))
					AchievementAlertFrame2GuildName:SetShadowColor(0,0,0,0)
				end
			end

			hooksecurefunc("AchievementAlertFrame_ShowAlert",miirgui_AchievementAlertFrame_ShowAlert)

			--[[Looking for PVP Changes]]

		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_PVPUI" then
			WarGamesFrame.HorizontalBar:Hide()
			wargamesscroll = select(2,WarGamesFrameInfoScrollFrameScrollBar:GetRegions())
			wargamesscroll:Hide()
			wargamesscroll2 = select(1,WarGamesFrame:GetRegions())
			wargamesscroll2:Hide()
			WarGamesFrameDescription:SetTextColor(1,1,1,1)
			WarGamesFrameDescription:SetFont(unpack(miirgui.medium))
			WarGamesFrameDescription:SetShadowColor(0,0,0,0)
			ring1 = select(2,PVPQueueFrameCategoryButton1:GetRegions())
			ring1:Hide()
			icon1 = select(3,PVPQueueFrameCategoryButton1:GetRegions())
			icon1:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			icon1:SetWidth(46)
			icon1:SetHeight(46)
			ring2 = select(2,PVPQueueFrameCategoryButton2:GetRegions())
			ring2:Hide()
			icon2 = select(3,PVPQueueFrameCategoryButton2:GetRegions())
			icon2:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			icon2:SetWidth(46)
			icon2:SetHeight(46)
			ring3 = select(2,PVPQueueFrameCategoryButton3:GetRegions())
			ring3:Hide()
			icon3 = select(3,PVPQueueFrameCategoryButton3:GetRegions())
			icon3:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			icon3:SetWidth(46)
			icon3:SetHeight(46)
			ring4 = select(2,PVPQueueFrameCategoryButton4:GetRegions())
			ring4:Hide()
			icon4 = select(3,PVPQueueFrameCategoryButton4:GetRegions())
			icon4:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			icon4:SetWidth(46)
			icon4:SetHeight(46)
			PVPRole = select(1,HonorFrame:GetChildren())
			local kids = {PVPRole:GetRegions() };
			for _, child in ipairs(kids) do
			child:Hide()
			end
			PVPReadyDialogBackground:Hide()
			Border(PVPQueueFrameCategoryButton1,50,50,"Left",10,0,14,"MEDIUM")
			Border(PVPQueueFrameCategoryButton2,50,50,"Left",10,0,14,"MEDIUM")
			Border(PVPQueueFrameCategoryButton3,50,50,"Left",10,0,14,"MEDIUM")
			Border(PVPQueueFrameCategoryButton4,50,50,"Left",10,0,14,"MEDIUM")
			Border(HonorFrame,330,290,"Center",0,-36,16,"HIGH")
			Border(ConquestFrame,332,350,"Center",2,-8,16,"HIGH")
			Border(WarGamesFrame,334,382,"Center",2,9,14,"HIGH")

			--[[Item Upgrade Changes]]

		elseif event == "ADDON_LOADED" and arg1 == "Blizzard_ItemUpgradeUI" then

			ItemUpgradeFrameCornerTL:Hide()
			ItemUpgradeFrameCornerTR:Hide()
			ItemUpgradeFrameCornerBL:Hide()
			ItemUpgradeFrameCornerBR:Hide()
			ItemUpgradeFrameLeftEdge:Hide()
			ItemUpgradeFrameRightEdge:Hide()
			ItemUpgradeFrameTopEdge:Hide()
			ItemUpgradeFrameBottomEdge:Hide()
			for i=2,4 do
			hideit= select(i,ItemUpgradeFrame.ItemButton:GetRegions() )
			hideit:Hide() 
			end
			Border(ItemUpgradeFrame.ItemButton,60,60,"Center",0,0,14,"HIGH")
			Border(ItemUpgradeFrame.ItemButton,330,60,"Center",196,0,14,"HIGH")
			hideit= select(8,ItemUpgradeFrame.ItemButton:GetRegions() )
			hideit:Hide() 

			local function miirgui_ItemUpgradeFrame_Update()
				local icon, name, quality, bound, numCurrUpgrades, numMaxUpgrades, cost, currencyType = GetItemUpgradeItemInfo();

				if icon then
					showit= select(1,ItemUpgradeFrame.ItemButton:GetRegions() )
					showit:Show() 
				else	
					hideit= select(1,ItemUpgradeFrame.ItemButton:GetRegions() )
					hideit:Hide() 
				end
			end

			hooksecurefunc("ItemUpgradeFrame_Update", miirgui_ItemUpgradeFrame_Update)

			ItemUpgradeFramePortrait:SetTexCoord(0.13, 0.83, 0.13, 0.83)
			ItemUpgradeFrame.ButtonFrame:GetRegions():Hide()
			ItemUpgradeFrame.ButtonFrame.ButtonBorder:Hide()
			ItemUpgradeFrame.ButtonFrame.ButtonBottomBorder:Hide()
			ItemUpgradeFrameHeaderTintage = select(23,ItemUpgradeFrame:GetRegions())
			ItemUpgradeFrameHeaderTintage:SetTexture(0.128,0.117,0.128,1)
			ItemUpgradeFrameBackgroundTintage = select(25, ItemUpgradeFrame:GetRegions())
			ItemUpgradeFrameBackgroundTintage:SetTexture(0.078,0.078,0.078,1) 
			ItemUpgradeFrameBackgroundTintage2 = select(27, ItemUpgradeFrame:GetRegions())
			ItemUpgradeFrameBackgroundTintage2:SetTexture(0,0,0,0)
		end

end

frame:SetScript("OnEvent", frame.OnEvent);