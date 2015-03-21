------------------------------------------------------------------------------
-- 繁體中文翻譯 為 BNS(TW 世界之樹-三皈依) 部分參考自 雷鱗 米利亞爾特
------------------------------------------------------------------------------

local L = LibStub("AceLocale-3.0"):NewLocale("ExtVendor", "zhTW", false)

if L then

L["LOADED_MESSAGE"] = "版本 %s 已載入，輸入|cffffff00/evui|r 來設置。";
L["ADDON_TITLE"] = "Extended Vendor UI";
L["VERSION_TEXT"] = "Extended Vendor UI |cffffffffv%s";

L["QUICKVENDOR_BUTTON_TOOLTIP"] = "售出所有不要的物品";

L["CONFIRM_SELL_JUNK"] = "請確認您想賣掉以下物品:";
L["TOTAL_SALE_PRICE"] = "總售價";
L["ITEMS_BLACKLISTED"] = "%s 個物品被忽略";

L["SOLD"] = "售出:";
L["JUNK_MONEY_EARNED"] = "售出物品獲得: %s";

L["HIDE_UNUSABLE"] = "可用物品";
L["HIDE_FILTERED"] = "隱藏過濾物品";
L["HIDE_KNOWN_RECIPES"] = "只顯示未學的專業圖紙";
L["FILTER_SUBOPTIMAL"] = "過濾次等護甲";
L["FILTER_SLOT"] = "部位";
L["QUALITY_FILTER_MINIMUM"] = "品質 (至少)";
L["QUALITY_FILTER_SPECIFIC"] = "品質 (指定)";
L["STOCK_FILTER"] = "預設過濾";
L["FILTER_DEFAULT_ALL"] = "預設為所有";
L["SINGLE_ITEM_HIDDEN"] = "%d 物品隱藏";
L["MULTI_ITEMS_HIDDEN"] = "%d 物品隱藏";
L["CONFIGURE_QUICKVENDOR"] = "設置快速售出設定";

L["SLOT_CAT_ARMOR"] = "護甲";
L["SLOT_HEAD"] = "頭部";
L["SLOT_SHOULDER"] = "肩部";
L["SLOT_BACK"] = "背部";
L["SLOT_CHEST"] = "胸部";
L["SLOT_WRIST"] = "手腕";
L["SLOT_HANDS"] = "手";
L["SLOT_WAIST"] = "腰帶";
L["SLOT_LEGS"] = "腿部";
L["SLOT_FEET"] = "腳";

L["SLOT_CAT_ACCESSORIES"] = "配件與飾品";
L["SLOT_NECK"] = "頸部";
L["SLOT_SHIRT"] = "襯衣";
L["SLOT_TABARD"] = "外袍";
L["SLOT_FINGER"] = "手指";
L["SLOT_TRINKET"] = "飾品";

L["SLOT_CAT_WEAPONS"] = "武器";
L["SLOT_WEAPON2H"] = "雙手";
L["SLOT_WEAPON1H"] = "單手/主手";
L["SLOT_WEAPONOH"] = "副手";
L["SLOT_RANGED"] = "遠程";

L["SLOT_CAT_OFFHAND"] = "副手";
L["SLOT_OFFHAND"] = "副手裝備";
L["SLOT_SHIELD"] = "盾牌";

-- The following strings are used to match against text found on item tooltips or itemType/itemSubType returns of GetItemInfo(); if they don't match, things will break.
L["ARMOR"] = "護甲";
L["ARMOR_CLOTH"] = "布甲";
L["ARMOR_LEATHER"] = "皮甲";
L["ARMOR_MAIL"] = "鎖甲";
L["ARMOR_PLATE"] = "鎧甲";
L["ARMOR_SHIELD"] = "盾牌";

L["WEAPON"] = "武器";
L["WEAPON_1H_AXE"] = "單手斧";
L["WEAPON_1H_MACE"] = "單手錘";
L["WEAPON_1H_SWORD"] = "單手劍";
L["WEAPON_2H_AXE"] = "雙手斧";
L["WEAPON_2H_MACE"] = "雙手錘";
L["WEAPON_2H_SWORD"] = "雙手劍";
L["WEAPON_STAFF"] = "法杖";
L["WEAPON_POLEARM"] = "長柄武器";
L["WEAPON_WAND"] = "魔杖";
L["WEAPON_BOW"] = "弓";
L["WEAPON_GUN"] = "鎗";
L["WEAPON_CROSSBOW"] = "弩";
L["WEAPON_DAGGER"] = "匕首";
L["WEAPON_FIST"] = "拳套";

L["CLASSES"] = "職業:";

-- used for checking darkmoon faire replica items
L["REPLICA"] = "複製品";

L["CONFIG_HEADING_GENERAL"] = "一般設定";
L["OPTION_STARTUP_MESSAGE"] = "顯示載入訊息";
L["OPTION_STARTUP_MESSAGE_TOOLTIP"] = "勾選此選項，每次登入遊戲時將會在聊天框顯示本插件訊息。";
L["OPTION_MOUSEWHEEL_PAGING"] = "滑鼠滾輪換頁";
L["OPTION_MOUSEWHEEL_PAGING_TOOLTIP"] = "如果啟用，滑鼠滾輪可以用來\n捲動商店的頁面。";
L["CONFIG_HEADING_FILTER"] = "過濾設定";
L["OPTION_FILTER_SUBARMOR_SHOW"] = "永遠不隱藏次等護甲";
L["OPTION_FILTER_SUBARMOR_SHOW_TOOLTIP"] = "勾選此選項, 不是該職業最佳護甲將會被過濾，而不是從選單中移除";
L["OPTION_STOCKFILTER_DEFAULTALL"] = "預設為『顯示所有』";
L["OPTION_STOCKFILTER_DEFAULTALL_TOOLTIP"] = "勾選此選項,『過濾』將預設為\n『顯示所有物品』 而不是角色職業。";
L["CONFIG_HEADING_QUICKVENDOR"] = "快速售出設定";
L["OPTION_QUICKVENDOR_ENABLEBUTTON"] = "顯示快速售出按鈕";
L["OPTION_QUICKVENDOR_ENABLEBUTTON_TOOLTIP"] = "在商店介面上顯示或隱藏快速售出按鈕。";
L["OPTION_QUICKVENDOR_SUBARMOR"] = "次等護甲 (只限拾綁)";
L["OPTION_QUICKVENDOR_SUBARMOR_TOOLTIP"] = "勾選此選項, 次等護甲物品\n將會被快速售出。\n\n包含:\n|cffa0a0a0- 戰士/聖騎士/死亡騎士: 布衣, 皮甲, 所甲 (等級40以上)\n- 薩滿/獵人: 布衣, 皮甲 (等級40以上)\n- 盜賊/德魯伊/武僧: 布衣";
L["OPTION_QUICKVENDOR_ALREADYKNOWN"] = "已學會的圖紙 (只限拾綁)";
L["OPTION_QUICKVENDOR_ALREADYKNOWN_TOOLTIP"] = "勾選此選項,  |cffff0000已學會|r 的圖紙(例如專業或食譜)\n 將被列入快速售出清單中。";
L["OPTION_QUICKVENDOR_UNUSABLE"] = "不能使用的裝備 (只限拾綁)";
L["OPTION_QUICKVENDOR_UNUSABLE_TOOLTIP"] = "勾選此選項, 你的職業無法使用的裝備\n (基於護甲、武器類型或職業限制)\n將適用於快速售出。\n\n例如:|cffa0a0a0\n- 皮甲對於法師\n- 鎧甲對於薩滿\n- 雙手劍對於牧師\n- 非你職業的套裝";
L["OPTION_QUICKVENDOR_WHITEGEAR"] = "一般品質 (|cffffffff白色|r) 武器和護甲";
L["OPTION_QUICKVENDOR_WHITEGEAR_TOOLTIP"] = "勾選此選項, 所有白色品質的武器和護甲 (未裝備的)\n將會被快速售出。";
L["NOTE"] = "NOTE";
L["QUICKVENDOR_SOULBOUND"] = "這個選項只會影響『拾取綁定』裝備。";

L["QUICKVENDOR_REASON_POORQUALITY"] = "灰色品質裝備";
L["QUICKVENDOR_REASON_WHITEGEAR"] = "白色品質裝備";
L["QUICKVENDOR_REASON_SUBOPTIMAL"] = "次等護甲";
L["QUICKVENDOR_REASON_ALREADYKNOWN"] = "已學會";
L["QUICKVENDOR_REASON_UNUSABLEARMOR"] = "無法使用的護甲類型";
L["QUICKVENDOR_REASON_UNUSABLEWEAPON"] = "無法使用的武器類型";
L["QUICKVENDOR_REASON_CLASSRESTRICTED"] = "職業限定";
L["QUICKVENDOR_REASON_WHITELISTED"] = "列入白名單";

L["QUICKVENDOR_CONFIG_HEADER"] = "快速售出設置";
L["CUSTOMIZE_BLACKLIST"] = "自定義黑名單";
L["CUSTOMIZE_BLACKLIST_TEXT"] = "在此名單的物品不會使用快速售出的功能出售。";
L["CUSTOMIZE_WHITELIST"] = "自定義白名單";
L["CUSTOMIZE_WHITELIST_TEXT"] = "在此名單的物品將永遠使用快速售出的功能出售。";
L["ITEMLIST_GLOBAL_TEXT"] = "此名單適用此帳號的所有角色。";
L["ITEMLIST_LOCAL_TEXT"] = "此名單只適用你正在玩的角色。";
L["DROP_ITEM_BLACKLIST"] = "從你的背包拖動物品到此按鈕來新增到黑名單。";
L["DROP_ITEM_WHITELIST"] = "從你的背包拖動物品到此按鈕來新增到白名單。";
L["CANNOT_BLACKLIST"] = "無法加入{$item}到黑名單: {$reason}";
L["CANNOT_WHITELIST"] = "無法加入{$item}到白名單: {$reason}";
L["REASON_NO_SELL_PRICE"] = "無商店價格";
L["REASON_ALREADY_BLACKLISTED"] = "物品已在黑名單內";
L["REASON_ALREADY_WHITELISTED"] = "物品已在白名單內";
L["ITEM_ADDED_TO_BLACKLIST"] = "%s 已經加入到快速售出的黑名單。";
L["ITEM_ADDED_TO_GLOBAL_WHITELIST"] = "%s 已經加入到所有角色的快速售出白名單。";
L["ITEM_ADDED_TO_LOCAL_WHITELIST"] = "%s 已經加入到唯獨當前角色的快速售出白名單。";
L["DELETE_SELECTED"] = "刪除已選的";
L["RESET_TO_DEFAULT"] = "重置到預設";
L["CLEAR_ALL"] = "清除所有";
L["CONFIRM_RESET_BLACKLIST"] = "你確定要重置快速售出的黑名單為預設值嗎？";
L["CONFIRM_CLEAR_GLOBAL_WHITELIST"] = "你確定想要清除帳號通用的快速售出白名單嗎？";
L["CONFIRM_CLEAR_LOCAL_WHITELIST"] = "你確定想要清除當前角色的快速售出白名單嗎？";
L["UNKNOWN_ITEM"] = "未知物品";
L["BASIC_SETTINGS"] = "基礎設定";

-- ***** About page strings *****
L["ABOUT"] = "關於";
L["LABEL_AUTHOR"] = "作者";
L["LABEL_EMAIL"] = "Email";
L["LABEL_HOSTS"] = "下載網站";

L["COPYRIGHT"] = "?012, All rights reserved.";

end
