
-- This is a basic cheap workaround to restore arrow key functionality for chat windows,
-- until Blizzard fixes the change they made to the AutoComplete edit box.
-- I've added basic DB support so it functions how Chatter used to, ie saving messages after logging.

local frame = CreateFrame("FRAME");
frame:RegisterEvent("ADDON_LOADED");
--frame:RegisterEvent("PLAYER_LOGOUT");
--frame:RegisterEvent("PLAYER_ENTERING_WORLD");

local bClearing = false;

function frame:OnEvent(event, arg1)
    if event == "ADDON_LOADED" and arg1 == "CrappyChatFix" then
        DEFAULT_CHAT_FRAME:AddMessage("CrappyChatFix loaded.  Hooray.");
        if ccfDB == nil then
            ccfDB = {};
        end
        ccfInitialize();
    end
end

function ccfInitialize()
	for i = 1, NUM_CHAT_WINDOWS do
		local f = _G["ChatFrame" .. i .. "EditBox"]
        local s = f:GetName();
		if ( ccfDB[s] ) then
            for i = 1, #ccfDB[s] do
                -- pointlessly add this stuff to the chat's existing history log?
                f:AddHistoryLine(ccfDB[s][i]);
            end
        else
            -- edit box doesn't exist yet
            ccfDB[s] = {}
        end

        f["historyIndex"] = 1;

        hooksecurefunc(f, "AddHistoryLine", mod_AddHistoryLine);
        hooksecurefunc(f, "ClearHistory", mod_ClearHistory);
        -- SetScript vice HookScript, so we override the AutoComplete OnArrowPressed event
        f:SetScript("OnArrowPressed", mod_OnArrowPressed);
        -- Accept arrow keys into our hearts... and edit boxes
        f:SetAltArrowKeyMode(false);
	end
end

function mod_AddHistoryLine(self, text)
    if ( bClearing ) then
        bClearing = false;
        return;
    end
    if ( (text == nil) or (text == "") ) then
        return;
    end
    local s = self:GetName();
    if ( ccfDB[s] == nil ) then
        ccfDB[s] = {}
    end
    local history = ccfDB[s];
    local maxlines = self:GetHistoryLines() or 1;
    local x = self["historyIndex"];

    --x = ((x > 0) and (x <= maxlines) and x) or (x > 0 and maxlines) or (x < maxlines and 1);

    if ( x >= maxlines ) then
        x = maxlines;
        self["historyIndex"] = 1;
    elseif ( x < 1 ) then
        x = 1;
        self["historyIndex"] = 2;
    else
        self["historyIndex"] = x + 1;
    end
    if (#history < maxlines) then
        if (history[x] ~= text) then
            tinsert(history, x, text);
        end
    else
        history[x] = text;
    end
end

function mod_ClearHistory(self)
    ccfDB[self:GetName()] = {}
end

function mod_OnArrowPressed(self, key)
	if ( key == "UP" ) then
		return ChatHistory_FetchNext(self, true);
	elseif ( key == "DOWN" ) then
		return ChatHistory_FetchNext(self, false);
	end
end


function ChatHistory_FetchNext(self, prev)
    local history = ccfDB[self:GetName()];
    if ( (history == nil) or (#history == 0) ) then
        return;
    end

    local maxlines = self:GetHistoryLines() or 1;
    maxlines = #history < maxlines and #history or maxlines;
    local i = self["historyIndex"] or (prev and 1 or maxlines);
    if prev then
        i = i - 2;
    end
    i = (i % maxlines) + 1;

    self["historyIndex"] = i;

    local s = history[i];
    if ( s ) then
        self:SetText(s);
    end
end

SLASH_CCFCLEARHISTORY1 = "/ccfclear";
function SlashCmdList.CCFCLEARHISTORY(msg)
    bClearing = true;
    for k,v in pairs(ccfDB) do
        ccfDB[k] = {};
        _G[k]["historyIndex"] = 1;
        _G[k]:ClearHistory();
    end
end

frame:SetScript("OnEvent", frame.OnEvent);
