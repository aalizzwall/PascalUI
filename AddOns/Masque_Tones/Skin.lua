--[[ Tones for Masque ]]

local MSQ = LibStub("Masque", true)
if not MSQ then return end

MSQ:AddSkin("Tones: Grey",{
	Author = "Kallieen",
	Version = "5.0.0",
	Shape = "Square",
	Masque_Version = 40300,
	-- Skin data start.
	Backdrop = {
		Width = 30,
		Height = 30,
		Texture = [[Interface\AddOns\Masque_Tones\Textures\Background]],
		
	},
	Icon = {
		Width = 22,
		Height = 22,
		TexCoords = {0.07,0.93,0.07,0.93}, -- Keeps the icon from showing its "silvery" edges.
	},
	Border = {
		Width = 32,
		Height = 32,
		Texture = [[Interface\AddOns\Masque_Tones\Textures\Border]],
		BlendMode = "ADD",
	},
	Flash = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque_Tones\Textures\Flash]],
	},
	Cooldown = {
		Width = 32,
		Height = 32,
	},
	AutoCast = {
		Width = 34,
		Height = 34,
	},
	AutoCastable = {
		Width = 58,
		Height = 58,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Normal = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque_Tones\Textures\Normal]],
		Red = 255,
		Green = 255,
		Blue = 255,
	},
	Pushed = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque_Tones\Textures\Pushed]],
		Red = 255,
		Green = 255,
		Blue = 255,
	},
	Disabled = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque_Tones\Textures\Disabled]],
		Red = 0,
		Green = 0,
		Blue = 0,
	},
	Checked = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque_Tones\Textures\Checked]],
		Red = 255,
		Green = 255,
		Blue = 140,
	},
	Gloss = {
		Height = 36,
		Width = 36,
		Texture = [[Interface\AddOns\Masque_Tones\Textures\Gloss]],
	},
	Highlight = {
		Width = 32,
		Height = 32,
		Texture = [[Interface\AddOns\Masque_Tones\Textures\Highlight]],
		BlendMode = "ADD",
	},
	HotKey = {
		Width = 36,
		Height = 5,
		OffsetX = 4,
		OffsetY = -1,
		Fontsize = 14,
	},
	Count = {
		Width = 36,
		Height = 5,
		OffsetX = 0,
		OffsetY = 5,
		Fontsize = 12,
	},
	Name = {
		Width = 36,
		Height = 10,
		OffsetY = 0,
	},
	-- Skin data end.

},true)

--Blues

MSQ:AddSkin("Tones: Blue",{
	--Skin Data Begin
	Template = "Tones: Grey",
	Normal = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque_Tones\Textures\Normal]],
		Color = {0.22, 0.25, 0.71, 1},
	},
	Pushed = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque_Tones\Textures\Pushed]],
		Color = {0.22, 0.25, 0.71, 1},
	},
	Disabled = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque_Tones\Textures\Disabled]],
		Color = {0.22, 0.25, 0.71, 0.5},
	},
	Backdrop = {
		Width = 30,
		Height = 30,
		Texture = [[Interface\AddOns\Masque_Tones\Textures\Background]],
		Color = {0.22, 0.25, 0.51, 1},
	},
	--Skin Data Ends

},true)

--Reds

MSQ:AddSkin("Tones: Red",{
	--Skin Data Begin
	Template = "Tones: Grey",
	Normal = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque_Tones\Textures\Normal]],
		Color = {0.71, 0.02, 0.13, 1},
	},
	Pushed = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque_Tones\Textures\Pushed]],
		Color = {0.71, 0.02, 0.13, 1},
	},
	Disabled = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque_Tones\Textures\Disabled]],
		Color = {0.71, 0.02, 0.13, 0.5},
	},
	Backdrop = {
		Width = 30,
		Height = 30,
		Texture = [[Interface\AddOns\Masque_Tones\Textures\Background]],
		Color = {0.9, 0.31, 0.34, 1},
	},
	--Skin Data Ends

},true)

--Greens

MSQ:AddSkin("Tones: Green",{
	--Skin Data Begin
	Template = "Tones: Grey",
	Normal = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque_Tones\Textures\Normal]],
		Color = {0.0, 0.63, 0.13, 1},
	},
	Pushed = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque_Tones\Textures\Pushed]],
		Color = {0.0, 0.63, 0.13, 1},
	},
	Disabled = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\Masque_Tones\Textures\Disabled]],
		Color = {0.0, 0.63, 0.13, 1},
	},
	Backdrop = {
		Width = 30,
		Height = 30,
		Texture = [[Interface\AddOns\Masque_Tones\Textures\Background]],
		Color = {0.3, 0.63, 0.35, 1},
	},
	--Skin Data Ends

},true)
