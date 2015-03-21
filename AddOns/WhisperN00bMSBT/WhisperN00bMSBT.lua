function WhisperN00bMSBT_OnLoad(self)
	DEFAULT_CHAT_FRAME:AddMessage("Whisper N00b MSBT v.1.5.4 Initialized (by |cff7fff7f IceMeph|r)");
	self:RegisterEvent("CHAT_MSG_WHISPER")
	self:RegisterEvent("CHAT_MSG_OFFICER")
	self:RegisterEvent("CHAT_MSG_BN_WHISPER")
end

function WhisperN00bMSBT_OnEvent (self, event, ...)
	local arg1, arg2 = ...;
	if (event == "CHAT_MSG_WHISPER") then
		if (arg1:sub(1,3) == "OQ,") then return false, msg, ... end
		MikSBT.DisplayMessage(arg2.. ": " .. arg1, MikSBT.DISPLAYTYPE_NOTIFICATION, true, 255, 128, 255);
		PlaySoundFile("Interface\\AddOns\\WhisperN00bMSBT\\Sound\\sonar.mp3");
		
	elseif (event == "CHAT_MSG_BN_WHISPER") then
		if (arg1:sub(1,3) == "OQ,") then return false, msg, ... end
		MikSBT.DisplayMessage(arg2.. ": " .. arg1, MikSBT.DISPLAYTYPE_NOTIFICATION, true, 0, 177, 240);
		PlaySoundFile("Interface\\AddOns\\WhisperN00bMSBT\\Sound\\sonar.mp3");

	elseif (event == "CHAT_MSG_OFFICER") then
		if (arg2:sub(1,3) == "OQ,") then return false, msg, ... end
		MikSBT.DisplayMessage(arg2.. ": " .. arg1, MikSBT.DISPLAYTYPE_NOTIFICATION, true, 64, 192, 64);
		PlaySoundFile("Interface\\AddOns\\WhisperN00bMSBT\\Sound\\sonar.mp3");

	end
end