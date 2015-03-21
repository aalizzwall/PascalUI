-------------------------------------------------------------------------------
-- Elementarist Gui functions
--
-- GUI functions and structures for Elementarist
-------------------------------------------------------------------------------

local L = Elementarist.Locals

function Elementarist:SetTexture(frame,icon)
	frame:SetTexture(icon)
end

function Elementarist:CreateCheckButton(name, parent, table, field, radio)
	local button
	if radio then
		button = CreateFrame('CheckButton', parent:GetName() .. name, parent, 'SendMailRadioButtonTemplate')
	else
		button = CreateFrame('CheckButton', parent:GetName() .. name, parent, 'OptionsCheckButtonTemplate')
	end
	local frame = _G[button:GetName() .. 'Text']
	frame:SetText(name)
	frame:SetTextColor(1, 1, 1, 1)
	frame:SetFontObject(GameFontNormal)
	button:SetScript("OnShow", 
		function (self) 
			self:SetChecked(table[field]) 
			self.origValue = table[field] or self.origValue
		end 
	)
	if radio then
		button:SetScript("OnClick", 
			function (self, button, down)
				this:SetChecked(1)
				table[field] = not table[field]
			end 
		)
	else
		button:SetScript("OnClick", 
			function (self, button, down) 
				table[field] = not table[field]
			end
		)
	end

	function button:Restore() 
		table[field] = self.origValue 
	end 
	return button 
end

function Elementarist:CreateSlider(text, parent, low, high, step)
	local name = parent:GetName() .. text
	local slider = CreateFrame('Slider', name, parent, 'OptionsSliderTemplate')
	slider:SetScript('OnMouseWheel', Slider_OnMouseWheel)
	slider:SetMinMaxValues(low, high)
	slider:SetValueStep(step)
	slider:EnableMouseWheel(true)
	_G[name .. 'Text']:SetText(text)
	_G[name .. 'Low']:SetText('')
	_G[name .. 'High']:SetText('')
	local text = slider:CreateFontString(nil, 'BACKGROUND')
	text:SetFontObject('GameFontHighlightSmall')
	text:SetPoint('LEFT', slider, 'RIGHT', 7, 0)
	slider.valText = text
	return slider
end

function Elementarist:CreateButton(text, parent)
	local name = parent:GetName() .. text
	local button = CreateFrame('Button', name, parent, 'UIPanelButtonTemplate')
	_G[name .. 'Text']:SetText(text)
	local text = button:CreateFontString(nil, 'BACKGROUND')
	text:SetFontObject('GameFontHighlightSmall')
	text:SetPoint('LEFT', button, 'RIGHT', 7, 0)
	button.valText = text
	return button
end

function Elementarist:CreateDropDownMenu(text, parent, dbTree, varName, itemList, width)
	local name = parent:GetName() .. text

	local menuParent = CreateFrame("Frame", name .. "parent", parent)
	menuParent:SetHeight(16)
	menuParent:SetWidth(400)
	
	local label = menuParent:CreateFontString(nil, 'BACKGROUND')
	label:SetFontObject('GameFontHighlight')
	label:SetPoint('LEFT', menuParent, "LEFT", 0,0)
	label:SetText(text)
	
	local labelWidth = label:GetStringWidth()
	
    local menu = CreateFrame("Frame", name, menuParent, "UIDropDownMenuTemplate")
    menu.displayMode = "MENU"

	local frame = _G[menu:GetName() .. 'Text']
	frame:SetText(text)
	frame:SetTextColor(1, 1, 1, 1)
	frame:SetFontObject(GameFontNormal)

    menu:EnableMouse(true);
    if(width) then
        _G.UIDropDownMenu_SetWidth(menu, width);
    end
    menu.itemList = itemList or {};
    menu.init = function()
            for i=1, #menu.itemList do
                if(not menu.itemList[i].hooked) then
                    local func = menu.itemList[i].func or function(self) end;
                    menu.itemList[i].func = function(self, arg1, arg2)
                        self = self or _G.this; -- wotlk/tbc hack
                        dbTree[varName] = self.value;
                        _G.UIDropDownMenu_SetSelectedValue(menu, self.value);
                        func(self, arg1, arg2);
                    end
                    menu.itemList[i].hooked = true;
                end
                local info = _G.UIDropDownMenu_CreateInfo();
                for k,v in pairs(menu.itemList[i]) do
                    info[k] = v;
                end
                _G.UIDropDownMenu_AddButton(info, _G.UIDROPDOWNMENU_MENU_LEVEL);
            end
        end
    menu:SetScript("OnShow", function(self)
            _G.UIDropDownMenu_Initialize(self, self.init);
            _G.UIDropDownMenu_SetSelectedValue(self, dbTree[varName]);
        end);
    menu.SetValue = function(self, value)
            _G.UIDropDownMenu_SetSelectedValue(self, value);
        end;
    
    menu:SetPoint("LEFT",labelWidth+10,0,"LEFT")
    menu:Hide(); menu:Show();
    return menuParent;
end

function Elementarist:ApplySettings()
	Elementarist:InitSettings()
	if (not ElementaristDB.locked) then
		Elementarist:UnLockFrames()
	else
		if (Elementarist.displayFrame) then
			Elementarist.displayFrame:EnableMouse(false)
			Elementarist.displayFrame:SetMovable(false)
			Elementarist.displayFrame:SetBackdropColor(0, 0, 0, .0)
			Elementarist.debuffTracker:EnableMouse(false)
			Elementarist.debuffTracker:SetMovable(false)
			Elementarist.debuffTracker:SetBackdropColor(0, 0, 0, .0)
			Elementarist.shieldTracker:EnableMouse(false)
			Elementarist.shieldTracker:SetMovable(false)
			Elementarist.shieldTracker:SetBackdropColor(0, 0, 0, .0)
		end
	end
	if (not Elementarist:isEnabled()) then
		if (Elementarist.displayFrame) then
			Elementarist.displayFrame:Hide()
			Elementarist.debuffTracker:Hide()
			Elementarist.shieldTracker:Hide()
		end
	else
		if (Elementarist.displayFrame) then
			Elementarist.displayFrame:Show()
			if (ElementaristDB.debuffdisabled) then
				Elementarist.debuffTracker:Hide()
			else
				Elementarist.debuffTracker:Show()
			end
			if (ElementaristDB.shielddisabled) then
				Elementarist.shieldTracker:Hide()
			else
				Elementarist.shieldTracker:Show()
			end
		end
	end
	if (Elementarist.displayFrame) then
		Elementarist.displayFrame:SetAlpha(ElementaristDB.alpha)
		Elementarist.displayFrame:SetScale(ElementaristDB.scale)
		Elementarist.debuffTracker:SetAlpha(ElementaristDB.debuffalpha)
		Elementarist.debuffTracker:SetScale(ElementaristDB.debuffscale)
		Elementarist.shieldTracker:SetAlpha(ElementaristDB.shieldalpha)
		Elementarist.shieldTracker:SetScale(ElementaristDB.shieldscale)
	end
	if (ElementaristDB.disableMini) then
		Elementarist:SetTexture(Elementarist.textureList["int"],"")
		Elementarist:SetTexture(Elementarist.textureList["misc"],"")
	end
	if (ElementaristDB.Layout == L.LAYOUT_GROW) then	-- grow layout
		Elementarist.displayFrame_next:SetPoint("TOPLEFT", 45, -30)
		Elementarist.displayFrame_next1:SetPoint("TOPLEFT", 55, -10)
		Elementarist.displayFrame_next2:SetPoint("TOPLEFT", 65, 0)
		Elementarist.displayFrame_next:SetHeight(60)
		Elementarist.displayFrame_next:SetWidth(60)
		Elementarist.displayFrame_next1:SetHeight(40)
		Elementarist.displayFrame_next1:SetWidth(40)
		Elementarist.displayFrame_next2:SetHeight(20)
		Elementarist.displayFrame_next2:SetWidth(20)
	end
	if (ElementaristDB.Layout == L.LAYOUT_RIGHTTOLEFT) then	-- right to left flow layout
		Elementarist.displayFrame_next:SetPoint("TOPLEFT", 0, 0)
		Elementarist.displayFrame_next1:SetPoint("TOPLEFT", 50, 0)
		Elementarist.displayFrame_next2:SetPoint("TOPLEFT", 100, 0)
		Elementarist.displayFrame_next:SetHeight(50)
		Elementarist.displayFrame_next:SetWidth(50)
		Elementarist.displayFrame_next1:SetHeight(50)
		Elementarist.displayFrame_next1:SetWidth(50)
		Elementarist.displayFrame_next2:SetHeight(50)
		Elementarist.displayFrame_next2:SetWidth(50)
	end
end

function Elementarist:StoreUIValues()
    for i,v in pairs(ElementaristDB) do
		Elementarist.prevDB[i]=v
    end
end

function Elementarist:ReStoreUIValues()
    for i,v in pairs(Elementarist.prevDB) do
		ElementaristDB[i]=v
    end
end

function Elementarist:CreateConfig()
	if (Elementarist.configPanel ~= nil) then
		return;
	end
	if (not ElementaristDB.version) then
		ElementaristDB.version = Elementarist.versionNumber;
		if (not ElementaristDB.modules) then
			ElementaristDB.modules = {}
		end
		ElementaristDB.modules.elemental = true;
		ElementaristDB.modules.restoration = not ElementaristDB.disableIfNotEle;
	end
	
	Elementarist.configPanel = CreateFrame( "Frame", "ElementaristConfigPanel", UIParent );
	-- Register in the Interface Addon Options GUI
	-- Set the name for the Category for the Options Panel
	Elementarist.configPanel.name = "Elementarist";

	local EnableBtn = Elementarist:CreateCheckButton(L.CONFIG_ENABLED, Elementarist.configPanel, ElementaristDB, "enabled", false)
	EnableBtn:SetPoint('TOPLEFT', 10, -8)

	local DisableMini = Elementarist:CreateCheckButton(L.CONFIG_DISABLE_MINI, Elementarist.configPanel, ElementaristDB, "disableMini", false)
	DisableMini:SetPoint('TOPLEFT', 40, -38)

	local LockBtn = Elementarist:CreateCheckButton(L.CONFIG_LOCK_FRAMES, Elementarist.configPanel, ElementaristDB, "locked", false)
	LockBtn:SetPoint('TOPLEFT', 10, -68)

	local Scale = Elementarist:CreateSlider(L.CONFIG_SPELL_ADV_SCALE, Elementarist.configPanel, .25, 3, .1)
	Scale:SetScript('OnShow', function(self)
		self.onShow = true
		Elementarist:StoreUIValues()
		self:SetValue(ElementaristDB.scale)
		self.onShow = nil
	end)
	Scale:SetScript('OnValueChanged', function(self, value)
		self.valText:SetText(format('%.1f', value))
		if not self.onShow then
			ElementaristDB.scale=value
			Elementarist.displayFrame:SetScale(value)
		end
	end)
	Scale:SetPoint("TOPLEFT",10,-108)
	Scale:Show()

	local Alpha = Elementarist:CreateSlider(L.CONFIG_SPELL_ADV_ALPHA, Elementarist.configPanel, .0, 1, .1)
	Alpha:SetScript('OnShow', function(self)
		self.onShow = true
		self:SetValue(ElementaristDB.alpha)
		self.onShow = nil
	end)
	Alpha:SetScript('OnValueChanged', function(self, value)
		self.valText:SetText(format('%.1f', value))
		if not self.onShow then
			ElementaristDB.alpha=value
			Elementarist.displayFrame:SetAlpha(value)
		end
	end)
	Alpha:SetPoint("TOPLEFT",200,-108)
	Alpha:Show()

	local DebuffDisableBtn = Elementarist:CreateCheckButton(L.CONFIG_DISABLE_DEBUFF_TRACKER, Elementarist.configPanel, ElementaristDB, "debuffdisabled", false)
	DebuffDisableBtn:SetPoint('TOPLEFT', 10, -168)

	local DebuffScale = Elementarist:CreateSlider(L.CONFIG_DEBUFF_TRACKER_SCALE, Elementarist.configPanel, .25, 3, .1)
	DebuffScale:SetScript('OnShow', function(self)
		self.onShow = true
		self:SetValue(ElementaristDB.debuffscale)
		self.onShow = nil
	end)
	DebuffScale:SetScript('OnValueChanged', function(self, value)
		self.valText:SetText(format('%.1f', value))
		if not self.onShow then
			ElementaristDB.debuffscale=value
			Elementarist.debuffTracker:SetScale(value)
		end
	end)
	DebuffScale:SetPoint("TOPLEFT",10,-148)
	DebuffScale:Show()

	local DebuffAlpha = Elementarist:CreateSlider(L.CONFIG_DEBUFF_TRACKER_ALPHA, Elementarist.configPanel, .0, 1, .1)
	DebuffAlpha:SetScript('OnShow', function(self)
		self.onShow = true
		self:SetValue(ElementaristDB.debuffalpha)
		self.onShow = nil
	end)
	DebuffAlpha:SetScript('OnValueChanged', function(self, value)
		self.valText:SetText(format('%.1f', value))
		if not self.onShow then
			ElementaristDB.debuffalpha=value
			Elementarist.debuffTracker:SetAlpha(value)
		end
	end)
	DebuffAlpha:SetPoint("TOPLEFT",200,-148)
	DebuffAlpha:Show()

	local ShieldDisableBtn = Elementarist:CreateCheckButton(L.CONFIG_DISABLE_SHIELD_TRACKER, Elementarist.configPanel, ElementaristDB, "shielddisabled", false)
	ShieldDisableBtn:SetPoint('TOPLEFT', 10, -228)

	local ShieldScale = Elementarist:CreateSlider(L.CONFIG_SHIELD_TRACKER_SCALE, Elementarist.configPanel, .25, 3, .1)
	ShieldScale:SetScript('OnShow', function(self)
		self.onShow = true
		self:SetValue(ElementaristDB.shieldscale)
		self.onShow = nil
	end)
	ShieldScale:SetScript('OnValueChanged', function(self, value)
		self.valText:SetText(format('%.1f', value))
		if not self.onShow then
			ElementaristDB.shieldscale=value
			Elementarist.shieldTracker:SetScale(value)
		end
	end)
	ShieldScale:SetPoint("TOPLEFT",10,-208)
	ShieldScale:Show()

	local ShieldAlpha = Elementarist:CreateSlider(L.CONFIG_SHIELD_TRACKER_ALPHA, Elementarist.configPanel, .0, 1, .1)
	ShieldAlpha:SetScript('OnShow', function(self)
		self.onShow = true
		self:SetValue(ElementaristDB.shieldalpha)
		self.onShow = nil
	end)
	ShieldAlpha:SetScript('OnValueChanged', function(self, value)
		self.valText:SetText(format('%.1f', value))
		if not self.onShow then
			ElementaristDB.shieldalpha=value
			Elementarist.shieldTracker:SetAlpha(value)
		end
	end)
	ShieldAlpha:SetPoint("TOPLEFT",200,-208)
	ShieldAlpha:Show()

	local ThreatWarnBtn = Elementarist:CreateCheckButton(L.CONFIG_THREAT_WARNING, Elementarist.configPanel, ElementaristDB, "ThreatWarning", false)
	ThreatWarnBtn:SetPoint('TOPLEFT', 10, -258)

	local EleLayout = Elementarist:CreateDropDownMenu(L.CONFIG_LAYOUT, Elementarist.configPanel, ElementaristDB, "Layout", {{text = L.LAYOUT_GROW},{text = L.LAYOUT_RIGHTTOLEFT}}, 200)
	EleLayout:SetPoint('TOPLEFT', 10, -288)

	local ResetBtn = Elementarist:CreateButton(L.CONFIG_RESET_POSITIONS, Elementarist.configPanel)
	ResetBtn:SetWidth(160)
	ResetBtn:SetHeight(22)
	ResetBtn:SetScript('OnClick', function()
		Elementarist:ResetPosition()
	end)
	ResetBtn:SetPoint("TOPLEFT",10,-318)
	ResetBtn:Show()
	
	Elementarist.configPanel.okay = function()
		Elementarist:ApplySettings()
	end
	Elementarist.configPanel.cancel = function()
		-- cancel button pressed, revert changes
		Elementarist:ReStoreUIValues()
		Elementarist:ApplySettings()
	end
	Elementarist.configPanel.default = function()
		-- default button pressed, reset setting
		ElementaristDB.scale = 1
		ElementaristDB.debuffscale = 1
		ElementaristDB.shieldscale = 1
		ElementaristDB.locked = false
		ElementaristDB.enabled = true
		ElementaristDB.disableMini = false
		ElementaristDB.debuffdisabled = false
		ElementaristDB.shielddisabled = false
		ElementaristDB.alpha = 0.8
		ElementaristDB.debuffalpha = 1
		ElementaristDB.shieldalpha = 1
		ElementaristDB.Behavior = Elementarist.Behaviors["1"]
		ElementaristDB.EnableEQ = false
		ElementaristDB.ThreatWarning = true
		ElementaristDB.Layout = Elementarist.EleLayout["1"]
		ElementaristDB.version = Elementarist.versionNumber;
		Elementarist:ResetPosition()
	end

	-- always show frame if config panel is open
	Elementarist.configPanel:SetScript('OnShow', function(self)
		self.onShow = true
		Elementarist:DecideSpells()
		self.onShow = nil
	end)
	Elementarist.configPanel:SetScript('OnHide', function(self)
		self.onHide = true
		Elementarist:DecideSpells()
		self.onHide = nil
	end)
	-- Add the panel to the Interface Options
	InterfaceOptions_AddCategory(Elementarist.configPanel)
	
	-- create module panels
	local i,i2,v,v2;
	
	if (Elementarist.modules) then
		for i,v in pairs(Elementarist.modules) do
			local vposition = -20;
			if (Elementarist[i].Configuration) then
				local childPanel = CreateFrame( "Frame", "ElementaristConfigPanel" .. i, Elementarist.configPanel );
				childPanel.name = i:gsub("^%l", string.upper);

				if (not ElementaristDB.modules) then
					ElementaristDB.modules = {};
				end
				if (ElementaristDB.modules[i] == nil) then
					ElementaristDB.modules[i] = {};
					ElementaristDB.modules[i].enabled = true;
				end
				local checkBox = Elementarist:CreateCheckButton(childPanel.name .. " enabled", childPanel, ElementaristDB.modules, i, false);
				checkBox:SetPoint('TOPLEFT', 10, vposition);
				vposition = vposition - 40;

				for i2,v2 in pairs(Elementarist[i].Configuration) do
					if (v2.type == "DropDown") then
						local dropDown = Elementarist:CreateDropDownMenu(v2.label, childPanel, ElementaristDB, i2, v2.options, 200);
						dropDown:SetPoint('TOPLEFT', 10, vposition);
						vposition = vposition - 30;
					end
					if (v2.type == "CheckBox") then
						local checkBox = Elementarist:CreateCheckButton(v2.label, childPanel, ElementaristDB, i2, false);
						checkBox:SetPoint('TOPLEFT', 10, vposition);
						vposition = vposition - 30;
					end
				end
				childPanel.parent = Elementarist.configPanel.name;
				InterfaceOptions_AddCategory(childPanel);
			end
		end
	end
end

function Elementarist:ResetPosition()
	ElementaristDB.x = 0
	ElementaristDB.y = -100
	ElementaristDB.relativePoint = "CENTER"
	ElementaristDB.debuffx = -100
	ElementaristDB.debuffy = 0
	ElementaristDB.debuffrelativePoint = "CENTER"
	ElementaristDB.shieldx = 100
	ElementaristDB.shieldy = 0
	ElementaristDB.shieldrelativePoint = "CENTER"
	Elementarist.displayFrame:ClearAllPoints()
	Elementarist.displayFrame:SetPoint(ElementaristDB.relativePoint,ElementaristDB.x,ElementaristDB.y)
	Elementarist.debuffTracker:ClearAllPoints()
	Elementarist.debuffTracker:SetPoint(ElementaristDB.debuffrelativePoint,ElementaristDB.debuffx,ElementaristDB.debuffy)
	Elementarist.shieldTracker:ClearAllPoints()
	Elementarist.shieldTracker:SetPoint(ElementaristDB.shieldrelativePoint,ElementaristDB.shieldx,ElementaristDB.shieldy)

end

function Elementarist:MakeDraggable(frame,x_name,y_name,rp_name)
	frame:SetBackdropColor(0, 0, 0, .3)
	frame:EnableMouse(true)
	frame:SetMovable(true)
	frame:SetClampedToScreen(true)
	frame:SetScript("OnMouseDown", function(self) self:StartMoving(); self:SetBackdropColor(0, 0, 0, .6); end)
	frame:SetScript("OnMouseUp", function(self)
		self:StopMovingOrSizing()
		if (Elementarist.locked) then
			self:SetBackdropColor(0, 0, 0, 0)
		else
			self:SetBackdropColor(0, 0, 0, .3)
		end
		local _,_,rp,x,y = self:GetPoint()
		ElementaristDB[x_name] = x
		ElementaristDB[y_name] = y
		ElementaristDB[rp_name] = rp
	end)
	frame:SetScript("OnDragStop", function(self)
		self:StopMovingOrSizing();
		if (Elementarist.locked) then
			self:SetBackdropColor(0, 0, 0, 0)
		else
			self:SetBackdropColor(0, 0, 0, .3)
		end
		local _,_,rp,x,y = self:GetPoint()
		ElementaristDB[x_name] = x
		ElementaristDB[y_name] = y
		ElementaristDB[rp_name] = rp
	end)
end

function Elementarist:UnLockFrames()
	Elementarist:MakeDraggable(Elementarist.displayFrame,"x","y","relativePoint")
	Elementarist:MakeDraggable(Elementarist.debuffTracker,"debuffx","debuffy","debuffrelativePoint")
	Elementarist:MakeDraggable(Elementarist.shieldTracker,"shieldx","shieldy","shieldrelativePoint")
end

function Elementarist:CreateGUI()
	local t
	local displayFrame = CreateFrame("Frame","ElementaristDisplayFrame",UIParent)
	displayFrame:SetFrameStrata("BACKGROUND")
	displayFrame:SetWidth(150)
	displayFrame:SetHeight(120)
	displayFrame:SetBackdrop({
          bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", tile = true, tileSize = 32,
	})
	displayFrame:SetBackdropColor(0, 0, 0, .0)
	displayFrame:SetPoint(ElementaristDB.relativePoint,ElementaristDB.x,ElementaristDB.y)
	
	local displayFrame_next = CreateFrame("Frame","$parent_next", ElementaristDisplayFrame)
	local displayFrame_next1 = CreateFrame("Frame","$parent_next1", ElementaristDisplayFrame)
	local displayFrame_next2 = CreateFrame("Frame","$parent_next2", ElementaristDisplayFrame)
	local displayFrame_misc = CreateFrame("Frame","$parent_misc", ElementaristDisplayFrame)
	local displayFrame_int = CreateFrame("Frame","$parent_int", ElementaristDisplayFrame)
	local displayFrame_dps = CreateFrame("Frame","$parent_dps", ElementaristDisplayFrame)
	
	displayFrame_next:SetWidth(60)
	displayFrame_next1:SetWidth(40)
	displayFrame_next2:SetWidth(20)
	displayFrame_misc:SetWidth(40)
	displayFrame_int:SetWidth(40)
	displayFrame_dps:SetWidth(60)

	displayFrame_next:SetFrameLevel(10)
	displayFrame_next1:SetFrameLevel(5)
	displayFrame_next2:SetFrameLevel(0)
	
	displayFrame_next:SetHeight(60)
	displayFrame_next1:SetHeight(40)
	displayFrame_next2:SetHeight(20)
	displayFrame_misc:SetHeight(40)
	displayFrame_int:SetHeight(40)
	displayFrame_dps:SetHeight(30)
	
	displayFrame_next:SetPoint("TOPLEFT", 45, -30)
	displayFrame_next1:SetPoint("TOPLEFT", 55, -10)
	displayFrame_next2:SetPoint("TOPLEFT", 65, 0)
	
	displayFrame_misc:SetPoint("TOPLEFT", 0, -80)
	displayFrame_int:SetPoint("TOPLEFT", 110, -80)
	displayFrame_dps:SetPoint("TOPLEFT", 45, -90)
	
	t = displayFrame_next:CreateTexture(nil,"BACKGROUND")
	Elementarist:SetTexture(t, "")
	t:SetAllPoints(displayFrame_next)
	t:SetAlpha(1)
	displayFrame_next.texture = t
	Elementarist.textureList["next"] = t

	t = displayFrame_next1:CreateTexture(nil,"BACKGROUND")
	Elementarist:SetTexture(t,"")
	t:SetAllPoints(displayFrame_next1)
	t:SetAlpha(0.7)
	displayFrame_next1.texture = t
	Elementarist.textureList["next1"] = t

	t = displayFrame_next2:CreateTexture(nil,"BACKGROUND")
	Elementarist:SetTexture(t,"")
	t:SetAllPoints(displayFrame_next2)
	t:SetAlpha(0.5)
	displayFrame_next2.texture = t
	Elementarist.textureList["next2"] = t
	
	t = displayFrame_misc:CreateTexture(nil,"BACKGROUND")
	Elementarist:SetTexture(t,"")
	t:SetAllPoints(displayFrame_misc)
	t:SetAlpha(1)
	displayFrame_misc.texture = t
	Elementarist.textureList["misc"] = t
	
	t = displayFrame_int:CreateTexture(nil,"BACKGROUND")
	Elementarist:SetTexture(t,"")
	t:SetAllPoints(displayFrame_int)
	t:SetAlpha(1)
	displayFrame_int.texture = t
	Elementarist.textureList["int"] = t
	
	t = displayFrame_dps:CreateFontString("$parent_DPSText","ARTWORK","GameFontNormal");
	t:SetAllPoints(displayFrame_dps)
	t:SetAlpha(1)
	t:SetText("")
	Elementarist.textList["dps"] = t

	displayFrame:SetScript("OnUpdate", function(this, elapsed)
		Elementarist:OnUpdate(elapsed)
	end)
  
	local cooldownFrame = CreateFrame("Cooldown","$parent_cooldown", displayFrame_next, "CooldownFrameTemplate")
	cooldownFrame:SetHeight(60)
	cooldownFrame:SetWidth(60)
	cooldownFrame:ClearAllPoints()
	cooldownFrame:SetPoint("CENTER", displayFrame_next, "CENTER", 0, 0)
	
	displayFrame:SetAlpha(ElementaristDB.alpha)
	
	Elementarist.displayFrame = displayFrame
	Elementarist.displayFrame_next = displayFrame_next
	Elementarist.displayFrame_next1 = displayFrame_next1
	Elementarist.displayFrame_next2 = displayFrame_next2
	Elementarist.displayFrame_misc =  displayFrame_misc
	Elementarist.displayFrame_int =  displayFrame_int
	Elementarist.displayFrame_dps =  displayFrame_dps
	Elementarist.cooldownFrame = cooldownFrame
	
	local debuffTracker = CreateFrame("Frame","ElementaristDebuffTrackerFrame",UIParent)
	debuffTracker:SetFrameStrata("BACKGROUND")
	debuffTracker:SetWidth(175)
	debuffTracker:SetHeight(50)
	debuffTracker:SetBackdrop({
          bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", tile = true, tileSize = 32,
	})
	debuffTracker:SetBackdropColor(0, 0, 0, .0)
	debuffTracker:SetPoint(ElementaristDB.debuffrelativePoint,ElementaristDB.debuffx,ElementaristDB.debuffy)
	debuffTracker:SetAlpha(ElementaristDB.debuffalpha)
	Elementarist.debuffTracker = debuffTracker

	local debuffTracker_cd = CreateFrame("Frame","$parent_debuff", ElementaristDebuffTrackerFrame)
	debuffTracker_cd:SetWidth(50)
	debuffTracker_cd:SetHeight(50)
	debuffTracker_cd:SetPoint("TOPLEFT", 0, 0)
	t = debuffTracker_cd:CreateTexture(nil,"BACKGROUND")
	Elementarist:SetTexture(t,"")
	t:SetAllPoints(debuffTracker_cd)
	t:SetAlpha(1)
	debuffTracker_cd.texture = t
	Elementarist.textureList["debuff"] = t

	t = debuffTracker_cd:CreateFontString("$parent_DebuffText","OVERLAY","GameFontNormalLarge")
	t:SetPoint("TOPLEFT", debuffTracker, "TOPLEFT", 0, 0)
	t:SetWidth(50)
	t:SetHeight(50)
	t:SetAlpha(1)
	t:SetText("")
	Elementarist.textList["debuff"] = t

	local auraCooldownFrame = CreateFrame("Cooldown","$parent_debuffcooldown", ElementaristDebuffTrackerFrame, "CooldownFrameTemplate")
	auraCooldownFrame:SetHeight(50)
	auraCooldownFrame:SetWidth(50)
	auraCooldownFrame:ClearAllPoints()
	auraCooldownFrame:SetPoint("TOPLEFT", Elementarist.debuffTracker, "TOPLEFT", 0, 0)
	Elementarist.auraCooldownFrame["main"] = auraCooldownFrame

	for i=1,10,1 do
		local debuffTracker_cd = CreateFrame("Frame","$parent_debuff_" .. tostring(i), ElementaristDebuffTrackerFrame)
		debuffTracker_cd:SetWidth(25)
		debuffTracker_cd:SetHeight(25)
		debuffTracker_cd:SetPoint("TOPLEFT", 50 + ( 25 * ( math.floor( (i - 1) / 2) ) ), - (25 * ( (i - 1) % 2) ) )
		t = debuffTracker_cd:CreateTexture(nil,"BACKGROUND")
		Elementarist:SetTexture(t,"")
		t:SetAllPoints(debuffTracker_cd)
		t:SetAlpha(1)
		debuffTracker_cd.texture = t
		Elementarist.textureList["debuff_" .. tostring(i)] = t
	
		local auraCooldownFrame = CreateFrame("Cooldown" ,"$parent_debuffcooldown_" .. tostring(i), ElementaristDebuffTrackerFrame, "CooldownFrameTemplate")
		auraCooldownFrame:SetHeight(25)
		auraCooldownFrame:SetWidth(25)
		auraCooldownFrame:ClearAllPoints()
		auraCooldownFrame:SetPoint("TOPLEFT", 50 + ( 25 * ( math.floor( (i - 1) / 2) ) ), - (25 * ( (i - 1) % 2) ) )
		Elementarist.auraCooldownFrame["mini_" .. tostring(i)] = auraCooldownFrame
	end

	local shieldTracker = CreateFrame("Frame","ElementaristShieldTrackerFrame",UIParent)
	shieldTracker:SetFrameStrata("BACKGROUND")
	shieldTracker:SetWidth(50)
	shieldTracker:SetHeight(50)
	shieldTracker:SetBackdrop({
          bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", tile = true, tileSize = 32,
	})
	shieldTracker:SetBackdropColor(0, 0, 0, .0)
	shieldTracker:SetPoint(ElementaristDB.shieldrelativePoint,ElementaristDB.shieldx,ElementaristDB.shieldy)

	local shieldTracker_cd = CreateFrame("Frame","$parent_shield", ElementaristShieldTrackerFrame)
	shieldTracker_cd:SetWidth(50)
	shieldTracker_cd:SetHeight(50)
	shieldTracker_cd:SetPoint("CENTER", 0, 0)
	t = shieldTracker_cd:CreateTexture(nil,"BACKGROUND")
	Elementarist:SetTexture(t,"")
	t:SetAllPoints(shieldTracker_cd)
	t:SetAlpha(1)
	shieldTracker_cd.texture = t
	Elementarist.textureList["shield"] = t

	t = shieldTracker_cd:CreateFontString("$parent_ShieldText","OVERLAY","GameFontHighlightLarge");
	t:SetPoint("BOTTOMRIGHT",shieldTracker,"BOTTOMRIGHT",-5,5)
--	t:SetAllPoints(shieldTracker)
	t:SetAlpha(1)
	t:SetText("")
	Elementarist.textList["shield"] = t

	local shieldCooldownFrame = CreateFrame("Cooldown","$parent_shieldcooldown", ElementaristShieldTrackerFrame, "CooldownFrameTemplate")
	shieldCooldownFrame:SetHeight(50)
	shieldCooldownFrame:SetWidth(50)
	shieldCooldownFrame:ClearAllPoints()
	shieldCooldownFrame:SetPoint("CENTER", shieldTracker, "CENTER", 0, 0)

	shieldTracker:SetAlpha(ElementaristDB.shieldalpha)

	Elementarist.shieldTracker = shieldTracker
	Elementarist.shieldCooldownFrame = shieldCooldownFrame

	if (not ElementaristDB.locked) then
		Elementarist:UnLockFrames()
	end


	DEFAULT_CHAT_FRAME:AddMessage("Elementarist " .. Elementarist.versionNumber .. " loaded")
end
