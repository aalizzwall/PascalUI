--[[
	This file is part of 'Masque', an add-on for World of Warcraft. For license information,
	please see the included License.txt file.

	* File.....: Skins\Shadow.lua
	* Revision.: 72
	* Author...: Dartz

	'Shadow' skin for Masque.
]]

local MSQ = LibStub("Masque", true)
if not MSQ then return end

-- Shadow
MSQ:AddSkin("Shadow", {
	Author = "Dartz",
	Version = "5.0.80",
	Shape = "Square",
	Masque_Version = 40300,
	Backdrop = {
		Width = 40,
		Height = 40,
		Texture = [[Interface\AddOns\Masque_Shadow\Textures\Backdrop]],
	},
	Icon = {
		Width = 26,
		Height = 26,
		TexCoords = {0.07,0.93,0.07,0.93},
	},
	Flash = {
		Width = 42,
		Height = 42,
		Color = {1, 0, 0, 0.3},
		Texture = [[Interface\AddOns\Masque_Shadow\Textures\Overlay]],
	},
	Cooldown = {
		Width = 26,
		Height = 26,
	},
	Pushed = {
		Width = 42,
		Height = 42,
		Color = {0, 0, 0, 0.5},
		Texture = [[Interface\AddOns\Masque_Shadow\Textures\Overlay]],
	},
	Normal = {
		Width = 40,
		Height = 40,
		Color = {0, 0, 0, 1}, --0.3,0.3,0.3,1
		Texture = [[Interface\AddOns\Masque_Shadow\Textures\Normal]],
	},
	Disabled = {
		Hide = true,
	},
	Checked = {
		Width = 42,
		Height = 42,
		BlendMode = "ADD",
		Color = {0.9, 1, 0.8, 0.3}, --0, 0.8, 1, 0.5 --0, 0.8, 1, 0.0
		Texture = [[Interface\AddOns\Masque_Shadow\Textures\Border]],
	},
	Border = {
		Width = 42,
		Height = 42,
		BlendMode = "ADD",
		Texture = [[Interface\AddOns\Masque_Shadow\Textures\Border]],
	},
	Gloss = {
		Width = 42,
		Height = 42,
		Texture = [[Interface\AddOns\Masque_Shadow\Textures\Gloss]],
	},
	AutoCastable = {
		Width = 64,
		Height = 64,
		OffsetX = 0.5,
		OffsetY = -0.5,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Highlight = {
		Width = 42,
		Height = 42,
		BlendMode = "ADD",
		Color = {1, 1, 1, 0.0}, --1, 1, 1, 0.3
		Texture = [[Interface\AddOns\Masque_Shadow\Textures\Highlight]],
	},
	Name = {
		Width = 42,
		Height = 10,
		OffsetY = 2,
	},
	Count = {
		Width = 42,
		Height = 10,
		OffsetY = 2,
	},
	HotKey = {
		Width = 42,
		Height = 10,
		OffsetX = -6,
		OffsetY = -3,
	},
	Duration = {
		Width = 42,
		Height = 10,
		OffsetY = -3,
	},
	AutoCast = {
		Width = 32,
		Height = 32,
		OffsetX = 1,
		OffsetY = -1,
	},
}, true)
