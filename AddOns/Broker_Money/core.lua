local ldb = LibStub:GetLibrary("LibDataBroker-1.1")
local L = LibStub:GetLibrary( "AceLocale-3.0" ):GetLocale( "Broker_Money")
local LibQTip = LibStub('LibQTip-1.0')
local L_GOLD = L["g"]
local L_SILVER = L["s"]
local L_COPPER = L["c"]


local Money = CreateFrame("frame")
LibStub("AceEvent-3.0"):Embed(Money)

Money.dataobj = LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject(L["Broker_Money"], 
  { type = "data source", 
   label = L["Broker Money"], 
	icon = "Interface\\MoneyFrame\\UI-GoldIcon",
	text = "5",
   })

local playerName = UnitName("player")
local realmName = GetRealmName()
local faction = UnitFactionGroup("player")
local moneyonlogin

local function pairsByKeys(t,f)
	local a = {}
		for n in pairs(t) do table.insert(a, n) end
		table.sort(a, f)
		local i = 0      -- iterator variable
		local iter = function ()   -- iterator function
			i = i + 1
			if a[i] == nil then return nil
			else return a[i], t[a[i]]
			end
		end
	return iter
end

local function returnchars()
	local a = {}
	for name,value in pairsByKeys(Broker_MoneyDB.realm[realmName].Alliance) do
		table.insert(a,name)
	end
	for name,value in pairsByKeys(Broker_MoneyDB.realm[realmName].Horde) do
		table.insert(a,name)
	end
	table.sort(a)
	return a
end

local function deletechar(char)
	if not char or char == nil or char == "" then return nil end
	for factionName,factionTable in pairs(Broker_MoneyDB.realm[realmName]) do	
		for name,value in pairsByKeys(factionTable) do
			if name == char then
				Broker_MoneyDB.realm[realmName][factionName][name] = nil
				print("Broker_Money: "..char.." deleted.")
			end
		end
	end
end


local sorting = {
	["Gold"] = L["Gold"],
	["Name"] = L["Name"],
}

local options = {
	name = L["Broker Money"],
	type = "group",
	args = {
		confdesc = {
			order = 1,
			type = "description",
			name = L["Simple money display for LDB\n"],
			cmdHidden = true
		},
		showCoinIcons = {
			order = 2, 
			type = "toggle", 
			width = "full",
			name = L["Show coin icons"],
			desc = L["Shows coin icons"],
			get = function() return Broker_MoneyConfig.ShowCoinIcons end,
			set = function(_,v) Broker_MoneyConfig.ShowCoinIcons = v 
				Money:UpdateConfig()
			end,
		},
		iconSize = {
			type = "range",
			order = 3,
			name = L["Icon size"],
			desc = L["Change Icon size"],
			min = 1, max = 32, step = 1, bigStep = 1,
			set = function(_,v) Broker_MoneyConfig.IconSize = v 
				Money:UpdateConfig()
			end,
			get = function() return Broker_MoneyConfig.IconSize end,
			disabled = function() return not Broker_MoneyConfig.ShowCoinIcons end,
		},
		showColoredText = {
			order = 4, 
			type = "toggle", 
			width = "full",
			name = L["Show colored text"],
			desc = L["Shows colored text"],
			get = function() return Broker_MoneyConfig.ShowColoredText end,
			set = function(_,v) Broker_MoneyConfig.ShowColoredText = v 
				Money:UpdateConfig()
			end,
		},				
		compressDisplay = {
			order = 5, 
			type = "toggle", 
			width = "full",
			name = L["Compress display"],
			desc = L["Display only relevant information (Value not 0)"],
			get = function() return Broker_MoneyConfig.CompressDisplay end,
			set = function(_,v) Broker_MoneyConfig.CompressDisplay = v 
				Money:UpdateConfig()
			end,
		},
		sorting = {
			name = L["Sort by"],
			desc = L["Sort the character table by ..."],
			order = 6,
			type = "select",
			values = sorting,
			set = function(info, val) Broker_MoneyConfig.Sorting = val; Money:UpdateConfig() end,
			get = function(info) return Broker_MoneyConfig.Sorting end
		},
		sortreverse = {
			order = 7, 
			type = "toggle", 
			width = "full",
			name = L["Reverse sorting"],
			desc = L["Reverse sorting (min/max gold on top / a-z/z-a)"],
			get = function() return Broker_MoneyConfig.SortReverse end,
			set = function(_,v) Broker_MoneyConfig.SortReverse = v; Money:UpdateConfig() end,
		},
		showvariation = {
			order = 7, 
			type = "toggle", 
			width = "full",
			name = L["Show variation"],
			desc = L["Shows the difference between your current money and the money you had on login."],
			get = function() return Broker_MoneyConfig.ShowVariation end,
			set = function(_,v) Broker_MoneyConfig.ShowVariation = v; Money:UpdateConfig() end,
		},
		shortengoldvalue = {
			order = 7, 
			type = "toggle", 
			width = "full",
			name = L["Short gold display"],
			desc = L["Shortens your gold value: 1000 => 1k, 1000000 => 1m"],
			get = function() return Broker_MoneyConfig.ShortenGoldValue end,
			set = function(_,v) Broker_MoneyConfig.ShortenGoldValue = v; Money:UpdateConfig() end,
		},		
		deletechar = {
			name = L["Delete char"],
			desc = L["Delete the selected char"],
			order = -1,
			type = "select",
			values = returnchars,
			set = function(info, val) local t=returnchars(); deletechar(t[val]); Money:UpdateConfig() end,
			get = function(info) return nil end
		},
	}
}	
   
LibStub("AceConfig-3.0"):RegisterOptionsTable(L["Broker Money"], options)
LibStub("AceConfigDialog-3.0"):AddToBlizOptions(L["Broker Money"])

local currentMoney, toolTipRef
local goldicon, silvericon, coppericon
local COLOR_COPPER, COLOR_SILVER, COLOR_GOLD
local gold, silver, copper



function Money:UpdateConfig() 
	if not Broker_MoneyConfig then 
		Broker_MoneyConfig = { 		
			ShowCoinIcons = true,
			ShowColoredText = true,
			CompressDisplay = false,
			IconSize = 16,
			Sorting = "Name",
			SortReverse = false,
			ShowVariation = true,
			ShortenGoldValue = false,
        }
  	end
	
	if not Broker_MoneyDB or not Broker_MoneyDB.realm then
		Broker_MoneyDB = {			
			realm = {},
		}
	end
	if not Broker_MoneyDB.realm[realmName] then
		Broker_MoneyDB.realm[realmName] = {}
	end

	if (not Broker_MoneyDB.realm[realmName]["Horde"] or not Broker_MoneyDB.realm[realmName]["Alliance"]) then
		Broker_MoneyDB.realm[realmName] = {}
		Broker_MoneyDB.realm[realmName]["Horde"] = {}
		Broker_MoneyDB.realm[realmName]["Alliance"] = {}		
	end
			
	if Broker_MoneyConfig.ShowCoinIcons then
		--use built-in icons
		--goldicon = " |TInterface\\AddOns\\Broker_Money\\Icons\\UI-GoldIcon::|t"
		--silvericon = " |TInterface\\AddOns\\Broker_Money\\Icons\\UI-SilverIcon::|t"
		--coppericon = " |TInterface\\AddOns\\Broker_Money\\Icons\\UI-CopperIcon::|t"
		
		-- 16 is fine
		local iconSize
		if not Broker_MoneyConfig.IconSize then		
			Broker_MoneyConfig.IconSize = 16
		end
		
		iconSize = Broker_MoneyConfig.IconSize
		
		goldicon = string.format("\124TInterface\\MoneyFrame\\UI-GoldIcon:%d:%d:1:0\124t", iconSize, iconSize)
		silvericon = string.format("\124TInterface\\MoneyFrame\\UI-SilverIcon:%d:%d:1:0\124t", iconSize, iconSize)
		coppericon = string.format("\124TInterface\\MoneyFrame\\UI-CopperIcon:%d:%d:1:0\124t", iconSize, iconSize)
	else
		goldicon = string.format("|cffffd700%s|r", L_GOLD)
		silvericon = string.format("|cffc7c7cf%s|r", L_SILVER)
		coppericon = string.format("|cffeda55f%s|r", L_COPPER)
	end
	if Broker_MoneyConfig.ShowColoredText then
		COLOR_GOLD = "|cffffd700%s|r"
		COLOR_SILVER = "|cffc7c7cf%i|r"
		COLOR_COPPER = "|cffeda55f%i|r"		
	else 
		COLOR_COPPER = "%i"
		COLOR_SILVER = "%i"
		COLOR_GOLD = "%s"
	end
	
	Money:Update()
end

local function GetTipAnchor(frame)
	local x,y = frame:GetCenter()
	if not x or not y then return "TOPLEFT", "BOTTOMLEFT" end
	local hhalf = (x > UIParent:GetWidth()*2/3) and "RIGHT" or (x < UIParent:GetWidth()/3) and "LEFT" or ""
	local vhalf = (y > UIParent:GetHeight()/2) and "TOP" or "BOTTOM"
	return vhalf..hhalf, frame, (vhalf == "TOP" and "BOTTOM" or "TOP")..hhalf
end

function Money.dataobj.OnLeave()
   -- Release the tooltip
   LibQTip:Release(toolTipRef)
   toolTipRef = nil
end


local next = next
function Money.dataobj.OnEnter(self)
	local tooltip = LibQTip:Acquire("BrokerMoneyTooltip", 4, "LEFT", "RIGHT", "RIGHT", "RIGHT")
	toolTipRef = tooltip
   
--	tooltip:AddHeader('Broker_Money')
--	tooltip:AddLine(" ")
	
	local totalMoney = 0
	local factionMoney = 0
	local reverse = nil
	if Broker_MoneyConfig.SortReverse then
		reverse = function(a,b) return a>b end
	end
	
	for factionName,factionTable in pairs(Broker_MoneyDB.realm[realmName]) do	
		if Broker_MoneyConfig.Sorting == "Name" then
		--	for name,value in pairs(factionTable) do
			for name,value in pairsByKeys(factionTable,reverse) do
				local moneyTable = Money:CreateMoneyStrings(value)
				
				tooltip:AddLine(string.format("%s: ", name), 
					moneyTable["gold"],
					moneyTable["silver"],
					moneyTable["copper"])
			
				totalMoney = totalMoney + value
				if(factionName == faction) then
					factionMoney = factionMoney + value
				end
			end
		elseif Broker_MoneyConfig.Sorting == "Gold" then			
			if next(factionTable) ~= nil then				
				valuetable = {}
				for name,value in pairs(factionTable) do
					table.insert(valuetable, value)
				end
				table.sort(valuetable, reverse)
				for i=1,getn(valuetable) do
					for name,value in pairs(factionTable) do
						if valuetable[i] == value then
							local moneyTable = Money:CreateMoneyStrings(value)
							
							tooltip:AddLine(string.format("%s: ", name), 
								moneyTable["gold"],
								moneyTable["silver"],
								moneyTable["copper"])
						
							totalMoney = totalMoney + value
							if(factionName == faction) then
								factionMoney = factionMoney + value
							end
						end
					end
				end
			end
		else
			print("Broker_Money: Solving bugs in config...")
			Broker_MoneyConfig.Sorting = "Name"
			for name,value in pairsByKeys(factionTable,reverse) do
				local moneyTable = Money:CreateMoneyStrings(value)
				
				tooltip:AddLine(string.format("%s: ", name), 
					moneyTable["gold"],
					moneyTable["silver"],
					moneyTable["copper"])
			
				totalMoney = totalMoney + value
				if(factionName == faction) then
					factionMoney = factionMoney + value
				end
			end
			print("Broker_Money: Bugs should be solved.")
		end
		
	end

	if (Broker_MoneyConfig.ShowVariation ~= false and Broker_MoneyConfig.ShowVariation ~= true) then
		print("Broker_Money: Solving bugs in config...")
		Broker_MoneyConfig.ShowVariation = true
	end
	if Broker_MoneyConfig.ShowVariation then
		tooltip:AddLine(" ")	
		local variationMoneyTable = Money:CreateMoneyStrings("variation")
		tooltip:AddLine("Variation since login: ", 
			variationMoneyTable["gold"], 
			variationMoneyTable["silver"], 
			variationMoneyTable["copper"])
	end
	
	tooltip:AddLine(" ")
	
	local factionMoneyTable = Money:CreateMoneyStrings(factionMoney)
	local moneyTable = Money:CreateMoneyStrings(totalMoney)
	
	tooltip:AddLine("Faction: ", 
		factionMoneyTable["gold"], 
		factionMoneyTable["silver"], 
		factionMoneyTable["copper"])
	
	tooltip:AddLine("Realm: ", 
		moneyTable["gold"], 
		moneyTable["silver"], 
		moneyTable["copper"])
		
	
   tooltip:SmartAnchorTo(self)
   
   tooltip:Show()
end


local function round(num, idp)
	return tonumber(string.format("%." .. (idp or 0) .. "f", num))
end

local function shortengoldvalue(gold)
	if Broker_MoneyConfig.ShortenGoldValue then
		if gold >= 1E6 then
			gold = round(gold/1E6,1).."m"
		elseif gold >= 1E3 then
			gold = round(gold/1E3,1).."k"
		end
	end
	
	return gold
end

function Money:CreateMoneyStrings(currentMoney) 
	
	local COLOR_COPPER, COLOR_SILVER, COLOR_GOLD = COLOR_COPPER, COLOR_SILVER, COLOR_GOLD
	local isdeficit = false
	
	if currentMoney == "variation" then
		currentMoney = GetMoney() - moneyonlogin
		
		if currentMoney < 0 then
			isdeficit = true
			currentMoney = currentMoney*(-1)
			COLOR_COPPER, COLOR_SILVER, COLOR_GOLD = "|cffff0000%i|r", "|cffff0000%i|r", "|cffff0000%s|r"
		else
			COLOR_COPPER, COLOR_SILVER, COLOR_GOLD = "|cff00ff00%i|r", "|cff00ff00%i|r", "|cff00ff00%s|r"
		end
		
	end
	
	gold = floor(currentMoney / 10000)
	silver = floor((currentMoney - (gold * 10000)) / 100)
	copper = mod(currentMoney, 100)
	
	local goldString, silverString, copperString
	
	local moneystring = ""
	local CompressDisplay = Broker_MoneyConfig.CompressDisplay
	
	if(gold > 0 or not CompressDisplay) then
		goldString = string.format("%s%s ",  string.format(COLOR_GOLD, shortengoldvalue(gold)), goldicon)
		moneystring = goldString
	end
	
	if((silver > 0 or gold > 0) or not CompressDisplay) then
		silverString = string.format("%s%s ", string.format(COLOR_SILVER, silver), silvericon)
		moneystring = moneystring..silverString;
	end
	
	copperString = string.format("%s%s", string.format(COLOR_COPPER, copper), coppericon)
	moneystring = moneystring..copperString
	
	local moneyTable = { full=moneystring,  gold=goldString, silver=silverString, copper=copperString }
	
	return moneyTable
	
end

function Money:Update()
	local currentMoney = GetMoney()
	
	if (realmName ~= nil) 
		and (faction ~= nil) 
		and (playerName ~= nil) 
	then
		Broker_MoneyDB.realm[realmName][faction][playerName] = currentMoney
		local moneyTable = Money:CreateMoneyStrings(currentMoney)
		Money.dataobj.text = moneyTable["full"]
	
		if tipshown then dataobj.OnEnter(tipshown) end
	end
end

function Money:EnteringWorld()
	Money:UpdateConfig()
	moneyonlogin = GetMoney()
end

Money:RegisterEvent("PLAYER_MONEY", "Update")
Money:RegisterEvent("PLAYER_TRADE_MONEY", "Update")
Money:RegisterEvent("TRADE_MONEY_CHANGED", "Update")
Money:RegisterEvent("SEND_MAIL_MONEY_CHANGED", "Update")
Money:RegisterEvent("SEND_MAIL_COD_CHANGED", "Update")
Money:RegisterEvent("PLAYER_LOGIN", "EnteringWorld")

Money:UpdateConfig()