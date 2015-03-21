local _, miirgui = ...

			--[[Setting up Quest-Fonts]]--
			
		hooksecurefunc("QuestFrameProgressItems_Update", function()
		QuestProgressTitleText:SetTextColor(unpack(miirgui.Color))
		QuestProgressTitleText:SetShadowColor(0,0,0,0)
		QuestProgressTitleText:SetFont(unpack(miirgui.huge))
		QuestProgressText:SetTextColor(1, 1, 1,1)
		QuestProgressText:SetShadowColor(0,0,0,0)
		QuestProgressText:SetFont(unpack(miirgui.medium))
		QuestProgressRequiredItemsText:SetTextColor(unpack(miirgui.Color))
		QuestProgressRequiredItemsText:SetFont(unpack(miirgui.huge))
		QuestProgressRequiredItemsText:SetShadowColor(0,0,0,0)
		QuestProgressRequiredMoneyText:SetTextColor(1, 1, 1,1)
		QuestProgressRequiredMoneyText:SetShadowColor(0,0,0,0)
		end)

		hooksecurefunc("GossipFrameUpdate", function()
		for i=1, 32 do
			local button = _G["GossipTitleButton"..i]
			if button:GetFontString() then
				if button:GetFontString():GetText() and button:GetFontString():GetText():find("|cff000000") then
					button:GetFontString():SetText(string.gsub(button:GetFontString():GetText(), "|cff000000", "|cffffffff"))
					button:GetFontString():SetShadowColor(0,0,0,0)
					button:GetFontString():SetFont(unpack(miirgui.medium))
				end
			end
		end
		end)

		local function QuestObjectiveText()
			local numObjectives = GetNumQuestLeaderBoards();
			local objective;
			local text, type, finished;
			local objectivesTable = QuestInfoObjectivesFrame.Objectives;
			local numVisibleObjectives = 0;
				for i = 1, numObjectives do
					text, type, finished = GetQuestLogLeaderBoard(i);
						if (type ~= "spell" and type ~= "log" and numVisibleObjectives < MAX_OBJECTIVES) then
							numVisibleObjectives = numVisibleObjectives+1;
							objective = objectivesTable[numVisibleObjectives];
								if ( not objective ) then
									objective = QuestInfoObjectivesFrame:CreateFontString("QuestInfoObjective"..numVisibleObjectives, "BACKGROUND", "QuestFontNormalSmall");
									objective:SetPoint("TOPLEFT", objectivesTable[numVisibleObjectives - 1], "BOTTOMLEFT", 0, -2);
									objective:SetJustifyH("LEFT");
									objective:SetWidth(285);
									objectivesTable[numVisibleObjectives] = objective;
								end

							if ( finished ) then
								objective:SetTextColor(0, 1, 0.5, 1)
								objective:SetFont(unpack(miirgui.medium))
								objective:SetShadowColor(0,0,0,0)
							else
								objective:SetTextColor(0.6, 0.6, 0.6)
								objective:SetFont(unpack(miirgui.medium))
								objective:SetShadowColor(0,0,0,0)
							end

						end
				end
		end

		hooksecurefunc("QuestInfo_Display", function(template, parentFrame, acceptButton, material)

		skillpoint= select(7,QuestInfoSkillPointFrame:GetRegions() )
		skillpoint:SetTextColor(1,1,1,1) 
		skillpoint:SetFont(unpack(miirgui.medium))
		skillpoint:SetShadowColor(0,0,0,0)
		QuestRewardFont4= select(2,QuestInfoRewardsFrame:GetRegions())
		QuestRewardFont4:SetTextColor(1,1,1,1)
		QuestRewardFont4:SetFont(unpack(miirgui.medium))
		QuestRewardFont4:SetShadowColor(0,0,0,0)
		QuestRewardFont1= select(1,QuestInfoRewardsFrame:GetRegions())
		QuestRewardFont1:SetTextColor(unpack(miirgui.Color))
		QuestRewardFont1:SetFont(unpack(miirgui.huge))
		QuestRewardFont1:SetShadowColor(0,0,0,0)
		QuestRewardFont2= select(3,QuestInfoRewardsFrame:GetRegions())
		QuestRewardFont2:SetTextColor(1,1,1,1)
		QuestRewardFont2:SetFont(unpack(miirgui.medium))
		QuestRewardFont2:SetShadowColor(0,0,0,0)
		QuestRewardFont3= select(1,QuestInfoXPFrame:GetRegions())
		QuestRewardFont3:SetTextColor(1,1,1,1)
		QuestRewardFont3:SetFont(unpack(miirgui.medium))
		QuestRewardFont3:SetShadowColor(0,0,0,0)

		QuestRewardFont4= select(4,QuestInfoRewardsFrame:GetRegions() )
		QuestRewardFont4:SetTextColor(1,1,1,1)
		QuestRewardFont4:SetFont(unpack(miirgui.medium))
		QuestRewardFont4:SetShadowColor(0,0,0,0)
		
		QuestFont:SetTextColor(1,1,1,1)
		QuestFont:SetFont(unpack(miirgui.medium))
		QuestFont:SetShadowColor(0,0,0,0)
		QuestInfoDescriptionText:SetTextColor(1, 1, 1)
		QuestInfoDescriptionText:SetShadowColor(0,0,0,0)
		QuestInfoDescriptionText:SetFont(unpack(miirgui.medium))
		QuestInfoObjectivesText:SetTextColor(1, 1, 1)
		QuestInfoObjectivesText:SetShadowColor(0,0,0,0)
		QuestInfoObjectivesText:SetFont(unpack(miirgui.medium))
		QuestInfoGroupSize:SetTextColor(1, 1, 1)
		QuestInfoGroupSize:SetShadowColor(0,0,0,0)
		QuestInfoGroupSize:SetFont(unpack(miirgui.medium))
		QuestInfoRewardText:SetTextColor(1, 1, 1)
		QuestInfoRewardText:SetShadowColor(0,0,0,0)
		QuestInfoRewardText:SetFont(unpack(miirgui.medium))
		QuestInfoTitleHeader:SetTextColor(unpack(miirgui.Color))
		QuestInfoTitleHeader:SetFont(unpack(miirgui.huge))
		QuestInfoTitleHeader:SetShadowColor(0,0,0,0)
		QuestInfoDescriptionHeader:SetTextColor(unpack(miirgui.Color))
		QuestInfoDescriptionHeader:SetFont(unpack(miirgui.huge))
		QuestInfoDescriptionHeader:SetShadowColor(0,0,0,0)
		QuestInfoObjectivesHeader:SetTextColor(unpack(miirgui.Color))
		QuestInfoObjectivesHeader:SetFont(unpack(miirgui.huge))
		QuestInfoObjectivesHeader:SetShadowColor(0,0,0,0)	
		GreetingText:SetTextColor(1, 1, 1,1)
		GreetingText:SetShadowColor(0,0,0,0)
		GreetingText:SetFont(unpack(miirgui.medium))
		AvailableQuestsText:SetTextColor(unpack(miirgui.Color))
		AvailableQuestsText:SetShadowColor(0,0,0,0)
		AvailableQuestsText:SetFont(unpack(miirgui.huge))
		QuestInfoSpellObjectiveLearnLabel:SetTextColor(1, 1, 1,1)
		QuestInfoSpellObjectiveLearnLabel:SetShadowColor(0,0,0,0)
		QuestInfoSpellObjectiveLearnLabel:SetFont(unpack(miirgui.medium))
		CurrentQuestsText:SetTextColor((unpack(miirgui.Color)))
		CurrentQuestsText:SetShadowColor(0,0,0,0)
		CurrentQuestsText:SetFont(unpack(miirgui.huge))
		QuestObjectiveText()
		end)

		hooksecurefunc("QuestFrameGreetingPanel_OnShow", function()

				for i=1, MAX_NUM_QUESTS do
					local button = _G["QuestTitleButton"..i]
						if button:GetFontString() then
							if button:GetFontString():GetText() and button:GetFontString():GetText():find("|cff000000") then
								button:GetFontString():SetText(string.gsub(button:GetFontString():GetText(), "|cff000000", "|cffffffff"))
								button:GetFontString():SetFont(unpack(miirgui.medium))
								button:GetFontString():SetShadowColor(0,0,0,0)
							end
						end
				end

				QuestFont:SetTextColor(1,1,1,1)
				QuestFont:SetFont(unpack(miirgui.medium))
				QuestFont:SetShadowColor(0,0,0,0)
				QuestInfoDescriptionText:SetTextColor(1, 1, 1)
				QuestInfoDescriptionText:SetShadowColor(0,0,0,0)
				QuestInfoDescriptionText:SetFont(unpack(miirgui.medium))
				QuestInfoObjectivesText:SetTextColor(1, 1, 1)
				QuestInfoObjectivesText:SetShadowColor(0,0,0,0)
				QuestInfoObjectivesText:SetFont(unpack(miirgui.medium))
				QuestInfoGroupSize:SetTextColor(1, 1, 1)
				QuestInfoGroupSize:SetShadowColor(0,0,0,0)
				QuestInfoGroupSize:SetFont(unpack(miirgui.medium))
				QuestInfoRewardText:SetTextColor(1, 1, 1)
				QuestInfoRewardText:SetShadowColor(0,0,0,0)
				QuestInfoRewardText:SetFont(unpack(miirgui.medium))
				QuestInfoTitleHeader:SetTextColor(unpack(miirgui.Color))
				QuestInfoTitleHeader:SetFont(unpack(miirgui.huge))
				QuestInfoTitleHeader:SetShadowColor(0,0,0,0)
				QuestInfoDescriptionHeader:SetTextColor(unpack(miirgui.Color))
				QuestInfoDescriptionHeader:SetFont(unpack(miirgui.huge))
				QuestInfoDescriptionHeader:SetShadowColor(0,0,0,0)
				QuestInfoObjectivesHeader:SetTextColor(unpack(miirgui.Color))
				QuestInfoObjectivesHeader:SetFont(unpack(miirgui.huge))
				QuestInfoObjectivesHeader:SetShadowColor(0,0,0,0)	
				GreetingText:SetTextColor(1, 1, 1,1)
				GreetingText:SetShadowColor(0,0,0,0)
				GreetingText:SetFont(unpack(miirgui.medium))
				AvailableQuestsText:SetTextColor(unpack(miirgui.Color))
				AvailableQuestsText:SetShadowColor(0,0,0,0)
				AvailableQuestsText:SetFont(unpack(miirgui.huge))
				QuestInfoSpellObjectiveLearnLabel:SetTextColor(1, 1, 1,1)
				QuestInfoSpellObjectiveLearnLabel:SetShadowColor(0,0,0,0)
				QuestInfoSpellObjectiveLearnLabel:SetFont(unpack(miirgui.medium))
				CurrentQuestsText:SetTextColor(unpack(miirgui.Color))
				CurrentQuestsText:SetShadowColor(0,0,0,0)
				CurrentQuestsText:SetFont(unpack(miirgui.huge))
		end)
		
		QuestFrameGreetingPanel:HookScript("OnShow", function()
			GreetingText:SetTextColor(1, 1, 1,1)
			GreetingText:SetFont(unpack(miirgui.medium))
			GreetingText:SetShadowColor(0,0,0,0)

			CurrentQuestsText:SetTextColor(unpack(miirgui.Color))
			CurrentQuestsText:SetShadowColor(0,0,0,0)
			CurrentQuestsText:SetFont(unpack(miirgui.huge))

			AvailableQuestsText:SetTextColor(unpack(miirgui.Color))
			AvailableQuestsText:SetShadowColor(0,0,0,0)
			AvailableQuestsText:SetFont(unpack(miirgui.huge))

			for i=1, MAX_NUM_QUESTS do
				local button = _G["QuestTitleButton"..i]
				if button:GetFontString() then
					if button:GetFontString():GetText() and button:GetFontString():GetText():find("|cff000000") then
					button:GetFontString():SetText(string.gsub(button:GetFontString():GetText(), "|cff000000", "|cffffffff"))
					button:GetFontString():SetFont(unpack(miirgui.medium))
					button:GetFontString():SetShadowColor(0,0,0,0)
					end
				end
			end
		end)