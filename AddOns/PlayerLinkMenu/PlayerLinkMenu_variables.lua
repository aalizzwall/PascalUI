--[[
    - Player Link Menu
      Constants and variables for the add-on.
]]

PLAYERLINKMENU_VERSION = "1.10";
PLAYERLINKMENU_NAME = "Player Link Menu";

PLAYERLINKMENU_STOREDNAME = nil;
PLAYERLINKMENU_PLAYERNAME = nil;
PLAYERLINKMENU_USEDSAVE = false;
PLAYERLINKMENU_USEDDEFAULT = false;
PLAYERLINKMENU_TIMEOUT = 3;
PLAYERLINKMENU_TIMEOUT_BACKUP = nil;
PLAYERLINKMENU_TITLE_HEIGHT = 18;
PLAYERLINKMENU_BUTTON_HEIGHT = 12;
PLAYERLINKMENU_BORDER_HEIGHT = 4;
PLAYERLINKMENU_BORDER_WIDTH = 12;
PLAYERLINKMENU_SPACER_SPACING = 3;
PLAYERLINKMENU_POSLEFT = 0;
PLAYERLINKMENU_POSBOTTOM = 0;
PLAYERLINKMENU_LINEID = nil;
PLAYERLINKMENU_INGUILDCHECK = false;

PLAYERLINKMENU_LABEL_VERSION = "Version "..PLAYERLINKMENU_VERSION;
PLAYERLINKMENU_LABEL_POSATCURSOR = "Position menu at mouse cursor";
PLAYERLINKMENU_LABEL_TOOLTIP = "Show tooltips for menu buttons";
PLAYERLINKMENU_LABEL_FROZEN = "Lock menu position (no dragging)";
PLAYERLINKMENU_LABEL_SHOWNAME = "Show player name in menu";
PLAYERLINKMENU_LABEL_NONE = "None";
PLAYERLINKMENU_LABEL_SHIFT = "Shift";
PLAYERLINKMENU_LABEL_CTRL = "Ctrl";
PLAYERLINKMENU_LABEL_ALT = "Alt";
PLAYERLINKMENU_LABEL_RESETWINDOW = "Reset window";
PLAYERLINKMENU_LABEL_TIMEOUT = "Window timeout";
PLAYERLINKMENU_LABEL_MASTERPROFILE_SET = "Set profile";
PLAYERLINKMENU_LABEL_MASTERPROFILE_CLEAR = "Clear profile";
PLAYERLINKMENU_TOOLTIP_TIMEOUT = "Click to change timeout value";

PLAYERLINKMENU_APPLY = "Apply";

plmOptions = {};
plmOptions[1] = {key="POSATCURSOR", frame="GeneralPosAtCursor", default=true, frametype="CHECKBOX"};
plmOptions[2] = {key="TOOLTIP", frame="GeneralTooltip", default=true, frametype="CHECKBOX"};
plmOptions[3] = {key="FROZEN", frame="GeneralFrozen", default=false, frametype="CHECKBOX"};
plmOptions[4] = {key="SHOWNAME", frame="GeneralShowName", default=true, frametype="CHECKBOX"};
plmOptions[5] = {key="IGNORE_MASTER_PROFILE", frame="ProfileIgnoreMasterProfile", default=false, frametype="CHECKBOX"};
plmOptions[6] = {key="TIMEOUT", frame="MiscStuffEditBox", default=3, frametype="EDITBOX"};

plmDropdowns = {};
plmDropdowns[1] = {button="Left", mode="None", default=1};
plmDropdowns[2] = {button="Left", mode="Shift", default=4};
plmDropdowns[3] = {button="Left", mode="Ctrl", default=7};
plmDropdowns[4] = {button="Left", mode="Alt", default=3};
plmDropdowns[5] = {button="Right", mode="None", default=1};
plmDropdowns[6] = {button="Right", mode="Shift", default=0};
plmDropdowns[7] = {button="Right", mode="Ctrl", default=0};
plmDropdowns[8] = {button="Right", mode="Alt", default=0};

plmLabels = {};
plmLabels[1] = "開啟選單";
plmLabels[2] = "邀請";
plmLabels[3] = "查詢";
plmLabels[4] = "悄悄話";
plmLabels[5] = "加為好友";
plmLabels[6] = "忽略";
plmLabels[7] = "公會邀請";
plmLabels[8] = "舉報玩家";
plmLabels[9] = "複製名稱";
plmLabels[10] = "英雄榜";
plmLabels[11] = "關閉";

plmActions = {};
plmActions[1] = {
  label = nil,
  tooltip = "顯示Player Link選單",
  visible = true,
  onlyKey = true,
  action = function(name, frameName)
    PlayerLinkMenu_DoWindow(name, frameName);
  end,
};
plmActions[2] = {
  label = nil,
  tooltip = "邀請玩家加入隊伍",
  visible = true,
  onlyKey = false,
  action = function(name)
    InviteUnit(name);
  end,
  condition = function()
    if (not IsInGroup() or (UnitIsGroupLeader("player") or UnitIsGroupAssistant("player"))) then
      return true;
    end
    return false;
  end
};
plmActions[3] = {
  label = nil,
  tooltip = "查詢玩家的基本資訊",
  visible = true,
  onlyKey = false,
  action = function(name)
    SendWho("n-"..name);
  end,
};
plmActions[4] = {
  label = nil,
  tooltip = "發送悄悄話給玩家",
  visible = true,
  onlyKey = false,
  action = function(name)
    PlayerLinkMenu_DoWhisper(name);
  end,
};
plmActions[5] = {
  label = nil,
  tooltip = "加入玩家到好友名單",
  visible = true,
  onlyKey = false,
  action = function(name)
    AddFriend(name);
  end,
};
plmActions[6] = {
  label = nil,
  tooltip = "加入玩家到忽略名單",
  visible = true,
  onlyKey = false,
  action = function(name)
    AddIgnore(name);
  end,
};
plmActions[7] = {
  label = nil,
  tooltip = "邀請玩家加入公會",
  visible = true,
  onlyKey = false,
  action = function(name)
    GuildInvite(name);
  end,
  condition = function()
    if (not PLAYERLINKMENU_INGUILDCHECK) then
      InGuildCheck();
    end
    if (CanGuildInvite()) then
      return true;
    end
    return false;
  end,
};
plmActions[8] = {
  label = nil,
  tooltip = "舉報玩家散佈垃圾訊息",
  visible = true,
  onlyKey = false,
  action = function(name)
    if (name and PLAYERLINKMENU_LINEID) then
      local dialog = StaticPopup_Show("CONFIRM_REPORT_SPAM_CHAT", name);
      if (dialog) then
        dialog.data = PLAYERLINKMENU_LINEID;
      end
    end
  end,
  condition = function()
    if (not PLAYERLINKMENU_LINEID or not CanComplainChat(PLAYERLINKMENU_LINEID)) then
      return false;
    end
    return true;
  end,
};
plmActions[9] = {
  label = nil,
  tooltip = "在對話欄開啟時貼上名稱",
  visible = true,
  onlyKey = false,
  action = function(name)
    if (not chatFrame) then
      chatFrame = DEFAULT_CHAT_FRAME;
    end
    if (not chatFrame.editBox:IsShown()) then
      ChatFrame_OpenChat(name, chatFrame);
    else
      chatFrame.editBox:Insert(name);
    end
  end,
};
plmActions[10] = {
  label = nil,
  tooltip = "取得英雄榜連結",
  visible = true,
  onlyKey = false,
  action = function(name)
  local n,r = name:match"(.*)-(.*)"
        n = n or name
        r = r or GetRealmName()

        local portal = GetCVar'portal'
        local portal = ("http://tw.battle.net/"):format(GetCVar'portal')

        local armory = "http://tw.battle.net/wow/zh/character/"..urlencode(r).."/"..urlencode(n).."/advanced"

        local editBox = ChatEdit_ChooseBoxForSend();
        ChatEdit_ActivateChat(editBox);
		editBox:SetText(armory);
		editBox:HighlightText();
    end,
}
plmActions[11] = {
  label = nil,
  tooltip = "關閉這個視窗",
  visible = true,
  onlyKey = nil,
  action = function()
  end,
};

plmActionsInUse = {};
plmActionsEdit = {};
