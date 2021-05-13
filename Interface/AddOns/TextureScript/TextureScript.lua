--EVOLVE PWP UI


--dark theme
local frame2=CreateFrame("Frame")
frame2:RegisterEvent("ADDON_LOADED")
frame2:SetScript("OnEvent", function(self, event, addon)
        if (addon == "Blizzard_TimeManager") then
                for i, v in pairs({PlayerFrameTexture, TargetFrameTextureFrameTexture, FocusFrameTextureFrameTexture, PetFrameTexture, PartyMemberFrame1Texture, PartyMemberFrame2Texture, PartyMemberFrame3Texture, PartyMemberFrame4Texture, SlidingActionBarTexture0,
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



-- ToT texture closing the alpha gap (may need recheck when classportraits are implemented)

TargetFrameToTTextureFrameTexture:SetVertexColor(0,0,0)



--position of minimap(remove to reset minimap position)
MinimapCluster:ClearAllPoints();
MinimapCluster:SetPoint("BOTTOMLEFT", 1186.333618164063, 595.0001831054688);


--increasing player-debuff size






-- get the old style party frames back when in raid .oO(like srsly Lizzard, u arent even going to fucking give us an option to disable this modern abomination retail shait?)


local frame = CreateFrame("FRAME", "PartyFrame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")


local function eventHandler(self,event,...)
local partyMemberFrames = {
    PartyMemberFrame1, PartyMemberFrame2, PartyMemberFrame3, PartyMemberFrame4
}
local partyMemberFrameTextures = {
    PartyMemberFrame1Texture, PartyMemberFrame2Texture, PartyMemberFrame3Texture, PartyMemberFrame4Texture
}

    local members = GetNumGroupMembers()
    if members > 1 then
        ShowPartyFrame();
        for i=1,#partyMemberFrames do
            partyMemberFrames[i]:SetScale(1)
        end
        for i=1,#partyMemberFrameTextures do
            partyMemberFrameTextures[i]:SetVertexColor(0,0,0)
        end        
    end
end
frame:SetScript("OnUpdate", eventHandler)

CompactRaidFrameManager:UnregisterAllEvents() CompactRaidFrameManager:Hide() CompactRaidFrameContainer:UnregisterAllEvents() CompactRaidFrameContainer:Hide()











--minimap buttons, horder/alliance icons on target/focus/player,minimap city location, minimap sun/clock, minimap text frame,minimap zoomable with mousewheel etc

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








--Left and Right Dragons on action bar hidden

MainMenuBarLeftEndCap:Hide();MainMenuBarRightEndCap:Hide()





--Hidden Player glow combat/rested flashes + Hidden Focus Flash on Focused Target + Trying to completely hide the red glowing status on target/focus frames when they have low HP(this is not completely fixed yet)













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
   MainMenuExpBar = "",
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
        local frames = {WorldFrame:GetChildren()}
        for _, plate in ipairs(frames) do
            if isPlate(plate) and plate:IsVisible() then
                local v = plate:GetChildren()
                SmoothBar(v)
            end
        end
        AnimationTick()
    end)
 
     for k,v in pairs (barstosmooth) do
      if _G[k] then
         SmoothBar(_G[k])
_G[k]:SetScript("OnHide", function() this.lastGuid = nil; this.max_ = nil end)
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



--position of minimap(remove to reset minimap position)
MinimapCluster:ClearAllPoints();
MinimapCluster:SetPoint("BOTTOMLEFT", 1186.333618164063, 595.0001831054688);

--removing character "C" button image

CharacterMicroButton:UnregisterEvent("UNIT_PORTRAIT_UPDATE")
MicroButtonPortrait:SetTexture(nil)
CharacterMicroButton:SetNormalTexture("Interface/BUTTONS/Custom Evo C panel");
CharacterMicroButton:SetPushedTexture("Interface/BUTTONS/Custom Evo C panel");


-- removing WorldMapMicroButton (shait classic addition to the game)

WorldMapMicroButton:UnregisterEvent("UNIT_PORTRAIT_UPDATE")
MicroButtonPortrait:SetTexture(nil)
WorldMapMicroButton:SetNormalTexture("Interface/BUTTONS/WorldMapMicroButton");
WorldMapMicroButton:SetPushedTexture("Interface/BUTTONS/WorldMapMicroButton");



--player health bar(status bar) colouring at certain % HP;class colours

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
            end
        end
    end
end
hooksecurefunc("UnitFrameHealthBar_Update", colour)
hooksecurefunc("UnitFrameHealthBar_OnUpdate", function(self)
    colour(self, self.unit)
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

--XP bar + reputation bar visual rework


local BACKDROP = {  bgFile = [[Interface\Tooltips\UI-Tooltip-Background]],
                    insets = {left = -1, right = -1, top = -1, bottom = -1} }
local _, class = UnitClass'Player'
local colour = RAID_CLASS_COLORS[class]
local orig = {}

orig.ReputationWatchBar_Update = ReputationWatchBar_Update

if BackdropTemplateMixin then
    Mixin(MainMenuExpBar, BackdropTemplateMixin)
end

MainMenuExpBar:SetWidth(1021) MainMenuExpBar:SetHeight(5)
MainMenuExpBar:ClearAllPoints() MainMenuExpBar:SetPoint('TOP', MainMenuBar, 0, -4)
MainMenuExpBar:SetBackdrop(BACKDROP)
MainMenuExpBar:SetBackdropColor(0, 0, 0, 1)

MainMenuExpBar.spark = MainMenuExpBar:CreateTexture(nil, 'OVERLAY', nil, 7)
MainMenuExpBar.spark:SetTexture[[Interface\CastingBar\UI-CastingBar-Spark]]
MainMenuExpBar.spark:SetWidth(35) MainMenuExpBar.spark:SetHeight(35)
MainMenuExpBar.spark:SetBlendMode'ADD'

MainMenuExpBar.rep = MainMenuExpBar:CreateFontString(nil, 'OVERLAY')
MainMenuExpBar.rep:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
MainMenuExpBar.rep:SetPoint('RIGHT', MainMenuBarExpText, 'LEFT')

if BackdropTemplateMixin then
    Mixin(ReputationWatchBar, BackdropTemplateMixin)
end

ReputationWatchBar:SetWidth(1021)
ReputationWatchBar:SetBackdrop(BACKDROP)
ReputationWatchBar:SetBackdropColor(0, 0, 0, 1)

ReputationWatchBar.StatusBar.spark = ReputationWatchBar.StatusBar:CreateTexture(nil, 'OVERLAY', nil, 7)
ReputationWatchBar.StatusBar.spark:SetTexture[[Interface\CastingBar\UI-CastingBar-Spark]]
ReputationWatchBar.StatusBar.spark:SetWidth(35) ReputationWatchBar.StatusBar.spark:SetHeight(35)
ReputationWatchBar.StatusBar.spark:SetBlendMode'ADD'
ReputationWatchBar.StatusBar.spark:SetVertexColor(colour.r*1.3, colour.g*1.3, colour.b*1.3, .6)

for i = 0, 3 do
    _G['MainMenuXPBarTexture'..i]:SetTexture('')
    _G['ReputationWatchBar']['StatusBar']['WatchBarTexture'..i]:SetTexture('')
    _G['ReputationWatchBar']['StatusBar']['XPBarTexture'..i]:SetTexture('')
end

function MainMenuExpBar_Update()
    local xp, next = UnitXP'player', UnitXPMax'player'
    MainMenuExpBar:SetMinMaxValues(min(0, xp), next)
    MainMenuExpBar:SetValue(math.floor(xp))
end

function ReputationWatchBar_Update(newLevel)
    if not newLevel then newLevel = UnitLevel'player' end
    orig.ReputationWatchBar_Update(newLevel)
    local name, standing, min, max, v = GetWatchedFactionInfo()
    local percent = math.floor((v - min)/(max - min)*100)
    local x

    local bar  = ReputationWatchBar
    local sb   = ReputationWatchBar.StatusBar
    local text = ReputationWatchBar.StatusBarText

    if v > 0 then x = ((v - min)/(max - min))*bar:GetWidth() end

    bar:SetFrameStrata'LOW'
    bar:SetHeight(newLevel < MAX_PLAYER_LEVEL and 4 or 5)

    if newLevel == MAX_PLAYER_LEVEL then
        bar:ClearAllPoints()
        bar:SetPoint('TOP', MainMenuBar, 0, -4)
        text:SetPoint('CENTER', ReputationWatchBarOverlayFrame, 0, 3)
        text:SetDrawLayer('OVERLAY', 7)
        if name then
            text:SetFont(STANDARD_TEXT_FONT, 12, 'OUTLINE')
            if GetCVar'modValue' == '1' then
                text:SetText(name..': '..true_format((v - min))..' / '..true_format((max - min)))
            else
                text:SetText(name..': '..percent..'% into '.._G['FACTION_STANDING_LABEL'..standing])
            end
        end
        MainMenuExpBar.spark:Hide()
    else
        TextStatusBar_UpdateTextString(MainMenuExpBar)
        text:SetText''
        MainMenuExpBar.spark:Show()
    end

    sb:SetHeight(newLevel < MAX_PLAYER_LEVEL and 4 or 5)
    sb:SetStatusBarColor(colour.r, colour.g, colour.b, 1)
    sb.spark:SetPoint('CENTER', sb, 'LEFT', x, -1)
end

local f = CreateFrame'Frame'
f:RegisterEvent'CVAR_UPDATE'
f:RegisterEvent'PLAYER_ENTERING_WORLD' f:RegisterEvent'PLAYER_XP_UPDATE'
f:RegisterEvent'UPDATE_EXHAUSTION'     f:RegisterEvent'PLAYER_LEVEL_UP'
f:SetScript('OnEvent', function()
    local xp, max = UnitXP'player', UnitXPMax'player'
    local x = (xp/max)*MainMenuExpBar:GetWidth()
    MainMenuExpBar.spark:SetPoint('CENTER', MainMenuExpBar, 'LEFT', x, -1)
    if event == 'PLAYER_ENTERING_WORLD' or event == 'UPDATE_EXHAUSTION' then
        local rest = GetRestState()
        if rest == 1 then
            MainMenuExpBar.spark:SetVertexColor(0*1.5, .39*1.5, .88*1.5, 1)
        elseif rest == 2 then
            MainMenuExpBar.spark:SetVertexColor(.58*1.5, 0*1.5, .55*1.5, 1)
        end
    end
end)

--increasing player-debuff size

hooksecurefunc("DebuffButton_UpdateAnchors", function(buttonName, index)
    _G[buttonName..index]:SetScale(1.23)
end)







--Login message informing all scripts of this file were properly executed

ChatFrame1:AddMessage("EvolvePWPUI 2.2 Loaded successfully!",255,255,0)
ChatFrame1:AddMessage("Check for updates at:",255,255,0)
ChatFrame1:AddMessage("https://github.com/Evolvee/EvolvePWPUI-ClassicTBC",255,255,0)
