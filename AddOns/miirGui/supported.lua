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
		
		--Classic Quest log

		local classicquest = IsAddOnLoaded("Classic Quest Log")

		local classicquest2 = IsAddOnLoaded("ClassicQuestLog")

		if classicquest == true or classicquest2 == true then
			Portrait= select(18,ClassicQuestLog:GetRegions() )
			Portrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)
			Portrait:SetPoint("Topleft",-8,10)
				
			Bg= select(19,ClassicQuestLog:GetRegions() )
			Bg:Hide() 
			
			Bg2= select(20,ClassicQuestLog:GetRegions() )
			Bg2:Hide() 
			
			Border(ClassicQuestLog,660,416,"Center",-1,-17,14)
		end

		--Clique

		hooksecurefunc("ToggleSpellBook", function(bookType)
			if (CliqueSpellTab) then
				CliqueIcon = select(6,CliqueSpellTab:GetRegions())
				CliqueIcon:SetTexCoord(0.13, 0.83, 0.13, 0.83)
				CliqueConfigPortrait:SetTexCoord(0.85, 0.15, 0.15, 0.85)
			end
		end)

		-- Combuctor

		local combuctor = IsAddOnLoaded("Combuctor")

		if combuctor == true  then
			CombuctorFrameinventoryPortrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)
			for i=19,21 do
				hideit=select(i,CombuctorFrameinventory:GetRegions())
				hideit:Hide()
			end
		end

		-- Inventorian
		
		local invent = IsAddOnLoaded("Inventorian")

		if invent == true  then
			local frame = CreateFrame("FRAME");
			frame:RegisterEvent("BAG_UPDATE_DELAYED")
			
			function frame:OnEvent(event)
				if ( event == "BAG_UPDATE_DELAYED" ) then
					InventorianBagFramePortrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)
					InventorianBankFramePortrait:SetTexCoord(0.15, 0.85, 0.15, 0.85)
					for i=19,21 do
						hideit=select(i,InventorianBagFrame:GetRegions())
						hideit:Hide()
						hideitalso=select(i,InventorianBankFrame:GetRegions())
						hideitalso:Hide()
					end
				end
			end
			frame:SetScript("OnEvent", frame.OnEvent);
		end