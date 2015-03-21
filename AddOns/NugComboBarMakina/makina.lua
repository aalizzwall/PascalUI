local SkinVersion = 500
if NugComboBar.SkinVersion ~= SkinVersion then
    print("NugComboBarMakina is not compatible with current version of NugComboBar")
    return 
end


local ActivateFunc = function(self)
    if self:GetAlpha() == 1 then return end
    if self.dag:IsPlaying() then self.dag:Stop() end
    self.aag:Play()
    self.glow2:Play()
end
local DeactivateFunc = function(self)
    if self:GetAlpha() == 0 then return end
    if self.aag:IsPlaying() then self.aag:Stop() end
    self.dag:Play()
end
local SetColorFunc = function(self,r,g,b)
    self.t:SetVertexColor(r,g,b)
    self.g:SetVertexColor(r,g,b)
    self.g2:SetVertexColor(r,g,b)
end


-- function NugComboBar.ConvertTo3(self)
--     if NugComboBar.MAX_POINTS == 3 then return end
--     NugComboBar.MAX_POINTS = 3
--     local p1 = self.p[1]
--     local point,parent,to,x,y = p1:GetPoint(1)
--     x = x - 34.5*2
--     p1:SetPoint(point,parent,to,x,y)
--     local w = 256-70-30
--     self:SetWidth(w)
--     self.bgt:SetTexture("Interface\\Addons\\NugComboBar\\tex\\ncbu_bg3")
--     for i=1,5 do
--         self.p[i]:Deactivate()
--         self.p[i-2] = self.p[i]
--     end
--     self.p[5] = nil
--     self.p[4] = nil
-- end
local pointtex = {
    [1] = {
        texture = "Interface\\Addons\\NugComboBarMakina\\tex\\ncbmbg",
        coords = {0, 85/512, 0, 1},
        width = 85, height = 128,
        psize = 58,
        poffset_x = 53.5, poffset_y = -57,
    },
    [2] = {
        texture = "Interface\\Addons\\NugComboBarMakina\\tex\\ncbmbg",
        coords = {85/512, 150/512, 0, 1},
        width = 65, height = 128,
        psize = 58,
        poffset_x = 33, poffset_y = -57,
    },

    [6] = {
        texture = "Interface\\Addons\\NugComboBarMakina\\tex\\ncbmbg",
        coords = {150/512, 255/512, 0, 1},
        width = 110, height = 128,
        psize = 58,
        poffset_x = 56.5, poffset_y = -60.5,
    },

    --reversed textures for paladin
    [7] = {
        texture = "Interface\\Addons\\NugComboBarMakina\\tex\\ncbmbg",
        coords = {260/512, 370/512, 0, 1},
        width = 110, height = 128,
        psize = 58,
        poffset_x = 53, poffset_y = -60.5,
    },

    [8] = {
        texture = "Interface\\Addons\\NugComboBarMakina\\tex\\ncbmbg",
        coords = {370/512, 435/512, 0, 1},
        width = 65, height = 128,
        psize = 58,
        poffset_x = 30, poffset_y = -57,
    },

    [9] = {
        texture = "Interface\\Addons\\NugComboBarMakina\\tex\\ncbmbg",
        coords = {435/512, 1, 0, 1},
        width = 77, height = 128,
        psize = 58,
        poffset_x = 30, poffset_y = -57,
    },
}
pointtex[3] = pointtex[2]
pointtex[4] = pointtex[2]
pointtex[5] = pointtex[2]

local mappings = {
    [2] = { 1, 6 },
    [3] = { 1, 2, 6 },
    [4] = { 1, 2, 3, 6 },
    [5] = { 1, 2, 3, 4, 6 },
    [6] = { 1, 2, 3, 4, 5, 6 },
    ["PALADIN"] = { 1, 2, 7, 8, 9 },
    ["ARCANE"] = { 1, 2, 3, 7, 8, 9 },
}

function NugComboBar.SetMaxPoints(self, n, special)
    if NugComboBar.MAX_POINTS == n then return end
    NugComboBar.MAX_POINTS = n

    for _, point in pairs(self.point) do
        point:SetAlpha(0)
        point:Hide()
        point.bg:Hide()
        point.fbg:Hide()
        point.bg:ClearAllPoints()
    end

    self.point_map = mappings[special or n]

    local prevt
    for i=1,NugComboBar.MAX_POINTS do
        local point = self.p[i]
        point:Show()
        point.bg:Show()
        point.fbg:Show()
        point.bg:SetPoint("TOPLEFT", prevt or self, prevt and "TOPRIGHT" or "TOPLEFT", point.bg.settings.offset_x or 0, 0)
        prevt = point.bg

        point:SetColor(unpack(NugComboBarDB.colors[i])) --+color_offset
        point:SetPreset(NugComboBarDB.preset3d)
    end
end

function NugComboBar.Create(self)
    local MAX_POINTS = #pointtex
    self:SetFrameStrata("MEDIUM")
    self:SetWidth(400)
    self:SetHeight(128)

    self.SetScale1 = self.SetScale
    self.SetScale = function(self, scale)
        self:SetScale1(scale*.5)
    end

    self.point = {}
    self.point_map = mappings[6]
    self.p = setmetatable({}, { __index = function(t,k)
        return self.point[self.point_map[k]]
    end})

    
    local prevt
    for i=1,MAX_POINTS do
        local ts = pointtex[i]
        local t = self:CreateTexture("NugComboBarBackgroundTexture"..i,"BACKGROUND",nil, ts.drawlayer)
        t:SetTexture(ts.texture)
        t:SetTexCoord(unpack(ts.coords))
        t:SetPoint("TOPLEFT", prevt or self, prevt and "TOPRIGHT" or "TOPLEFT", 0, 0)
        --t:SetPoint("BOTTOMRIGHT", prevt or self, prevt and "BOTTOMRIGHT" or "BOTTOMLEFT", ts.width, ts.height)
        t:SetWidth(ts.width)
        t:SetHeight(ts.height)
        t.settings = ts
        prevt = t

        local isBig = (i == 6) or (i == 7)
        local size = ts.psize
        local mul = isBig and 1.8 or 1.35
        local mul2 = isBig and 2 or 1.8
        local glowAlpha = (MAX_POINTS == 6) and 0.85 or 0.85
        local tex = [[Interface\Addons\NugComboBarMakina\tex\ncbmpoint]]
        if isBig then tex = [[Interface\Addons\NugComboBarMakina\tex\ncbmpoint5]] end
        local f = CreateFrame("Frame","NugComboBarPoint"..i,self)
        f:SetHeight(size); f:SetWidth(size);
        
        local t1 = f:CreateTexture(nil,"ARTWORK")
        t1:SetTexture(tex)
        t1:SetAllPoints(f)
        f.t = t1

        local fbg = CreateFrame("Frame", nil, self)
        fbg:SetHeight(size); fbg:SetWidth(size);
        fbg:SetAllPoints(f)
        
        local t2 = fbg:CreateTexture(nil,"BACKGROUND", 2)
        t2:SetTexture(tex)
        t2:SetAllPoints(fbg)
        t2:SetVertexColor(0.07, 0.07, 0.07)
        f.fbg = fbg
        
        local g = f:CreateTexture(nil,"OVERLAY")
        g:SetHeight(size*mul); g:SetWidth(size*mul);
        g:SetTexture[[Interface\Addons\NugComboBarMakina\tex\ncbu_point_glow]]
        g:SetPoint("CENTER",f,"CENTER",0,0)
        g:SetAlpha(glowAlpha)
        f.g = g
        
        local f2 = CreateFrame("Frame",nil,f)
        f2:SetHeight(size*mul2); f2:SetWidth(size*mul2);
        local g2 = f2:CreateTexture(nil,"OVERLAY")
        g2:SetAllPoints(f2)
        g2:SetTexture[[Interface\Addons\NugComboBarMakina\tex\ncbu_glow2]]
        f2:SetPoint("CENTER",f,"CENTER",0,0)
        f.g2 = g2
        
        f2:SetAlpha(0)
        f:SetAlpha(0)
        
        local g2aag = f2:CreateAnimationGroup()
        local g2a = g2aag:CreateAnimation("Alpha")
        g2a:SetStartDelay(0.2)
        g2a:SetChange(1)
        g2a:SetDuration(0.3)
        g2a:SetOrder(1)
        local g2d = g2aag:CreateAnimation("Alpha")
        g2d:SetChange(-1)
        g2d:SetDuration(0.7)
        g2d:SetOrder(2)
        --Required for 4.2
        g2aag:SetScript("OnFinished",function(self)
            self:GetParent():SetAlpha(0)
        end)
        
        f.glow2 = g2aag
        f.SetColor = SetColorFunc
        f.SetPreset = function() end
    
        f:SetPoint("CENTER", t, "TOPLEFT", ts.poffset_x, ts.poffset_y)

        f.bg = t
        f.id = i
        self.point[i] = f

        local aag = f:CreateAnimationGroup()
        f.aag = aag
        local a1 = aag:CreateAnimation("Alpha")
        a1:SetChange(1)
        a1:SetDuration(0.4)
        a1:SetOrder(1)
        aag:SetScript("OnFinished",function(self)
            self:GetParent():SetAlpha(1)
        end)


        local dag = f:CreateAnimationGroup()
        f.dag = dag
        local d1 = dag:CreateAnimation("Alpha")
        d1:SetChange(-1)
        d1:SetDuration(0.5)
        d1:SetOrder(1)
        dag:SetScript("OnFinished",function(self)
            self:GetParent():SetAlpha(0)
        end)
        
        
        f.Activate = ActivateFunc
        f.Deactivate = DeactivateFunc
    end    
    return self
end
