
--[[Setting up invisible frame with class-icon]]
		local classicon = CreateFrame("Frame","Test")
		classicon:SetWidth(64)
		classicon:SetHeight(64)
		classicon:CreateTexture("clasicon_texture")
		classicon:SetAlpha(0)
		clasicon_texture:SetAllPoints()
		--clasicon_texture:SetTexture("Interface\\Addons\\miirgui\\gfx\\class_icons\\classes")
		
--[[Registering blizzard_InspectUI load and parenting the icon to the inspectframe]]	

		local frame2 = CreateFrame("FRAME");
		frame2:RegisterEvent("ADDON_LOADED")
		function frame2:OnEvent(event, arg1)
			if event == "ADDON_LOADED" and arg1 == "Blizzard_InspectUI" then
			classicon:SetParent(InspectFrame)
			classicon:SetAlpha(1)
			classicon:SetPoint("Topleft", -8,9)
			end
		end
		
--[[Registering player_target_change and setting up the texcoords correctly accroding to classcoords]]	
	
		local frame = CreateFrame("FRAME");
		frame:RegisterEvent("PLAYER_TARGET_CHANGED")
		function frame:OnEvent(event, arg1)
		
			if event == "PLAYER_TARGET_CHANGED" then	
					local class  = select(2,UnitClass("target"))
							if class =="WARRIOR" then
							--clasicon_texture:SetTexCoord(0, 0.25, 0, 0.25)
							clasicon_texture:SetTexture("Interface\\Addons\\miirgui\\gfx\\class_icons\\warrior")
							elseif class== "MAGE" then
							clasicon_texture:SetTexture("Interface\\Addons\\miirgui\\gfx\\class_icons\\mage")
							--clasicon_texture:SetTexCoord(0.25, 0.5, 0, 0.25)
							elseif class== "ROGUE" then
							clasicon_texture:SetTexture("Interface\\Addons\\miirgui\\gfx\\class_icons\\rogue")
							--clasicon_texture:SetTexCoord(0.5, 0.75, 0, 0.25)
							elseif class== "DRUID" then 
							clasicon_texture:SetTexture("Interface\\Addons\\miirgui\\gfx\\class_icons\\druid")
							--clasicon_texture:SetTexCoord(0.75, 1, 0, 0.25)
							elseif class== "HUNTER" then 
							clasicon_texture:SetTexture("Interface\\Addons\\miirgui\\gfx\\class_icons\\hunter")
							--clasicon_texture:SetTexCoord(0, 0.25, 0.25, 0.5)
							elseif class== "SHAMAN" then
							clasicon_texture:SetTexture("Interface\\Addons\\miirgui\\gfx\\class_icons\\shaman")
							--clasicon_texture:SetTexCoord(0.25, 0.5, 0.25, 0.5)
							elseif class== "PRIEST" then 
							clasicon_texture:SetTexture("Interface\\Addons\\miirgui\\gfx\\class_icons\\priest")
							--clasicon_texture:SetTexCoord(0.5, 0.75, 0.25, 0.5)
							elseif class== "WARLOCK" then 
							clasicon_texture:SetTexture("Interface\\Addons\\miirgui\\gfx\\class_icons\\warlock")
							--clasicon_texture:SetTexCoord(0.75, 1, 0.25, 0.5)
							elseif class == "PALADIN" then
							clasicon_texture:SetTexture("Interface\\Addons\\miirgui\\gfx\\class_icons\\paladin")
							--clasicon_texture:SetTexCoord(0, 0.25, 0.5, 0.75)
							elseif class== "DEATHKNIGHT" then
							clasicon_texture:SetTexture("Interface\\Addons\\miirgui\\gfx\\class_icons\\deathknight")
							--clasicon_texture:SetTexCoord(0.25, .5, 0.5, .75)
							elseif class== "MONK" then	
							clasicon_texture:SetTexture("Interface\\Addons\\miirgui\\gfx\\class_icons\\monk")
							--clasicon_texture:SetTexCoord(0.5, 0.75 , 0.5, 0.75 )
							end
					end
			end
		
		frame:SetScript("OnEvent", frame.OnEvent);
		frame2:SetScript("OnEvent", frame2.OnEvent);