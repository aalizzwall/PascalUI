		local _, miirgui = ...

		local f = CreateFrame("Frame");
		f:RegisterEvent("PLAYER_ENTERING_WORLD");
		f:SetScript("OnEvent", function()

			--[[Setting up the border-function]]--

		local function Border(arg1,arg2,arg3,arg4,arg5,arg6,arg7)
			Border2 = CreateFrame("Frame", "nil", arg1)
			Border2:SetSize(arg2, arg3)
			Border2:SetPoint(arg4,arg5,arg6 )
			Border2:SetBackdrop({
			bgFile = "",
			edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
			edgeSize = arg7,
			})
			Border2:SetBackdropColor(0, 0, 0, 0)
			Border2:SetBackdropBorderColor(1, 1, 1)	
		end 

			--[[Registering Events]]--

		local frame = CreateFrame("FRAME");
		frame:RegisterEvent("ITEM_TEXT_READY")
		
		local frame2 = CreateFrame("Frame");
		frame2:RegisterEvent("MERCHANT_SHOW")

			--[[GameMenuFrame Changes]]--

		GameMenuFrameHeader:Hide()
		GameMenuText=select (11,GameMenuFrame:GetRegions())
		GameMenuText:Hide()

			--[[Time Changes]]--

			TimeManagerGlobe:SetTexCoord(0.85, 0.15, 0.15, 0.85)	
			TimeManagerGlobe:SetPoint("TOPLEFT", -7,9)

			--[[TradeFrame Changes]]--

		TradeFramePlayerPortrait:SetTexCoord(0.13, 0.83, 0.13, 0.83)
		TradeFramePlayerPortrait:SetPoint("Topleft",-8,10)
		TradeFramePlayerPortrait:SetWidth(64)
		TradeFramePlayerPortrait:SetHeight(64)
		TradeFrameRecipientPortrait:SetTexCoord(0.13, 0.83, 0.13, 0.83)
		TradeFrameRecipientPortrait:SetWidth(62)
		TradeFrameRecipientPortrait:SetHeight(62)
		TradeRecipientBG:Hide()
		TradeRecipientBotLeftCorner:SetPoint("BOTTOMLEFT", "TradeFrame", "BOTTOMRIGHT", -178, -5)

			--[[LootFrame Changes]]--

		LootFramePortraitOverlay:SetTexCoord(0.13, 0.83, 0.13, 0.83)
		LootFramePortraitOverlay:SetPoint("Topleft",-8,10)
		LootFramePortraitOverlay:SetWidth(64)
		LootFramePortraitOverlay:SetHeight(64)

			--[[LFGDungeonReadyDialogFrame Changes]]--

		PVPReadyDialogFiligree:Hide()
		PVPReadyDialogBottomArt:Hide()
		PVPReadyDialogBackground:Hide()
		hideit= select(1,LFGDungeonReadyDialogInstanceInfoFrame:GetRegions() )
		hideit:Hide() 
		LFGDungeonReadyDialogFiligree:Hide()
		LFGDungeonReadyDialogBottomArt:Hide()
		LFGDungeonReadyDialogRewardsFrameReward1Border:Hide()
		LFGDungeonReadyDialogRewardsFrameReward1Texture:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		LFGDungeonReadyDialogRewardsFrameReward2Border:Hide()
		LFGDungeonReadyDialogRewardsFrameReward2Texture:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		LFGDungeonReadyDialogBackground:Hide()
		LFDQueueFrameRandomScrollFrameScrollBackground:Hide()
		LFDQueueFrameBackground:Hide()
		RaidFinderQueueFrameBackground:Hide()
		ScenarioBG= select(1,ScenarioQueueFrame:GetRegions())
		ScenarioBG:Hide()
		Border(LFDQueueFrame,334,260,"Center",0,-60,14)		
		Border(RaidFinderQueueFrame,334,260,"Center",0,-57,14)
		Border(LFGDungeonReadyDialogRewardsFrameReward1,36,36,"Center",-3,2,12)
		Border(LFGDungeonReadyDialogRewardsFrameReward2,36,36,"Center",-3,2,12)
		Border(ScenarioQueueFrame,334,336,"Center",-2,-22,14)


		completed = select(4,ScenarioAlertFrame1:GetRegions())
		completed:SetTextColor(unpack(miirgui.Color))
		completed:SetFont(unpack(miirgui.medium))
		completed:SetShadowColor(0,0,0,0)
		completed2 = select(5,ScenarioAlertFrame1:GetRegions())
		completed2:SetTextColor(1,1,1,1)
		completed2:SetFont(unpack(miirgui.medium))
		completed2:SetShadowColor(0,0,0,0)

			--[[ItemTextFrame Changes]]--

		InboxFrameBg:Hide()
		ItemTextFrameIcon = select(18,ItemTextFrame:GetRegions())
		ItemTextFrameIcon:SetPoint("Topleft",-8,9)
		ItemTextFrameIcon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		ItemTextFrameIcon:SetWidth(64)
		ItemTextFrameIcon:SetHeight(64)
		Border(ItemTextFrame,330,364,"Center",0,-27,14)
		function frame:OnEvent(event)
			if ( event == "ITEM_TEXT_READY" ) then
				ItemTextPageText:SetTextColor(1,1,1,1)
				ItemTextPageText:SetFont(unpack(miirgui.medium))
				ItemTextPageText:SetShadowColor(0,0,0,0)
				ItemTextMaterialTopLeft:Hide()
				ItemTextMaterialTopRight:Hide()
				ItemTextMaterialBotLeft:Hide()
				ItemTextMaterialBotRight:Hide()
				ItemTextScrollFrameMiddle:Hide()
			end
		end

			--[[MailFrame Changes]]--

		for i=24,25 do
			hideit= select(i,OpenMailFrame:GetRegions() )
			hideit:Hide() 
		end

		for i=4,7 do
			hideit= select(i,SendMailFrame:GetRegions() )
			hideit:Hide() 
		end

		OpenMailFrameIcon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		OpenMailBodyText:SetTextColor(1,1,1,1)
		OpenMailBodyText:SetShadowColor(0,0,0,0)
		OpenMailBodyText:SetFont(unpack(miirgui.medium))
		OpenStationeryBackgroundLeft:Hide()
		OpenStationeryBackgroundRight:Hide()
		OpenMailInvoiceItemLabel:SetTextColor(1,1,1,1)
		OpenMailInvoiceItemLabel:SetShadowColor(0,0,0,0)
		OpenMailInvoiceItemLabel:SetFont(unpack(miirgui.medium))
		OpenMailInvoicePurchaser:SetTextColor(1,1,1,1)
		OpenMailInvoicePurchaser:SetShadowColor(0,0,0,0)
		OpenMailInvoicePurchaser:SetFont(unpack(miirgui.medium))
		OpenMailInvoiceSalePrice:SetTextColor(1,1,1,1)
		OpenMailInvoiceSalePrice:SetShadowColor(0,0,0,0)
		OpenMailInvoiceSalePrice:SetFont(unpack(miirgui.medium))
		OpenMailInvoiceBuyMode:SetTextColor(1,1,1,1)
		OpenMailInvoiceBuyMode:SetShadowColor(0,0,0,0)
		OpenMailInvoiceBuyMode:SetFont(unpack(miirgui.medium))
		OpenMailInvoiceAmountReceived:SetTextColor(1,1,1,1)
		OpenMailInvoiceAmountReceived:SetShadowColor(0,0,0,0)
		OpenMailInvoiceAmountReceived:SetFont(unpack(miirgui.medium))
		SendMailBodyEditBox:SetFont(unpack(miirgui.medium))
		SendMailBodyEditBox:SetTextColor(1,1,1,1)
		SendMailBodyEditBox:SetShadowColor(0,0,0,0)
		OpenMailInvoiceDeposit:SetFont(unpack(miirgui.medium))
		OpenMailInvoiceDeposit:SetTextColor(1,1,1,1)
		OpenMailInvoiceDeposit:SetShadowColor(0,0,0,0)
		OpenMailInvoiceHouseCut:SetFont(unpack(miirgui.medium))
		OpenMailInvoiceHouseCut:SetTextColor(1,1,1,1)
		OpenMailInvoiceHouseCut:SetShadowColor(0,0,0,0)
		InvoiceTextFontNormal:SetFont(unpack(miirgui.medium))
		InvoiceTextFontNormal:SetTextColor(1,1,1,1)
		InvoiceTextFontNormal:SetShadowColor(0,0,0,0)
		SendStationeryBackgroundLeft:Hide()
		SendStationeryBackgroundRight:Hide()
		SendMailMoneyInset:Hide()
		MailFrameIcon = select(18,MailFrame:GetRegions())
		MailFrameIcon:SetPoint("Topleft",-8,9)
		MailFrameIcon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		MailFrameIcon:SetWidth(64)
		MailFrameIcon:SetHeight(64)
		for i=1,7 do
			MailItem1Horizontal = select(3,_G["MailItem"..i]:GetRegions())
			MailItem1Horizontal:SetTexture(0.129,0.113,0.129,1)
		end
		Border(SendMailFrame,330,322,"Center",-24,18,14)
		Border(InboxFrame,330,364,"Center",-24,18,14)
		Border(OpenMailFrameInset,330,320,"TOPLEFT",0,0,14)

			--[[GossipFrame Changes]]--

		GossipFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		GossipGreetingText:SetTextColor(1, 1, 1,1)
		GossipGreetingText:SetFont(unpack(miirgui.medium))
		GossipGreetingText:SetShadowColor(0,0,0,0)
		GossipFrameBackground = select(19,GossipFrame:GetRegions())
		GossipFrameBackground:Hide()
		Border(GossipFrame,330,412,"Center",0,-18,14)

			--[[DressUpFrame Changes]]--

		DressUpFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)

			--[[Bag and BankFrame Changes]]--

		function miirgui_ContainerFrame_Update(frame)
			local id = frame:GetID();
			local name = frame:GetName();
			local itemButton;
			for i=1, frame.size, 1 do
				itemButton = _G[name.."Item"..i];
				texture, itemCount, locked, quality, readable, _, _, isFiltered, noValue = GetContainerItemInfo(id, itemButton:GetID());
				if (quality) then
					if (quality >= LE_ITEM_QUALITY_COMMON and BAG_ITEM_QUALITY_COLORS[quality]) then
						itemButton.IconBorder:SetTexture("Interface\\Containerframe\\quality.blp")
						itemButton.IconBorder:Show();
						itemButton.IconBorder:SetVertexColor(BAG_ITEM_QUALITY_COLORS[quality].r, BAG_ITEM_QUALITY_COLORS[quality].g, BAG_ITEM_QUALITY_COLORS[quality].b);
						itemButton.Count:ClearAllPoints()
						itemButton.Count:SetPoint("Center", 0, -11)
					end
				end
			end
		end

		hooksecurefunc("ContainerFrame_Update",miirgui_ContainerFrame_Update)
		
		function miirgui_BankFrameItemButton_Update(button)
			local container = button:GetParent():GetID();
			local buttonID = button:GetID();
			if( button.isBag ) then
				container = -4;
			end
			local _, _, _, quality, _, _, _, isFiltered = GetContainerItemInfo(container, buttonID);
			local slotName = button:GetName();
			button.hasItem = nil;
			if ( isFiltered ) then
				button.searchOverlay:Show();
			else
				button.searchOverlay:Hide();
			end
			if (quality and quality >= LE_ITEM_QUALITY_COMMON and BAG_ITEM_QUALITY_COLORS[quality]) then
				button.IconBorder:SetTexture("Interface\\Containerframe\\quality.blp")
				button.IconBorder:Show();
				button.IconBorder:SetVertexColor(BAG_ITEM_QUALITY_COLORS[quality].r, BAG_ITEM_QUALITY_COLORS[quality].g, BAG_ITEM_QUALITY_COLORS[quality].b);
				button.Count:ClearAllPoints()
				button.Count:SetPoint("Center", 0, -11)
			else
				button.IconBorder:Hide();
			end
		end

		hooksecurefunc("BankFrameItemButton_Update",miirgui_BankFrameItemButton_Update)

		BankPortraitTexture:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		BankPortraitTexture:SetPoint("Topleft",-8,9)
		BankPortraitTexture:SetWidth(64)
		BankPortraitTexture:SetHeight(64)	
		BankFrameBg:SetTexture(0.078,0.078,0.078,1)
		for i=1,12 do
			_G["ContainerFrame"..i.."Portrait"]:SetTexCoord(0.15, 0.85, 0.15, 0.85)
		end

			--[[FriendsFrame Changes]]--

		FriendsFrameIcon:SetTexCoord(0.85, 0.15, 0.15, 0.85)	
		FriendsFrameIcon:SetPoint("Topleft",-8,9)
		FriendsFrameIcon:SetWidth(64)
		FriendsFrameIcon:SetHeight(64)
		Border(FriendsListFrame,332,318,"Center",-2,-29,14)
		Border(IgnoreListFrame,332,318,"Center",-2,-29,14)
		Border(PendingListFrame,332,318,"Center",-2,-29,14)
		Border(WhoFrame,332,320,"Center",-2,-28,14)
		Border(ChannelFrame,330,340,"Center",-2,-4,14)
		Border(RaidFrame,330,340,"Center",-1,-17,14)

			--[[MerchantFrame Changes]]--

		MerchantFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		BuybackBG:SetTexture(0.078,0.078,0.078,1)
		function frame2:OnEvent(event)
			if event == "MERCHANT_SHOW" then
			MerchantExtraCurrencyInset:Show();

			end
		end

			--[[TabardFrame Changes]]--

		TabardFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)

			--[[WorldLogFrame Changes]]--

		WorldMapFrameTutorialButton:Hide()
		WorldMapFramePortrait:SetWidth(66)
		WorldMapFramePortrait:SetHeight(66)
		WorldMapFramePortrait:SetPoint("TopLeft",-9,9)
		WorldMapFramePortrait:SetTexture("Interface\\Addons\\miirgui\\gfx\\quest.blp")
		QuestFrameGreetingPanelBg:Hide()
		QuestNPCModelTopBorder:Hide()
		QuestNPCModelLeftBorder:Hide()
		QuestNPCModelRightBorder:Hide()
		QuestNPCModelBottomBorder:Hide()
		QuestNPCModelBotLeftCorner:Hide()
		QuestNPCModelBotRightCorner:Hide()
		QuestNPCModelTextBottomBorder:Hide()
		QuestNPCModelTextLeftBorder:Hide()
		QuestNPCModelTextRightBorder:Hide()
		QuestNPCModelTextBotRightCorner:Hide()
		QuestNPCModelTextBotLeftCorner:Hide()
		QuestMapDetailsScrollFrameScrollBarTrack:Hide()

		QuestLogPopupDetailFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		QuestLogPopupDetailFramePortraitb= select(18,QuestLogPopupDetailFrame:GetRegions())
		QuestLogPopupDetailFramePortraitb:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		QuestLogPopupDetailFramePortraitb:SetPoint("TopLeft",-8,8)
		QuestTextBG= select(3,GossipTitleButton6:GetRegions())
		QuestTextBG:SetTextColor(1, 1, 1,1)
		QuestmapBG= select(1,QuestScrollFrame:GetRegions())
		QuestmapBG:Hide()
		QuestFrameRewardPanelBg:Hide()
		QuestTextBG= select(1,QuestMapFrame.DetailsFrame:GetRegions())
		QuestTextBG:Hide()
		BG1=select(2,QuestMapFrame.DetailsFrame:GetRegions())
		BG1:Hide()
		BG2=select(1,QuestMapFrame.DetailsFrame.RewardsFrame:GetRegions())
		BG2:Hide()
		BG3=select(2,QuestMapFrame.DetailsFrame.RewardsFrame:GetRegions())
		BG3:Hide()
		Rewards= select(3,QuestMapFrame.DetailsFrame.RewardsFrame:GetRegions())
		Rewards:SetTextColor(unpack(miirgui.Color))
		Rewards:SetFont(unpack(miirgui.huge))
		Rewards:SetShadowColor(0,0,0,0)
		receive=select(2,MapQuestInfoRewardsFrame:GetRegions())
		receive:SetTextColor(1,1,1,1)
		receive:SetFont(unpack(miirgui.medium))
		receive:SetShadowColor(0,0,0,0)
		receive2= select(1,MapQuestInfoRewardsFrame:GetRegions())
		receive2:SetTextColor(1,1,1,1)
		receive2:SetFont(unpack(miirgui.small))
		receive2:SetShadowColor(0,0,0,0)
		QuestFrameDetailPanelBg:Hide()
		QuestLogPopupDetailFramePageBg:Hide()
		QuestFrameProgressPanelBg:Hide()
		QuestFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		Border(QuestNPCModel,202,336,"Center",1,-34,14)
		Border(QuestFrame,330,412,"Center",0,-18,14)
		Border(QuestLogPopupDetailFrame,330,412,"Center",0,-18,14)

		local QuestNPCModelBG= CreateFrame("Frame","QuestNPCModel",QuestNPCModel)
		QuestNPCModelBG:SetFrameStrata("BACKGROUND")
		QuestNPCModelBG:SetWidth(202) 
		QuestNPCModelBG:SetHeight(336)
		local QuestNPCModelBGtexture = QuestNPCModelBG:CreateTexture(nil,"BACKGROUND")
		QuestNPCModelBGtexture:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock.blp")
		QuestNPCModelBGtexture:SetAllPoints(QuestNPCModelBG)
		QuestNPCModelBG.texture = QuestNPCModelBGtexture
		QuestNPCModelBG:SetPoint("Center",0,-34)
		QuestNPCModelBG:Show()
		for i=1, 32 do
			local button = _G["GossipTitleButton"..i]
			QuestTextBG= select(3,button:GetRegions())
			QuestTextBG:SetTextColor(1, 1, 1,1)
			QuestTextBG:SetFont(unpack(miirgui.medium))
			QuestTextBG:SetShadowColor(0,0,0,0)
		end

			--[[CharacterFrame Changes]]--

		local function miirgui_PaperDollItemSlotButton_Update(self)
			local quality = GetInventoryItemQuality("player", self:GetID());
			if (quality and quality >= LE_ITEM_QUALITY_COMMON and BAG_ITEM_QUALITY_COLORS[quality] and self:GetID() < 20) then
				self.IconBorder:Show();
				self.IconBorder:SetTexture("Interface\\Containerframe\\quality.blp")
				self.IconBorder:SetVertexColor(BAG_ITEM_QUALITY_COLORS[quality].r, BAG_ITEM_QUALITY_COLORS[quality].g, BAG_ITEM_QUALITY_COLORS[quality].b);
			else
				self.IconBorder:Hide();
			end
		end

		hooksecurefunc("PaperDollItemSlotButton_Update",miirgui_PaperDollItemSlotButton_Update)

		local function miirgui_CharacterFrame_UpdatePortrait()
		local masteryIndex = GetSpecialization();
			if (masteryIndex == nil) then
				local _, class = UnitClass("player");
				CharacterFramePortrait:SetTexture("Interface\\Addons\\miirgui\\gfx\\class_icons\\classes");
				CharacterFramePortrait:SetTexCoord(unpack(CLASS_ICON_TCOORDS[class]));
				CharacterFramePortrait:SetPoint("Topleft",-8,9)
				CharacterFramePortrait:SetWidth(64)
				CharacterFramePortrait:SetHeight(64)
				else
				local icon = select(4,GetSpecializationInfo(masteryIndex))
				CharacterFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85);
			end
		end

		hooksecurefunc("CharacterFrame_UpdatePortrait",miirgui_CharacterFrame_UpdatePortrait)

		Border(ReputationFrame,330,364,"Center",-1,-27,14)
		Border(TokenFrame,330,364,"Center",-1,-27,14)
		Border(PetModelFrame,330,362,"Center",-1,0,14)

			--[[PVEFrame Changes]]--

		hooksecurefunc("DungeonCompletionAlertFrame_ShowAlert",function()
			DungeonCompletionAlertFrame1InstanceName:SetTextColor(1,1,1,1)
			DungeonCompletionAlertFrame1InstanceName:SetShadowColor(0,0,0,0)
			DungeonCompletionAlertFrame1InstanceName:SetFont(unpack(miirgui.medium))
			completed= select(7,DungeonCompletionAlertFrame1:GetRegions() )
			completed:SetTextColor(unpack(miirgui.Color))
			completed:SetShadowColor(0,0,0,0)
			completed:SetFont(unpack(miirgui.small))
		end)

		LFGListApplicationViewerScrollFrameScrollBarBG:Hide()
		RaidFinderFrameRoleBackground:Hide()
		RaidBrowserFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		LFDQueueFrameRoleButtonTankIncentiveIconBorder:Hide()
		LFDQueueFrameRoleButtonTankIncentiveIconTexture:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		LFDQueueFrameRoleButtonHealerIncentiveIconBorder:Hide()
		LFDQueueFrameRoleButtonHealerIncentiveIconTexture:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		LFDQueueFrameRoleButtonDPSIncentiveIconBorder:Hide()
		LFDQueueFrameRoleButtonDPSIncentiveIconTexture:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		PVEFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		for i=1,4 do
			_G["GroupFinderFrameGroupButton"..i.."Ring"]:Hide()
			_G["GroupFinderFrameGroupButton"..i.."Icon"]:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			_G["GroupFinderFrameGroupButton"..i.."Icon"]:SetWidth(46)
			_G["GroupFinderFrameGroupButton"..i.."Icon"]:SetHeight(46)
		end
		Border(GroupFinderFrameGroupButton1,50,50,"Left",10,0,14)
		Border(GroupFinderFrameGroupButton2,50,50,"Left",10,0,14)
		Border(GroupFinderFrameGroupButton3,50,50,"Left",10,0,14)
		Border(GroupFinderFrameGroupButton4,50,50,"Left",10,0,14)
		Border(LFDQueueFrameRoleButtonTankIncentiveIcon,19,19,"Left",0,3,4)
		Border(LFDQueueFrameRoleButtonHealerIncentiveIcon,19,19,"Left",0,3,4)
		Border(LFDQueueFrameRoleButtonDPSIncentiveIcon,19,19,"Left",0,3,4)
		Border(LFGListFrame.CategorySelection,336,344,"Center",-4,-16,14)
		Border(LFGListFrame.EntryCreation,336,344,"Center",-4,-16,14)
		Border(LFGListFrame.ApplicationViewer,316,254,"Center",-13,-62,14)

		local c= CreateFrame("Frame","RaidFinderBg",RaidFinderQueueFrame)
		c:SetFrameStrata("Medium")
		c:SetWidth(512) 
		c:SetHeight(128)
		local ct = c:CreateTexture(nil,"BACKGROUND")
		ct:SetTexture("Interface\\LFGFrame\\UI-LFG-BlueBG.blp")
		ct:SetAllPoints(c)
		c.texture = ct
		c:SetPoint("Topleft",2,-23)
		c:Show()

			--[[SpellBookFrame Changes]]--

		SpellBookFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)	
		PrimaryProfession1Icon:SetAlpha(1)
		PrimaryProfession1Icon:SetDesaturated(nil)
		PrimaryProfession1Icon:SetBlendMode("Blend")
		PrimaryProfession1Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		PrimaryProfession2Icon:SetAlpha(1)
		PrimaryProfession2Icon:SetDesaturated(nil)
		PrimaryProfession2Icon:SetBlendMode("Blend")
		PrimaryProfession2Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		SpellBookFrameTutorialButton:Hide()
		SpellBookPageText:SetTextColor(1, 1, 1,1)
		SpellBookPageText:SetFont(unpack(miirgui.small))
		SpellBookPageText:SetShadowColor(0,0,0,0)
		PrimaryProfession1Missing:SetTextColor(unpack(miirgui.Color))
		PrimaryProfession1Missing:SetFont(unpack(miirgui.huge))
		PrimaryProfession1Missing:SetShadowColor(0,0,0,0)
		PrimaryProfession2Missing:SetTextColor(unpack(miirgui.Color))
		PrimaryProfession2Missing:SetFont(unpack(miirgui.huge))
		PrimaryProfession2Missing:SetShadowColor(0,0,0,0)
		SpellBookSkillLineTab1Icon=select(4,SpellBookSkillLineTab1:GetRegions())
		SpellBookSkillLineTab1Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		SpellBookSkillLineTab2Icon=select(4,SpellBookSkillLineTab2:GetRegions())
		SpellBookSkillLineTab2Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		SpellBookSkillLineTab3Icon=select(4,SpellBookSkillLineTab3:GetRegions())
		SpellBookSkillLineTab3Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		SpellBookSkillLineTab4Icon=select(4,SpellBookSkillLineTab4:GetRegions())
		SpellBookSkillLineTab4Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		SpellBookSkillLineTab5Icon=select(4,SpellBookSkillLineTab5:GetRegions())
		SpellBookSkillLineTab5Icon:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		PrimaryProfession1missingtext=select(4,PrimaryProfession1:GetRegions())
		PrimaryProfession1missingtext:SetTextColor(1,1,1,1)
		PrimaryProfession1missingtext:SetShadowColor(0,0,0,0)
		PrimaryProfession1missingtext:SetFont(unpack(miirgui.small))
		SecondaryProfession1Missing:SetTextColor(unpack(miirgui.Color))
		SecondaryProfession1Missing:SetFont(unpack(miirgui.medium))
		SecondaryProfession1Missing:SetShadowColor(0,0,0,0)
		SecondaryProfession2Missing:SetTextColor(unpack(miirgui.Color))
		SecondaryProfession2Missing:SetFont(unpack(miirgui.medium))
		SecondaryProfession2Missing:SetShadowColor(0,0,0,0)
		SecondaryProfession3Missing:SetTextColor(unpack(miirgui.Color))
		SecondaryProfession3Missing:SetFont(unpack(miirgui.medium))
		SecondaryProfession3Missing:SetShadowColor(0,0,0,0)
		SecondaryProfession4Missing:SetTextColor(unpack(miirgui.Color))
		SecondaryProfession4Missing:SetFont(unpack(miirgui.medium))
		SecondaryProfession4Missing:SetShadowColor(0,0,0,0)	
		SecondaryProfession1missingtext=select(4,SecondaryProfession1:GetRegions())
		SecondaryProfession1missingtext:SetTextColor(1,1,1,1)
		SecondaryProfession1missingtext:SetShadowColor(0,0,0,0)	
		SecondaryProfession1missingtext:SetFont(unpack(miirgui.small))
		SecondaryProfession2missingtext=select(4,SecondaryProfession2:GetRegions())
		SecondaryProfession2missingtext:SetTextColor(1,1,1,1)
		SecondaryProfession2missingtext:SetShadowColor(0,0,0,0)	
		SecondaryProfession2missingtext:SetFont(unpack(miirgui.small))
		SecondaryProfession3missingtext=select(4,SecondaryProfession3:GetRegions())
		SecondaryProfession3missingtext:SetTextColor(1,1,1,1)
		SecondaryProfession3missingtext:SetShadowColor(0,0,0,0)	
		SecondaryProfession3missingtext:SetFont(unpack(miirgui.small))
		SecondaryProfession4missingtext=select(4,SecondaryProfession4:GetRegions())
		SecondaryProfession4missingtext:SetTextColor(1,1,1,1)	
		SecondaryProfession4missingtext:SetShadowColor(0,0,0,0)	
		SecondaryProfession4missingtext:SetFont(unpack(miirgui.small))
		PrimaryProfession2missingtext=select(4,PrimaryProfession2:GetRegions())
		PrimaryProfession2missingtext:SetTextColor(1,1,1,1)
		PrimaryProfession2missingtext:SetShadowColor(0,0,0,0)	
		PrimaryProfession2missingtext:SetFont(unpack(miirgui.small))
		Border(PrimaryProfession1,74,74,"Left",6,-2,14)	
		Border(PrimaryProfession2,74,74,"Left",6,-2,14)

		local function miirgui_FormatProfession(frame,index)
			if index then
				frame.missingHeader:Hide();
				frame.missingText:Hide();
				local name, texture, rank, maxRank, numSpells, spelloffset, skillLine, rankModifier, specializationIndex, specializationOffset = GetProfessionInfo(index);
				frame.skillName = name;
				frame.rank:SetText(prof_title);
				frame.rank:SetShadowColor(0,0,0,0)
				frame.rank:SetFont(unpack(miirgui.small))
				frame.professionName:SetText(name);
				frame.professionName:SetTextColor(unpack(miirgui.Color))
				frame.professionName:SetFont(unpack(miirgui.medium))
				frame.professionName:SetShadowColor(0,0,0,0)
			end
		end

		hooksecurefunc("FormatProfession",miirgui_FormatProfession)

		local function miirgui_UpdateProfessionButton(self)
			local spellIndex = self:GetID() + self:GetParent().spellOffset;
			local texture = GetSpellBookItemTexture(spellIndex, SpellBookFrame.bookType);
			local spellName, subSpellName = GetSpellBookItemName(spellIndex, SpellBookFrame.bookType);
			local isPassive = IsPassiveSpell(spellIndex, SpellBookFrame.bookType);
				if ( isPassive ) then
					self.highlightTexture:SetTexture("Interface\\Buttons\\UI-PassiveHighlight");
					self.spellString:SetTextColor(unpack(miirgui.Color))
					self.spellString:SetFont(unpack(miirgui.medium))
					self.spellString:SetShadowColor(0,0,0,0)     
				else
					self.highlightTexture:SetTexture("Interface\\Buttons\\ButtonHilight-Square");
					self.spellString:SetTextColor(unpack(miirgui.Color))
					self.spellString:SetFont(unpack(miirgui.medium))
					self.spellString:SetShadowColor(0,0,0,0)
				end
		end

		hooksecurefunc("UpdateProfessionButton",miirgui_UpdateProfessionButton)


		local function miirgui_SpellBookCoreAbilities_UpdateTabs()
			local numSpecs = GetNumSpecializations();
			local currentSpec = GetSpecialization();
			local index = 1;
			local tab;
			for i=1, numSpecs do
			tab =SpellBook_GetCoreAbilitySpecTab(i)
			tab:GetNormalTexture():SetTexCoord(0.85, 0.15, 0.15, 0.85)
			i = i+1
			end
		end

		hooksecurefunc("SpellBookCoreAbilities_UpdateTabs",miirgui_SpellBookCoreAbilities_UpdateTabs)

		local function miirgui_SpellBook_UpdateCoreAbilitiesTab()
			local currentSpec = GetSpecialization();
			local desaturate = currentSpec and (currentSpec ~= SpellBookCoreAbilitiesFrame.selectedSpec);
			local specID, displayName = GetSpecializationInfo(SpellBookCoreAbilitiesFrame.selectedSpec);
			SpellBookCoreAbilitiesFrame.SpecName:SetText(displayName);
			SpellBookCoreAbilitiesFrame.SpecName:SetTextColor(unpack(miirgui.Color))
			SpellBookCoreAbilitiesFrame.SpecName:SetFont(unpack(miirgui.huge))
			SpellBookCoreAbilitiesFrame.SpecName:SetShadowColor(0,0,0,0)
	
			local abilityList = SPEC_CORE_ABILITY_DISPLAY[specID];
			if ( abilityList ) then
				for i=1, #abilityList do
					local name, subname = GetSpellInfo(abilityList[i]);
					local _, icon = GetSpellTexture(abilityList[i]);
					local button = SpellBook_GetCoreAbilityButton(i);
					button.spellID = abilityList[i];
					button.Name:SetText(name);
					button.Name:SetTextColor(unpack(miirgui.Color))
					button.Name:SetFont(unpack(miirgui.medium))
					button.Name:SetShadowColor(0,0,0,0)
					button.InfoText:SetText(_G[SPEC_CORE_ABILITY_TEXT[specID].."_CORE_ABILITY_"..i]);
					button.InfoText:SetTextColor(1, 1, 1,1)
					button.InfoText:SetFont(unpack(miirgui.small))
					button.InfoText:SetShadowColor(0,0,0,0)
					button.iconTexture:SetTexture(icon);
					button.iconTexture:SetDesaturated(showLevel or desaturate);
					button.RequiredLevel:SetTextColor(1, 1, 1,1)
					button.RequiredLevel:SetShadowColor(0,0,0,0)
					button.RequiredLevel:SetFont(unpack(miirgui.small))
				end
			end
		end

		hooksecurefunc("SpellBook_UpdateCoreAbilitiesTab", miirgui_SpellBook_UpdateCoreAbilitiesTab)

		local function miirgui_SpellButton_UpdateButton(self)
			local slot, slotType = SpellBook_GetSpellBookSlot(self);
			local name = self:GetName();
			local subSpellString = _G[name.."SubSpellName"]
			local spellString = _G[name.."SpellName"];
			spellString:SetTextColor(unpack(miirgui.Color));
			spellString:SetFont(unpack(miirgui.medium))
			spellString:SetShadowColor(0,0,0,0)
			subSpellString:SetTextColor(1, 1, 1)
			subSpellString:SetShadowColor(0,0,0,0)
			subSpellString:SetFont(unpack(miirgui.small))
			if slotType == "FUTURESPELL" then
				local level = GetSpellAvailableLevel(slot, SpellBookFrame.bookType)
					if (level and level > UnitLevel("player")) then
						self.RequiredLevelString:SetTextColor(1, 1, 1);
						self.RequiredLevelString:SetFont(unpack(miirgui.small))
						self.RequiredLevelString:SetShadowColor(0,0,0,0)
					end
			end
			local temp, texture, offset, numSlots, isGuild, offSpecID = GetSpellTabInfo(SpellBookFrame.selectedSkillLine);
			local isOffSpec = (offSpecID ~= 0) and (SpellBookFrame.bookType == BOOKTYPE_SPELL);
			if (isOffSpec) then
						self.RequiredLevelString:SetTextColor(1, 1, 1);
						self.RequiredLevelString:SetFont(unpack(miirgui.small))
						self.RequiredLevelString:SetShadowColor(0,0,0,0)
			end
		end

		hooksecurefunc("SpellButton_UpdateButton", miirgui_SpellButton_UpdateButton)

			--[[GuildPetitionFrame Changes]]--

		for i=1,2 do
			local button = _G["GuildRegistrarButton"..i]
			if button:GetFontString() then
				if button:GetFontString():GetText() then
					button:GetFontString():SetTextColor(1,1,1)
					button:GetFontString():SetShadowColor(0,0,0,0)
					button:GetFontString():SetFont(unpack(miirgui.medium))
				end
			end
		end
		GuildRegistrarPurchaseText:SetTextColor(1,1,1)
		GuildRegistrarPurchaseText:SetShadowColor(0,0,0,0)
		GuildRegistrarPurchaseText:SetFont(unpack(miirgui.medium))
		PetitionBg= select(19,PetitionFrame:GetRegions() )
		PetitionBg:Hide() 
		PetitionPortrait= select(18,PetitionFrame:GetRegions() )
		PetitionPortrait:Show()
		PetitionPortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		PetitionPortrait:SetPoint("Topleft",-8,10)
		PetitionPortrait:SetWidth(64)
		PetitionPortrait:SetHeight(64)
		PetitionFrameCharterTitle:SetTextColor(unpack(miirgui.Color))
		PetitionFrameCharterTitle:SetShadowColor(0,0,0,0)
		PetitionFrameCharterTitle:SetFont(unpack(miirgui.medium))
		PetitionFrameCharterName:SetTextColor(1, 1, 1,1)
		PetitionFrameCharterName:SetShadowColor(0,0,0,0)
		PetitionFrameCharterName:SetFont(unpack(miirgui.medium))
		PetitionFrameMasterTitle:SetTextColor(unpack(miirgui.Color))
		PetitionFrameMasterTitle:SetShadowColor(0,0,0,0)
		PetitionFrameMasterTitle:SetFont(unpack(miirgui.medium))
		PetitionFrameMasterName:SetTextColor(1, 1, 1,1)
		PetitionFrameMasterName:SetShadowColor(0,0,0,0)
		PetitionFrameMasterName:SetFont(unpack(miirgui.medium))
		PetitionFrameMemberTitle:SetTextColor(unpack(miirgui.Color))
		PetitionFrameMemberTitle:SetShadowColor(0,0,0,0)
		PetitionFrameMemberTitle:SetFont(unpack(miirgui.medium))
		for i= 1,9 do
		_G["PetitionFrameMemberName"..i]:SetTextColor(1, 1, 1,1)
		_G["PetitionFrameMemberName"..i]:SetShadowColor(0,0,0,0)
		_G["PetitionFrameMemberName"..i]:SetFont(unpack(miirgui.medium))
		end
		PetitionFrameInstructions:SetTextColor(1, 1, 1,1)
		PetitionFrameInstructions:SetShadowColor(0,0,0,0)
		PetitionFrameInstructions:SetFont(unpack(miirgui.medium))

				--[[GuildRegistrarFrame Changes]]--

		local GuildInvite=CreateFrame("frame")
		GuildInvite:RegisterEvent("GUILD_INVITE_REQUEST")
		GuildInvite:SetScript("OnEvent",function(GuildInvite)
		GuildInviteFrameTabardRing:Hide()
		GuildInviteFrameBackground:Hide()
		GuildInviteFrameBg:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock.blp")
		GuildInviteFrameBg:SetAlpha(0.6)
		Border(GuildInviteFrame,66,66,"Top",0,-68,14)
		GuildInviteFrameInviterName:SetTextColor(1,1,1,1)
		GuildInviteFrameInviterName:SetShadowColor(0,0,0,0)
		GuildInviteFrameInviterName:SetFont(unpack(miirgui.small))
		GuildInviteFrameInviteText:SetTextColor(1,1,1,1)
		GuildInviteFrameInviteText:SetShadowColor(0,0,0,0)
		GuildInviteFrameInviteText:SetFont(unpack(miirgui.small))
		GuildInviteFrameGuildName:SetTextColor(unpack(miirgui.Color))
		GuildInviteFrameGuildName:SetShadowColor(0,0,0,0)
		GuildInviteFrameGuildName:SetFont(unpack(miirgui.medium))
		Achievement= select(1,GuildInviteFrame:GetChildren() )
		Achievementtext= select(1,Achievement:GetRegions() )
		Achievementtext:SetTextColor(unpack(miirgui.Color))
		Achievementtext:SetShadowColor(0,0,0,0)
		Achievementtext:SetFont(unpack(miirgui.small))
		GuildLevel= select(1,GuildInviteFrame:GetChildren() )
		GuildLevelText= select(2,GuildLevel:GetRegions() )
		GuildLevelText:SetTextColor(1,1,1,1)
		GuildLevelText:SetShadowColor(0,0,0,0)
		GuildLevelText:SetFont(unpack(miirgui.medium))
		end)

		GuildRegistrarRealBG=select(19,GuildRegistrarFrame:GetRegions())
		GuildRegistrarRealBG:Hide()
		GuildRegistrarFramePortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
		AvailableServicesText:SetTextColor(1,1,1,1)
		AvailableServicesText:SetShadowColor(0,0,0,0)
		AvailableServicesText:SetFont(unpack(miirgui.medium))
		Border(GuildRegistrarFrame,332,340,"TopLeft",2,-60,14)

			--[[OptionsFrameChanges]]--

		InterfaceOptionsFramePanelContainer:SetBackdrop({
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
		edgeSize = 14,
		})
		InterfaceOptionsFrameHeader:Hide()
		InterfaceOptionsFrameHeaderText:Hide()
		VideoOptionsFrameHeader:Hide()
		VideoOptionsFrameHeaderText:Hide()

			--[[TargetFrame Changes]]--

		PlayerLevelText:SetPoint("CENTER", PlayerFrameTexture, "CENTER", -62, -15);

		local function miirgui_TargetFrame_CheckClassification(self, forceNormalTexture)
			local classification = UnitClassification(self.unit);
			self.nameBackground:Show();
			self.manabar:Show();
			self.manabar.TextString:Show();
			self.threatIndicator:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Flash");
			if ( forceNormalTexture ) then
				self.haveElite = nil;
				if ( classification == "minus" ) then
					self.Background:SetSize(119,12);
					self.Background:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 7, 47);
				else
					self.Background:SetSize(119,25);
					self.Background:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 7, 35);
				end
				if ( self.threatIndicator ) then
					if ( classification == "minus" ) then
						self.threatIndicator:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Minus-Flash");
						self.threatIndicator:SetTexCoord(0, 1, 0, 1);
						self.threatIndicator:SetWidth(256);
						self.threatIndicator:SetHeight(128);
						self.threatIndicator:SetPoint("TOPLEFT", self, "TOPLEFT", -23, 0);
					else
						self.threatIndicator:SetTexCoord(0, 0.9453125, 0, 0.181640625);
						self.threatIndicator:SetWidth(242);
						self.threatIndicator:SetHeight(93);
						self.threatIndicator:SetPoint("TOPLEFT", self, "TOPLEFT", -23, 0);
					end
				end
			else
				self.haveElite = true;
				TargetFrameBackground:SetSize(119,41);
				if ( self.threatIndicator ) then
					self.threatIndicator:SetTexCoord(0, 0.9453125, 0, 0.181640625);
					self.threatIndicator:SetWidth(242);
					self.threatIndicator:SetHeight(93);
					self.threatIndicator:SetPoint("TOPLEFT", self, "TOPLEFT", -23, 0);
				end
			end
		end

		hooksecurefunc("TargetFrame_CheckClassification",miirgui_TargetFrame_CheckClassification)

		local function miirgui_TargetFrame_UpdateLevelTextAnchor(self, targetLevel)
			if ( targetLevel >= 100 ) then
				self.levelText:SetPoint("CENTER", 62, -15);
			else
				self.levelText:SetPoint("CENTER", 62, -15);
			end
		end

		hooksecurefunc("TargetFrame_UpdateLevelTextAnchor",miirgui_TargetFrame_UpdateLevelTextAnchor)

		local function miirgui_PlayerFrame_UpdateLevelTextAnchor(level)
			if ( level >= 100 ) then
				PlayerLevelText:SetPoint("CENTER", PlayerFrameTexture, "CENTER", -62, -15);
			else
				PlayerLevelText:SetPoint("CENTER", PlayerFrameTexture, "CENTER", -62, -15);
			end
		end

		hooksecurefunc("PlayerFrame_UpdateLevelTextAnchor",miirgui_PlayerFrame_UpdateLevelTextAnchor)

		local function miirgui_TargetFrame_CheckFaction(self)
			self.pvpIcon:ClearAllPoints()
			self.pvpIcon:SetPoint("CENTER", 81, -2);
		end

		hooksecurefunc("TargetFrame_CheckFaction",miirgui_TargetFrame_CheckFaction)

			--[[GameMenu Changes]]--

		gamemenubg = select(1,GameMenuFrame:GetRegions())
		gamemenubg:ClearAllPoints()
		gamemenubg:SetPoint("Topleft", GameMenuFrame, 8,-8)
		gamemenubg:SetPoint("Bottomright", GameMenuFrame, -8,8)

			--[[Static Popup Changes]]--

		staticbg = select(1,StaticPopup1:GetRegions())
		staticbg:ClearAllPoints()
		staticbg:SetPoint("Topleft",StaticPopup1, 8,-8)
		staticbg:SetPoint("Bottomright", StaticPopup1, -8,8)

			--[[ObjectiveWatcher Changes]]--

		bonusobj= select(4,ObjectiveTrackerBlocksFrame:GetChildren() )
		bonusobj2=select(2,bonusobj:GetRegions())
		bonusobj2:SetTextColor(1,1,1,1)
		bonusobj2:SetFont(unpack(miirgui.medium))
		bonusobj2:SetShadowColor(0,0,0,0)
		WatchFrameTitle= select(2,ObjectiveTrackerBlocksFrame.QuestHeader:GetRegions())
		WatchFrameTitle:SetTextColor(1, 1, 1,1)
		WatchFrameTitle:SetShadowColor(0,0,0,0)
		WatchFrameTitle:SetFont(unpack(miirgui.medium))
		ACHFrameTitle= select(2,ObjectiveTrackerBlocksFrame.AchievementHeader:GetRegions())
		ACHFrameTitle:SetTextColor(1, 1, 1,1)
		ACHFrameTitle:SetShadowColor(0,0,0,0)
		ACHFrameTitle:SetFont(unpack(miirgui.medium))
		ScenFrameTitle= select(2,ObjectiveTrackerBlocksFrame.ScenarioHeader:GetRegions())
		ScenFrameTitle:SetTextColor(1, 1, 1,1)
		ScenFrameTitle:SetShadowColor(0,0,0,0)
		ScenFrameTitle:SetFont(unpack(miirgui.medium))

		local function miirgui_SetStringText(_,fontString, text, useFullHeight, colorStyle, useHighlight)
			local r, g, b = fontString:GetTextColor()
			r = floor(r * 255 ) 
			g = floor(g * 255 ) 
			b = floor(b * 255 ) 
			if r == 190 then
					fontString:SetTextColor(unpack(miirgui.Color))
					fontString:SetFont(unpack(miirgui.medium))
					fontString:SetShadowColor(0,0,0,0)
			else if r == 203 then
					fontString:SetTextColor(1,1,1,1)
					fontString:SetFont(unpack(miirgui.medium))
					fontString:SetShadowColor(0,0,0,0)
			else if r == 152 then
					fontString:SetTextColor(0, 1, 0.5, 1)
					fontString:SetFont(unpack(miirgui.medium))
					fontString:SetShadowColor(0,0,0,0)
			end
		end
		
		end
		end

		hooksecurefunc(DEFAULT_OBJECTIVE_TRACKER_MODULE,"SetStringText", miirgui_SetStringText)

		local function miirgui_OnBlockHeaderEnter(self,block)
			if ( block.HeaderText ) then
				block.HeaderText:SetTextColor(unpack(miirgui.Color.Highlight));
				for objectiveKey, line in pairs(block.lines) do
					whitepls = line.Text:GetTextColor()
						whitepls = floor(whitepls * 255 ) 
							if ( line.Dash ) then
								line.Dash:SetTextColor(1,1,1,1);
								r, g, b, a = line.Dash:GetTextColor()
							end
				end
			end
		end

		hooksecurefunc(DEFAULT_OBJECTIVE_TRACKER_MODULE,"OnBlockHeaderEnter",miirgui_OnBlockHeaderEnter)

		local function miirgui_OnBlockHeaderLeave(self,block)
	if ( block.HeaderText ) then
				block.HeaderText:SetTextColor(unpack(miirgui.Color));
	end
	for objectiveKey, line in pairs(block.lines) do
		local colorStyle = line.Text.colorStyle.reverse;
		if ( colorStyle ) then
			line.Text:SetTextColor(1,1,1,1);
			if ( line.Dash ) then
				line.Dash:SetTextColor(1,1,1,1);
			end
		else
		end
	end	
		end

		hooksecurefunc(DEFAULT_OBJECTIVE_TRACKER_MODULE,"OnBlockHeaderLeave",miirgui_OnBlockHeaderLeave)

		local function miirgui_ObjectiveTracker_Collapse()
			ObjectiveTrackerFrame.HeaderMenu.Title:SetTextColor(1, 1, 1,1)
			ObjectiveTrackerFrame.HeaderMenu.Title:SetShadowColor(0,0,0,0)
			ObjectiveTrackerFrame.HeaderMenu.Title:SetFont(unpack(miirgui.medium))
		end

		hooksecurefunc("ObjectiveTracker_Collapse",miirgui_ObjectiveTracker_Collapse)

			--[[Guild ChallengeAlert Frame changes]]--

		local function miirgui_GuildChallengeAlertFrame_ShowAlert()
			if(GuildChallengeAlertFrame) then
				chabg= select(3,GuildChallengeAlertFrame:GetRegions() )
				chabg:Hide()
				chabg= select(1,GuildChallengeAlertFrame:GetRegions() )
				chabg:SetWidth(42)
				chabg:SetHeight(42)
				Icon= select(4,GuildChallengeAlertFrame:GetRegions() )
				Icon:SetWidth(42)
				Icon:SetHeight(42)
				chabg= select(2,GuildChallengeAlertFrame:GetRegions() )
				chabg:Hide()

				Border(GuildChallengeAlertFrame,46,46,"Left",12,0,12)
				local ididit = CreateFrame("Frame", "nil",GuildChallengeAlertFrame)
				ididit:SetFrameStrata("HIGH")
				ididit:SetPoint("TOPLEFT",GuildChallengeAlertFrame,14,-15)
				ididit:SetPoint("BOTTOMRIGHT",GuildChallengeAlertFrame,-15,15)
				ididit:SetBackdrop({
				bgFile = "Interface\\FrameGeneral\\UI-Background-Rock.blp",
				edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
				edgeSize = 14,insets = { left = 3, right = 3, top =3, bottom = 3 }})
				ididit:SetBackdropColor(1, 1, 1, 1)
				ididit:SetBackdropBorderColor(1, 1, 1,1)

				GuildChallengeAlertFrameCount:SetFont(unpack(miirgui.medium))
				GuildChallengeAlertFrameCount:SetShadowColor(0,0,0,0)
				GuildChallengeAlertFrameCount:SetTextColor(1, 1, 1,1)
				GuildChallengeAlertFrameType:SetFont(unpack(miirgui.small))
				GuildChallengeAlertFrameType:SetShadowColor(0,0,0,0)
				GuildChallengeAlertFrameType:SetTextColor(1, 1, 1,1)
				ChallengeTitle= select(5,GuildChallengeAlertFrame:GetRegions() )
				ChallengeTitle:SetFont(unpack(miirgui.medium))
				ChallengeTitle:SetShadowColor(0,0,0,0)
				ChallengeTitle:SetTextColor(unpack(miirgui.Color))
			end
		end

		hooksecurefunc("GuildChallengeAlertFrame_ShowAlert",miirgui_GuildChallengeAlertFrame_ShowAlert)

			--[[ChallengeModeAlert Frame changes]]--

		local function miirgui_ChallengeModeAlertFrame_ShowAlert()
			if(GuildChallengeAlertFrame) then
				bg= select(1,ChallengeModeAlertFrame1:GetRegions() )
				bg:Hide() 

				Border(ChallengeModeAlertFrame1,48,48,"Left",17,0,12)
				local ididit = CreateFrame("Frame", "nil",ChallengeModeAlertFrame1)
				ididit:SetFrameStrata("HIGH")
				ididit:SetPoint("TOPLEFT",ChallengeModeAlertFrame1,20,-16)
				ididit:SetPoint("BOTTOMRIGHT",ChallengeModeAlertFrame1,-20,16)
				ididit:SetBackdrop({
				bgFile = "Interface\\FrameGeneral\\UI-Background-Rock.blp",
				edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
				edgeSize = 14,insets = { left = 3, right = 3, top =3, bottom = 3 }})
				ididit:SetBackdropColor(1, 1, 1, 1)
				ididit:SetBackdropBorderColor(1, 1, 1,1)

				complete= select(4,ChallengeModeAlertFrame1:GetRegions() )
				complete:SetFont(unpack(miirgui.small))
				complete:SetShadowColor(0,0,0,0)
				complete:SetTextColor(unpack(miirgui.Color))
				time= select(5,ChallengeModeAlertFrame1:GetRegions() )
				time:SetFont(unpack(miirgui.medium))
				time:SetShadowColor(0,0,0,0)
				time:SetTextColor(1, 1, 1,1)
			end
		end

		hooksecurefunc("ChallengeModeAlertFrame_ShowAlert",miirgui_ChallengeModeAlertFrame_ShowAlert)

			--[[Achievement CriteriaAlert Frame changes]]--

		local function miirgui_CriteriaAlertFrame_ShowAlert(achievementID, criteriaID)
			if(CriteriaAlertFrame1) then
				Border(CriteriaAlertFrame1Icon,52,52,"Center",0,3,14)
				CriteriaAlertFrame1Background:Hide()
				local ididit = CreateFrame("Frame", "nil",CriteriaAlertFrame1)
				ididit:SetFrameStrata("HIGH")
				ididit:SetPoint("TOPLEFT",CriteriaAlertFrame1Icon,40,-30)
				ididit:SetPoint("BOTTOMRIGHT",CriteriaAlertFrame1,0,4)
				ididit:SetBackdrop({
				bgFile = "Interface\\FrameGeneral\\UI-Background-Rock.blp",
				edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
				edgeSize = 14,insets = { left = 3, right = 3, top =3, bottom = 3 }})
				ididit:SetBackdropColor(1, 1, 1, 1)
				ididit:SetBackdropBorderColor(1, 1, 1,1)

				CriteriaAlertFrame1Unlocked:SetTextColor(unpack(miirgui.Color))
				CriteriaAlertFrame1Unlocked:SetFont(unpack(miirgui.medium))
				CriteriaAlertFrame1Unlocked:SetShadowColor(0,0,0,0)
				CriteriaAlertFrame1Name:SetTextColor(1,1,1,1)
				CriteriaAlertFrame1Name:SetFont(unpack(miirgui.small))
				CriteriaAlertFrame1Name:SetShadowColor(0,0,0,0)
			end

			if(CriteriaAlertFrame2) then
				Border(CriteriaAlertFrame2Icon,52,52,"Center",0,3,14)
				CriteriaAlertFrame2Background:Hide()
				local ididit2 = CreateFrame("Frame", "nil",CriteriaAlertFrame2)
				ididit2:SetFrameStrata("HIGH")
				ididit2:SetPoint("TOPLEFT",CriteriaAlertFrame2Icon,40,-30)
				ididit2:SetPoint("BOTTOMRIGHT",CriteriaAlertFrame2,0,4)
				ididit2:SetBackdrop({
				bgFile = "Interface\\FrameGeneral\\UI-Background-Rock.blp",
				edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
				edgeSize = 14,insets = { left = 3, right = 3, top =3, bottom = 3 }})
				ididit2:SetBackdropColor(1, 1, 1, 1)
				ididit2:SetBackdropBorderColor(1, 1, 1,1)

				CriteriaAlertFrame2Unlocked:SetTextColor(unpack(miirgui.Color))
				CriteriaAlertFrame2Unlocked:SetFont(unpack(miirgui.medium))
				CriteriaAlertFrame2Unlocked:SetShadowColor(0,0,0,0)
				CriteriaAlertFrame2Name:SetTextColor(1,1,1,1)
				CriteriaAlertFrame2Name:SetFont(unpack(miirgui.small))
				CriteriaAlertFrame2Name:SetShadowColor(0,0,0,0)
			end
		end

		hooksecurefunc("CriteriaAlertFrame_ShowAlert",miirgui_CriteriaAlertFrame_ShowAlert)

			--[[Digsite Alert Frame changes]]--

		local function miirgui_DigsiteCompleteToastFrame_ShowAlert(researchBranchID)
			if(DigsiteCompleteToastFrame) then
				Border(DigsiteCompleteToastFrame,54,54,"Left",11,0,12)
				local ididit = CreateFrame("Frame", "nil",DigsiteCompleteToastFrame)
				ididit:SetFrameStrata("HIGH")
				ididit:SetPoint("TOPLEFT",DigsiteCompleteToastFrame,10.5,-13)
				ididit:SetPoint("BOTTOMRIGHT",DigsiteCompleteToastFrame,0.5,13)
				ididit:SetBackdrop({
				bgFile = "Interface\\FrameGeneral\\UI-Background-Rock.blp",
				edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border_blue.blp",
				edgeSize = 14,insets = { left = 3, right = 3, top =3, bottom = 3 }})
				ididit:SetBackdropColor(1, 1, 1, 1)
				ididit:SetBackdropBorderColor(1, 1, 1,1)
				bg = select(1,DigsiteCompleteToastFrame:GetRegions());
				bg:Hide()
	
				race = select(2,DigsiteCompleteToastFrame:GetRegions());
				race:SetTextColor(1, 1, 1,1)
				race:SetShadowColor(0,0,0,0)
				race:SetFont(unpack(miirgui.medium))
				complete = select(3,DigsiteCompleteToastFrame:GetRegions());
				complete:SetTextColor(1, 1, 1,1)
				complete:SetShadowColor(0,0,0,0)
				complete:SetFont(unpack(miirgui.small))
			end
		end

		hooksecurefunc("DigsiteCompleteToastFrame_ShowAlert",miirgui_DigsiteCompleteToastFrame_ShowAlert)

		frame:SetScript("OnEvent", frame.OnEvent);
		frame2:SetScript("OnEvent", frame2.OnEvent);
		end)
