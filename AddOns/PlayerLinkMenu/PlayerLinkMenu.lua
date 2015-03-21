--[[
    - Player Link Menu
    
    - Adds a movable pop-up menu when clicking a mouse button on
      a name in the chat window.
    - Fully configurable and adds the option to also use Ctrl and
      Alt + click for different behaviors.

    - Copyright © 2005, Viper (http://www.viper.dk/WoW/)
                  2008-2010 ArtureLeCoiffeur
]]

local plmSetItemRer, plmInGuildCheck;
local PlayerLinkMenuDragging;
local storedX, storedY;

function PlayerLinkMenu_OnLoad(self)
  -- Hook the new functions instead of the old ones.
  plmChatFrame_OnHyperlinkShow = ChatFrame_OnHyperlinkShow;
  ChatFrame_OnHyperlinkShow = PlayerLinkMenu_ChatFrame_OnHyperlinkShow;
  plmInGuildCheck = InGuildCheck;
  InGuildCheck = PlayerLinkMenu_InGuildCheck;

  SLASH_PLM1 = "/plm";
  SlashCmdList["PLM"] = function()
    PlayerLinkMenu_ToggleOptionsFrame();
  end

  self:SetBackdropBorderColor(0.8, 0.8, 0.8, 0.9);
  self:SetBackdropColor(0.1, 0.1, 0.1, 1.0);
  self:RegisterForDrag("LeftButton");
  self:RegisterEvent("VARIABLES_LOADED");

  PlayerLinkMenuDragging = false;

  UIPanelWindows["PlayerLinkMenuOptions"] = {area = "center", pushable = 0, whileDead = 1};
end


function PlayerLinkMenu_OnEvent(self, event, ...)
  if (event == "VARIABLES_LOADED") then
    if (VipersAddonsLoaded) then
      local tablePos = table.getn(VipersAddonsLoaded)+1;
      VipersAddonsLoaded[tablePos] = {};
      VipersAddonsLoaded[tablePos]["NAME"] = PLAYERLINKMENU_NAME;
      VipersAddonsLoaded[tablePos]["VERSION"] = PLAYERLINKMENU_VERSION;
      VipersAddonsLoaded[tablePos]["OPTIONSFRAME"] = "PlayerLinkMenuOptions";
    end

    PLAYERLINKMENU_PLAYERNAME = UnitName("player");

    -- Clean up settings from very old versions --
    if ((PlayerLinkMenuSettings) and (PlayerLinkMenuSettings["NONE"])) then
      PlayerLinkMenuSettings = {};
    end

    -- Register for new settings --
    if (not PlayerLinkMenuSettings) then
      PlayerLinkMenuSettings = {};
      PlayerLinkMenuSettings["MASTER_PROFILE"] = nil;
    end

    -- Register settings for each unique player name --
    if (not PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]) then
      PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME] = {};
      PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["HASMOVED"] = false;
      PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["POSBOTTOM"] = PLAYERLINKMENU_POSBOTTOM;
      PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["POSLEFT"] = PLAYERLINKMENU_POSLEFT;
      PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["IGNORE_MASTER_PROFILE"] = false;
      PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["MENUSETTINGS"] = {};
      for i, v in pairs(plmOptions) do
        PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME][v.key] = v.default;
      end
    end

    -- Create new keys for each mouse button --
    if (PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["LEFT"] == nil) then
      PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["LEFT"] = {};
      PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["LEFT"]["NONE"] = 4;
      PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["LEFT"]["SHIFT"] = 3;
      PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["LEFT"]["CTRL"] = 2;
      PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["LEFT"]["ALT"] = 2;
    end
    if (PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["RIGHT"] == nil) then
      PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["RIGHT"] = {};
      PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["RIGHT"]["NONE"] = 1;
      PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["RIGHT"]["SHIFT"] = 0;
      PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["RIGHT"]["CTRL"] = 0;
      PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["RIGHT"]["ALT"] = 0;
    end

    -- Create new key for storing user changes to the menu --
    if (PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["MENUSETTINGS"] == nil) then
      PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["MENUSETTINGS"] = {};
    end
    -- Set new keys, if any --
    for i, v in pairs(plmOptions) do
      if (PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME][v.key] == nil) then
        PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME][v.key] = v.default;
      end
    end

    PLAYERLINKMENU_TIMEOUT = PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["TIMEOUT"];

    if ((PlayerLinkMenuSettings["MASTER_PROFILE"]) and (PlayerLinkMenuSettings[PlayerLinkMenuSettings["MASTER_PROFILE"]]) and (not PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["IGNORE_MASTER_PROFILE"])) then
      PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME] = PlayerLinkMenuSettings[PlayerLinkMenuSettings["MASTER_PROFILE"]];
    end

    -- Create the actions currently enabled --
    PlayerLinkMenu_GenerateActions();

    if ((not VipersAddonsSettings) or ((VipersAddonsSettings) and (not VipersAddonsSettings["SURPRESSLOADMSG"])) and (DEFAULT_CHAT_FRAME)) then
      DEFAULT_CHAT_FRAME:AddMessage("|cffffffff- |cff00f100Player Link Menu is loaded (version "..PLAYERLINKMENU_VERSION..").");
    end
    return;
  end
end


function PlayerLinkMenu_GenerateActions()
  plmActionsInUse = {};
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
    if ((tmp.visible == true) and (tmp.onlyKey ~= true)) then
      plmActionsInUse[pos] = tmp;
    end
  end
end


function PlayerLinkMenu_OnClick(self,button,down)
  local id = self:GetID();
  if (PLAYERLINKMENU_STOREDNAME == nil) then
    return;
  end

  local doAction = plmActions[id].action;
  doAction(PLAYERLINKMENU_STOREDNAME);

  PLAYERLINKMENU_STOREDNAME = nil;
  PlayerLinkMenuFrame:Hide();
end


function PlayerLinkMenu_OnUpdate(self, elapsed)
  if ((not PlayerLinkMenuDragging) and (PlayerLinkMenuFrame:IsVisible())) then
    local timeleft = PlayerLinkMenuFrame.timeleft - elapsed;
    if (timeleft <= 0) then
      PlayerLinkMenuFrame:Hide();
      return;
    end
    PlayerLinkMenuFrame.timeleft = timeleft;
  end
end


function PlayerLinkMenu_OnDragStart(self, button)
  if (not PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["FROZEN"]) then
    storedX, storedY = GetCursorPosition(UIParent);
    PlayerLinkMenuDragging = true;
    PlayerLinkMenuFrame:StartMoving();
  end
end


function PlayerLinkMenu_OnDragStop(self, button)
  if (PlayerLinkMenuDragging) then
    local newX, newY = GetCursorPosition(UIParent);
    PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["HASMOVED"] = true;
    PlayerLinkMenuFrame:StopMovingOrSizing();
    PlayerLinkMenuDragging = false;
    PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["POSLEFT"] = PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["POSLEFT"] + (newX - storedX);
    PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["POSBOTTOM"] = PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["POSBOTTOM"] + (newY - storedY);-- - newY;
  end
end


function PlayerLinkMenu_ChatFrame_OnHyperlinkShow(frame, link, text, button)
  PLAYERLINKMENU_LINEID = nil;
  if (link and button) then
    local frameName = frame:GetName();
    local args = {};
    for v in string.gmatch(link, "[^:]+") do
      table.insert(args, v);
    end

    if (args[1] and args[1] == "player") then
      local name = args[2];
      PLAYERLINKMENU_LINEID = args[3];
      if (name) then
        local offset = 1;
        local paramCutPos = string.find(name, " ", offset);
        if (paramCutPos) then
          while (paramCutPos) do
            offset = paramCutPos+1;
            paramCutPos = string.find(name, " ", offset);
          end
          name = strsub(name, offset);
        end

        local doAction;
        local usedButton = "LEFT";
        local key = "NONE";
        if (button == "RightButton") then
          usedButton = "RIGHT";
        end
        if (IsShiftKeyDown()) then
          key = "SHIFT";
        elseif (IsControlKeyDown()) then
          key = "CTRL";
        elseif (IsAltKeyDown()) then
          key = "ALT";
        end
        doAction = PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME][usedButton][key];
        if (doAction > 0) then
          if (plmActions[doAction]) then
            plmActions[doAction].action(name, frameName);
          else
            DEFAULT_CHAT_FRAME:AddMessage("[Player Link Menu] Error when trying to perform action: Action not found.");
          end
          return;
        end
      end
    end
  end
  plmChatFrame_OnHyperlinkShow(frame, link, text, button);
end


function PlayerLinkMenu_DoWhisper(name)
  DEFAULT_CHAT_FRAME.editBox:SetAttribute("chatType", "WHISPER");
  DEFAULT_CHAT_FRAME.editBox:SetAttribute("tellTarget", name);
  ChatFrame_OpenChat("", DEFAULT_CHAT_FRAME);
end


function PlayerLinkMenu_DoWindow(name, frameName)
  PLAYERLINKMENU_STOREDNAME = name;
  PlayerLinkMenuFrame.timeleft = PLAYERLINKMENU_TIMEOUT;
  local width, btn;
  local maxWidth = 0;
  local titleOffset = 0;

  if (PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["SHOWNAME"]) then
    PlayerLinkMenuTitle:SetText(" "..name.." ");
    PlayerLinkMenuTitle:Show();
    maxWidth = PlayerLinkMenuTitle:GetStringWidth();
  else
    PlayerLinkMenuTitle:Hide();
    titleOffset = PLAYERLINKMENU_TITLE_HEIGHT;
  end

  local i = 1;
  local pos;
  for index, value in pairs(plmActionsInUse) do
    btn = _G["PlayerLinkMenuButton"..i];
    if (btn == nil) then
      return;
    end

    btn:SetText(value.label);

    if (i == 1) then
      btn:ClearAllPoints();
      if (PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["SHOWNAME"]) then
        btn:SetPoint("TOP", "PlayerLinkMenuTitle", "BOTTOM", 0, -8);
      else
        btn:SetPoint("TOP", "PlayerLinkMenuFrame", "TOP", 0, -14);
      end
    elseif (i > 1) then
      btn:ClearAllPoints();
      btn:SetPoint("TOP", "PlayerLinkMenuButton"..(i-1), "BOTTOM", 0, -PLAYERLINKMENU_SPACER_SPACING);
    end

    if (PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["TOOLTIP"]) then
      btn.tooltip = value.tooltip;
    else
      btn.tooltip = nil;
    end

    pos = index;
    if (value.index) then
      pos = value.index;
    end
    btn:SetID(pos);
    btn:Show();
    if (value.condition == nil or value.condition() == true) then
      btn:Enable();
    else
      btn:Disable();
    end

    width = btn:GetTextWidth();
    if (width > maxWidth) then
      maxWidth = width;
    end

    i = i + 1;
  end
  local buttons = i;

  if (i == 1) then
    PlayerLinkMenuFrame:Hide();
    return;
  end

  while (true) do
    btn = _G["PlayerLinkMenuButton"..i];
    if (btn) then
      btn:Hide();
    else
      break;
    end
    i = i + 1;
  end

  i = 1;
  for index, value in pairs(plmActionsInUse) do
    local btn = _G["PlayerLinkMenuButton"..i];
    btn:SetWidth(maxWidth);
    i = i + 1;
  end

  local height = ((PLAYERLINKMENU_TITLE_HEIGHT - titleOffset) + (buttons * PLAYERLINKMENU_BUTTON_HEIGHT) + (2 * PLAYERLINKMENU_BORDER_HEIGHT));
  height = height + (buttons * PLAYERLINKMENU_SPACER_SPACING) + 4;
  local width = maxWidth + (2 * PLAYERLINKMENU_BORDER_WIDTH);

  local frame = _G[frameName];
  local scale = frame:GetEffectiveScale();
  if (PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["POSATCURSOR"]) then
    local mX, mY = GetCursorPosition(frame);
    mX = mX / scale;
    mY = mY / scale;
    PlayerLinkMenuFrame:ClearAllPoints();
    PlayerLinkMenuFrame:SetPoint("BOTTOMLEFT", "UIParent", "BOTTOMLEFT", mX, mY);
  else
    PlayerLinkMenuFrame:ClearAllPoints();
    PlayerLinkMenuFrame:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["POSLEFT"] / scale, PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["POSBOTTOM"] / scale);
  end

  PlayerLinkMenuFrame:SetHeight(height);
  PlayerLinkMenuFrame:SetWidth(width);
  PlayerLinkMenuFrame:Show();
end


function PlayerLinkMenu_ResetWindow()
  PlayerLinkMenuFrame:ClearAllPoints();
  PlayerLinkMenuFrame:SetPoint("BOTTOMLEFT", "UIParent", "BOTTOMLEFT", PLAYERLINKMENU_POSBOTTOM, PLAYERLINKMENU_POSLEFT);
  PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["HASMOVED"] = false;
  PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["POSBOTTOM"] = PLAYERLINKMENU_POSBOTTOM;
  PlayerLinkMenuSettings[PLAYERLINKMENU_PLAYERNAME]["POSLEFT"] = PLAYERLINKMENU_POSLEFT;
  if (DEFAULT_CHAT_FRAME) then
    DEFAULT_CHAT_FRAME:AddMessage("[Player Link Menu] The menu window's position has now been reset back to default.");
  end
end


function PlayerLinkMenu_InGuildCheck()
  if plmInGuildCheck then
    plmInGuildCheck();
  end
  if (not PLAYERLINKMENU_INGUILDCHECK) then
    PLAYERLINKMENU_INGUILDCHECK = true;
  end
end

function urlencode(obj)
    local currentIndex = 1;
    local charArray = {}
    while currentIndex <= #obj do
        local char = string.byte(obj, currentIndex);
        charArray[currentIndex] = char
        currentIndex = currentIndex + 1
    end
    local converchar = "";
    for _, char in ipairs(charArray) do
        converchar = converchar..string.format("%%%X", char)
    end
    return converchar;
end
