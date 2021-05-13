local GetTime = GetTime

sArenaMixin.defaultSettings.profile.racialCategories = {
    ["Human"] = true,
    ["Scourge"] = true,
	["Gnome"] = true,
	["Dwarf"] = true,
	["Orc"] = true,
	["Tauren"] = true,
	["BloodElf"] = true,
	["Troll"] = true,
	["Draenei"] = false,
	["NightElf"] = false,
}

local racialSpells = {
    [20549] = 120,  -- War Stomp
    [7744] = 120,   -- Will of the Forsaken
	[20554] = 180,   -- Berserking
	[20572] = 120,   -- Blood Fury
	[20580] = 10,   -- Shadowmeld
	[20589] = 105,   -- Escape Artist
	[20594] = 180,   -- Stoneform
	[20600] = 180,   -- Preception
	[26297] = 180,   -- Berserking - Rogue
	[28880] = 180,   -- Gift of the Naaru
	[26296] = 180,   -- Berserking - Warr
	[33702] = 120,   -- Blood Fury - Caster
	[25046] = 120,   -- Arcane Torrent - Rogue
	[28730] = 120,   -- Arcane Torrent 
	
}

local racialData = {
    ["Human"] = { texture = GetSpellTexture(20600)},
    ["Scourge"] = { texture = GetSpellTexture(7744)},
	["Gnome"] = { texture = GetSpellTexture(20589)},
	["Dwarf"] = { texture = GetSpellTexture(20594)},
	["Orc"] = { texture = GetSpellTexture(20572)},
	["Tauren"] = { texture = GetSpellTexture(20549)},
	["BloodElf"] = { texture = GetSpellTexture(28730)},
	["Troll"] = { texture = GetSpellTexture(26296)},
	["Draenei"] = { texture = GetSpellTexture(28880)},
	["NightElf"] = { texture = GetSpellTexture(20580)},
}

local function GetRemainingCD(frame)
    local startTime, duration = frame:GetCooldownTimes()
    if ( startTime == 0 ) then return 0 end

    local currTime = GetTime()

    return (startTime + duration) / 1000 - currTime
end

function sArenaFrameMixin:FindRacial(event, spellID)
    if ( event ~= "SPELL_CAST_SUCCESS" ) then return end

    local duration = racialSpells[spellID]

    if ( duration ) then
        local currTime = GetTime()

        if ( self.Racial.Texture:GetTexture() ) then
            self.Racial.Cooldown:SetCooldown(currTime, duration)
        end
		
	end
end

function sArenaFrameMixin:UpdateRacial()
    if ( not self.race ) then
        self.race = select(2, UnitRace(self.unit))

        if ( self.parent.db.profile.racialCategories[self.race] ) then
            self.Racial.Texture:SetTexture(racialData[self.race].texture)
        end
    end
end

function sArenaFrameMixin:ResetRacial()
    self.race = nil
    self.Racial.Texture:SetTexture(nil)
    self.Racial.Cooldown:Clear()
    self:UpdateRacial()
end