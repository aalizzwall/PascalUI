﻿----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
local math,table,string,pairs,type,select,tonumber,floor,unpack=math,table,string,pairs,type,select,tonumber,floor,unpack
local _

local GameTooltip=GameTooltip
local GetCurrentResolution=GetCurrentResolution
local GetScreenResolutions=GetScreenResolutions
local ChatEdit_ChooseBoxForSend=ChatEdit_ChooseBoxForSend

local Emote_Panel_STRING_1="快捷功能"
local Emote_Panel_STRING_2="『左鍵』打開表情選單"
local Emote_Panel_STRING_3="『Ctrl+拖曳』移動"
local RollBtn_STRING="擲骰"
local ReportBtn_STRING_1="開場倒數"
local ReportBtn_STRING_2="（需有團隊權限）"

local Locale={
    ["Angel"]="天使",
    ["Angry"]="生氣",
    ["Biglaugh"]="大笑",
    ["Clap"]="鼓掌",
    ["Cool"]="酷",
    ["Cry"]="哭",
    ["Cute"]="可愛",
    ["Despise"]="鄙視",
    ["Dreamsmile"]="美夢",
    ["Embarras"]="尷尬",
    ["Evil"]="邪惡",
    ["Excited"]="興奮",
    ["Faint"]="暈",
    ["Fight"]="打架",
    ["Flu"]="感冒",
    ["Freeze"]="呆",
    ["Frown"]="皺眉",
    ["Greet"]="致敬",
    ["Grimace"]="鬼臉",
    ["Growl"]="呲牙",
    ["Happy"]="開心",
    ["Heart"]="心",
    ["Horror"]="恐懼",
    ["Ill"]="生病",
    ["Innocent"]="無辜",
    ["Kongfu"]="功夫",
    ["Love"]="花痴",
    ["Mail"]="郵件",
    ["Makeup"]="化妝",
    ["Mario"]="瑪莉歐",
    ["Meditate"]="沉思",
    ["Miserable"]="可憐",
    ["Okay"]="好",
    ["Pretty"]="漂亮",
    ["Puke"]="吐",
    ["Shake"]="握手",
    ["Shout"]="喊",
    ["Silent"]="噓~",
    ["Shy"]="害羞",
    ["Sleep"]="睡覺",
    ["Smile"]="微笑",
    ["Suprise"]="吃驚",
    ["Surrender"]="投降",
    ["Sweat"]="流汗",
    ["Tear"]="流淚",
    ["Tears"]="悲劇",
    ["Think"]="想",
    ["Titter"]="偷笑",
    ["Ugly"]="猥瑣",
    ["Victory"]="勝利",
    ["Volunteer"]="雷鋒",
    ["Wronged"]="委屈",
	["rt1"]="rt1", --"星星"
	["rt2"]="rt2", --"圈圈"
	["rt3"]="rt3", --"菱形"
	["rt4"]="rt4", --"三角"
	["rt5"]="rt5", --"月亮"
	["rt6"]="rt6", --"方塊"
	["rt7"]="rt7", --"十字"
	["rt8"]="rt8", --"骷髏"
}


------------------------------------------------------------------------------------------------
local Emote_CallButton
local Emote_Index2Path={}
local Emote_IconTable={}
Emote_IconSize=0.6
local Emote_IconTable={
		{Locale["rt1"],"Interface\\TargetingFrame\\UI-RaidTargetingIcon_1"},
        {Locale["rt2"],"Interface\\TargetingFrame\\UI-RaidTargetingIcon_2"},
        {Locale["rt3"],"Interface\\TargetingFrame\\UI-RaidTargetingIcon_3"},
        {Locale["rt4"],"Interface\\TargetingFrame\\UI-RaidTargetingIcon_4"},
        {Locale["rt5"],"Interface\\TargetingFrame\\UI-RaidTargetingIcon_5"},
        {Locale["rt6"],"Interface\\TargetingFrame\\UI-RaidTargetingIcon_6"},
        {Locale["rt7"],"Interface\\TargetingFrame\\UI-RaidTargetingIcon_7"},
        {Locale["rt8"],"Interface\\TargetingFrame\\UI-RaidTargetingIcon_8"},
        {Locale["Angel"],"Interface\\AddOns\\ChatEmote\\icon\\angel.tga"},
        {Locale["Angry"],"Interface\\AddOns\\ChatEmote\\icon\\angry.tga"},
        {Locale["Biglaugh"],"Interface\\AddOns\\ChatEmote\\icon\\biglaugh.tga"},
        {Locale["Clap"],"Interface\\AddOns\\ChatEmote\\icon\\clap.tga"},
        {Locale["Cool"],"Interface\\AddOns\\ChatEmote\\icon\\cool.tga"},
        {Locale["Cry"],"Interface\\AddOns\\ChatEmote\\icon\\cry.tga"},
        {Locale["Cute"],"Interface\\AddOns\\ChatEmote\\icon\\cutie.tga"},
        {Locale["Despise"],"Interface\\AddOns\\ChatEmote\\icon\\despise.tga"},
        {Locale["Dreamsmile"],"Interface\\AddOns\\ChatEmote\\icon\\dreamsmile.tga"},
        {Locale["Embarras"],"Interface\\AddOns\\ChatEmote\\icon\\embarrass.tga"},
        {Locale["Evil"],"Interface\\AddOns\\ChatEmote\\icon\\evil.tga"},
        {Locale["Excited"],"Interface\\AddOns\\ChatEmote\\icon\\excited.tga"},
        {Locale["Faint"],"Interface\\AddOns\\ChatEmote\\icon\\faint.tga"},
        {Locale["Fight"],"Interface\\AddOns\\ChatEmote\\icon\\fight.tga"},
        {Locale["Flu"],"Interface\\AddOns\\ChatEmote\\icon\\flu.tga"},
        {Locale["Freeze"],"Interface\\AddOns\\ChatEmote\\icon\\freeze.tga"},
        {Locale["Frown"],"Interface\\AddOns\\ChatEmote\\icon\\frown.tga"},
        {Locale["Greet"],"Interface\\AddOns\\ChatEmote\\icon\\greet.tga"},
        {Locale["Grimace"],"Interface\\AddOns\\ChatEmote\\icon\\grimace.tga"},
        {Locale["Growl"],"Interface\\AddOns\\ChatEmote\\icon\\growl.tga"},
        {Locale["Happy"],"Interface\\AddOns\\ChatEmote\\icon\\happy.tga"},
        {Locale["Heart"],"Interface\\AddOns\\ChatEmote\\icon\\heart.tga"},
        {Locale["Horror"],"Interface\\AddOns\\ChatEmote\\icon\\horror.tga"},
        {Locale["Ill"],"Interface\\AddOns\\ChatEmote\\icon\\ill.tga"},
        {Locale["Innocent"],"Interface\\AddOns\\ChatEmote\\icon\\innocent.tga"},
        {Locale["Kongfu"],"Interface\\AddOns\\ChatEmote\\icon\\kongfu.tga"},
        {Locale["Love"],"Interface\\AddOns\\ChatEmote\\icon\\love.tga"},
        {Locale["Mail"],"Interface\\AddOns\\ChatEmote\\icon\\mail.tga"},
        {Locale["Makeup"],"Interface\\AddOns\\ChatEmote\\icon\\makeup.tga"},
        {Locale["Mario"],"Interface\\AddOns\\ChatEmote\\icon\\mario.tga"},
        {Locale["Meditate"],"Interface\\AddOns\\ChatEmote\\icon\\meditate.tga"},
        {Locale["Miserable"],"Interface\\AddOns\\ChatEmote\\icon\\miserable.tga"},
        {Locale["Okay"],"Interface\\AddOns\\ChatEmote\\icon\\okay.tga"},
        {Locale["Pretty"],"Interface\\AddOns\\ChatEmote\\icon\\pretty.tga"},
        {Locale["Puke"],"Interface\\AddOns\\ChatEmote\\icon\\puke.tga"},
        {Locale["Shake"],"Interface\\AddOns\\ChatEmote\\icon\\shake.tga"},
        {Locale["Shout"],"Interface\\AddOns\\ChatEmote\\icon\\shout.tga"},
        {Locale["Silent"],"Interface\\AddOns\\ChatEmote\\icon\\shuuuu.tga"},
        {Locale["Shy"],"Interface\\AddOns\\ChatEmote\\icon\\shy.tga"},
        {Locale["Sleep"],"Interface\\AddOns\\ChatEmote\\icon\\sleep.tga"},
        {Locale["Smile"],"Interface\\AddOns\\ChatEmote\\icon\\smile.tga"},
        {Locale["Suprise"],"Interface\\AddOns\\ChatEmote\\icon\\suprise.tga"},
        {Locale["Surrender"],"Interface\\AddOns\\ChatEmote\\icon\\surrender.tga"},
        {Locale["Sweat"],"Interface\\AddOns\\ChatEmote\\icon\\sweat.tga"},
        {Locale["Tear"],"Interface\\AddOns\\ChatEmote\\icon\\tear.tga"},
        {Locale["Tears"],"Interface\\AddOns\\ChatEmote\\icon\\tears.tga"},
        {Locale["Think"],"Interface\\AddOns\\ChatEmote\\icon\\think.tga"},
        {Locale["Titter"],"Interface\\AddOns\\ChatEmote\\icon\\titter.tga"},
        {Locale["Ugly"],"Interface\\AddOns\\ChatEmote\\icon\\ugly.tga"},
        {Locale["Victory"],"Interface\\AddOns\\ChatEmote\\icon\\victory.tga"},
        {Locale["Volunteer"],"Interface\\AddOns\\ChatEmote\\icon\\volunteer.tga"},
        {Locale["Wronged"],"Interface\\AddOns\\ChatEmote\\icon\\wronged.tga"},
    }

local Emote_ICON_TAG_LIST={
        {strlower(ICON_TAG_RAID_TARGET_STAR1),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_1"},
        {strlower(ICON_TAG_RAID_TARGET_STAR2),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_1"},
        {strlower(ICON_TAG_RAID_TARGET_CIRCLE1),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_2"},
        {strlower(ICON_TAG_RAID_TARGET_CIRCLE2),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_2"},
        {strlower(ICON_TAG_RAID_TARGET_DIAMOND1),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_3"},
        {strlower(ICON_TAG_RAID_TARGET_DIAMOND2),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_3"},
        {strlower(ICON_TAG_RAID_TARGET_TRIANGLE1),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_4"},
        {strlower(ICON_TAG_RAID_TARGET_TRIANGLE2),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_4"},
        {strlower(ICON_TAG_RAID_TARGET_MOON1),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_5"},
        {strlower(ICON_TAG_RAID_TARGET_MOON2),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_5"},
        {strlower(ICON_TAG_RAID_TARGET_SQUARE1),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_6"},
        {strlower(ICON_TAG_RAID_TARGET_SQUARE2),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_6"},
        {strlower(ICON_TAG_RAID_TARGET_CROSS1),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_7"},
        {strlower(ICON_TAG_RAID_TARGET_CROSS2),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_7"},
        {strlower(ICON_TAG_RAID_TARGET_SKULL1),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_8"},
        {strlower(ICON_TAG_RAID_TARGET_SKULL2),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_8"},
        {strlower(RAID_TARGET_1),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_1"},
        {strlower(RAID_TARGET_2),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_2"},
        {strlower(RAID_TARGET_3),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_3"},
        {strlower(RAID_TARGET_4),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_4"},
        {strlower(RAID_TARGET_5),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_5"},
        {strlower(RAID_TARGET_6),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_6"},
        {strlower(RAID_TARGET_7),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_7"},
        {strlower(RAID_TARGET_8),"Interface\\TargetingFrame\\UI-RaidTargetingIcon_8"},
    }
	for k,v in pairs(Emote_ICON_TAG_LIST) do
		Emote_Index2Path["{"..v[1].."}"]=v[2]
 	end

	for k,v in pairs(Emote_IconTable) do
  	    Emote_Index2Path["{"..v[1].."}"]=v[2]
 	end
------------------------------------------------------------------------------------------------
local function IconSize(f)
 	local _,font=f:GetFont()
 	local res=select(GetCurrentResolution(),GetScreenResolutions())
 	local _,h=string.match(res,"(%d+)x(%d+)")
 	font=Emote_IconSize*font*h/500
 	font=floor(font)
 	return font
end
------------------------------------------------------------------------------------------------
local function Emote_SendChatMessage_Filter(text)
	for s in string.gmatch(text,"\124T([^:]+):%d+\124t") do
  		local index
		for k,v in pairs(Emote_Index2Path) do
		    if v==s then
			    index=k
			end
		end
		if index then
   			text=string.gsub(text,"(\124T[^:]+:%d+\124t)",index,1)
  		end
 	end
 	return text
end

local function Emote_AddMessage_Filter(self,text)
	for s in string.gmatch(text,"({[^}]+})") do
  		if (Emote_Index2Path[s]) then
   			text=string.gsub(text,s,"\124T"..Emote_Index2Path[s] ..":"..IconSize(self).."\124t",1)
  		end
 	end
 	return text
end

local _xSendChatMessage=SendChatMessage
local _xBNSendWhisper=BNSendWhisper
local _xBNSendConversationMessage=BNSendConversationMessage
	for i=1,NUM_CHAT_WINDOWS do
		if i~=2 then
			local f=getglobal("ChatFrame"..i)
			f._xAddMessage=f.AddMessage
			f.AddMessage=function(self,text,...)
			        text=Emote_AddMessage_Filter(self,text) self:_xAddMessage(text,...)
			    end
		end
	end
	_xSendChatMessage=SendChatMessage
	_G["SendChatMessage"]=function(text,...) text=Emote_SendChatMessage_Filter(text) _xSendChatMessage(text,...) end
	_xBNSendWhisper=BNSendWhisper
	_G["BNSendWhisper"]=function(presenceID,text) text=Emote_SendChatMessage_Filter(text) _xBNSendWhisper(presenceID,text) end
	_xBNSendConversationMessage=BNSendConversationMessage
	_G["BNSendConversationMessage"]=function(target,text) text=Emote_SendChatMessage_Filter(text) _xBNSendConversationMessage(target,text) end

 	Emote_CallButton=CreateFrame("Button","Emote_CallButton",UIParent)
 	Emote_CallButton:SetWidth(24)
 	Emote_CallButton:SetHeight(24)
 	Emote_CallButton:SetNormalTexture("Interface\\AddOns\\ChatEmote\\icon\\report")
 	Emote_CallButton:SetPushedTexture("Interface\\AddOns\\ChatEmote\\icon\\report")
 	Emote_CallButton:SetHighlightTexture("Interface\\Buttons\\CheckButtonHilight")
	Emote_CallButton:GetHighlightTexture():SetBlendMode("ADD")
	Emote_CallButton:SetAlpha(0.8)
	Emote_CallButton:SetFrameLevel(32)
	Emote_CallButton:SetMovable(true)
	Emote_CallButton:EnableMouse(true)
	Emote_CallButton:RegisterForClicks("LeftButtonUp","RightButtonUp")
 	Emote_CallButton:RegisterForDrag("LeftButton","RightButton")
	Emote_CallButton:ClearAllPoints()
 	Emote_CallButton:SetPoint("TOPLEFT",ChatFrame1,"TOPRIGHT",0,5)
 	Emote_CallButton:SetScript("OnClick",function(self) if Emote_IconPanel:IsShown() then Emote_IconPanel:Hide() else Emote_IconPanel:Show() end if GameTooltip:GetOwner()==self then GameTooltip:Hide() end end)
 	Emote_CallButton:SetScript("OnDragStart",function(self) if self:IsMovable() and IsControlKeyDown() then self:StartMoving() end end)
 	Emote_CallButton:SetScript("OnDragStop",function(self) if self:IsMovable() then self:StopMovingOrSizing()  end  end)
 	Emote_CallButton:SetScript("OnEnter",function(self) GameTooltip:SetOwner(self,"ANCHOR_TOPLEFT")  GameTooltip:AddLine(Emote_Panel_STRING_1)  GameTooltip:AddLine(Emote_Panel_STRING_2) GameTooltip:AddLine(Emote_Panel_STRING_3) GameTooltip:Show() Emote_IconPanel.isCounting=nil end)
 	Emote_CallButton:SetScript("OnLeave",function(self) if GameTooltip:GetOwner()==self then GameTooltip:Hide() end Emote_IconPanel.showTimer=1.0 Emote_IconPanel.isCounting=1 end)
	Emote_CallButton:Show()

	Emote_IconPanel=CreateFrame("Frame","Emote_IconPanel",UIParent)
  	Emote_IconPanel:SetWidth(260)
 	Emote_IconPanel:SetHeight(160)
 	Emote_IconPanel:SetFrameLevel(32)
 	Emote_IconPanel:SetMovable(true)
 	Emote_IconPanel:EnableMouse(true)
 	Emote_IconPanel:Hide()
 	Emote_IconPanel:ClearAllPoints()
 	Emote_IconPanel:SetPoint("BOTTOMLEFT",Emote_CallButton,"TOPRIGHT",0,0)
 	Emote_IconPanel:SetBackdrop({bgFile="Interface\\Tooltips\\UI-Tooltip-Background",edgeFile="Interface\\Tooltips\\UI-Tooltip-Border",tile=true,tileSize=16,edgeSize=7,insets={left=4,right=4,top=4,bottom=4}})
 	Emote_IconPanel:SetBackdropColor(0,0,0)
 	Emote_IconPanel.showTimer=0
 	Emote_IconPanel:SetScript("OnUpdate",function(self,elapsed)
									if (not self.isCounting) then
                                     return
                                    elseif (self.showTimer<=0) then
                                     self:Hide()
                                     self.showTimer=nil
                                     self.isCounting=nil
                                    else
                                     self.showTimer=self.showTimer-elapsed
                                    end
								   end)
 	Emote_IconPanel:SetScript("OnEnter",function(self)
                                    self.isCounting=nil
                                  end)
 	Emote_IconPanel:SetScript("OnLeave",function(self)
                                    self.showTimer=1.0
                                    self.isCounting=1
                                  end)
	Emote_IconPanel.IconList={}
	Emote_IconPanel:SetScript("OnShow",function(self) for k,v in pairs(self.IconList) do v:Show() end end)
	Emote_IconPanel:SetScript("OnHide",function(self) for k,v in pairs(self.IconList) do v:Hide() end end)

 	local px=1
 	local py=1
 	for k,v in pairs(Emote_IconTable) do
		local b=CreateFrame("Button","Emote_Icon"..k,Emote_IconPanel)
    	b:Hide()
     	b:Show()
 	    b:EnableMouse(true)
 	    b:SetWidth(23)
 	    b:SetHeight(23)
 	    b.text=v[1]
 	    b.texture=v[2]
 	    b:SetNormalTexture(v[2])
 	    b:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight")
 	    b:GetHighlightTexture():SetBlendMode("ADD")
 	    b:SetFrameLevel(35)
 	    b:ClearAllPoints()
		b.parent=Emote_IconPanel
 	    b:SetPoint("TOPLEFT",Emote_IconPanel,"TOPLEFT",(px-1)*25+5,(1-py)*25-5)
 	    b:SetScript("OnClick",function(self)
                                    local editBox=ChatEdit_ChooseBoxForSend()
                                    editBox:Show()
                                    editBox:SetFocus()
                                    editBox:Insert("\124T"..self.texture..":"..IconSize(SELECTED_CHAT_FRAME).."\124t")
                                    self.parent:Hide()
                                  end)
 	    b:SetScript("OnEnter",function(self)
                                    GameTooltip:SetOwner(self.parent,"ANCHOR_TOPLEFT")
                                    GameTooltip:SetText(self.text)
                                    GameTooltip:Show()
									self.parent.isCounting=nil
                                 end)
 	    b:SetScript("OnLeave",function(self)
                                    if GameTooltip:GetOwner()==self.parent then
                                        GameTooltip:Hide()
                                    end
                                    self.parent.showTimer=1.0
                                    self.parent.isCounting=1
								end)

  	    Emote_IconPanel.IconList[k]=b
  	    px=px+1
  	    if px>=11 then
   	    	px=1
   		    py=py+1
  	    end
 	end

	Locale=nil
	Emote_IconTable=nil
	Emote_ICON_TAG_LIST=nil


local ICON_PATH="Interface\\AddOns\\ChatEmote\\icon\\"

local RollBtn=CreateFrame("Button","RollBtn",UIParent)
RollBtn:SetWidth(24)
RollBtn:SetHeight(24)
RollBtn:SetNormalTexture(ICON_PATH.."roll")
RollBtn:SetPushedTexture(ICON_PATH.."roll")
RollBtn:SetHighlightTexture("Interface\\Buttons\\CheckButtonHilight")
RollBtn:GetHighlightTexture():SetBlendMode("ADD")
RollBtn:SetAlpha(0.8)
RollBtn:SetFrameLevel(32)
RollBtn:SetMovable(true)
RollBtn:EnableMouse(true)
RollBtn:RegisterForClicks("LeftButtonUp","RightButtonUp")
RollBtn:RegisterForDrag("LeftButton","RightButton")
RollBtn:ClearAllPoints()
RollBtn:SetPoint("TOP",Emote_CallButton,"BOTTOM",0,-2)
RollBtn:SetScript("OnEnter",function(self) GameTooltip:SetOwner(self,"ANCHOR_TOPLEFT")  GameTooltip:AddLine(RollBtn_STRING) GameTooltip:Show() Emote_IconPanel.isCounting=nil end)
RollBtn:SetScript("OnClick",function(self)
RandomRoll("1","100")
if GameTooltip:GetOwner()==self then GameTooltip:Hide() end
end)
RollBtn:SetScript("OnDragStart",function(self)
if self:IsMovable() and IsControlKeyDown() then self:StartMoving() end
end)
RollBtn:SetScript("OnDragStop",function(self)
if self:IsMovable() then self:StopMovingOrSizing() end
end)
RollBtn:SetScript("OnLeave",function(self)
if GameTooltip:GetOwner()==self then GameTooltip:Hide() end
end)
RollBtn:Show()

local ReportBtn=CreateFrame("Button","ReportBtn",UIParent)
ReportBtn:SetWidth(24)
ReportBtn:SetHeight(24)
ReportBtn:SetNormalTexture(ICON_PATH.."raiders")
ReportBtn:SetPushedTexture(ICON_PATH.."raiders")
ReportBtn:SetHighlightTexture("Interface\\Buttons\\CheckButtonHilight")
ReportBtn:GetHighlightTexture():SetBlendMode("ADD")
ReportBtn:SetAlpha(0.8)
ReportBtn:SetFrameLevel(32)
ReportBtn:SetMovable(true)
ReportBtn:EnableMouse(true)
ReportBtn:RegisterForClicks("LeftButtonUp","RightButtonUp")
ReportBtn:RegisterForDrag("LeftButton","RightButton")
ReportBtn:ClearAllPoints()
ReportBtn:SetPoint("TOP",RollBtn,"BOTTOM",0,-2)
ReportBtn:SetScript("OnEnter",function(self) GameTooltip:SetOwner(self,"ANCHOR_TOPLEFT")  GameTooltip:AddLine(ReportBtn_STRING_1) GameTooltip:AddLine(ReportBtn_STRING_2) GameTooltip:Show() Emote_IconPanel.isCounting=nil end)
ReportBtn:SetScript("OnClick",function(self)
SlashCmdList["DEADLYBOSSMODS"]("PULL 8")
if GameTooltip:GetOwner()==self then GameTooltip:Hide() end
end)
ReportBtn:SetScript("OnDragStart",function(self)
if self:IsMovable() and IsControlKeyDown() then self:StartMoving() end
end)
ReportBtn:SetScript("OnDragStop",function(self)
if self:IsMovable() then self:StopMovingOrSizing() end
end)
ReportBtn:SetScript("OnLeave",function(self)
if GameTooltip:GetOwner()==self then GameTooltip:Hide() end
end)
ReportBtn:Show()