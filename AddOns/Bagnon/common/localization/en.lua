--[[
	English Localization (default)
--]]

local ADDON = ...
local L = LibStub('AceLocale-3.0'):NewLocale(ADDON, 'enUS', true)

--keybinding text
L.ToggleBags = 'Toggle Inventory'
L.ToggleBank = 'Toggle Bank'
L.ToggleVault = 'Toggle Void Storage'


--system messages
L.NewUser = 'New user detected, default settings loaded'
L.Updated = 'Updated to v%s'
L.UpdatedIncompatible = 'Updating from an incompatible version, defaults loaded'


--slash commands
L.Commands = 'Command list'
L.CmdShowInventory = 'Toggles your inventory'
L.CmdShowBank = 'Toggles your bank'
L.CmdShowVersion = 'Prints the current verison'


--frame text
L.TitleBags = '%s\'s Inventory'
L.TitleBank = '%s\'s Bank'


--tooltips
L.TipBags = 'Bags'
L.TipChangePlayer = 'Click to view another character\'s items'
L.TipCleanBags = 'Click to clean up bags.'
L.TipCleanBank = '<Left-Click> to to clean up bank.'
L.TipDepositReagents = '<Right-Click> to deposit all reagents.'
L.TipFrameToggle = '<Right-Click> to toggle other windows.'
L.TipGoldOnRealm = '%s Totals'
L.TipHideBag = 'Click to hide this bag.'
L.TipHideBags = '<Left-Click> to hide the bags display.'
L.TipHideSearch = 'Click to hide the search box.'
L.TipManageBank = 'Manage Bank'
L.PurchaseBag = 'Click to purchase this bank slot.'
L.TipShowBag = 'Click to show this bag.'
L.TipShowBags = '<Left-Click> to show the bags display.'
L.TipShowMenu = '<Right-Click> to configure this window.'
L.TipShowSearch = 'Click to search'
L.TipShowFrameConfig = 'Click to configure this window'
L.TipDoubleClickSearch = '<Alt-Drag> to move.\n<Right-Click> to configure.\n<Double-Click> to search.'
L.Total = 'Total'

--itemcount tooltips
L.TipCount1 = 'Equipped: %d'
L.TipCount2 = 'Bags: %d'
L.TipCount3 = 'Bank: %d'
L.TipCount4 = 'Vault: %d'
L.TipDelimiter = '|'

--databroker tooltips
L.TipShowBank = '<Right Click> to toggle your bank.'
L.TipShowInventory = '<Left Click> to toggle your inventory.'
L.TipShowOptions = '<Shift Click> to open the options menu.'