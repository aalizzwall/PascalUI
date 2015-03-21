local _, miirgui = ...

miirgui.Color = {1.0, 0.745, 0,1}
miirgui.Color.Highlight = {0.694, 0.694, 0.694,1}


function glv()

local lan = GetLocale()

	if lan == "enUS" then

		miirgui.small = {"Fonts\\ARIALN.TTF",10, "OUTLINE"}
		miirgui.medium = {"Fonts\\FRIZQT__.TTF",12, "OUTLINE"}
		miirgui.huge = {"Fonts\\MORPHEUS.TTF",16, "OUTLINE"}
		
	elseif lan == "deDE" then

		miirgui.small = {"Fonts\\ARIALN.TTF",10, "OUTLINE"}
		miirgui.medium = {"Fonts\\FRIZQT__.TTF",12, "OUTLINE"}
		miirgui.huge = {"Fonts\\MORPHEUS.TTF",16, "OUTLINE"}

		
	elseif lan == "frFR" then
	
		miirgui.small = {"Fonts\\ARIALN.TTF",10, "OUTLINE"}
		miirgui.medium = {"Fonts\\FRIZQT__.TTF",12, "OUTLINE"}
		miirgui.huge = {"Fonts\\MORPHEUS.TTF",16, "OUTLINE"}

		
	elseif lan == "esMX" then

		miirgui.small = {"Fonts\\ARIALN.TTF",10, "OUTLINE"}
		miirgui.medium = {"Fonts\\FRIZQT__.TTF",12, "OUTLINE"}
		miirgui.huge = {"Fonts\\MORPHEUS.TTF",16, "OUTLINE"}

		
	elseif lan == "esES" then

		miirgui.small = {"Fonts\\ARIALN.TTF",10, "OUTLINE"}
		miirgui.medium = {"Fonts\\FRIZQT__.TTF",12, "OUTLINE"}
		miirgui.huge = {"Fonts\\MORPHEUS.TTF",16, "OUTLINE"}

		
	elseif lan == "koKR" then	


		miirgui.small = {"Fonts\\2002.TTF",10, "OUTLINE"}
		miirgui.medium = {"Fonts\\2002.TTF",12, "OUTLINE"}
		miirgui.huge = {"Fonts\\2002.TTF",16, "OUTLINE"}

		
	elseif lan ==  "zhCN" then	

		miirgui.small = {"Fonts\\ARKai_T.TTF",10, "OUTLINE"}
		miirgui.medium = {"Fonts\\ARKai_T.TTF",12, "OUTLINE"}
		miirgui.huge = {"Fonts\\ARKai_T.TTF",16, "OUTLINE"}
	
		
	elseif lan == "zhTW" then

		miirgui.small = {"Fonts\\bHEI01B.TTF",10, "OUTLINE"}
		miirgui.medium = {"Fonts\\bHEI01B.TTF",12, "OUTLINE"}
		miirgui.huge = {"Fonts\\bHEI01B.TTF",16, "OUTLINE"}

		
	elseif lan == "ruRU" then
		

		miirgui.small = {"Fonts\\FRIZQT___CYR.TTF",10, "OUTLINE"}
		miirgui.medium = {"Fonts\\FRIZQT___CYR.TTF",12, "OUTLINE"}
		miirgui.huge = {"Fonts\\FRIZQT___CYR.TTF",16, "OUTLINE"}

	
	elseif lan == "itIT" then

		miirgui.small = {"Fonts\\ARIALN.TTF",10, "OUTLINE"}
		miirgui.medium = {"Fonts\\FRIZQT__.TTF",12, "OUTLINE"}
		miirgui.huge = {"Fonts\\MORPHEUS.TTF",16, "OUTLINE"}

elseif lan == "ptBR" then

		miirgui.small = {"Fonts\\ARIALN.TTF",10, "OUTLINE"}
		miirgui.medium = {"Fonts\\FRIZQT__.TTF",12, "OUTLINE"}
		miirgui.huge = {"Fonts\\MORPHEUS.TTF",16, "OUTLINE"}

	end


end


local f = CreateFrame("Frame");
f:RegisterEvent("PLAYER_ENTERING_WORLD");
f:SetScript("OnEvent", function()

glv()
end)