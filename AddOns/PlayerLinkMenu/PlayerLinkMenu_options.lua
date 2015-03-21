--[[
    - Player Link Menu
      Functions for dealing with user options and settings.
]]


function PlayerLinkMenu_ToggleOptionsFrame()
  ShowUIPanel(PlayerLinkMenuOptions);
end


function PlayerLinkMenu_Save()
  PLAYERLINKMENU_USEDSAVE = true;
  if (PLAYERLINKMENU_USEDDEFAULT) then
    PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["MENUSETTINGS"] = {};
  end

  for i, v in pairs(plmActionsEdit) do
    if (i ~= v.index) then
      if (PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["MENUSETTINGS"][v.index] == nil) then
        PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["MENUSETTINGS"][v.index] = {};
      end
      PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["MENUSETTINGS"][v.index].pos = i;
    elseif ((PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["MENUSETTINGS"][v.index]) and (PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["MENUSETTINGS"][v.index].pos ~= nil)) then
      PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["MENUSETTINGS"][v.index].pos = nil;
    end
    if (plmLabels[v.index] ~= v.label) then
      if (PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["MENUSETTINGS"][v.index] == nil) then
        PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["MENUSETTINGS"][v.index] = {};
      end
      PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["MENUSETTINGS"][v.index].label = v.label;
    elseif ((PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["MENUSETTINGS"][v.index]) and (PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["MENUSETTINGS"][v.index].label ~= nil)) then
      PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["MENUSETTINGS"][v.index].label = nil;
    end
    if (not v.visible) then
      if (PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["MENUSETTINGS"][v.index] == nil) then
        PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["MENUSETTINGS"][v.index] = {};
      end
      PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["MENUSETTINGS"][v.index].visible = v.visible;
    elseif ((PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["MENUSETTINGS"][v.index]) and (PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["MENUSETTINGS"][v.index].visible ~= nil)) then
      PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["MENUSETTINGS"][v.index].visible = nil;
    end
  end
  PlayerLinkMenu_GenerateActions();

  local tmp;
  for i, v in pairs(plmOptions) do
    if (v.frametype == "CHECKBOX") then
      tmp = false;
      if (_G["PlayerLinkMenuOptions"..v.frame]:GetChecked()) then
        tmp = true;
      end
      PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME][v.key] = tmp;
    elseif (v.frametype == "EDITBOX") then
      PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME][v.key] = PLAYERLINKMENU_TIMEOUT;
    end
  end

  local selID;
  for i, v in pairs(plmDropdowns) do
    selID = tonumber(UIDropDownMenu_GetSelectedID(_G["PlayerLinkMenuOptions"..v.button.."MB"..v.mode]))-1;
    PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME][strupper(v.button)][strupper(v.mode)] = selID;
  end
end


function PlayerLinkMenu_SetDefaults()
  PLAYERLINKMENU_USEDDEFAULT = true;
  PLAYERLINKMENU_TIMEOUT_BACKUP = PLAYERLINKMENU_TIMEOUT;
  for i, v in pairs(plmOptions) do
    if (v.frametype == "CHECKBOX") then
      _G["PlayerLinkMenuOptions"..v.frame]:SetChecked(v.default);
    elseif (v.frametype == "EDITBOX") then
      _G["PlayerLinkMenuOptions"..v.frame]:SetText(v.default);
      if (v.key == "TIMEOUT") then
        local tmp = v.default.." second";
        if (v.default > 1) then
          tmp = tmp.."s";
        end
        PlayerLinkMenuOptionsMiscStuffTimeout:SetText(tmp);
      end
    end
  end
  for i, v in pairs(plmDropdowns) do
    UIDropDownMenu_SetSelectedID(_G["PlayerLinkMenuOptions"..v.button.."MB"..v.mode], (v.default+1), 1);
  end
  PlayerLinkMenu_BuildMenuForEdit(true);
end


function PlayerLinkMenu_Cancel()
  if (PLAYERLINKMENU_USEDSAVE) then
    return;
  end
  if (PLAYERLINKMENU_TIMEOUT_BACKUP) then
    PLAYERLINKMENU_TIMEOUT = PLAYERLINKMENU_TIMEOUT_BACKUP;
  end
end


function PlayerLinkMenu_OnShow()
  PLAYERLINKMENU_USEDSAVE = false;
  PLAYERLINKMENU_USEDDEFAULT = false;
  PLAYERLINKMENU_TIMEOUT_BACKUP = PLAYERLINKMENU_TIMEOUT;
  plmActionsEdit = {};
  PlayerLinkMenu_BuildMenuForEdit();
  PlayerLinkMenuDropDown_Load();
  for i, v in pairs(plmOptions) do
    if (v.frametype == "CHECKBOX") then
      _G["PlayerLinkMenuOptions"..v.frame]:SetChecked(PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME][v.key]);
    elseif (v.frametype == "EDITBOX") then
      _G["PlayerLinkMenuOptions"..v.frame]:SetText(PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME][v.key]);
    end
  end
  if (PlayerLinkMenuSettings["MASTER_PROFILE"]) then
    PlayerLinkMenuOptionsProfileCurrentMasterProfile:SetText("Using: |cffaebfff"..PlayerLinkMenuSettings["MASTER_PROFILE"].."|r");
  else
    PlayerLinkMenuOptionsProfileCurrentMasterProfile:SetText("Using: |cffaebfffNone set|r");
  end
end


function PlayerLinkMenu_BuildMenuForEdit(reset)
  local tmp, pos;
  if (reset) then
    for i, v in pairs(plmActions) do
      tmp = v;
      tmp.index = i;
      tmp.label = plmLabels[i];
      tmp.visible = true;
      plmActionsEdit[i] = tmp;
    end
  elseif (table.getn(plmActionsEdit) == 0) then
    for i, v in pairs(plmActions) do
      pos = i;
      tmp = v;
      tmp.index = i;
      tmp.label = plmLabels[i];
      if (PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["MENUSETTINGS"][i] ~= nil) then
        for n, k in pairs(PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["MENUSETTINGS"][i]) do
          tmp[n] = k;
        end
        if (tmp.pos) then
          pos = tmp.pos;
          tmp.pos = nil;
        end
      end
      plmActionsEdit[pos] = tmp;
    end
  end

  local f, p, button, checkbox, buttonUp, buttonDown, pos;
  local n = 1;
  local cnt = table.getn(plmActionsEdit);
  for i, v in pairs(plmActionsEdit) do
    if (v.onlyKey ~= true) then
      p = "PlayerLinkMenuOptionsMenuConfigurationEdit"..n;
      f = _G[p];
      button = _G[p.."Button"];
      checkbox = _G[p.."Checkbox"];
      buttonUp = _G[p.."ButtonUp"];
      buttonDown = _G[p.."ButtonDown"];
      button:SetText(v.label);
      button:SetWidth(button:GetTextWidth());
      checkbox:SetChecked(v.visible)
      button:Show();
      if (n == 1) then
        buttonUp:Hide();
      elseif (i == cnt) then
        buttonDown:Hide();
      end

      f:SetID(i);
      f:Show();
      n = n + 1;
    end
  end

  while (true) do
    f = _G["PlayerLinkMenuOptionsMenuConfigurationEdit"..n];
    if (not f) then
      break;
    end
    f:Hide();
    n = n + 1;
  end
end


function PlayerLinkMenuDropDown_Load()
  for i, v in pairs(plmDropdowns) do
    PlayerLinkMenuDropDown_OnLoad("PlayerLinkMenuOptions"..v.button.."MB"..v.mode, PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME][strupper(v.button)][strupper(v.mode)]);
  end
end


function PlayerLinkMenuDropDown_OnLoad(frame, selID)
  local frame = _G[frame];
  if (selID > 0 and plmActions[selID]) then
    selID = selID + 1;
  else
    selID = 1;
  end
  UIDropDownMenu_Initialize(frame, PlayerLinkMenuDropDown_Initialize);
  UIDropDownMenu_SetSelectedID(frame, selID, 1);
  UIDropDownMenu_SetWidth(frame, 115);
end


function PlayerLinkMenuDropDown_Initialize(frame, level, menuList)
  local ownerName = frame:GetName();
  local info = {text="|cffff1010Disabled|r", value="|cffff1010Disabled|r", func=PlayerLinkMenuDropDown_OnClick, checked=nil, owner=ownerName};
  UIDropDownMenu_AddButton(info);

  for i, v in pairs(plmActions) do
    if (v.onlyKey ~= nil) then
      info = {};
      info.text = plmLabels[i];
      info.value = info.text;
      info.tooltipTitle = plmLabels[i];
      info.tooltipText = v.tooltip;
      info.func = PlayerLinkMenuDropDown_OnClick;
      info.checked = nil;
      info.owner = ownerName;
      UIDropDownMenu_AddButton(info);
    end
  end
end


function PlayerLinkMenuDropDown_OnClick(self)
  local owner = _G[self.owner]:GetParent();
  UIDropDownMenu_SetSelectedID(_G[self.owner], self:GetID(), 1);
end


function PlayerLinkMenu_LabelEdit(e)
  local f = PlayerLinkMenuOptionsMenuConfigurationEditBox;
  if (f.button) then
    PlayerLinkMenu_EditBoxHide();
  end
  e:Hide();
  f.button = e;
  f:ClearAllPoints();
  f:SetPoint("TOPLEFT", e:GetName(), "TOPLEFT", 0, 0);
  f:SetText(e:GetText());
  f:SetMaxLetters(25);
  f:Show();
end


function PlayerLinkMenu_EditBoxSave()
  local f = PlayerLinkMenuOptionsMenuConfigurationEditBox;
  local text = f:GetText();
  local id = f.button:GetParent():GetID();
  if (strlen(text) > 0) then
    plmActionsEdit[id].label = text;
    f.button:SetText(text);
  elseif(strlen(text) > 25) then
    return;
  end
  PlayerLinkMenu_EditBoxHide();
end


function PlayerLinkMenu_EditBoxHide()
  local f = PlayerLinkMenuOptionsMenuConfigurationEditBox;
  f:ClearFocus();
  f:Hide();
  if (f.button) then
    f.button:Show();
    f.button = nil;
  end
end


function PlayerLinkMenu_MoveItem(self,button,down,up)
  local id = self:GetParent():GetID();
  local tmp;
  local dir = 1;
  if (up) then
    dir = -1;
  end
  tmp = plmActionsEdit[(id+dir)];
  plmActionsEdit[(id+dir)] = plmActionsEdit[id];
  plmActionsEdit[id] = tmp;
  PlayerLinkMenu_BuildMenuForEdit();
end


function PlayerLinkMenu_SetVisible(self)
  local id = self:GetParent():GetID();
  local val = false;
  if (self:GetChecked()) then
    val = true;
  end
  plmActionsEdit[id].visible = val;
  PlayerLinkMenu_BuildMenuForEdit();
end


function PlayerLinkMenu_TimeoutEdit(e)
  local f = PlayerLinkMenuOptionsMiscStuffEditBox;
  if (f.button) then
    PlayerLinkMenu_TimeoutEditBoxHide();
  end
  e:Hide();
  f.button = e;
  f:ClearAllPoints();
  f:SetPoint("TOPLEFT", e:GetName(), "TOPLEFT", 6, 6);
  local val = tonumber(strsub(e:GetText(), 1, (strfind(e:GetText(), " ")-1)));
  f:SetText(val);
  local str = "second";
  if (val > 1) then
    str = str.."s";
  end
  _G[f:GetName().."Label"]:SetText(str);
  f:SetMaxLetters(3);
  f:Show();
end


function PlayerLinkMenu_TimeoutEditBoxSave()
  local f = PlayerLinkMenuOptionsMiscStuffEditBox;
  local no = f:GetNumber();
  if (no > 0) then
    PLAYERLINKMENU_TIMEOUT = no;
  else
    return;
  end
  PlayerLinkMenu_TimeoutEditBoxHide();
end


function PlayerLinkMenu_TimeoutEditBoxHide()
  local f = PlayerLinkMenuOptionsMiscStuffEditBox;
  f:ClearFocus();
  f:Hide();
  if (f.button) then
    f.button:Show();
    f.button = nil;
  end
end


function PlayerLinkMenu_SetMasterProfile(state)
  if (state) then
    PlayerLinkMenuSettings["MASTER_PROFILE"] = PLAYERLINKMENU_PLAYERNAME;
    PlayerLinkMenuOptionsProfileCurrentMasterProfile:SetText("Using: |cffaebfff"..PlayerLinkMenuSettings["MASTER_PROFILE"].."|r");
  else
    PlayerLinkMenuSettings["MASTER_PROFILE"] = nil;
    PlayerLinkMenuOptionsProfileCurrentMasterProfile:SetText("Using: |cffaebfffNone set|r");
  end
end
