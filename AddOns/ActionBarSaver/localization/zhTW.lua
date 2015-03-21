if( GetLocale() ~= "zhTW" ) then return end
local L = {}
L["/abs count - Toggles checking if you have the item in your inventory before restoring it, use if you have disconnect issues when restoring."] = "『/abs count』 - 切換是否在載入快捷配置前檢查背包內物品符合配置所需。"
L["/abs delete <profile> - Deletes the saved profile."] = "『/abs delete 名稱』- 刪除已儲存的快捷配置。"
L["/abs errors - Lists the errors that happened on the last restore (if any)."] = "/abs errors - Lists the errors that happened on the last restore (if any)."
--L["/abs link \"<spell 1>\" \"<spell 2>\" - Links a spell with another, INCLUDE QUOTES for example you can use \"Shadowmeld\" \"War Stomp\" so if War Stomp can't be found, it'll use Shadowmeld and vica versa."] = "/abs link \"<spell 1>\" \"<spell 2>\" - Links a spell with another, INCLUDE QUOTES for example you can use \"Shadowmeld\" \"War Stomp\" so if War Stomp can't be found, it'll use Shadowmeld and vica versa."
L["/abs list - Lists all saved profiles."] = "『/abs list』 - 列出目前所儲存的所有快捷配置。"
L["/abs logout - Toggles auto saving of the current profile whenever you leave the world."] = "/abs logout - Toggles auto saving of the current profile whenever you leave the world."
L["/abs macro - Attempts to restore macros that have been deleted for a profile."] = "『/abs macro』 - 恢復快捷配置中已被刪除的巨集。"
--L["/abs rank - Toggles if ABS should restore the highest rank of the spell, or the one saved originally."] = "/abs rank - Toggles if ABS should restore the highest rank of the spell, or the one saved originally."
L["/abs rename <oldProfile> <newProfile> - Renames a saved profile from oldProfile to newProfile."] = "『/abs rename 名稱 新名稱』 - 將快捷配置名稱重新命名。"
L["/abs restore <profile> - Changes your action bars to the passed profile."] = "『/abs restore 名稱』 - 導入已儲存的快捷配置。"
L["/abs save <profile> - Saves your current action bar setup under the given profile."] = "『/abs save 名稱』 - 將目前快捷配置以你所要的名稱儲存。"
L["/abs test <profile> - Tests restoring a profile, results will be outputted to chat."] = "/abs test <profile> - Tests restoring a profile, results will be outputted to chat."
L["Also moved from the unknown category to %s."] = "Also moved from the unknown category to %s."
L["Auto macro restoration is now disabled!"] = "Auto macro restoration is now disabled!"
L["Auto macro restoration is now enabled!"] = "Auto macro restoration is now enabled!"
L["Auto profile save on logout is disabled!"] = "Auto profile save on logout is disabled!"
L["Auto profile save on logout is enabled!"] = "Auto profile save on logout is enabled!"
L["Auto restoring highest spell rank is now disabled!"] = "Auto restoring highest spell rank is now disabeld!"
L["Auto restoring highest spell rank is now enabled!"] = "Auto restoring highest spell rank is now enabled!"
L["Cannot rename \"%s\" to \"%s\" a profile already exists for %s."] = "不能將『\"%s\"』重新命名為『\"%s\"』，『%s』已存在。"
L["Cannot restore profile \"%s\", you can only restore profiles saved to your class."] = "不能載入快捷配置『\"%s\"』, 您只能載入相同職業的快捷配置。"
L["Cannot test restore profile \"%s\", you can only test restore profiles saved to your class."] = "Cannot test restore profile \"%s\", you can only test restore profiles saved to your class."
L["Checking item count is now disabled!"] = "檢查背包內物品已停用!"
L["Checking item count is now enabled!"] = "檢查背包內物品已啟用!"
L["DEATHKNIGHT"] = "死亡騎士"
L["Deleted saved profile %s."] = "刪除已儲存的快捷配置 %s."
L["DRUID"] = "德魯伊"
L["Errors found: %d"] = "發現錯誤: %d"
L["HUNTER"] = "獵人"
L["Instant"] = "Instant"
L["Invalid spells passed, remember you must put quotes around both of them."] = "Invalid spells passed, remember you must put quotes around both of them."
L["MAGE"] = "法師"
L["Miscellaneous"] = "雜項"
L["MONK"] = "武僧"
L["No errors found!"] = "沒有找到錯誤!"
L["No name specified to rename \"%s\" to."] = "沒有指定的名稱來重新命名 \"%s\" 。"
L["No profile with the name \"%s\" exists."] = "快捷配置 \"%s\" 不存在。"
L["PALADIN"] = "聖騎士"
L["PRIEST"] = "牧師"
L["Profile List"] = "快捷配置列表"
L["Renamed \"%s\" to \"%s\""] = "將 \"%s\" 重新命名為 \"%s\""
L["Restored profile %s!"] = "已載入快捷配置 %s!"
L["Restored profile %s, failed to restore %d buttons type /abs errors for more information."] = "載入快捷配置：『%s』時有 %d 個快捷失效了，『/abs errors』來看更多資訊。"
L["ROGUE"] = "盜賊"
L["Saved profile %s!"] = "已儲存快捷配置 %s!"
L["SHAMAN"] = "薩滿"
L["Slash commands"] = "指令"
L["Spells \"%s\" and \"%s\" are now linked."] = "Spells \"%s\" and \"%s\" are now linked."
L["%s Profiles"] = "%s 快捷配置"
L["The profile %s has been moved from the unknown category to %s."] = "The profile %s has been moved from the unknown category to %s."
L["Unable to restore companion \"%s\" to slot #%d, it does not appear to exist yet."] = "Unable to restore companion \"%s\" to slot #%d, it does not appear to exist yet."
L["Unable to restore equipment set \"%s\" to slot #%d, it does not appear to exist anymore."] = "Unable to restore equipment set \"%s\" to slot #%d, it does not appear to exist anymore."
L["Unable to restore item \"%s\" to slot #%d, cannot be found in inventory."] = "載入 \"%s\" 到快捷 #%d 失敗了, 在背包中沒有這個物品。"
L["Unable to restore item \"%s\" to slot #%d, you on the Arena Tournament Realms and attempting to restore that item would cause a disconnect."] = "Unable to restore item \"%s\" to slot #%d, you on the Arena Tournament Realms and attempting to restore that item would cause a disconnect."
L["Unable to restore macro id #%d to slot #%d, it appears to have been deleted."] = "Unable to restore macro id #%d to slot #%d, it appears to have been deleted."
L["Unable to restore macros, you already have 36 global and 18 per character ones created."] = "不能恢復巨集，因為目前巨集欄位已滿。"
L["Unable to restore profile \"%s\", you are in combat."] = "不能載入快捷配置 \"%s\", 因為您還在戰鬥中。"
L["Unable to restore spell \"%s\" to slot #%d, it does not appear to have been learned yet."] = "不能載入技能 \"%s\" 到 #%d 快捷, 可能您尚未學到這個技能。"
L["UNKNOWN"] = "未知"
L["WARLOCK"] = "術士"
L["WARRIOR"] = "戰士"
L["You cannot rename \"%s\" to \"%s\" they are the same profile names."] = "你不能將 \"%s\" 重新命名為 \"%s\"，因為他們的配置名稱相同。"
L["Your DB has been upgraded to the new storage format."] = "你的快捷配置儲存格式已經升級到新的儲存格式。"
local ABS = select(2, ...)
ABS.L = setmetatable(L, {__index = ABS.L})
