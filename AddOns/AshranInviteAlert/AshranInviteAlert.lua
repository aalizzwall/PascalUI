

-- Globals Section
AshranInviteAlert_UpdateInterval = 1.0; -- How often the OnUpdate code will run (in seconds)
local summedTime = 0;
local confirmed = 0;
local confirmSoundCounter = 0;

-- Functions Section
function AshranInviteAlert_OnUpdate(self, elapsed)

	summedTime = summedTime + elapsed
	
	if(summedTime >= AshranInviteAlert_UpdateInterval and confirmed == 0) then
		--Prints the players status for their queued non-instanced pvp zones
			for index=1, MAX_WORLD_PVP_QUEUES do
			   local status, mapName = GetWorldPVPQueueStatus(index)
			   
			   if(mapName == "Ashran" and status == "confirm") then
					playSound()
					confirmSoundCounter = confirmSoundCounter + 1
					confirmed = 1
			   end
			end
			
		--reset counter
		summedTime = 0
	end

	
	if(confirmed == 1 and summedTime >= 20.0) then
		playSound()
		confirmSoundCounter = confirmSoundCounter + 1
		print("--- ASHRAN INVITE ---")
		
		if(confirmSoundCounter >= 3) then
			confirmSoundCounter = 0
			confirmed = 0
		end
		
		--reset counter
		summedTime = 0
	end
	
end

local frame = CreateFrame("frame")
frame:SetScript("OnUpdate", AshranInviteAlert_OnUpdate)

frame:RegisterUnitEvent("ADDON_LOADED");
frame:SetScript("OnEvent", function(self, event, ...)
	if(... == "AshranInviteAlert")then
		print("--- Ashran Invite Alert loaded! ---")
	end
end)

function playSound()
	PlaySoundFile("sound\\interface\\levelup2.ogg", "Master")
end


SLASH_ASHRANINVITEALERT1, SLASH_ASHRANINVITEALERT2 = '/aia', '/ashraninvitealert';
function SlashCmdList.ASHRANINVITEALERT(msg, editbox)
	if msg == 'test' then
		print("Ashran Invite Alert: Play test sound")
		playSound()
	else
		print("Ashran Invite Alert: Command not found")
	end
end
