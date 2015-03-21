-- zhTW localization file for Elementarist

-- 由米利亞爾特-雷麟TW翻譯

if GetLocale() then
	local L = Elementarist.Locals

	L.BEHAVIOR_KEEP_FS_UP = "保持[烈焰震擊]DOT"
	L.BEHAVIOR_FS_BEFORE_LVB = "僅在使用[熔岩爆發]前才施放[烈焰震擊](會掉DOT)"
	L.THREAT_WARNING_SUFFIX = "% 仇恨!"
	L.THREAT_WARNING_PREFIX = ""
	L.CONFIG_ENABLED = "啟用"
	L.CONFIG_ONLY_ON_ELE = "當天賦不是【元素】時禁用插件"
	L.CONFIG_LOCK_FRAMES = "鎖定『元素薩助手』框架"
	L.CONFIG_SPELL_ADV_SCALE = "施法建議圖示大小"
	L.CONFIG_SPELL_ADV_ALPHA = "施法建議圖示透明度"
	L.CONFIG_DISABLE_DEBUFF_TRACKER = "禁用減益法術(debuff)追蹤"
	L.CONFIG_DEBUFF_TRACKER_SCALE = "減益法術追蹤圖示大小"
	L.CONFIG_DEBUFF_TRACKER_ALPHA = "減益法術追蹤圖示透明度"
	L.CONFIG_BEHAVIOR = "[烈焰震擊]動作:"
	L.CONFIG_THREAT_WARNING = "仇恨警報"
	L.CONFIG_RESET_POSITIONS = "重置框架位置"
	L.CONFIG_CLSTBEHAVIOR = "[閃電鏈]在單一目標時的動作"
	L.CLSTBEHAVIOR_CL_AFTER_LVB = "在[熔岩爆發]之後[閃電鍊]"
	L.CLSTBEHAVIOR_CL_ON_CD = "[閃電鍊]冷卻"
	L.CLSTBEHAVIOR_NONE = "無"
-- new for 1.9
	L.CONFIG_SHIELD_TRACKER_SCALE = "元素盾追蹤圖示大小"
	L.CONFIG_SHIELD_TRACKER_ALPHA = "元素盾追蹤圖示透明度"
	L.CONFIG_DISABLE_SHIELD_TRACKER = "禁用元素盾追蹤"
-- new for 2.0
	L.CONFIG_ENABLE_EQ_SPELL = "將[地震術]加入迴圈"
-- new for 2.1.4
	L.CONFIG_DISABLE_MINI = "禁用迷你框架"
-- new for 3.0.0
	L.CONFIG_LAYOUT = "佈局:"
	L.LAYOUT_GROW = "成長圖示"
	L.LAYOUT_RIGHTTOLEFT = "由右至左"
	L.CONFIG_ENABLE_HS_TOTEM = "顯示[治療之泉圖騰]"
	L.CONFIG_ENABLE_SEARING_TOTEM = "顯示[灼熱圖騰]"
	L.CONFIG_ANNOUNCE_STORMLASH = "當使用『風暴鞭笞圖騰』時在團隊/隊伍頻道通報"
end