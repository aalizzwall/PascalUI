﻿-- --------------------
-- TellMeWhen
-- Originally by Nephthys of Hyjal <lieandswell@yahoo.com>

-- Other contributions by:
--		Sweetmms of Blackrock, Oozebull of Twisting Nether, Oodyboo of Mug'thol,
--		Banjankri of Blackrock, Predeter of Proudmoore, Xenyr of Aszune

-- Currently maintained by
-- Cybeloras of Aerie Peak/Detheroc/Mal'Ganis
-- --------------------


if not TMW then return end

local TMW = TMW
local L = TMW.L
local print = TMW.print


local Counter = TMW.C.EventHandler_WhileConditions_Repetitive:New("Counter", 50)
Counter.frequencyMinimum = 0

Counter:RegisterEventDefaults{
	Counter = "",
	CounterOperation = "+",
	CounterAmt = 1,
}

TMW.COUNTERS = setmetatable({}, {__index = function() return 0 end})
local COUNTERS = TMW.COUNTERS


function Counter:SanitizeCounterName(counter)
	-- don't return in a single line because that will return all of gsub's return values, which we don't want.
	counter = tostring(counter):trim():lower():gsub("[ \t\r\n]", "")
	return counter
end

-- Required methods
function Counter:ProcessIconEventSettings(event, eventSettings)
	return eventSettings.Counter ~= ""
end

function Counter:HandleEvent(icon, eventSettings)
	local Counter = eventSettings.Counter
	local CounterOperation = eventSettings.CounterOperation
	local CounterAmt = eventSettings.CounterAmt

	if CounterOperation == "+" then
		COUNTERS[Counter] = COUNTERS[Counter] + CounterAmt
	elseif CounterOperation == "-" then
		COUNTERS[Counter] = COUNTERS[Counter] - CounterAmt
	elseif CounterOperation == "/" and CounterAmt ~= 0 then
		COUNTERS[Counter] = COUNTERS[Counter] / CounterAmt
	elseif CounterOperation == "*" then
		COUNTERS[Counter] = COUNTERS[Counter] * CounterAmt
	elseif CounterOperation == "=" then
		COUNTERS[Counter] = CounterAmt
	else
		TMW:Error("Bad counter operation: " .. tostring(icon) .. " " .. Counter .. ": " .. CounterOperation .. " " .. CounterAmt)
		return
	end
	
	TMW:Fire("TMW_COUNTER_MODIFIED", Counter)

	return true
end

function Counter:OnRegisterEventHandlerDataTable()
	error("The Counter event handler does not support registration of event handler data - everything is user-defined.", 3)
end



local ConditionCategory = TMW.CNDT:GetCategory("MISC")

ConditionCategory:RegisterCondition(0.5,	"COUNTER", {
	text = L["EVENTHANDLER_COUNTER_TAB"],
	tooltip = L["CONDITIONPANEL_COUNTER_DESC"],
	range = 15,
	step = 1,

	unit = false,
	icon = "Interface\\Icons\\spell_chargepositive",
	name = function(editbox) TMW:TT(editbox, "CONDITION_COUNTER", "CONDITION_COUNTER_EB_DESC") editbox.label = L["CONDITION_COUNTER"] end,
	useSUG = "counterName",
	tcoords = TMW.CNDT.COMMON.standardtcoords,
	Env = {
		COUNTERS = COUNTERS,
	},
	funcstr = function(c, icon)
		local counter = format("%q", Counter:SanitizeCounterName(c.Name))

		return "COUNTERS[" .. counter .. "] c.Operator c.Level"
	end,
	events = function(ConditionObject, c)
		return
			ConditionObject:GenerateNormalEventString("TMW_COUNTER_MODIFIED", Counter:SanitizeCounterName(c.Name))
	end,
})

ConditionCategory:RegisterSpacer(0.6)



local DogTag = LibStub("LibDogTag-3.0", true)
if DogTag then

	TMW:RegisterCallback("TMW_COUNTER_MODIFIED", DogTag.FireEvent, DogTag)

	DogTag:AddTag("TMW", "Counter", {
		code = function(countername)
			return COUNTERS[Counter:SanitizeCounterName(countername)]
		end,
		arg = {
			'countername', 'string', '@req',
		},
		ret = "number",
		doc = L["DT_DOC_Counter"],
		example = '[Counter("countername")] => "3"',
		events = "TMW_COUNTER_MODIFIED",
		category = L["MISCELLANEOUS"],
	})
end
