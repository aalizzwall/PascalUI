-- enUS localization file for Elementarist

-- This is the default locale.

if GetLocale() then
	local L = Elementarist.Locals

	L.BEHAVIOR_KEEP_FS_UP = "Keep Flame Shock up"
	L.BEHAVIOR_FS_BEFORE_LVB = "Flame Shock before Lava"
	L.THREAT_WARNING_SUFFIX = "% threat!"
	L.THREAT_WARNING_PREFIX = ""
	L.CONFIG_ENABLED = "Enabled"
	L.CONFIG_ONLY_ON_ELE = "Disable when not on elemental talent"
	L.CONFIG_LOCK_FRAMES = "Lock elementarist frames"
	L.CONFIG_SPELL_ADV_SCALE = "Spell advisor scale"
	L.CONFIG_SPELL_ADV_ALPHA = "Spell advisor alpha"
	L.CONFIG_DISABLE_DEBUFF_TRACKER = "Disable debuff tracker"
	L.CONFIG_DEBUFF_TRACKER_SCALE = "Debuff tracker scale"
	L.CONFIG_DEBUFF_TRACKER_ALPHA = "Debuff tracker alpha"
	L.CONFIG_BEHAVIOR = "Flame Shock behavior:"
	L.CONFIG_THREAT_WARNING = "Threat warning"
	L.CONFIG_RESET_POSITIONS = "Reset frame positions"
	L.CONFIG_CLSTBEHAVIOR = "Chain Lightning single target behavior"
	L.CLSTBEHAVIOR_CL_AFTER_LVB = "Chain Lightning after Lava"
	L.CLSTBEHAVIOR_CL_ON_CD = "Chain Lightning on Cooldown"
	L.CLSTBEHAVIOR_NONE = "None"
-- new for 1.9
	L.CONFIG_SHIELD_TRACKER_SCALE = "Shield tracker scale"
	L.CONFIG_SHIELD_TRACKER_ALPHA = "Shield tracker alpha"
	L.CONFIG_DISABLE_SHIELD_TRACKER = "Disable shield tracker"
-- new for 2.0
	L.CONFIG_ENABLE_EQ_SPELL = "Enable Earthquake in rotation"
-- new for 2.1.4
	L.CONFIG_DISABLE_MINI = "Disable mini frames"
-- new for 3.0.0
	L.CONFIG_LAYOUT = "Layout:"
	L.LAYOUT_GROW = "Growing icons"
	L.LAYOUT_RIGHTTOLEFT = "Right to left"
	L.CONFIG_ENABLE_HS_TOTEM = "Show Healing Stream Totem"
	L.CONFIG_ENABLE_SEARING_TOTEM = "Show Searing Totem"
	L.CONFIG_ANNOUNCE_STORMLASH = "Announce Stormlash Totem in Raid/Party chat"
end