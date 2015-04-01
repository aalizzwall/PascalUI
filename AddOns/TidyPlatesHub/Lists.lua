TidyPlatesHubLocalization = TidyPlatesHubLocalization or {}


----------------------------------------------------------------------
-- Localization
----------------------------------------------------------------------

--[[  Example of Localization LUA...

TidyPlatesHubLocalizedFont = "FONTS/ARIALN.TTF"

if GetLocale() == "enUS" then
	TidyPlatesHubLocalization["Style"] = "Translation of STYLE"
	TidyPlatesHubLocalization["Headline Mode"] = "No-Bars Mode"
end
--]]

function TidyPlatesHub_GetLocalizedString(str)
	if str then return TidyPlatesHubLocalization[str] or str
	else return "" end
end

local L = TidyPlatesHub_GetLocalizedString



	--[[
		Color Guide:
		|cffffdd00		for Yellow
		|cffff6906		for Orange
		|cff999999		for Grey
		|cffffaa33		for Brownish Orange
	--]]

	-- For making tooltips....
	-- .tooltipTitle = "Default", tooltipText = "Health bars always visible.", tooltipOnButton = true,

	--[[ 6.7 Testing
	TidyPlatesHubModes.ArtStyles = {{ text = "Blizzard", notCheckable = 1 } ,}

	TidyPlatesHubModes.ArtModes = {
		{ text = "By Elite", notCheckable = 1 } ,
		{ text = "By Enemy", notCheckable = 1 } ,
		{ text = "By NPC", notCheckable = 1 } ,
	}

	--]]

----------------------------------------------------------------------
-- Dropdown menu choices (corresponds to functions)
----------------------------------------------------------------------

TidyPlatesHubModes = {}

TidyPlatesHubModes.StyleModes = {
				{ text = L("預設"), notCheckable = 1, } ,
				{ text = L("|cffffaa33純文字"),	notCheckable = 1, } ,
				{ text = L("|cffffaa33顯示血條/戰鬥中"), notCheckable = 1, } ,
				{ text = L("|cffffaa33顯示血條主動/受損"),	notCheckable = 1, } ,
				{ text = L("|cffffaa33顯示血條/精英"), notCheckable = 1 } ,
				{ text = L("|cffffaa33顯示血條/標記單位"), notCheckable = 1 } ,
				{ text = L("|cffffaa33顯示血條/友方"), notCheckable = 1 } ,
				{ text = L("|cffffaa33顯示血條/當前目標"), notCheckable = 1 } ,
				{ text = L("|cffffaa33顯示血條/仇恨模式 (坦克模式)"), notCheckable = 1 } ,
			}

TidyPlatesHubModes.TextModes = {
				{ text = L("不顯示血量"), notCheckable = 1 },
				{ text = L("顯示百分比"), notCheckable = 1 } ,
				{ text = L("顯示總血量"), notCheckable = 1 } ,
				{ text = L("顯示損血量"), notCheckable = 1 } ,
				{ text = L("總血量 & 百分比"), notCheckable = 1 } ,
				{ text = L("只顯示當前目標"), notCheckable = 1 } ,
				{ text = L("只顯示簡略血量"), notCheckable = 1 } ,
				{ text = L("只顯示等級"), notCheckable = 1 } ,
				{ text = L("等級與總血量"), notCheckable = 1 } ,
				{ text = L("只在競技場 ID, 總血量與能量"), notCheckable = 1 } ,
			}

			--[[
			-- Status Text Ingredients
			-- Text Builder

			TidyPlatesHubModes.TextModes = {
				{ text = L("無"), notCheckable = 1 },
				{ text = L("生命"), notCheckable = 1 } ,
				{ text = L("目標"), notCheckable = 1 } ,
				{ text = L("大概"), notCheckable = 1 } ,
				{ text = L("等級"), notCheckable = 1 } ,
				{ text = L("等級和生命"), notCheckable = 1 } ,
				{ text = L("競技場ID, 生命,能量"), notCheckable = 1 } ,
			}

			TidyPlatesHubModes.TextIngredientList = {
				{ text = L("無"), notCheckable = 1 },
				{ text = L("百分比"), notCheckable = 1 } ,
				{ text = L("大概"), notCheckable = 1 } ,
				{ text = L("精確值"), notCheckable = 1 } ,

				{ text = L("血少多少"), notCheckable = 1 } ,

				{ text = L("目標"), notCheckable = 1 } ,

				{ text = L("等級"), notCheckable = 1 } ,
				{ text = L("生命"), notCheckable = 1 } ,
				{ text = L("競技場ID"), notCheckable = 1 } ,
				{ text = L("能量"), notCheckable = 1 } ,
			}

			--]]

TidyPlatesHubModes.RangeModes = {
				{ text = L("9 碼")} ,
				{ text = L("15 碼") } ,
				{ text = L("28 碼") } ,
				{ text = L("40 碼") } ,
			}

TidyPlatesHubModes.DebuffStyles = {
				{ text = L("寬鬆"), notCheckable = 1 } ,
				{ text = L("緊湊型(重載UI生效)"), notCheckable = 1 } ,
			}

TidyPlatesHubModes.DebuffModes = {
				{ text = L("顯示全部"), notCheckable = 1 } ,
				{ text = L("顯示自定義... "), notCheckable = 1 } ,
				{ text = L("顯示我的所有 "), notCheckable = 1 } ,
				{ text = L("顯示我的... "), notCheckable = 1 } ,
				{ text = L("按 前綴..."), notCheckable = 1 } ,

				--[[

				--]]
			}

TidyPlatesHubModes.AuraWidgetModes = {
				{ text = L("顯示我的減益"), notCheckable = 1 } ,
				{ text = L("顯示我的增益 "), notCheckable = 1 } ,
				{ text = L("自定義..."), notCheckable = 1 } ,
			}

TidyPlatesHubModes.ScaleModes = {
				{ text = L("不顯示"), notCheckable = 1 } ,
				{ text = L("精英"), notCheckable = 1 } ,
				{ text = L("目標"), notCheckable = 1 } ,
				{ text = L("仇恨 (自動)"), notCheckable = 1 } ,
				{ text = L("光環"), notCheckable = 1 } ,
				{ text = L("敵方"), notCheckable = 1 } ,
				{ text = L("NPCs"), notCheckable = 1 } ,
				{ text = L("隊伍目標"), notCheckable = 1 } ,
				{ text = L("敵方治療"), notCheckable = 1 } ,
				{ text = L("低生命"), notCheckable = 1 } ,
				{ text = L("首領"), notCheckable = 1 } ,
				}

TidyPlatesHubModes.OpacityModes = {
				{ text = L("不顯示"), notCheckable = 1 } ,
				{ text = L("仇恨 (自動)"), notCheckable = 1 } ,
				{ text = L("光環"), notCheckable = 1 } ,
				{ text = L("敵方"), notCheckable = 1 } ,
				{ text = L("NPCs"), notCheckable = 1 } ,
				{ text = L("團隊圖標"), notCheckable = 1 } ,
				{ text = L("主動/損傷"), notCheckable = 1 } ,
				{ text = L("敵方治療"), notCheckable = 1 } ,
				{ text = L("低生命"), notCheckable = 1 } ,
				}

--[[
	Friendly Unit Bar Coloring					Enemy Unit Bar Coloring
		- Reaction								- Threat
		- Health								- Reaction
		- Class									- Health
												- Raid Icon * Remove * Add to a checkbox
												- Class
--]]

TidyPlatesHubModes.FriendlyBarModes = {
				{ text = L("反應類型"), notCheckable = 1 } ,
				{ text = L("職業"), notCheckable = 1 } ,
				{ text = L("生命"), notCheckable = 1 } ,
				--{ text = L("團隊圖標"), notCheckable = 1 } ,
				{ text = L("Pass-through"), notCheckable = 1 } ,
				}

TidyPlatesHubModes.EnemyBarModes = {
				{ text = L("仇恨"), notCheckable = 1 } ,
				{ text = L("反應類型"), notCheckable = 1 } ,
				{ text = L("職業"), notCheckable = 1 } ,
				{ text = L("生命"), notCheckable = 1 } ,
				--{ text = L("團隊圖標"), notCheckable = 1 } ,
				{ text = L("Pass-through"), notCheckable = 1 } ,
				}

TidyPlatesHubModes.NameColorModes = {
				{ text = L("預設"), notCheckable = 1 } ,
				{ text = L("職業"), notCheckable = 1 } ,
				{ text = L("仇恨"), notCheckable = 1 } ,
				{ text = L("反應類型"), notCheckable = 1 } ,
				{ text = L("生命"), notCheckable = 1 } ,
				{ text = L("等級顏色"), notCheckable = 1 } ,
				{ text = L("普通/精英/首領"), notCheckable = 1 } ,
				}

-----
--[[
TidyPlatesHubModes.HealthColorModes = {
				{ text = L("預設"), notCheckable = 1 } ,
				{ text = L("敵方類型"), notCheckable = 1 } ,
				{ text = L("仇恨"), notCheckable = 1 } ,
				{ text = L("反應類型"), notCheckable = 1 } ,
				{ text = L("等級顏色"), notCheckable = 1 } ,
				{ text = L("團隊圖標"), notCheckable = 1 } ,
				{ text = L("生命"), notCheckable = 1 } ,
				{ text = L("友方類型"), notCheckable = 1 } ,
				}

TidyPlatesHubModes.NameColorModes = {
				{ text = L("預設"), notCheckable = 1 } ,
				{ text = L("敵方類型"), notCheckable = 1 } ,
				{ text = L("仇恨"), notCheckable = 1 } ,
				{ text = L("反應類型"), notCheckable = 1 } ,
				{ text = L("等級顏色"), notCheckable = 1 } ,
				{ text = L("生命"), notCheckable = 1 } ,
				{ text = L("普通/精英/首領"), notCheckable = 1 } ,
				{ text = L("友方類型"), notCheckable = 1 } ,
				}

--]]
TidyPlatesHubModes.WarningGlowModes = {
				{ text = L("不顯示"), notCheckable = 1 } ,
				{ text = L("仇恨"), notCheckable = 1 } ,
				{ text = L("敵方治療"), notCheckable = 1 } ,
				}

				--[[
				By Threat
				By Low Health
				By Healers

				[] Use Class Color for healers
				[] Healer Color
				--]]


TidyPlatesHubModes.TextPlateFieldModes = {
				{ text = L("不顯示"), notCheckable = 1 } ,
				{ text = L("生命百分比"), notCheckable = 1 } ,		--
				{ text = L("角色, 公會和等級"), notCheckable = 1 } ,
				{ text = L("角色和公會"), notCheckable = 1 } ,
				{ text = L("NPC 角色"), notCheckable = 1 } ,
				{ text = L("等級"), notCheckable = 1 } ,
				{ text = L("角色, 公會,等級和生命百分比"), notCheckable = 1 } ,
				}

TidyPlatesHubModes.ThreatWidgetModes = {
					{ text = L("顯示拔河式仇恨"), notCheckable = 1 } ,
					{ text = L("顯示輪盤式仇恨"), notCheckable = 1 } ,
					}

TidyPlatesHubModes.ThreatModes = {
					{ text = L("自動 (色彩交換)"), notCheckable = 1 } ,
					{ text = L("坦克"), notCheckable = 1 } ,
					{ text = L("輸出/治療"), notCheckable = 1 } ,
					}