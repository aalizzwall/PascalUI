U1RegisterAddon("tdCooldown2", {
    title = "技能冷卻",
    defaultEnable = 1,

    tags = {TAG_COMBATINFO,},
    icon = [[Interface\Icons\INV_Qiraj_JewelGlyphed]],
    modifier = "WOWbox",
    desc = "給所有的技能冷卻動畫添加文字顯示及冷卻後的效果，同時可以將超出範圍的技能圖標設置為暗紅色。",

    toggle = function(name, info, enable, justload)
        CoreCall("tdCooldownUpdateCooldowns");
        return true
    end,

    ------- Options --------
    {
        type="checkbox",
        var = "redout",
        default = 1,
        text="超出技能範圍圖標顯示為紅色",
        callback = function(cfg, v, loading) tdCooldown2:SetCurVal("redout", nil, v) end,
    },
    {
        type="checkbox",
        var = "flash",
        default = 1,
        text="顯示動作條上的技能冷卻數字",
        callback = function(cfg, v, loading) tdCooldown2:SetCurVal("ACTION", "config", v) end,
        {
            text = '動作條計時文字大小',
            var = 'textSize',
            type = 'spin',
            range = {10, 60, 1},
            default = 24,
            callback = function(cfg, v, loading)
                tdCooldown2:SetCurVal('ACTION', 'size', v)
            end,
        },
    },
    {
        type="checkbox",
        var = "buff",
        default = 1,
        text="顯示狀態圖標的計時數字",
        tip = "說明`目標頭像下的狀態圖標的數字",
        callback = function(cfg, v, loading) tdCooldown2:SetCurVal("BUFF", "config", v) end,
        {
            type="checkbox",
            var = "hidecd",
            default = false,
            text="隱藏系統冷卻動畫",
            tip="說明`顯示冷卻倒計時文字後，可以選擇隱藏系統的冷卻轉圈動畫。",
            callback = function(cfg, v, loading)
                tdCooldown2:SetCurVal("BUFF", "hidecooldown", v)
                tdCooldown2:SetCurVal("ACTION", "hidecooldown", v)
            end,
        },
        {
            type="checkbox",
            var = "mine",
            default = 1,
            text="只顯示自己施放的",
            callback = function(cfg, v, loading) tdCooldown2:SetCurVal("mine", nil, v) end,
        },
        {
            type="checkbox",
            var = "compactRaid",
            default = 1,
            text="忽略暴雪團隊框架",
            tip="說明`暴雪的團隊框架的狀態圖標實在太小了, 默認關閉顯示計時, 如果有特殊需要, 請修改此選項",
            reload = 1,
            callback = function(cfg, v, loading) tdCooldown2:SetCurVal("ignoreCompactRaid", nil, v) end,
        },
        {
            type = "custom",
            text = "",
            place = function(parent, cfg, last)
                if not cfg.f then
                    local f = WW:Frame():Size(1,1)
                    local text = f:CreateFontString():SetFontObject(CtlFontNormalSmall):SetText(cfg.text):LEFT(CTL_INDENT, -10)
                    local buff1 = f:Frame("TdCooldownTestBuff", "TargetofTargetDebuffFrameTemplate"):LEFT(text, "R", 88, 0):Size(21,21):Show():un()
                    buff1:SetScript("OnEnter", nil)
                    local buff2 = f:Frame("TdCooldownTestBuff2", "TargetofTargetDebuffFrameTemplate"):LEFT(buff1, "R", 10, 0):Size(12,12):Show():un()
                    buff2:SetScript("OnEnter", nil)
                    TdCooldownTestBuffIcon:SetTexture("Interface\\Icons\\Achievement_Reputation_KirinTor")
                    TdCooldownTestBuff2Icon:SetTexture("Interface\\Icons\\Achievement_Reputation_KirinTor")
                    f.CtlSetEnabled = CoreUIShowOrHide
                    cfg.f = f:un()
                end
                CtlCustomPlace(cfg.f, parent, cfg, last)
                TdCooldownTestBuffCooldown:SetCooldown(GetTime(), 60)
                TdCooldownTestBuff2Cooldown:SetCooldown(GetTime(), 60)
                return cfg.f
            end
        },
        {
            text = '文字大小',
            var = 'textSize',
            type = 'spin',
            range = {10, 60, 1},
            default = 30,
            callback = function(cfg, v, loading)
                tdCooldown2:SetCurVal('BUFF', 'size', v)
                if TdCooldownTestBuff and TdCooldownTestBuff:IsVisible() then
                    TdCooldownTestBuffCooldown:SetCooldown(GetTime(), 12)
                    TdCooldownTestBuff2Cooldown:SetCooldown(GetTime(), 12)
                end
            end,
        },
        {
            text = "橫向偏移量",
            var = "buffx",
            type = "spin",
            range = {-30, 30, 1},
            default = -2,
            callback = function(cfg, v, loading)
                tdCooldown2:SetCurVal("BUFF", "x", v)
                if TdCooldownTestBuff and TdCooldownTestBuff:IsVisible() then
                    TdCooldownTestBuffCooldown:SetCooldown(GetTime(), 12)
                    TdCooldownTestBuff2Cooldown:SetCooldown(GetTime(), 12)
                end
            end,
        },
        {
            text = "縱向偏移量",
            var = "buffy",
            type = "spin",
            range = {-30, 30, 1},
            default = 2,
            callback = function(cfg, v, loading)
                tdCooldown2:SetCurVal("BUFF", "y", v)
                if TdCooldownTestBuff and TdCooldownTestBuff:IsVisible() then
                    TdCooldownTestBuffCooldown:SetCooldown(GetTime(), 12)
                    TdCooldownTestBuff2Cooldown:SetCooldown(GetTime(), 12)
                end
            end,
        },
    },
    {
        var = "shine",
        type = "radio",
        text = "選擇冷卻完畢的閃光動畫：",
        tip = "說明`選擇'僅默認'則只播放暴雪自帶的小閃光動畫，沒有額外占用，適合性能較差的機器。",
        default = 0,
        options = {"僅默認動畫", -1, "圖標", 0, "小閃光", 1, "雷達", 2, "大閃光", 3, },
        indent = 1,
        cols = 2,
        callback = function(cfg, v, loading) tdCooldown2:SetShineType(v); if TdCooldownTestAction and TdCooldownTestAction:IsVisible() then TdCooldownTestActionCooldown:SetCooldown(GetTime()-4, 4) end end,
        {
            type = "custom",
            text = "",
            place = function(parent, cfg, last)
                if not cfg.f then
                    local f = WW:Frame():Size(1,1)
                    local text = f:CreateFontString():SetFontObject(CtlFontNormalSmall):SetText(cfg.text):LEFT(0, 0)
                    f:Frame("TdCooldownTestAction", "ActionButtonTemplate"):Key("action"):CENTER(-13, 25):Size(28,28):Show():un()
                    f.action.icon:SetTexture("Interface\\Icons\\Ability_UpgradeMoonGlaive")
                    f.CtlSetEnabled = CoreUIShowOrHide
                    cfg.f = f:un()
                end
                CtlCustomPlace(cfg.f, parent, cfg, last)
                TdCooldownTestActionCooldown:SetCooldown(GetTime(), 60)
                return cfg.f
            end
        },
    },
    {
        var = "center",
        text="顯示中心冷卻圖標",
        tip = "說明`技能冷卻結束後在屏幕中央顯示一個大圖標",
        default = false,
        callback = function(cfg, v, loading) tdCooldown2:SetCurVal("center", "config", not not v); tdCooldown2:ToggleCenter(not not v) end,
        {
            text = "調整圖標位置",
            callback = function(cfg, v, loading) tdCooldown2:ShowCenterPos(); end,
        },
        {
            var = "size",
            text = "圖標大小",
            default = 100,
            type = "spin",
            range = {20, 200, 10},
            callback = function(cfg, v, loading)
                tdCooldown2:SetCurVal("center", "width", v);
                if not loading then tdCooldown2:Demo() end
            end,
        },
        {
            var = "text",
            text = "下方顯示技能名稱",
            default = 1,
            callback = function(cfg, v, loading) tdCooldown2:SetCurVal("center", "text", not not v); end,
            {
                var = "textsize",
                text = "文字大小",
                default = 30,
                type = "spin",
                range = {9, 30, 1},
                callback = function(cfg, v, loading)
                    tdCooldown2:SetCurVal("center", "size", v);
                    if not loading then tdCooldown2:Demo() end
                end,
            },
        },
    },
});
