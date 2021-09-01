--EVOLVE PWP UI


--dark theme
local frame2=CreateFrame("Frame")
frame2:RegisterEvent("ADDON_LOADED")
frame2:SetScript("OnEvent", function(self, event, addon)
        if (addon == "Blizzard_TimeManager") then
                for i, v in pairs({PlayerFrameTexture, PetFrameTexture, PartyMemberFrame1Texture, PartyMemberFrame2Texture, PartyMemberFrame3Texture, PartyMemberFrame4Texture, SlidingActionBarTexture0,
        SlidingActionBarTexture1,
        MainMenuBarLeftEndCap,
        MainMenuBarRightEndCap,
                        PartyMemberFrame1PetFrameTexture, PartyMemberFrame2PetFrameTexture, PartyMemberFrame3PetFrameTexture, PartyMemberFrame4PetFrameTexture, BonusActionBarTexture0, BonusActionBarTexture1,
                        TargetofTargetTexture, TargetofFocusTexture, BonusActionBarFrameTexture0, BonusActionBarFrameTexture1, BonusActionBarFrameTexture2, BonusActionBarFrameTexture3,
                        BonusActionBarFrameTexture4, MainMenuBarTexture0, MainMenuBarTexture1, MainMenuBarTexture2, MainMenuBarTexture3, MainMenuMaxLevelBar0, MainMenuMaxLevelBar1, MainMenuMaxLevelBar2,
                        MainMenuMaxLevelBar3, MinimapBorder, CastingBarFrameBorder, MiniMapBattlefieldBorder, FocusFrameSpellBarBorder, CastingBarBorder, TargetFrameSpellBarBorder, MiniMapTrackingButtonBorder, MiniMapLFGFrameBorder, MainMenuXPBarTextureLeftCap, MainMenuXPBarTextureRightCap, ReputationWatchBarTexture0, ReputationWatchBarTexture1,
   ReputationWatchBarTexture2, ReputationWatchBarTexture3,
   ReputationXPBarTexture0, ReputationXPBarTexture1,
   ReputationXPBarTexture2, ReputationXPBarTexture3, MainMenuXPBarTextureMid, MiniMapBattlefieldBorder,
                        MiniMapMailBorder, MinimapBorderTop,
                        select(1, TimeManagerClockButton:GetRegions())
                }) do
                        v:SetVertexColor(.0, .0, .0)
                end

                for i,v in pairs({ select(2, TimeManagerClockButton:GetRegions()) }) do
                        v:SetVertexColor(1, 1, 1)
                end

                self:UnregisterEvent("ADDON_LOADED")
                frame2:SetScript("OnEvent", nil)
		end
end)


-- class colour nameplates

SetCVar("ShowClassColorInFriendlyNameplate", 1)
SetCVar("ShowClassColorInNameplate", 1)



-- ToT texture closing the alpha gap (previously handled by ClassPortraits itself)

TargetFrameToTTextureFrameTexture:SetVertexColor(0,0,0)



--minimap buttons, horde/alliance icons on target/focus/player,minimap city location, minimap sun/clock, minimap text frame,minimap zoomable with mousewheel etc

MinimapZoomIn:Hide()
MinimapZoomOut:Hide()
Minimap:EnableMouseWheel(true)
Minimap:SetScript('OnMouseWheel', function(self, delta)
        if delta > 0 then
                Minimap_ZoomIn()
        else
                Minimap_ZoomOut()
        end
end)
MiniMapTracking:Hide()
MinimapBorderTop:Hide()
PlayerPVPIcon:SetAlpha(0)
TargetFrameTextureFramePVPIcon:SetAlpha(0)
FocusFrameTextureFramePVPIcon:SetAlpha(0)
for i=1,4 do
   _G["PartyMemberFrame"..i.."PVPIcon"]:SetAlpha(0)
end
GameTimeTexture:Hide()
MiniMapWorldMapButton:Hide()
MinimapToggleButton:Hide()
MiniMapMailFrame:ClearAllPoints() MiniMapMailFrame:SetPoint('BOTTOMRIGHT', 0, -10)
MinimapZoneTextButton:Hide()









-- Disable combat text spam over player & pet frame
PlayerHitIndicator:SetText(nil)
PlayerHitIndicator.SetText = function() end

PetHitIndicator:SetText(nil)
PetHitIndicator.SetText = function() end





--current HP/MANA value
PetFrameHealthBar.useSimpleValue = true
PetFrameManaBar.useSimpleValue = true
PlayerFrameHealthBar.useSimpleValue = true
PlayerFrameManaBar.useSimpleValue = true
TargetFrameHealthBar.useSimpleValue = true
TargetFrameManaBar.useSimpleValue = true
FocusFrameHealthBar.useSimpleValue = true
FocusFrameManaBar.useSimpleValue = true
for i=1,4 do
   _G["PartyMemberFrame"..i.."HealthBar"].useSimpleValue = true
   _G["PartyMemberFrame"..i.."ManaBar"].useSimpleValue = true
end

function TextStatusBar_UpdateTextString(textStatusBar)
   if ( not textStatusBar ) then
      textStatusBar = this;
   end
   local textString = textStatusBar.TextString;
   if(textString) then
      local value = textStatusBar.finalValue or textStatusBar:GetValue();
      local valueMin, valueMax = textStatusBar:GetMinMaxValues();

      if ( ( tonumber(valueMax) ~= valueMax or valueMax > 0 ) and not ( textStatusBar.pauseUpdates ) ) then
         textStatusBar:Show();
         if ( value and valueMax > 0 and ( GetCVar("statusTextPercentage") == "1" or textStatusBar.showPercentage ) ) then
            if ( value == 0 and textStatusBar.zeroText ) then
               textString:SetText(textStatusBar.zeroText);
               textStatusBar.isZero = 1;
               textString:Show();
               return;
            end
            value = tostring(math.ceil((value / valueMax) * 100)) .. "%";
            if ( textStatusBar.prefix and (textStatusBar.alwaysPrefix or not (textStatusBar.cvar and GetCVar(textStatusBar.cvar) == "1" and textStatusBar.textLockable) ) ) then
               textString:SetText(textStatusBar.prefix .. " " .. value);
            else
               textString:SetText(value);
            end
         elseif ( value == 0 and textStatusBar.zeroText ) then
            textString:SetText(textStatusBar.zeroText);
            textStatusBar.isZero = 1;
            textString:Show();
            return;
         elseif ( textStatusBar.useSimpleValue ) then
            textStatusBar.isZero = nil;
            textString:SetText(value);
         else
            textStatusBar.isZero = nil;
            if ( textStatusBar.prefix and (textStatusBar.alwaysPrefix or not (textStatusBar.cvar and GetCVar(textStatusBar.cvar) == "1" and textStatusBar.textLockable) ) ) then
               textString:SetText(textStatusBar.prefix.." "..value.." / "..valueMax);
            else
               textString:SetText(value.." / "..valueMax);
            end
         end
         
         if ( (textStatusBar.cvar and GetCVar(textStatusBar.cvar) == "1" and textStatusBar.textLockable) or textStatusBar.forceShow ) then
            textString:Show();
         elseif ( textStatusBar.lockShow > 0 ) then
            textString:Show();
         else
            textString:Hide();
         end
      else
         textString:Hide();
         textStatusBar:Hide();
      end
   end
end



--Pet Frame (IT IS NECCESSARY TO COPY INTERFACE/TARGETINGFRAME FOLDER AS WELL)

PetFrameHealthBar:SetWidth(70)
PetFrameHealthBar:SetHeight(18)
PetFrameManaBar:SetWidth(71)
PetFrameManaBar:SetHeight(10)
PetFrameHealthBar:SetPoint("TOPLEFT", 45, -14)
PetFrameHealthBarText:SetPoint("CENTER", 19, 4)
PetFrameHealthBarText:SetFont("Fonts/FRIZQT__.TTF", 14, "OUTLINE")
PetFrameManaBarText:SetPoint("CENTER", 19, -10)
PetFrameManaBarText:SetFont("Fonts/FRIZQT__.TTF", 9, "OUTLINE")
PetFrameManaBar:SetPoint("TOPLEFT", 45, -32)


--Party Member Frames 1-4

PartyMemberFrame1Texture:SetTexture("Interface\\AddOns\\TextureScript\\UI-PartyFrame")
PartyMemberFrame1HealthBar:SetWidth(70)
PartyMemberFrame1HealthBar:SetHeight(18)
PartyMemberFrame1ManaBar:SetWidth(71)
PartyMemberFrame1ManaBar:SetHeight(10)
PartyMemberFrame1HealthBar:SetPoint("TOPLEFT", 45, -14)
PartyMemberFrame1ManaBar:SetPoint("TOPLEFT", 45, -32)



PartyMemberFrame2Texture:SetTexture("Interface\\AddOns\\TextureScript\\UI-PartyFrame")
PartyMemberFrame2HealthBar:SetWidth(70)
PartyMemberFrame2HealthBar:SetHeight(18)
PartyMemberFrame2ManaBar:SetWidth(71)
PartyMemberFrame2ManaBar:SetHeight(10)
PartyMemberFrame2HealthBar:SetPoint("TOPLEFT", 45, -14)
PartyMemberFrame2ManaBar:SetPoint("TOPLEFT", 45, -32)


PartyMemberFrame3Texture:SetTexture("Interface\\AddOns\\TextureScript\\UI-PartyFrame")
PartyMemberFrame3HealthBar:SetWidth(70)
PartyMemberFrame3HealthBar:SetHeight(18)
PartyMemberFrame3ManaBar:SetWidth(71)
PartyMemberFrame3ManaBar:SetHeight(10)
PartyMemberFrame3HealthBar:SetPoint("TOPLEFT", 45, -14)
PartyMemberFrame3ManaBar:SetPoint("TOPLEFT", 45, -32)


PartyMemberFrame4Texture:SetTexture("Interface\\AddOns\\TextureScript\\UI-PartyFrame")
PartyMemberFrame4HealthBar:SetWidth(70)
PartyMemberFrame4HealthBar:SetHeight(18)
PartyMemberFrame4ManaBar:SetWidth(71)
PartyMemberFrame4ManaBar:SetHeight(10)
PartyMemberFrame4HealthBar:SetPoint("TOPLEFT", 45, -14)
PartyMemberFrame4ManaBar:SetPoint("TOPLEFT", 45, -32)



--Player Frame, Focus Frame, Target Frame

PlayerFrameTexture:SetTexture("Interface\\AddOns\\TextureScript\\UI-TargetingFrame")
PlayerStatusTexture:SetTexture("Interface\\AddOns\\TextureScript\\UI-Player-Status")
PlayerFrameHealthBar:SetPoint("TOPLEFT", 106, -22)
PlayerFrameHealthBar:SetWidth(119)
PlayerFrameHealthBar:SetHeight(29)
PlayerName:SetPoint("CENTER", 50, 35)
PlayerFrameHealthBarText:SetPoint("CENTER", 50, 12)
PlayerFrameHealthBarText:SetFont("Fonts/FRIZQT__.TTF", 16, "OUTLINE")

-- retarded classic client forces you to reapply this on every reload (god bless 2.4.3)


hooksecurefunc("PlayerFrame_UpdateLevelTextAnchor", function(level)
  if ( level >= 100 ) then
    PlayerLevelText:Hide();
    PlayerFrameHealthBar:SetPoint("TOPLEFT", 106, -22);
  else
    PlayerLevelText:Hide();
    PlayerFrameHealthBar:SetPoint("TOPLEFT", 106, -22);
  end
end)


hooksecurefunc("TargetFrame_CheckFaction", function(self)
    self.nameBackground:SetVertexColor(0.0, 0.0, 0.0, 0.5);
end)


-- end of retardation


TargetFrameHealthBar:SetWidth(119)
TargetFrameHealthBar:SetHeight(29)
TargetFrameHealthBar:SetPoint("TOPLEFT", 7, -22)TargetFrameHealthBar:SetPoint("CENTER", -50, 6)
TargetFrameNameBackground:Hide()
TargetFrameTextureFrameName:SetPoint("CENTER", -50, 35)
TargetFrameHealthBar.TextString:SetPoint("CENTER", -50, 12)
TargetFrameHealthBar.TextString:SetFont("Fonts/FRIZQT__.TTF", 16, "OUTLINE")


FocusFrameHealthBar:SetWidth(119)
FocusFrameHealthBar:SetHeight(29)
FocusFrameHealthBar:SetPoint("TOPLEFT", 7, -22)FocusFrameHealthBar:SetPoint("CENTER", -50, 6)
FocusFrameNameBackground:Hide()
FocusFrameTextureFrameName:SetPoint("CENTER", -50, 35)
FocusFrameHealthBar.TextString:SetPoint("CENTER", -50, 12)
FocusFrameHealthBar.TextString:SetFont("Fonts/FRIZQT__.TTF", 16, "OUTLINE")

-- aparently "FocusFrame_CheckClassification" doesnt exist anymore in this modern abomination of a client so docking it inside Target...

hooksecurefunc("TargetFrame_CheckClassification", function(self, forceNormalTexture)
    local classification = UnitClassification("target")
    if classification == "elite" or classification == "worldboss" then
        TargetFrameTextureFrameTexture:SetTexture("Interface\\AddOns\\TextureScript\\UI-TargetingFrame-Elite")
        FocusFrameTextureFrameTexture:SetTexture("Interface\\AddOns\\TextureScript\\UI-TargetingFrame-Elite")
    elseif classification == "rareelite" then
        TargetFrameTextureFrameTexture:SetTexture("Interface\\AddOns\\TextureScript\\UI-TargetingFrame-Rare-Elite")
        FocusFrameTextureFrameTexture:SetTexture("Interface\\AddOns\\TextureScript\\UI-TargetingFrame-Rare-Elite")
    elseif classification == "rare" then
        TargetFrameTextureFrameTexture:SetTexture("Interface\\AddOns\\TextureScript\\UI-TargetingFrame-Rare")
        FocusFrameTextureFrameTexture:SetTexture("Interface\\AddOns\\TextureScript\\UI-TargetingFrame-Rare")
    else
        TargetFrameTextureFrameTexture:SetTexture("Interface\\AddOns\\TextureScript\\UI-TargetingFrame")
        FocusFrameTextureFrameTexture:SetTexture("Interface\\AddOns\\TextureScript\\FocusFrame")
    end

    -- fix Blizzard's overlapping backgrounds causing a darker line
    if forceNormalTexture then
        if classification ~= "minus" then
            self.Background:SetHeight(24)
        else
            -- not sure if "minus" mobs exist in TBC - wowpedia says:
            -- Patch 5.0.4: used for minion mobs that typically have less health than normal mobs of their level, but engage the player in larger numbers
            -- if they do exist, have to check if the default 12 is an OK size for it not to overlap
            -- self.Background:SetHeight(12)
        end
    else
        self.Background:SetHeight(24)
    end
end)



--Left and Right Dragons on action bar hidden

MainMenuBarLeftEndCap:Hide()
MainMenuBarRightEndCap:Hide()





--Hidden Player glow combat/rested flashes + Hidden Focus Flash on Focused Target + Trying to completely hide the red glowing status on target/focus frames when they have low HP(this is not completely fixed yet)


hooksecurefunc("PlayerFrame_UpdateStatus", function()
   if IsResting("player") then
      PlayerStatusTexture:Hide()
      PlayerRestGlow:Hide()
      PlayerStatusGlow:Hide()
      elseif PlayerFrame.inCombat then
      PlayerStatusTexture:Hide()
      PlayerAttackGlow:Hide()
      PlayerStatusGlow:Hide()
   end
end)




--Player,Focus,Target,Pet and Party 1-4 Frames cleaned of names, group frame titles, combat indicators, glows, leader icons, master looter icons, levels, rest icons, !Improved Error Frame button hidden, Red Erros in top-center of screen hidden etc


PlayerName:Hide()
PetName:Hide()
PlayerFrameGroupIndicator:SetScript("OnShow", PlayerFrameGroupIndicator.Hide)
ActionBarUpButton:Hide()
ActionBarDownButton:Hide()
MainMenuBarPageNumber:SetAlpha(0)

UIErrorsFrame:Hide()

PlayerRestIcon:SetAlpha(0)
PlayerAttackIcon:SetAlpha(0)
PlayerRestGlow:SetAlpha(0)
PlayerLevelText:SetAlpha(0)
PlayerAttackGlow:SetAlpha(0)
PlayerStatusGlow:SetAlpha(0)
PlayerAttackBackground:SetAlpha(0)
PlayerLeaderIcon:SetAlpha(0)
PlayerStatusTexture:SetAlpha(0)
PlayerMasterIcon:SetAlpha(0)

FocusFrameTextureFrameLevelText:SetAlpha(0)
FocusFrameTextureFrameLeaderIcon:SetAlpha(0)

TargetFrameTextureFrameLevelText:SetAlpha(0)
TargetFrameTextureFrameLeaderIcon:SetAlpha(0)



PartyMemberFrame1LeaderIcon:SetAlpha(0)
PartyMemberFrame1MasterIcon:SetAlpha(0)

PartyMemberFrame2LeaderIcon:SetAlpha(0)
PartyMemberFrame2MasterIcon:SetAlpha(0)

PartyMemberFrame3LeaderIcon:SetAlpha(0)
PartyMemberFrame3MasterIcon:SetAlpha(0)

PartyMemberFrame4LeaderIcon:SetAlpha(0)
PartyMemberFrame4MasterIcon:SetAlpha(0)

PartyMemberFrame1Name:SetAlpha(0)
PartyMemberFrame2Name:SetAlpha(0)
PartyMemberFrame3Name:SetAlpha(0)
PartyMemberFrame4Name:SetAlpha(0)

ChatFrameMenuButton:Hide()
ChatFrameChannelButton:Hide()


--POSITION OF DEBUFFS ON PARTY MEMBER FRAMES 1-4

PartyMemberFrame1Debuff1:ClearAllPoints();
PartyMemberFrame1Debuff1:SetPoint("BOTTOMLEFT", 45.00000048894432, -9.374971298968035);

PartyMemberFrame2Debuff1:ClearAllPoints();
PartyMemberFrame2Debuff1:SetPoint("BOTTOMLEFT", 44.99999870080508, -8.437474379317337);

PartyMemberFrame3Debuff1:ClearAllPoints();
PartyMemberFrame3Debuff1:SetPoint("BOTTOMLEFT", 44.99999870080508, -10.31263004755721);

PartyMemberFrame4Debuff1:ClearAllPoints();
PartyMemberFrame4Debuff1:SetPoint("BOTTOMLEFT", 44.99999870080508, -8.437541575172077);





--TargetFrame castbar slight up-scaling

TargetFrameSpellBar:SetScale(1.1)


--FocusFrame castbar slight up-scaling

FocusFrameSpellBar:SetScale(1.1)


--Action bar buttons are now bigger, better looking and also fixes spellbook/wep switch bugging of dark theme

hooksecurefunc("ActionButton_ShowGrid", function(Button)
   if not Button then
      Button = this
   end
   _G[Button:GetName().."NormalTexture"]:SetVertexColor(1, 1, 1, 1)
end)
for _, Bar in pairs({ "Action", "MultiBarBottomLeft", "MultiBarBottomRight", "MultiBarLeft", "MultiBarRight", "Stance", "PetAction" }) do
for i = 1, 12 do
local Button = Bar.."Button"..i
if _G[Button] then _G[Button.."Icon"]:SetTexCoord(0.06, 0.94, 0.06, 0.94) end
end
end

--smooth status bars(animated)

local floor = math.floor
local barstosmooth = {
   PlayerFrameHealthBar = "player",
   PlayerFrameManaBar = "player",
   TargetFrameHealthBar = "target",
   PetFrameHealthBar = "pet",
   PetFrameManaBar = "pet",
   TargetFrameManaBar = "target",
   FocusFrameHealthBar = "focus",
   FocusFrameManaBar = "focus",
   ReputationWatchStatusBar = "",
   PartyMemberFrame1HealthBar = "party1",
   PartyMemberFrame1ManaBar = "party1",
   PartyMemberFrame2HealthBar = "party2",
   PartyMemberFrame2ManaBar = "party2",
   PartyMemberFrame3HealthBar = "party3",
   PartyMemberFrame3ManaBar = "party3",
   PartyMemberFrame4HealthBar = "party4",
   PartyMemberFrame4ManaBar = "party4",
    } 
    MODUI_RAIDBARS_TO_SMOOTH = {}
 
    local smoothframe = CreateFrame'Frame'
    smoothing = {}
 
    local isPlate = function(frame)
        local overlayRegion = frame:GetRegions()
        if not overlayRegion or overlayRegion:GetObjectType() ~= 'Texture'
        or overlayRegion:GetTexture() ~= [[Interface\Tooltips\Nameplate-Border]] then
            return false
        end
        return true
    end
 
    local min, max = math.min, math.max
    local function AnimationTick()
        local limit = 30/GetFramerate()
        for bar, value in pairs(smoothing) do
            local cur = bar:GetValue()
            local new = cur + min((value - cur)/3, max(value - cur, limit))
            if new ~= new then new = value end
            if cur == value or abs(new - value) < 2 then
                bar:SetValue_(value)
                smoothing[bar] = nil
            else
                bar:SetValue_(floor(new))
            end
        end
    end
 
local function SmoothSetValue(self, value)
   self.finalValue = value
   if self.unitType then
      local guid = UnitGUID(self.unitType)
      if value == self:GetValue() or not guid or guid ~= self.lastGuid then
         smoothing[self] = nil
         self:SetValue_(value)
      else
         smoothing[self] = value
      end
      self.lastGuid = guid
   else
     local _, max = self:GetMinMaxValues()
     if value == self:GetValue() or self._max and self._max ~= max then
         smoothing[self] = nil
         self:SetValue_(value)
     else
         smoothing[self] = value
     end
     self._max = max
   end
end 
    for bar, value in pairs(smoothing) do
        if bar.SetValue_ then bar.SetValue = SmoothSetValue end
    end
 
    local function SmoothBar(bar)
        if not bar.SetValue_ then
            bar.SetValue_ = bar.SetValue bar.SetValue = SmoothSetValue
        end
    end
 
    local function ResetBar(bar)
        if bar.SetValue_ then
            bar.SetValue = bar.SetValue_ bar.SetValue_ = nil
        end
    end
 
    smoothframe:SetScript('OnUpdate', function()

-- skip applying the script in PVE instances because NuBlizzard is retarded as usual

        local _, instanceType = IsInInstance()
if instanceType ~= "party" and instanceType ~= "raid" then
        local frames = {WorldFrame:GetChildren()}
        for _, plate in ipairs(frames) do
            if not plate:IsForbidden() and plate:IsVisible() and isPlate(plate) then
                local v = plate:GetChildren()
                SmoothBar(v)
            end
        end
        end
        AnimationTick()
    end)
 
     for k,v in pairs (barstosmooth) do
      if _G[k] then
         SmoothBar(_G[k])
_G[k]:SetScript("OnHide", function(self) self.lastGuid = nil; self.max_ = nil end)
         if v ~= "" then
            _G[k].unitType = v
         end
      end
   end
    smoothframe:RegisterEvent'ADDON_LOADED'
    smoothframe:SetScript('OnEvent', function()
        if arg1 == 'Blizzard_RaidUI' then
            for i = 1, 40 do
                local hp = _G['modraid'..i]
                local pp = _G['modraid'..i]
                if hp then
                    for _, v in pairs({hp.hp, pp.mana}) do SmoothBar(v) end
                end
            end
        end
    end)



--removing character "C" button image

MicroButtonPortrait:Hide()
local originalPaperDollFrameOnShow = PaperDollFrame:GetScript("OnShow")
PaperDollFrame:SetScript("OnShow", function(...) MicroButtonPortrait:Show() if originalPaperDollFrameOnShow then originalPaperDollFrameOnShow(...) end end)
local originalPaperDollFrameOnHide = PaperDollFrame:GetScript("OnHide")
PaperDollFrame:SetScript("OnHide", function(...) MicroButtonPortrait:Hide() if originalPaperDollFrameOnHide then originalPaperDollFrameOnHide(...) end end)

CharacterMicroButton:SetNormalTexture("Interface/BUTTONS/Custom Evo C panel");
CharacterMicroButton:SetPushedTexture("Interface/BUTTONS/Custom Evo C panel");


-- removing WorldMapMicroButton (shait classic addition to the game)
-- E: as of Patch 2.5.2 Lizzard removed it and replaced it with LFG button instead

--WorldMapMicroButton:UnregisterEvent("UNIT_PORTRAIT_UPDATE")
--MicroButtonPortrait:SetTexture(nil)

-- ^^ commented out no longer usable (maybe usable later when Lizzard introduced some similar shit again)



LFGMicroButton:SetNormalTexture("Interface/BUTTONS/WorldMapMicroButton");
LFGMicroButton:SetPushedTexture("Interface/BUTTONS/WorldMapMicroButton");




--player health bar(status bar) colouring at certain % HP;class colours

local function colour(statusbar, unit)
    if UnitIsPlayer(unit) and UnitIsConnected(unit) and unit == statusbar.unit then
        if statusbar == PlayerFrameHealthBar then
            local percent = UnitHealth("player") * 100 / UnitHealthMax("player")
            if percent <= 25 then
                statusbar:SetStatusBarColor(1, 0, 0)
            elseif percent <= 60 then
                statusbar:SetStatusBarColor(1, 1, 0)
            else
                statusbar:SetStatusBarColor(0, 1, 0)
            end
        else
            local _, class = UnitClass(unit)
            local c = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]
            if c then
                statusbar:SetStatusBarColor(c.r, c.g, c.b)
                statusbar.lockColor = true
            else
                statusbar:SetStatusBarColor(0, 1, 0)
                statusbar.lockColor = false
            end
        end
    else
        statusbar:SetStatusBarColor(0, 1, 0)
        statusbar.lockColor = false
    end
end
hooksecurefunc("UnitFrameHealthBar_Update", colour)
hooksecurefunc("UnitFrameHealthBar_OnUpdate", function(self)
    colour(self, self.unit)
end)


-- remove red tint when low on health
local function RemoveRedFromPortrait(bar)
	local parent = bar:GetParent()
   local r, g, b = parent.portrait:GetVertexColor()
   if g == 0 and r > .99 and b == 0 then
      parent.portrait:SetVertexColor(1.0, 1.0, 1.0, 1.0)
   end
end
hooksecurefunc("TargetHealthCheck", RemoveRedFromPortrait)
hooksecurefunc("PartyMemberHealthCheck", RemoveRedFromPortrait)

hooksecurefunc("TargetofTargetHealthCheck", function(self)
   local r, g, b = self.portrait:GetVertexColor()
   if g == 0 and r > .99 and b == 0 then
      self.portrait:SetVertexColor(1.0, 1.0, 1.0, 1.0)
   end
end)

-- remove low health flashing from portraits
local function RemoveFlashFromPortrait(self)
	if self.portrait:GetAlpha() < 1 then
		self.portrait:SetAlpha(1)
	end
end
hooksecurefunc("TargetFrame_HealthUpdate", RemoveFlashFromPortrait)
hooksecurefunc("PartyMemberFrame_UpdateMemberHealth", RemoveFlashFromPortrait)

-- add health and mana text to party frames
for i=1,4 do
	local pFrame = _G["PartyMemberFrame"..i]

	local healthText = pFrame.healthbar:CreateFontString(nil, "OVERLAY", "GameFontWhite")
	healthText:SetFont("Fonts/FRIZQT__.TTF", 15, "OUTLINE")
	healthText:SetPoint("CENTER")

	local manaText = pFrame.manabar:CreateFontString(nil, "OVERLAY", "GameFontWhite")
	manaText:SetFont("Fonts/FRIZQT__.TTF", 9, "OUTLINE")
	manaText:SetPoint("CENTER")

	pFrame.healthbar.fontString = healthText
	pFrame.manabar.fontString = manaText
end

hooksecurefunc("PartyMemberFrame_UpdateMemberHealth", function(self)
	local healthbar = self.healthbar
	local manabar = self.manabar

	if healthbar.finalValue ~= healthbar.lastTextValue then
		healthbar.lastTextValue = healthbar.finalValue
		healthbar.fontString:SetText(healthbar.finalValue)
	end

	if manabar.finalValue ~= manabar.lastTextValue then
		manabar.lastTextValue = manabar.finalValue
		manabar.fontString:SetText(manabar.finalValue)
	end
end)

--Blacklist of frames where tooltips mouseovering is hidden(editable)

local tooltipOwnerBlacklist = {
    "ActionButton%d+$",            -- bar buttons
    "MultiBarBottomLeftButton",
    "MultiBarBottomRightButton",
    "MultiBarLeftButton",
    "MultiBarRightButton",
    "MinimapZoneTextButton",
    "MicroButton$",                -- micro buttons
    "^KeyRingButton$",             -- key ring
    "^CharacterBag%dSlot$",        -- bags
    "^MainMenuBarBackpackButton$", -- backpack
}

local GameTooltip_OnShow = GameTooltip:GetScript("OnShow")
GameTooltip:SetScript("OnShow", function(self, ...)
    local owner = self:GetOwner() and self:GetOwner():GetName()
    if owner then
        -- hide world object tooltips like torches and signs
        if owner == "UIParent" and not self:GetUnit() then
            self:Hide()
            return
        end
        -- hide tooltips owned by frames in the blacklist
        for i=1,#tooltipOwnerBlacklist do
            if owner:find(tooltipOwnerBlacklist[i]) then
                self:Hide()
                return
            end
        end
    end
    if GameTooltip_OnShow then
        GameTooltip_OnShow(self, ...)
    end
end)


--increasing self(player)-debuff size

hooksecurefunc("DebuffButton_UpdateAnchors", function(buttonName, index)
    _G[buttonName..index]:SetScale(1.23)
end)



-- SpeedyActions level: Garage clicker

MultiBarBottomLeftButton1:RegisterForClicks("AnyDown")
MultiBarBottomLeftButton2:RegisterForClicks("AnyDown")
MultiBarBottomLeftButton3:RegisterForClicks("AnyDown")
MultiBarBottomLeftButton4:RegisterForClicks("AnyDown")
MultiBarBottomLeftButton5:RegisterForClicks("AnyDown")
MultiBarBottomLeftButton6:RegisterForClicks("AnyDown")
MultiBarBottomLeftButton7:RegisterForClicks("AnyDown")
MultiBarBottomLeftButton8:RegisterForClicks("AnyDown")
MultiBarBottomLeftButton9:RegisterForClicks("AnyDown")
MultiBarBottomLeftButton10:RegisterForClicks("AnyDown")
MultiBarBottomLeftButton11:RegisterForClicks("AnyDown")
MultiBarBottomLeftButton12:RegisterForClicks("AnyDown")

MultiBarBottomRightButton1:RegisterForClicks("AnyDown")
MultiBarBottomRightButton2:RegisterForClicks("AnyDown")
MultiBarBottomRightButton3:RegisterForClicks("AnyDown")
MultiBarBottomRightButton4:RegisterForClicks("AnyDown")
MultiBarBottomRightButton5:RegisterForClicks("AnyDown")
MultiBarBottomRightButton6:RegisterForClicks("AnyDown")
MultiBarBottomRightButton7:RegisterForClicks("AnyDown")
MultiBarBottomRightButton8:RegisterForClicks("AnyDown")
MultiBarBottomRightButton9:RegisterForClicks("AnyDown")
MultiBarBottomRightButton10:RegisterForClicks("AnyDown")
MultiBarBottomRightButton11:RegisterForClicks("AnyDown")
MultiBarBottomRightButton12:RegisterForClicks("AnyDown")

ActionButton1:RegisterForClicks("Anydown")
ActionButton2:RegisterForClicks("Anydown")
ActionButton3:RegisterForClicks("Anydown")
ActionButton4:RegisterForClicks("Anydown")
ActionButton5:RegisterForClicks("Anydown")
ActionButton6:RegisterForClicks("Anydown")
ActionButton7:RegisterForClicks("Anydown")
ActionButton8:RegisterForClicks("Anydown")
ActionButton9:RegisterForClicks("Anydown")
ActionButton10:RegisterForClicks("Anydown")
ActionButton11:RegisterForClicks("Anydown")
ActionButton12:RegisterForClicks("Anydown")

MainMenuBarBackpackButton:RegisterForClicks("Anydown")
CharacterBag1Slot:RegisterForClicks("Anydown")
CharacterBag0Slot:RegisterForClicks("Anydown")
CharacterBag2Slot:RegisterForClicks("Anydown")
CharacterBag3Slot:RegisterForClicks("Anydown")

MultiBarLeftButton1:RegisterForClicks("Anydown")
MultiBarLeftButton2:RegisterForClicks("Anydown")
MultiBarLeftButton3:RegisterForClicks("Anydown")
MultiBarLeftButton4:RegisterForClicks("Anydown")
MultiBarLeftButton5:RegisterForClicks("Anydown")
MultiBarLeftButton6:RegisterForClicks("Anydown")
MultiBarLeftButton7:RegisterForClicks("Anydown")
MultiBarLeftButton8:RegisterForClicks("Anydown")
MultiBarLeftButton9:RegisterForClicks("Anydown")
MultiBarLeftButton10:RegisterForClicks("Anydown")
MultiBarLeftButton11:RegisterForClicks("Anydown")
MultiBarLeftButton12:RegisterForClicks("Anydown")

MultiBarRightButton1:RegisterForClicks("Anydown")
MultiBarRightButton2:RegisterForClicks("Anydown")
MultiBarRightButton3:RegisterForClicks("Anydown")
MultiBarRightButton4:RegisterForClicks("Anydown")
MultiBarRightButton5:RegisterForClicks("Anydown")
MultiBarRightButton6:RegisterForClicks("Anydown")
MultiBarRightButton7:RegisterForClicks("Anydown")
MultiBarRightButton8:RegisterForClicks("Anydown")
MultiBarRightButton9:RegisterForClicks("Anydown")
MultiBarRightButton10:RegisterForClicks("Anydown")
MultiBarRightButton11:RegisterForClicks("Anydown")
MultiBarRightButton12:RegisterForClicks("Anydown")


-- move target of target to the right in order to allow clear vision of buffs/debuffs on a target, this will also be prolly mandatory when I try to resize the debuff scale to match 2.4.3

local FRAMEZ = CreateFrame("FRAME")

FRAMEZ:RegisterEvent("ADDON_LOADED")

FRAMEZ:SetScript("OnUpdate", 

	function()
		if not InCombatLockdown() then
			TargetFrameToT:ClearAllPoints();
			TargetFrameToT:SetPoint("RIGHT", "TargetFrame", "BOTTOMRIGHT", -20, 5);
			FocusFrameToT:ClearAllPoints();
			FocusFrameToT:SetPoint("RIGHT", "FocusFrame", "BOTTOMRIGHT", -20, 5);
		end

	end 
	
) 



-- Hiding some of the new retail shait UI elements

PlayerFrameGroupIndicator:Hide()


--position of minimap(remove to reset minimap position)
MinimapCluster:ClearAllPoints();
MinimapCluster:SetPoint("BOTTOMLEFT", 1186.333618164063, 595.0001831054688);



-- Increaseed nameplate DISTANCE and SIZE

local function OnEvent(self, event)
	SetCVar("nameplateMaxDistance", "41")
	SetCVar("nameplateGlobalScale", "1.2")
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", OnEvent)




--position of buff frame (for some reason Classic TBC has it more to the left than 2.4.3)
--positition of the 2 side action button bars, for some reason Classic TBC doesnt maximize the UI properly so its not possible to click on buttons by placing mouse to the border of the screen


--^^ BOTH HANDLED IN ADDON MoveAnyThing FOR NOW


--disable mouseover flashing on buttons

texture = MultiBarBottomLeftButton1:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarBottomLeftButton2:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarBottomLeftButton3:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarBottomLeftButton4:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarBottomLeftButton5:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarBottomLeftButton6:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarBottomLeftButton7:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarBottomLeftButton8:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarBottomLeftButton9:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarBottomLeftButton10:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarBottomLeftButton11:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarBottomLeftButton12:GetHighlightTexture()
texture:SetAlpha(0)

texture = MultiBarBottomRightButton1:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarBottomRightButton2:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarBottomRightButton3:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarBottomRightButton4:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarBottomRightButton5:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarBottomRightButton6:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarBottomRightButton7:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarBottomRightButton8:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarBottomRightButton9:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarBottomRightButton10:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarBottomRightButton11:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarBottomRightButton12:GetHighlightTexture()
texture:SetAlpha(0)

texture = MultiBarLeftButton1:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarLeftButton2:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarLeftButton3:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarLeftButton4:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarLeftButton5:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarLeftButton6:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarLeftButton7:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarLeftButton8:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarLeftButton9:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarLeftButton10:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarLeftButton11:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarLeftButton12:GetHighlightTexture()
texture:SetAlpha(0)

texture = MultiBarRightButton1:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarRightButton2:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarRightButton3:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarRightButton4:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarRightButton5:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarRightButton6:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarRightButton7:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarRightButton8:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarRightButton9:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarRightButton10:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarRightButton11:GetHighlightTexture()
texture:SetAlpha(0)
texture = MultiBarRightButton12:GetHighlightTexture()
texture:SetAlpha(0)

texture = ActionButton1:GetHighlightTexture()
texture:SetAlpha(0)
texture = ActionButton2:GetHighlightTexture()
texture:SetAlpha(0)
texture = ActionButton3:GetHighlightTexture()
texture:SetAlpha(0)
texture = ActionButton4:GetHighlightTexture()
texture:SetAlpha(0)
texture = ActionButton5:GetHighlightTexture()
texture:SetAlpha(0)
texture = ActionButton6:GetHighlightTexture()
texture:SetAlpha(0)
texture = ActionButton7:GetHighlightTexture()
texture:SetAlpha(0)
texture = ActionButton8:GetHighlightTexture()
texture:SetAlpha(0)
texture = ActionButton9:GetHighlightTexture()
texture:SetAlpha(0)
texture = ActionButton10:GetHighlightTexture()
texture:SetAlpha(0)
texture = ActionButton11:GetHighlightTexture()
texture:SetAlpha(0)
texture = ActionButton12:GetHighlightTexture()
texture:SetAlpha(0)

texture = MainMenuBarBackpackButton:GetHighlightTexture()
texture:SetAlpha(0)

texture = CharacterBag0Slot:GetHighlightTexture()
texture:SetAlpha(0)

texture = CharacterBag1Slot:GetHighlightTexture()
texture:SetAlpha(0)

texture = CharacterBag2Slot:GetHighlightTexture()
texture:SetAlpha(0)

texture = CharacterBag3Slot:GetHighlightTexture()
texture:SetAlpha(0)

texture = CharacterMicroButton:GetHighlightTexture()
texture:SetAlpha(0)

texture = SpellbookMicroButton:GetHighlightTexture()
texture:SetAlpha(0)

texture = TalentMicroButton:GetHighlightTexture()
texture:SetAlpha(0)

texture = QuestLogMicroButton:GetHighlightTexture()
texture:SetAlpha(0)

texture = SocialsMicroButton:GetHighlightTexture()
texture:SetAlpha(0)

-- |Patch 2.5.2 no longer valid| texture = WorldMapMicroButton:GetHighlightTexture()
-- |Patch 2.5.2 no longer vlaid| texture:SetAlpha(0)

texture = LFGMicroButton:GetHighlightTexture()
texture:SetAlpha(0)

texture = MainMenuMicroButton:GetHighlightTexture()
texture:SetAlpha(0)

texture = HelpMicroButton:GetHighlightTexture()
texture:SetAlpha(0)



-- Remove Fizzle sounds (this was previously done by replacing the actual sound in Data/Sounds)

local sounds = {
	569772, -- sound/spells/fizzle/fizzleholya.ogg
	569773, -- sound/spells/fizzle/fizzlefirea.ogg
	569774, -- sound/spells/fizzle/fizzlenaturea.ogg
	569775, -- sound/spells/fizzle/fizzlefrosta.ogg
	569776, -- sound/spells/fizzle/fizzleshadowa.ogg
	567407, -- sound/interface/uchatscrollbutton.ogg annoying clicking sound when you press a spell on action bar
}

for _, fdid in pairs(sounds) do
	MuteSoundFile(fdid)
end


-- highlight dispelable shit from enemies target/focus

local function Update(frame)
    local buffFrame, frameStealable, icon, debuffType, isStealable, _
    local selfName = frame:GetName()
    local isEnemy = UnitIsEnemy(PlayerFrame.unit, frame.unit)
    for i = 1, MAX_TARGET_BUFFS do
        _, icon, _, debuffType, _, _, _, isStealable = UnitBuff(frame.unit, i)
        if (icon and (not frame.maxBuffs or i <= frame.maxBuffs)) then
            local frameName = selfName .. 'Buff' .. i
            buffFrame = _G[frameName]
            frameStealable = _G[frameName .. 'Stealable']
            if (isEnemy and frameStealable and debuffType == 'Magic') then
                frameStealable:Show()
            end
        end
    end
end
TargetFrame:HookScript("OnEvent", function(self) Update(self) end)
FocusFrame:HookScript("OnEvent", function(self) Update(self) end)

-- remove the shitty new client "raid frame manager" left gray bar next to the party frames (currently shows on/off on mouseover)



local manager = CompactRaidFrameManager
manager:SetAlpha(0)
-- look through a frame's parents
local function FindParent(frame, target)
	if frame == target then
		return true
	elseif frame then
		return FindParent(frame:GetParent(), target)
	end
end

manager:HookScript("OnEnter", function(self)
	self:SetAlpha(1)
end)

manager:HookScript("OnLeave", function(self)
	if manager.collapsed and not FindParent(GetMouseFocus(), self) then
		self:SetAlpha(0)
	end
end)

manager.toggleButton:HookScript("OnClick", function()
	if manager.collapsed then
		manager:SetAlpha(0)
	end
end)
-- keep the container frame visible
manager.container:SetIgnoreParentAlpha(true)
manager.containerResizeFrame:SetIgnoreParentAlpha(true)



-- Temporary way to disable the dogshit cata spellqueue they brought to tbc instead of using the proper Retail TBC one that bypasses GCD: /console SpellQueueWindow 0


-- ^^ current value for testing:100, 400 was too cancerous - sometimes prevented the cast with /cqs+cast macro altogether

-- Ingame commmand for classcoloured names in chat: /console SET chatClassColorOverride "0"
-- trying to remove the cancer wheather that is not part of the video settings as it used to be in 2.4.3: /console set weatherdensity 0 // /console WeatherDensity 0

--Login message informing all scripts of this file were properly executed

ChatFrame1:AddMessage("EvolvePWPUI-ClassicTBC v0.4 Loaded successfully!",255,255,0)
ChatFrame1:AddMessage("Check for updates at:",255,255,0)
ChatFrame1:AddMessage("https://github.com/Evolvee/EvolvePWPUI-ClassicTBC",255,255,0)
