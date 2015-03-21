local addonName, addonTable = ...
local uiAddonName = "Storm, Earth, and Fire"

local LSM = LibStub("LibSharedMedia-3.0")

local DB = addonTable.DB

--[====[ Interface Options ]====]

local config = {}

do
	local options
	function config:AceConfig3Options()
		if options then return options end

		options = {
			name = uiAddonName,
			type = "group",
			get = function(info) return DB[info[#info]] end,
			set = function(info, val) DB:SetOverlay(info[#info], val) end,
			args = {
				version = {
					name = "v1.0.3\n監控你的風、火、大地分身。\n",
					type = "description",
					order = 0,
				},
				configMode = {
					name = "啟用設定模式",
					type = "toggle",
					width = "full",
					order = 1,
				},
				growDown = {
					name = "向下延展",
					type = "toggle",
					width = "full",
					desc = "勾選後向下延展，反之則向上延展",
					order = 2,
				},
				highlightMouseover = {
					name = "當滑鼠移過則高亮",
					type = "toggle",
					width = "full",
					desc = "當滑鼠移過時則高亮顯示分身框架",
					order = 3,
				},
				healthBar = {
					name = "目標血條",
					type = "group",
					inline = true,
					order = 4,
					args = {
						showTargetHealthBar = {
							name = "顯示目標血條",
							type = "toggle",
							desc = "顯示分身目標的血條",
							order = 1,
						},
						showHealthBarText = {
							name = "顯示血量",
							type = "toggle",
							desc = "顯示血條上的血量",
							order = 2,
						},
						desc = {
							name = "目標血條僅在目標為你的「目標」、「焦點目標」、「滑鼠在目標上」，或是你的隊友的目標才能正常運作。",
							type = "description",
							order = 3,
						}
					},
				},
				deathSound = {
					name = "消失音效",
					type = "group",
					inline = true,
					order = 5,
					args = {
						soundDesc = {
							name = "當分身消失時播放音效:",
							type = "description",
							order = 1,
						},
						deathSound = {
							name = "音效",
							desc = "當分身消失時播放的音效",
							type = "select",
							order = 2,
							dialogControl = "LSM30_Sound",
							values = LSM:HashTable("sound"),
						},
						playDeathSoundOnMaster = {
							name = "靜音時一樣播放音效",
							desc = "就算遊戲音效關閉時也一樣播放音效",
							type = "toggle",
							order = 3,
						},
					},
				},
				targetSound = {
					name = "目標音效",
					type = "group",
					inline = true,
					order = 6,
					args = {
						soundDesc = {
							name = "當你的目標為分身目標時播放音效:",
							type = "description",
							order = 1,
						},
						targetSound = {
							name = "音效",
							desc = "當你的目標為分身目標時播放的音效",
							type = "select",
							order = 2,
							dialogControl = "LSM30_Sound",
							values = LSM:HashTable("sound"),
						},
						playTargetSoundOnMaster = {
							name = "靜音時一樣播放音效",
							desc = "就算遊戲音效關閉時也一樣播放音效",
							type = "toggle",
							order = 3,
						},
						playTargetSoundOnCast = {
							name = "召喚音效",
							desc = "當你召喚分身到你當前目標時播放音效",
							type = "toggle",
							order = 4,
						},
					},
				},
			},
		}

		return options
	end
end

LibStub("AceConfig-3.0"):RegisterOptionsTable(uiAddonName, function() return config:AceConfig3Options() end)
local optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions(uiAddonName)
optionsFrame.obj:SetCallback("default", function()
	DB:ResetToDefaults();
	LibStub("AceConfigRegistry-3.0"):NotifyChange(uiAddonName)
end)
optionsFrame.obj:SetCallback("okay", function() DB:MergeOverlay() end)
optionsFrame.obj:SetCallback("cancel", function() DB:ClearOverlay() end)

--[====[ Console config ]====]

local console = {}
addonTable.configConsole = console

function console:ProcessCommand(tokens, positions, msg)
	table.remove(tokens, 1)
	table.remove(positions, 1)
	if #tokens == 0 then
		InterfaceOptionsFrame_OpenToCategory(optionsFrame)
	else
		local ok, err = self:handleConfigMsg(tokens, positions, msg)
		if not ok then
			if err then
				print(addonTable.printHeader.." |cffff0000error|r: " .. err)
			else
				print(addonTable.printHeader.." config usage:")
				print("    config list - view all config keys and values")
				print("    config <key> - view value for <key>")
				print("    config <key> <value> - set <key> to <value>")
			end
		end
	end
end

do
	local configTypes = {
		configMode="bool", growDown="bool", playDeathSoundOnMaster="bool",
		deathSound="string", highlightMouseover="bool",
		targetSound="string", playTargetSoundOnMaster="bool", playTargetSoundOnCast="bool",
		showTargetHealthBar="bool", showHealthBarText="bool",
	}
	local configKeys = {}
	for key in pairs(configTypes) do
		table.insert(configKeys, key)
	end
	table.sort(configKeys)
	function console:handleConfigMsg(tokens, positions, msg)
		if tokens[1] == "list" then
			if #tokens ~= 1 then
				return false
			end
			print(addonTable.printHeader.." config:")
			for _, key in ipairs(configKeys) do
				print("    " .. key .. " - " .. tostring(DB[key]))
			end
			return true
		end
		if #tokens == 1 then
			local key = tokens[1]:lower()
			local ok = false
			for _, v in ipairs(configKeys) do
				if key == v:lower() then
					key = v
					ok = true
					break
				end
			end
			if ok then
				print(addonTable.printHeader.." config: " .. key .. " - " .. tostring(DB[key]))
				return true
			end
			return false, "unknown key " .. key
		elseif #tokens > 1 then
			local key, value = tokens[1]:lower(), msg:sub(positions[2]):gsub("%s+$", "", 1)
			local typ
			for k, t in pairs(configTypes) do
				if key == k:lower() then
					key = k
					typ = t
					break
				end
			end
			if typ == "bool" then
				if value:lower() == "true" then
					DB[key] = true
				elseif value:lower() == "false" then
					DB[key] = false
				else
					return false, "config key " .. key .. " is a boolean"
				end
			elseif typ == "string" then
				DB[key] = value
			else
				return false, "unknown key " .. key
			end
			return true
		end
		return false
	end
end
