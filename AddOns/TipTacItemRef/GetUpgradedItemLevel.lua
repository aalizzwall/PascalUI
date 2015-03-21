-- GetUpgradedItemLevelFromItemLink() -- REV-03 -- Modified: 13.05.22
-- Until Blizzard adds an easier solution, this function is supposed to be portable between addons, and is placed in the global namespace.
-- REV-03: Patch 5.3: Added the 465/466/467 IDs (0/4/8 lvls) to the table.
-- REV-02: Patch 5.2: Added the 470 ID (8 lvls) to the table.

-- Make sure we do not override a newer revision.
local REVISION = 3;
if (type(GET_UPGRADED_ITEM_LEVEL_REV) == "number") and (GET_UPGRADED_ITEM_LEVEL_REV >= REVISION) then
	return;
end
GET_UPGRADED_ITEM_LEVEL_REV = REVISION;

-- ItemLink pattern
local ITEMLINK_PATTERN = "(item:[^|]+)";
-- Finds the last and 11th parameter of an itemLink, which is the upgradeId
local ITEMLINK_PATTERN_UPGRADE = ":(%d+)$";
-- Table for adjustment of levels due to upgrade -- Source: http://www.wowinterface.com/forums/showthread.php?t=45388
local UPGRADED_LEVEL_ADJUST = {
	[0] = 0,       [1] = 8,       [373] = 4,     [374] = 8,     [375] = 4,     [376] = 4,
	[377] = 4,     [379] = 4,     [380] = 4,     [445] = 0,     [446] = 4,     [447] = 8,
	[451] = 0,     [452] = 8,     [453] = 0,     [454] = 4,     [455] = 8,     [456] = 0,
	[457] = 8,     [458] = 0,     [459] = 4,     [460] = 8,     [461] = 12,    [462] = 16,
	[465] = 0,     [466] = 4,     [467] = 8,     [468] = 0,     [469] = 4,     [470] = 8,
	[471] = 12,    [472] = 16,    [477] = 4,     [478] = 8,     [480] = 8,     [491] = 0,   
	[492] = 4,     [493] = 8,     [494] = 0,     [495] = 4,     [496] = 8,     [497] = 12,   
	[498] = 16,
};
local UPGRADED_LEVEL_CONDITIONS = {	
	[0] = "0/0",   [1] = "1/1",   [373] = "1/2", [374] = "2/2", [375] = "1/3", [376] = "2/3",
	[377] = "3/3", [379] = "1/2", [380] = "2/2", [445] = "0/2", [446] = "1/2", [447] = "2/2",
	[451] = "0/1", [452] = "1/1", [453] = "0/2", [454] = "1/2", [455] = "2/2", [456] = "0/1",
	[457] = "1/1", [458] = "0/4", [459] = "1/4", [460] = "2/4", [461] = "3/4", [462] = "4/4",
	[465] = "0/2", [466] = "1/2", [467] = "2/2", [468] = "0/4", [469] = "1/4", [470] = "2/4",
	[471] = "3/4", [472] = "4/4", [477] = "1/2", [478] = "2/2", [480] = "1/1", [491] = "0/2", 
	[492] = "1/2", [493] = "2/2", [494] = "0/4", [495] = "1/4", [496] = "2/4", [497] = "3/4",   
	[498] = "4/4",
};
-- Analyses the itemLink and checks for upgrades that affects itemLevel -- Only itemLevel 450 and above will have this
function GetUpgradedItemLevelFromItemLink(itemLink)
	-- Make certain we only have the raw itemLink, and not the full itemString
	itemLink = itemLink:match(ITEMLINK_PATTERN);
	local _, _, _, itemLevel = GetItemInfo(itemLink);
	local upgradeId = tonumber(itemLink:match(ITEMLINK_PATTERN_UPGRADE));
	if (itemLevel) and (itemLevel >= 450) and (upgradeId) and (UPGRADED_LEVEL_ADJUST[upgradeId]) then
		return itemLevel + UPGRADED_LEVEL_ADJUST[upgradeId],UPGRADED_LEVEL_CONDITIONS[upgradeId];
	else
		return itemLevel;
	end
end