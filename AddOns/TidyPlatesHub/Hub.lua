
-- Rapid Panel Functions
local CreateQuickSlider = TidyPlatesHubRapidPanel.CreateQuickSlider
local CreateQuickCheckbutton = TidyPlatesHubRapidPanel.CreateQuickCheckbutton
local SetSliderMechanics = TidyPlatesHubRapidPanel.SetSliderMechanics
local CreateQuickEditbox = TidyPlatesHubRapidPanel.CreateQuickEditbox
local CreateQuickColorbox = TidyPlatesHubRapidPanel.CreateQuickColorbox
local CreateQuickDropdown = TidyPlatesHubRapidPanel.CreateQuickDropdown
local CreateQuickHeadingLabel = TidyPlatesHubRapidPanel.CreateQuickHeadingLabel
local CreateQuickItemLabel = TidyPlatesHubRapidPanel.CreateQuickItemLabel
local OnMouseWheelScrollFrame = TidyPlatesHubRapidPanel.OnMouseWheelScrollFrame
local CreateInterfacePanel = TidyPlatesHubRapidPanel.CreateInterfacePanel

-- Modes
local ThemeList = TidyPlatesHubModes.ThemeList
local StyleModes = TidyPlatesHubModes.StyleModes
local TextModes = TidyPlatesHubModes.TextModes
local RangeModes = TidyPlatesHubModes.RangeModes
local AuraWidgetModes = TidyPlatesHubModes.AuraWidgetModes
local DebuffStyles = TidyPlatesHubModes.DebuffStyles
local OpacityModes = TidyPlatesHubModes.OpacityModes
local ScaleModes = TidyPlatesHubModes.ScaleModes
local FriendlyBarModes = TidyPlatesHubModes.FriendlyBarModes
local EnemyBarModes = TidyPlatesHubModes.EnemyBarModes
--local WarningGlowModes = TidyPlatesHubModes.WarningGlowModes
local ThreatWidgetModes = TidyPlatesHubModes.ThreatWidgetModes
local NameColorModes = TidyPlatesHubModes.NameColorModes
local TextPlateFieldModes = TidyPlatesHubModes.TextPlateFieldModes
local ArtStyles = TidyPlatesHubModes.ArtStyles
local ArtModes = TidyPlatesHubModes.ArtModes
local ThreatModes = TidyPlatesHubModes.ThreatModes

------------------------------------------------------------------
-- Generate Panel
------------------------------------------------------------------
local function CreateInterfacePanelWidgets(panel)
	local objectName = panel.objectName
	local AlignmentColumn = panel.AlignmentColumn
	local OffsetColumnB = 200	-- 240

--[[
------------------------------------------------------------------------------------------------------------------------
NOTES:

1. Aura Widget Enhancements
	- Cooldowns
	- Abilities
	- Dispellables
	- Mixed Sizes

2. New Settings Lists

3. Name Text Pre/Suff

4. Core Fade/In Animations

Likely Conditions/Settings
Health Bar
- Class Colors in BGs
- Threat Colors in Instances

Warning, Healer Icon, Animated?


Mouseover Highlight colors on Name
Target Color Name
Name Text Prefix and Suffix   <- Name ->

Plate Show, Fade In Animation
------------------------------------------------------------------------------------------------------------------------
--]]

	--[[
	Friendly Unit Bar Coloring					Enemy Unit Bar Coloring
		- Reaction								- Threat
		- Health								- Reaction
		- Class									- Health
												- Raid Icon * Remove * Add to a checkbox
												- Class

		- Raid Icon Coloring should be an overrride setting, rather than a complete package

		How can we remove the Warning Glow option?


		Under Health
			- Enable Low Health Border Glow

		Under ____
			- Enable Enemy Healer Warning Glow

		PVP Category?


		Need to update, EnableWatchers()

	--]]

	------------------------------
    -- Text
	------------------------------
--[[

	Friendly Unit Name Coloring					Enemy Unit Name Coloring
		- Reaction								- Threat
		- Health								- Reaction
		- Class									- Health
												- Raid Icon
												- Class

		- Elite/Significance

	Custom Text Field
	*Field 1				*Field 2				* Field 3
		- Target, Approx Health, Total and Current, Mana/Power, Arena Number, etc.

		None
		Percent Health
		Exact Health
		Rounded Health
		Health Deficit
		Health Total & Percent
		Target Of
		Level
		Arena ID
		Power

	Enable Level Text
	Alt Font
	Show Optional Text on Target/Mouseover

	------
	NOTES:
	Name text highlight color
	Yellow when the name is white
	Brighter/White when the name is a color
--]]

	--[[
	Bar Modes:
	By Threat + By Class (Default)
	* Make it so it can be out-of-box, automatic

	Friendly By Class
	--]]


	------------------------------
	-- Trivial Units
	------------------------------
	--Trivial Mob Scale



	------------------------------
    -- Health Bars
	------------------------------

    panel.HealthBarLabel = CreateQuickHeadingLabel(nil, "血條樣式", AlignmentColumn, nil, 0, 5)

    -- Enemy
	panel.ColorEnemyBarMode =  CreateQuickDropdown(objectName.."ColorEnemyBarMode", "敵方血條顏色:", EnemyBarModes, 1, AlignmentColumn, panel.HealthBarLabel)
	panel.ColorEnemyNameMode =  CreateQuickDropdown(objectName.."ColorEnemyNameMode", "敵方姓名顏色:", NameColorModes, 1, AlignmentColumn, panel.ColorEnemyBarMode)
	panel.ColorEnemyStatusTextMode =  CreateQuickDropdown(objectName.."ColorEnemyStatusTextMode", "敵方血條上的文字:", TextModes, 1, AlignmentColumn, panel.ColorEnemyNameMode)

	-- Friendly
	panel.ColorFriendlyBarMode =  CreateQuickDropdown(objectName.."ColorFriendlyBarMode", "友方血條顏色:", FriendlyBarModes, 1, AlignmentColumn, panel.HealthBarLabel, OffsetColumnB)
	panel.ColorFriendlyNameMode =  CreateQuickDropdown(objectName.."ColorFriendlyNameMode", "友方姓名顏色:", NameColorModes, 1, AlignmentColumn, panel.ColorFriendlyBarMode, OffsetColumnB)
	panel.ColorFriendlyStatusTextMode =  CreateQuickDropdown(objectName.."ColorFriendlyStatusTextMode", "友方血條上的文字:", TextModes, 1, AlignmentColumn, panel.ColorFriendlyNameMode, OffsetColumnB)

	-- Other
	panel.TextShowLevel = CreateQuickCheckbutton(objectName.."TextShowLevel", "顯示等級", AlignmentColumn, panel.ColorFriendlyStatusTextMode, 0)
	panel.TextUseBlizzardFont = CreateQuickCheckbutton(objectName.."TextUseBlizzardFont", "使用暴雪默認字體", AlignmentColumn, panel.TextShowLevel, 0)
    panel.TextShowOnlyOnTargets = CreateQuickCheckbutton(objectName.."TextShowOnlyOnTargets", "滑鼠游標移上去顯示血條文字", AlignmentColumn, panel.TextUseBlizzardFont, 0)


	------------------------------
	-- Headline View
	------------------------------
	panel.StyleLabel = CreateQuickHeadingLabel(nil, "文字血條模式", AlignmentColumn, panel.TextShowOnlyOnTargets, 0, 5)
	panel.StyleEnemyMode =  CreateQuickDropdown(objectName.."StyleEnemyMode", "敵方框架:", StyleModes, 1, AlignmentColumn, panel.StyleLabel, 0, 2)
	panel.StyleFriendlyMode =  CreateQuickDropdown(objectName.."StyleFriendlyMode", "友方框架:", StyleModes, 1, AlignmentColumn, panel.StyleLabel, OffsetColumnB, 2)

	panel.HeadlineEnemyColor = CreateQuickDropdown(objectName.."HeadlineEnemyColor", "敵方血條顏色:", NameColorModes, 1, AlignmentColumn, panel.StyleEnemyMode)	-- |cffee9900Text-Only Style
	panel.HeadlineFriendlyColor = CreateQuickDropdown(objectName.."HeadlineFriendlyColor", "友方血條顏色:", NameColorModes, 1, AlignmentColumn, panel.StyleFriendlyMode, OffsetColumnB)	-- |cffee9900Text-Only Style

	panel.TextPlateFieldMode =  CreateQuickDropdown(objectName.."TextPlateFieldMode", "血條上的文字:", TextPlateFieldModes, 1, AlignmentColumn, panel.HeadlineEnemyColor )	-- |cffee9900Text-Only Style


	------------------------------
	-- Aura (Buff and Debuff) Widget
	------------------------------
	panel.DebuffsLabel = CreateQuickHeadingLabel(nil, "增益 & 減益", AlignmentColumn, panel.TextPlateFieldMode, 0, 5)
	panel.WidgetsDebuff = CreateQuickCheckbutton(objectName.."WidgetsDebuff", "顯示光環計時器", AlignmentColumn, panel.DebuffsLabel)
	panel.WidgetsDebuffStyle =  CreateQuickDropdown(objectName.."WidgetsDebuffStyle", "光環樣式:", DebuffStyles, 1, AlignmentColumn, panel.WidgetsDebuff, 16)
	panel.WidgetsAuraMode =  CreateQuickDropdown(objectName.."WidgetsAuraMode", "過濾模式:", AuraWidgetModes, 1, AlignmentColumn, panel.WidgetsDebuffStyle, 16)		-- used to be WidgetsDebuffMode
	panel.WidgetsDebuffListLabel = CreateQuickItemLabel(nil, "光環列表:", AlignmentColumn, panel.WidgetsAuraMode, 16)
	panel.WidgetsDebuffTrackList = CreateQuickEditbox(objectName.."WidgetsDebuffTrackList", AlignmentColumn, panel.WidgetsDebuffListLabel, 16)

	panel.WidgetAuraTrackDispelFriendly = CreateQuickCheckbutton(objectName.."WidgetAuraTrackDispelFriendly", "驅散友方身上的減益法術", AlignmentColumn, panel.WidgetsDebuffTrackList, 0, 4)
	panel.WidgetAuraTrackCurse = CreateQuickCheckbutton(objectName.."WidgetAuraTrackCurse", "詛咒", AlignmentColumn, panel.WidgetAuraTrackDispelFriendly, 16, -2)
	panel.WidgetAuraTrackDisease = CreateQuickCheckbutton(objectName.."WidgetAuraTrackDisease", "疾病", AlignmentColumn, panel.WidgetAuraTrackCurse, 16, -2)
	panel.WidgetAuraTrackMagic = CreateQuickCheckbutton(objectName.."WidgetAuraTrackMagic", "魔法", AlignmentColumn, panel.WidgetAuraTrackDisease, 16, -2)
	panel.WidgetAuraTrackPoison = CreateQuickCheckbutton(objectName.."WidgetAuraTrackPoison", "中毒", AlignmentColumn, panel.WidgetAuraTrackMagic, 16, -2)

	------------------------------
	-- Debuff Help Tip
	panel.DebuffHelpTip = CreateQuickItemLabel(nil, "提示: |cffCCCCCC光環應列出確切的名稱，或者法術ID號碼. "..
		"你可以使用前綴, 'My' or 'All', 來僅監視關於你的光環效果. "..
		"位於列表上方的光環的優先級將高於下方的.", AlignmentColumn, panel.WidgetsDebuffListLabel, 225+40) -- 210, 275, )
	panel.DebuffHelpTip:SetHeight(128)
	panel.DebuffHelpTip:SetWidth(200)
	panel.DebuffHelpTip.Text:SetJustifyV("TOP")

	-- Expand Options
	-- Filtering mode: Show raid targets, show only my target

	------------------------------
	--Opacity
	------------------------------
	panel.OpacityLabel = CreateQuickHeadingLabel(nil, "透明度", AlignmentColumn, panel.WidgetAuraTrackPoison, 0, 5)
	panel.OpacityTarget = CreateQuickSlider(objectName.."OpacityTarget", "目標的透明度:", AlignmentColumn, panel.OpacityLabel, 0, 2)
	panel.OpacityNonTarget = CreateQuickSlider(objectName.."OpacityNonTarget", "非目標透明度:", AlignmentColumn, panel.OpacityTarget, 0, 2)
	panel.OpacitySpotlightMode =  CreateQuickDropdown(objectName.."OpacitySpotlightMode", "聚焦模式:", OpacityModes, 1, AlignmentColumn, panel.OpacityNonTarget)
	panel.OpacitySpotlight = CreateQuickSlider(objectName.."OpacitySpotlight", "聚焦模式透明度:", AlignmentColumn, panel.OpacitySpotlightMode, 0, 2)
	panel.OpacityFullSpell = CreateQuickCheckbutton(objectName.."OpacityFullSpell", "正在施法單位透明度", AlignmentColumn, panel.OpacitySpotlight, 16)
	panel.OpacityFullMouseover = CreateQuickCheckbutton(objectName.."OpacityFullMouseover", "啟用當滑鼠停留該單位時的透明度", AlignmentColumn, panel.OpacityFullSpell, 16)
	panel.OpacityFullNoTarget = CreateQuickCheckbutton(objectName.."OpacityFullNoTarget", "無目標存在時，使用目標不透明度", AlignmentColumn, panel.OpacityFullMouseover, 16)

	------------------------------
	--Scale
	------------------------------
	panel.ScaleLabel = CreateQuickHeadingLabel(nil, "比例", AlignmentColumn, panel.OpacityFullNoTarget, 0, 5)
	panel.ScaleStandard = CreateQuickSlider(objectName.."ScaleStandard", "正常時:", AlignmentColumn, panel.ScaleLabel, 0, 2)
	panel.ScaleSpotlightMode =  CreateQuickDropdown(objectName.."ScaleSpotlightMode", "顯示模式:", ScaleModes, 1, AlignmentColumn, panel.ScaleStandard)
	panel.ScaleSpotlight = CreateQuickSlider(objectName.."ScaleSpotlight", "聚焦模式:", AlignmentColumn, panel.ScaleSpotlightMode, 0, 2)
	panel.ScaleIgnoreNeutralUnits= CreateQuickCheckbutton(objectName.."ScaleIgnoreNeutralUnits", "忽略中立單位", AlignmentColumn, panel.ScaleSpotlight, 16)
	panel.ScaleIgnoreNonEliteUnits= CreateQuickCheckbutton(objectName.."ScaleIgnoreNonEliteUnits", "忽略非精英單位", AlignmentColumn, panel.ScaleIgnoreNeutralUnits, 16)
	panel.ScaleIgnoreInactive= CreateQuickCheckbutton(objectName.."ScaleIgnoreInactive", "忽略無效單位", AlignmentColumn, panel.ScaleIgnoreNonEliteUnits, 16)
	panel.ScaleMiniMobs= CreateQuickCheckbutton(objectName.."ScaleMiniMobs", "自動縮放迷你/普通小怪", AlignmentColumn, panel.ScaleIgnoreInactive, 0)
	panel.ScaleCastingSpotlight= CreateQuickCheckbutton(objectName.."ScaleCastingSpotlight", "施法條比例", AlignmentColumn, panel.ScaleMiniMobs, 0)
	-- panel.ScaleTrivialMobsMultiplier =
	-- Downscale Trivial Mobs  (70%)

	------------------------------
	-- Trivial Mobs
	------------------------------
	-- Scale Multiplier
	-- Override Target Settings
	-- Ignore Threat
	--

	-- Hiding Mobs vs Filtering Mobs

	------------------------------
    -- Unit Search Spotlight/Searchlight
	------------------------------

	--[[
	panel.UnitSpotlightLabel = CreateQuickHeadingLabel(nil, "Unit Spotlight", AlignmentColumn, panel.ScaleCastingSpotlight, 0, 5)

	-- Column 1
	panel.UnitSpotlightOpacity = CreateQuickSlider(objectName.."UnitSpotlightOpacity", "Spotlight Opacity:", AlignmentColumn, panel.UnitSpotlightLabel, 0, 2)
	panel.UnitSpotlightScale = CreateQuickSlider(objectName.."UnitSpotlightScale", "Spotlight Scale:", AlignmentColumn, panel.UnitSpotlightOpacity, 0, 2)
	panel.UnitSpotlightColorLabel = CreateQuickItemLabel(nil, "Spotlight Color:", AlignmentColumn, panel.UnitSpotlightScale, 0, 0)
	panel.UnitSpotlightColor = CreateQuickColorbox(objectName.."UnitSpotlightColor", "Bar & Glow Color", AlignmentColumn, panel.UnitSpotlightColorLabel , 6, 2)

	panel.UnitSpotlightListLabel = CreateQuickItemLabel(nil, "Unit Name:", AlignmentColumn, panel.UnitSpotlightColor, 0, 4)
	panel.UnitSpotlightList = CreateQuickEditbox(objectName.."UnitSpotlightList", AlignmentColumn, panel.UnitSpotlightListLabel, 0)

	-- Boss NPC units

	-- Column 2
	panel.UnitSpotlightOpacityEnable = CreateQuickCheckbutton(objectName.."UnitSpotlightOpacityEnable", "Enable Opacity", AlignmentColumn, panel.UnitSpotlightListLabel, 8+ OffsetColumnB, 0)
	panel.UnitSpotlightScaleEnable = CreateQuickCheckbutton(objectName.."UnitSpotlightScaleEnable", "Enable Scale", AlignmentColumn, panel.UnitSpotlightOpacityEnable, 8+ OffsetColumnB, 0)
	panel.UnitSpotlightBarEnable = CreateQuickCheckbutton(objectName.."UnitSpotlightBarEnable", "Enable Bar Color", AlignmentColumn, panel.UnitSpotlightScaleEnable, 8+OffsetColumnB)
	panel.UnitSpotlightGlowEnable = CreateQuickCheckbutton(objectName.."UnitSpotlightGlowEnable", "Enable Glow Color", AlignmentColumn, panel.UnitSpotlightBarEnable, 8+OffsetColumnB)

	--]]

	------------------------------
	-- Filter
	--------------------------------
	panel.FilterLabel = CreateQuickHeadingLabel(nil, "單位過濾", AlignmentColumn, panel.ScaleCastingSpotlight, 0, 5)
	panel.OpacityFiltered = CreateQuickSlider(objectName.."OpacityFiltered", "過濾單位透明度:", AlignmentColumn, panel.FilterLabel, 0, 2)
	panel.ScaleFiltered = CreateQuickSlider(objectName.."ScaleFiltered", "過濾單位比例:", AlignmentColumn, panel.OpacityFiltered, 0, 2)
	panel.FilterScaleLock = CreateQuickCheckbutton(objectName.."FilterScaleLock", "打勾啟動過濾", AlignmentColumn, panel.ScaleFiltered, 16)

	panel.OpacityFilterNeutralUnits = CreateQuickCheckbutton(objectName.."OpacityFilterNeutralUnits", "過濾中立單位", AlignmentColumn, panel.FilterScaleLock, 8, 4)
	panel.OpacityFilterNonElite = CreateQuickCheckbutton(objectName.."OpacityFilterNonElite", "過濾非精英單位", AlignmentColumn, panel.OpacityFilterNeutralUnits, 8)
	panel.OpacityFilterNPC = CreateQuickCheckbutton(objectName.."OpacityFilterNPC", "過濾 NPC", AlignmentColumn, panel.OpacityFilterNonElite, 8)
	panel.OpacityFilterFriendlyNPC = CreateQuickCheckbutton(objectName.."OpacityFilterFriendlyNPC", "過濾友方 NPC", AlignmentColumn, panel.OpacityFilterNPC, 8)

    panel.OpacityFilterPlayers = CreateQuickCheckbutton(objectName.."OpacityFilterPlayers", "過濾玩家", AlignmentColumn, panel.FilterScaleLock, OffsetColumnB, 4)
	panel.OpacityFilterInactive = CreateQuickCheckbutton(objectName.."OpacityFilterInactive", "過濾無效", AlignmentColumn, panel.OpacityFilterPlayers, OffsetColumnB)
	panel.OpacityFilterMini = CreateQuickCheckbutton(objectName.."OpacityFilterMini", "過濾迷你小怪", AlignmentColumn, panel.OpacityFilterInactive, OffsetColumnB)

	panel.OpacityCustomFilterLabel = CreateQuickItemLabel(nil, "按單位名字過濾:", AlignmentColumn, panel.OpacityFilterFriendlyNPC, 8, 4)
	panel.OpacityFilterList = CreateQuickEditbox(objectName.."OpacityFilterList", AlignmentColumn, panel.OpacityCustomFilterLabel, 8)


    ------------------------------
	-- Reaction
	------------------------------

        panel.ReactionLabel = CreateQuickHeadingLabel(nil, "對應顏色", AlignmentColumn, panel.OpacityFilterList, 0, 5)
	panel.ReactionColorLabel = CreateQuickItemLabel(nil, "血條顏色:", AlignmentColumn, panel.ReactionLabel, 0, 2)
	panel.ColorFriendlyNPC = CreateQuickColorbox(objectName.."ColorFriendlyNPC", "友方 NPC", AlignmentColumn, panel.ReactionColorLabel , 16)
	panel.ColorFriendlyPlayer = CreateQuickColorbox(objectName.."ColorFriendlyPlayer", "友方玩家", AlignmentColumn, panel.ColorFriendlyNPC , 16)
	panel.ColorNeutral= CreateQuickColorbox(objectName.."ColorNeutral", "中立", AlignmentColumn, panel.ColorFriendlyPlayer , 16)
	panel.ColorHostileNPC = CreateQuickColorbox(objectName.."ColorHostileNPC", "敵對 NPC", AlignmentColumn, panel.ColorNeutral , 16)
	panel.ColorHostilePlayer = CreateQuickColorbox(objectName.."ColorHostilePlayer", "敵對玩家", AlignmentColumn, panel.ColorHostileNPC , 16)
	panel.ColorGuildMember = CreateQuickColorbox(objectName.."ColorGuildMember", "公會成員", AlignmentColumn, panel.ColorHostilePlayer , 16)
    -- Column 2
    panel.TextReactionColorLabel = CreateQuickItemLabel(nil, "文字顏色:", AlignmentColumn, panel.ReactionLabel, OffsetColumnB )
	panel.TextColorFriendlyNPC = CreateQuickColorbox(objectName.."TextColorFriendlyNPC", "友方 NPC", AlignmentColumn, panel.ReactionColorLabel , OffsetColumnB + 16)
	panel.TextColorFriendlyPlayer = CreateQuickColorbox(objectName.."TextColorFriendlyPlayer", "友方玩家", AlignmentColumn, panel.TextColorFriendlyNPC , OffsetColumnB + 16)
	panel.TextColorNeutral= CreateQuickColorbox(objectName.."TextColorNeutral", "中立", AlignmentColumn, panel.TextColorFriendlyPlayer , OffsetColumnB + 16)
	panel.TextColorHostileNPC = CreateQuickColorbox(objectName.."TextColorHostileNPC", "敵對 NPC", AlignmentColumn, panel.TextColorNeutral , OffsetColumnB + 16)
	panel.TextColorHostilePlayer = CreateQuickColorbox(objectName.."TextColorHostilePlayer", "敵對玩家", AlignmentColumn, panel.TextColorHostileNPC , OffsetColumnB + 16)
	panel.TextColorGuildMember = CreateQuickColorbox(objectName.."TextColorGuildMember", "公會成員", AlignmentColumn, panel.TextColorHostilePlayer , OffsetColumnB + 16)

	------------------------------
	-- Threat
	------------------------------
    -- Column 1
	panel.ThreatLabel = CreateQuickHeadingLabel(nil, "仇恨值", AlignmentColumn, panel.ColorGuildMember, 0, 5)
	panel.ThreatMode =  CreateQuickDropdown(objectName.."ThreatMode", "仇恨值設置:", ThreatModes, 1, AlignmentColumn, panel.ThreatLabel, 0, 2)
	panel.ThreatGlowEnable = CreateQuickCheckbutton(objectName.."ThreatGlowEnable", "啟用邊框發光", AlignmentColumn, panel.ThreatMode,0)

	panel.ColorThreatColorLabels = CreateQuickItemLabel(nil, "仇恨值顏色:", AlignmentColumn, panel.ThreatGlowEnable, 0, 2)
	panel.ColorAttackingMe = CreateQuickColorbox(objectName.."ColorAttackingMe", "攻擊我", AlignmentColumn, panel.ColorThreatColorLabels , 16)
	panel.ColorAggroTransition = CreateQuickColorbox(objectName.."ColorAggroTransition", "失去仇恨", AlignmentColumn, panel.ColorAttackingMe , 16)
	panel.ColorAttackingOthers = CreateQuickColorbox(objectName.."ColorAttackingOthers", "攻擊他人", AlignmentColumn, panel.ColorAggroTransition, 16)

	--[[
	-- Warning Border Glow
	--]]

    -- Column 2
	panel.ColorEnableOffTank = CreateQuickCheckbutton(objectName.."ColorEnableOffTank", "高亮其他坦克", AlignmentColumn, panel.ThreatLabel, OffsetColumnB)
	panel.ColorAttackingOtherTank = CreateQuickColorbox(objectName.."ColorAttackingOtherTank", "攻擊另一位坦克", AlignmentColumn, panel.ColorEnableOffTank , 16+OffsetColumnB)

	panel.ColorShowPartyAggro = CreateQuickCheckbutton(objectName.."ColorShowPartyAggro", "高亮隊伍中OT的成員", AlignmentColumn, panel.ColorAttackingOtherTank, OffsetColumnB)
	panel.ColorPartyAggro = CreateQuickColorbox(objectName.."ColorPartyAggro", "隊伍成員仇恨", AlignmentColumn, panel.ColorShowPartyAggro , 14+OffsetColumnB)
	panel.ColorPartyAggroBar = CreateQuickCheckbutton(objectName.."ColorPartyAggroBar", "血條顏色", AlignmentColumn, panel.ColorPartyAggro, 16+OffsetColumnB)
	panel.ColorPartyAggroGlow = CreateQuickCheckbutton(objectName.."ColorPartyAggroGlow", "邊框/警告閃爍", AlignmentColumn, panel.ColorPartyAggroBar, 16+OffsetColumnB)
	panel.ColorPartyAggroText = CreateQuickCheckbutton(objectName.."ColorPartyAggroText", "姓名文字顏色", AlignmentColumn, panel.ColorPartyAggroGlow, 16+OffsetColumnB)

	------------------------------
	-- Health
	------------------------------
	panel.HealthLabel = CreateQuickHeadingLabel(nil, "生命值", AlignmentColumn, panel.ColorPartyAggroText, 0, 5)
	panel.HighHealthThreshold = CreateQuickSlider(objectName.."HighHealthThreshold", "高血量:", AlignmentColumn, panel.HealthLabel, 0, 2)
	panel.LowHealthThreshold =  CreateQuickSlider(objectName.."LowHealthThreshold", "低血量:", AlignmentColumn, panel.HighHealthThreshold, 0, 2)
	panel.HealthColorLabels = CreateQuickItemLabel(nil, "血量顏色:", AlignmentColumn, panel.LowHealthThreshold, 0)
	panel.ColorHighHealth = CreateQuickColorbox(objectName.."ColorHighHealth", "高血量", AlignmentColumn, panel.HealthColorLabels , 16)
	panel.ColorMediumHealth = CreateQuickColorbox(objectName.."ColorMediumHealth", "中血量", AlignmentColumn, panel.ColorHighHealth , 16)
	panel.ColorLowHealth = CreateQuickColorbox(objectName.."ColorLowHealth", "低血量", AlignmentColumn, panel.ColorMediumHealth , 16)

	--[[
			[ ]  Highlight Enemy Healers
	--]]

	------------------------------
    -- Cast Bars
	------------------------------
	--[[
	Enable Friendly Cast Bars
	Enable Enemy Cast Bars
	Interuptable Color
	Un-Interuptable Color

	(Uninteruptable Cast Art)
	--]]

    panel.SpellCastLabel = CreateQuickHeadingLabel(nil, "施法條", AlignmentColumn, panel.ColorLowHealth, 0, 5)
    panel.SpellCastEnableFriendly = CreateQuickCheckbutton(objectName.."SpellCastEnableFriendly", "顯示友方施法條", AlignmentColumn, panel.SpellCastLabel)
	panel.SpellCastColorLabel = CreateQuickItemLabel(nil, "施法條顏色:", AlignmentColumn, panel.SpellCastEnableFriendly, 0, 2)
	panel.ColorNormalSpellCast = CreateQuickColorbox(objectName.."ColorNormalSpellCast", "可斷法", AlignmentColumn, panel.SpellCastColorLabel , 16)
	panel.ColorUnIntpellCast = CreateQuickColorbox(objectName.."ColorUnIntpellCast", "免疫斷法", AlignmentColumn, panel.ColorNormalSpellCast , 16)



	------------------------------
	--Widgets
	------------------------------
	panel.WidgetsLabel = CreateQuickHeadingLabel(nil, "小工具", AlignmentColumn, panel.ColorUnIntpellCast, 0, 5)
	panel.WidgetTargetHighlight = CreateQuickCheckbutton(objectName.."WidgetTargetHighlight", "高亮當前目標", AlignmentColumn, panel.WidgetsLabel)
	panel.WidgetEliteIndicator = CreateQuickCheckbutton(objectName.."WidgetEliteIndicator", "顯示精英圖示", AlignmentColumn, panel.WidgetTargetHighlight)
	panel.ClassEnemyIcon = CreateQuickCheckbutton(objectName.."ClassEnemyIcon", "顯示敵對職業圖標", AlignmentColumn, panel.WidgetEliteIndicator)
	panel.ClassPartyIcon = CreateQuickCheckbutton(objectName.."ClassPartyIcon", "顯示隊伍成員的圖標", AlignmentColumn, panel.ClassEnemyIcon)
	panel.WidgetsTotemIcon = CreateQuickCheckbutton(objectName.."WidgetsTotemIcon", "顯示圖騰圖標", AlignmentColumn, panel.ClassPartyIcon)
	panel.WidgetsComboPoints = CreateQuickCheckbutton(objectName.."WidgetsComboPoints", "顯示連擊點數", AlignmentColumn, panel.WidgetsTotemIcon)

	panel.WidgetsEnableExternal = CreateQuickCheckbutton(objectName.."WidgetsEnableExternal", "啟用外部工具", AlignmentColumn, panel.WidgetsComboPoints)

	panel.WidgetsThreatIndicator = CreateQuickCheckbutton(objectName.."WidgetsThreatIndicator", "顯示仇恨值", AlignmentColumn, panel.WidgetsLabel, OffsetColumnB)
	panel.WidgetsThreatIndicatorMode =  CreateQuickDropdown(objectName.."WidgetsThreatIndicatorMode", "仇恨指示器:", ThreatWidgetModes, 1, AlignmentColumn, panel.WidgetsThreatIndicator, OffsetColumnB+16)
	panel.WidgetsRangeIndicator = CreateQuickCheckbutton(objectName.."WidgetsRangeIndicator", "顯示範圍警告", AlignmentColumn, panel.WidgetsThreatIndicatorMode, OffsetColumnB)
	panel.WidgetsRangeMode =  CreateQuickDropdown(objectName.."WidgetsRangeMode", "警示範圍:", RangeModes, 1, AlignmentColumn, panel.WidgetsRangeIndicator, OffsetColumnB+16)

	------------------------------
	-- Advanced
	------------------------------
	panel.AdvancedLabel = CreateQuickHeadingLabel(nil, "進階設定", AlignmentColumn, panel.WidgetsEnableExternal, 0, 5)
	panel.AdvancedEnableUnitCache = CreateQuickCheckbutton(objectName.."AdvancedEnableUnitCache", "啟用對象數據暫存 ", AlignmentColumn, panel.AdvancedLabel)
	panel.FrameVerticalPosition = CreateQuickSlider(objectName.."FrameVerticalPosition", "姓名板的垂直位置: (請謹慎使用！)", AlignmentColumn, panel.AdvancedEnableUnitCache, 0, 4)

	--panel.AdvancedCustomCodeLabel = CreateQuickItemLabel(nil, "Custom Theme Code:", AlignmentColumn, panel.FrameVerticalPosition, 0, 4)
	--panel.AdvancedCustomCodeTextbox = CreateQuickEditbox(objectName.."AdvancedCustomCodeTextbox", AlignmentColumn, panel.AdvancedHealthTextLabel, 8)


	--loadstring( [[return function(unit) ]]..LocalVars.AdvancedCustomCodeTextbox..[[ end]])
	--[[
	--function(theme)

	theme.Default.name.size = 18
	--]]

	local BlizzOptionsButton = CreateFrame("Button", objectName.."BlizzButton", AlignmentColumn, "TidyPlatesPanelButtonTemplate")
	BlizzOptionsButton:SetPoint("TOPLEFT", panel.FrameVerticalPosition, "BOTTOMLEFT",-6, -18)
	--BlizzOptionsButton:SetPoint("TOPLEFT", panel.AdvancedCustomCodeTextbox, "BOTTOMLEFT",-6, -18)
	BlizzOptionsButton:SetWidth(300)
	BlizzOptionsButton:SetText("開啟編輯暴雪設置...")
	BlizzOptionsButton:SetScript("OnClick", function() InterfaceOptionsFrame_OpenToCategory(_G["InterfaceOptionsNamesPanel"]) end)


	------------------------------
	-- Set Sizes and Mechanics
	------------------------------
	panel.MainFrame:SetHeight(2800)

	-- Edit Box Widths
	--panel.AdvancedCustomCodeTextbox:SetWidth(300)
	panel.OpacityFilterList:SetWidth(200)
	panel.WidgetsDebuffTrackList:SetWidth(200)


	-- Slider Ranges
	--SetSliderMechanics(panel.UnitSpotlightOpacity, 1, 0, 1, .01)
	--SetSliderMechanics(panel.UnitSpotlightScale, 1, .1, 2.5, .01)

	SetSliderMechanics(panel.OpacityTarget, 1, 0, 1, .01)
	SetSliderMechanics(panel.OpacityNonTarget, 1, 0, 1, .01)
	SetSliderMechanics(panel.OpacitySpotlight, 1, 0, 1, .01)
	SetSliderMechanics(panel.OpacityFiltered, 1, 0, 1, .01)

	SetSliderMechanics(panel.ScaleFiltered, 1, .1, 2.5, .01)
	SetSliderMechanics(panel.ScaleStandard, 1, .1, 2.5, .01)
	SetSliderMechanics(panel.ScaleSpotlight, 1, .1, 2.5, .01)

	SetSliderMechanics(panel.FrameVerticalPosition, .5, 0, 1, .02)

	SetSliderMechanics(panel.HighHealthThreshold, .7, .5, 1, .01)
	SetSliderMechanics(panel.LowHealthThreshold, .3, 0, .5, .01)

	-- "RefreshSettings" is called; A) When PLAYER_ENTERING_WORLD is called, and; B) When changes are made to settings

	local ConvertStringToTable = TidyPlatesHubHelpers.ConvertStringToTable
	local ConvertDebuffListTable = TidyPlatesHubHelpers.ConvertDebuffListTable
	local CallForStyleUpdate = TidyPlatesHubHelpers.CallForStyleUpdate

	function panel.RefreshSettings(LocalVars)
		CallForStyleUpdate()
		-- Convert Debuff Filter Strings
		ConvertDebuffListTable(LocalVars.WidgetsDebuffTrackList, LocalVars.WidgetsDebuffLookup, LocalVars.WidgetsDebuffPriority)
		-- Convert Unit Filter Strings
		ConvertStringToTable(LocalVars.OpacityFilterList, LocalVars.OpacityFilterLookup)
		ConvertStringToTable(LocalVars.UnitSpotlightList, LocalVars.UnitSpotlightLookup)
		-- Convert Custom Code...  (Testing)
		--local func, err = loadstring( [[return function(unit) ]]..LocalVars.AdvancedCustomCodeTextbox..[[ end]])
		--if func == nil and err then print(panel.name, "|r CUSTOM SCRIPT ERROR", err)
		--elseif func then LocalVars.CustomHealthFunction = func()	end

	end
end

--local function OnLogin()
	-- Init
	--InitializeTidyPlatesHubModes()

	-- Create Instances of Panels
	local TankPanel = CreateInterfacePanel( "HubPanelSettingsTank", "Tidy Plates Hub: |cFF3782D1Tank", nil )
	CreateInterfacePanelWidgets(TankPanel)
	InterfaceOptions_AddCategory(TankPanel)
	function ShowTidyPlatesHubTankPanel() TidyPlatesUtility.OpenInterfacePanel(TankPanel) end

	local DamagePanel = CreateInterfacePanel( "HubPanelSettingsDamage", "Tidy Plates Hub: |cFFFF1100Damage", nil )
	CreateInterfacePanelWidgets(DamagePanel)
	InterfaceOptions_AddCategory(DamagePanel)
	function ShowTidyPlatesHubDamagePanel() TidyPlatesUtility.OpenInterfacePanel(DamagePanel) end
--end

--local HubHandler = CreateFrame("Frame")
--HubHandler:SetScript("OnEvent", OnLogin)
--HubHandler:RegisterEvent("PLAYER_LOGIN")





--[[
local GladiatorPanel = CreateInterfacePanel( "HubPanelSettingsGladiator", "Tidy Plates Hub: |cFFAA6600Gladiator", nil )
CreateInterfacePanelWidgets(GladiatorPanel)
function ShowTidyPlatesHubGladiatorPanel() InterfaceOptionsFrame_OpenToCategory(GladiatorPanel) end
--]]
--[[

-- Testing

/run print(HubDamageConfigFrame:GetParent())
/run HubDamageConfigFrame:SetParent(UIParent); HubDamageConfigFrame:SetPoint("TOPLEFT")

HubDamageConfigFrame = DamagePanel

local HealerPanel = CreateInterfacePanel( "HubPanelSettingsHealer", "Tidy Plates Hub: |cFF44DD55Healer", nil )
CreateInterfacePanelWidgets(HealerPanel)
function ShowTidyPlatesHubHealerPanel() InterfaceOptionsFrame_OpenToCategory(HealerPanel) end
--]]

