-- Masque_DaedUI, used in DaedhirUI
-- http://daedhirui.blogspot.com

local LBF = LibStub("LibButtonFacade", true)
if not LBF then return end

LBF:AddSkin("DaedUI", {
	       Backdrop = {
		  Width = 42,
		  Height = 42,
		  Texture = [[Interface\AddOns\Masque_DaedUI\Textures\Backdrop]],
	       },
	       Icon = {
		  Width = 36,
		  Height = 36,
	       },
	       Flash = {
		  Width = 42,
		  Height = 42,
		  Color = {1, 0, 0, 0.3},
		  Texture = [[Interface\AddOns\Masque_DaedUI\Textures\Overlay]],
	       },
	       Cooldown = {
		  Width = 36,
		  Height = 36,
	       },
	       Pushed = {
		  Width = 42,
		  Height = 42,
		  Color = {0, 0, 0, 0.5},
		  Texture = [[Interface\AddOns\Masque_DaedUI\Textures\Overlay]],
	       },
	       Normal = {
		  Width = 42,
		  Height = 42,
		  Static = true,
		  Color = {1, 1, 1, 1},
		  Texture = [[Interface\AddOns\Masque_DaedUI\Textures\Normal]],
	       },
	       Disabled = {
		  Hide = true,
	       },
	       Checked = {
		  Width = 42,
		  Height = 42,
		  BlendMode = "ADD",
		  Color = {0, 0.8, 1, 0.5},
		  Texture = [[Interface\AddOns\Masque_DaedUI\Textures\Border]],
	       },
	       Border = {
		  Width = 42,
		  Height = 42,
		  BlendMode = "ADD",
		  Texture = [[Interface\AddOns\Masque_DaedUI\Textures\Border]],
	       },
	       Gloss = {
		  Width = 42,
		  Height = 42,
		  Texture = [[Interface\AddOns\Masque_DaedUI\Textures\Gloss]],
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
		  Color = {1, 1, 1, 0.3},
		  Texture = [[Interface\AddOns\Masque_DaedUI\Textures\Highlight]],
	       },
	       Name = {
		  Width = 42,
		  Height = 10,
		  OffsetY = -10,
	       },
	       Count = {
		  Width = 42,
		  Height = 10,
		  OffsetX = -3,
		  OffsetY = -10,
	       },
	       HotKey = {
		  Width = 42,
		  Height = 10,
		  OffsetX = -3,
		  OffsetY = 10,
	       },
	       AutoCast = {
		  Width = 32,
		  Height = 32,
		  OffsetX = 1,
		  OffsetY = -1,
	       },
	    }, true)
