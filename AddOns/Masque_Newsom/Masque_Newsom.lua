--Masque: Newsom, a World of Warcraft® user interface addon plugin.
--By Leo Bolin, aka Newsom <leo@leobolin.com>
--Code based on Masque: Trinity by Connor H. Chenoweth, aka Maul

--[[ Newsom Button Skins for Masque]]

if not LibStub then return end

local MSQ = LibStub("Masque", true)

if not MSQ then return end

MSQ:AddSkin("Newsom",{

	-- Skin data start.
	Author = "Newsom",
	Version = "40300.2",
	Masque_Version = 40200,
	Shape = "Square",

	Normal = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque_Newsom\images\newsom\Normal]],
		TexCoords = {0.14,0.86,0.14,0.86},
		Static = true,
	},
	Pushed = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque_Newsom\images\newsom\Highlight]],
		TexCoords = {0.14,0.86,0.14,0.86},
	},
	Checked = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque_Newsom\images\newsom\Highlight]],
		TexCoords = {0.14,0.86,0.14,0.86},
	},
	Highlight = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque_Newsom\images\newsom\Highlight]],
		TexCoords = {0.14,0.86,0.14,0.86},
		BlendMode = "ADD",
	},
	Border = {
		Width = 35,
		Height = 35,
		Texture = [[Interface\AddOns\Masque_Newsom\images\newsom\Equipped]],
		TexCoords = {0.14,0.86,0.14,0.86},
		BlendMode = "ADD",
	},
	Gloss = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque_Newsom\images\newsom\Gloss]],
		TexCoords = {0.14,0.86,0.14,0.86},
	},
	Disabled = {
		Hide = true,
	},
	Icon = {
		Width = 30,
		Height = 30,
		TexCoords = {0.07,0.93,0.07,0.93},
	},
	Cooldown = {
		Width = 30,
		Height = 30,
	},
	Backdrop = {
		Width = 30,
		Height = 30,
		Texture = [[Interface\AddOns\Masque_Newsom\images\trinity_button_bg]],
	},
	Name = {
		Width = 32,
		Height = 10,
		OffsetY = 4,
	},
	Count = {
		Width = 32,
		Height = 10,
		OffsetX = -1,
		OffsetY = 6,
	},
	HotKey = {
		Width = 32,
		Height = 10,
		OffsetX = 1,
		OffsetY = -6,
	},
	Duration = {
		Width = 36,
		Height = 10,
		OffsetY = -2,
	},
	AutoCast = {
		Width = 38,
		Height = 38,
		OffsetX = 0.5,
		OffsetY = -0.5,
	},
	AutoCastable = {
		Width = 64,
		Height = 64,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Flash = {
		Width = 38,
		Height = 38,
		Texture = [[Interface\Buttons\UI-QuickslotRed]],
	},
	-- Skin data end.

},true)

