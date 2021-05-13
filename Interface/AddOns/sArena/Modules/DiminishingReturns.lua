sArenaMixin.drCategories = {
    "Stun",
	"KidneyShot",
    "Incapacitate",
	"Fear",
	"Horror",
	"Charm",
    "Disorient",
	"Disarm",
	"DisorientSmall",
    "Root",
	
}
sArenaMixin.defaultSettings.profile.drCategories = {
    Stun = true,
    Incapacitate = true,
    Disorient = true,
	Fear = true,
	Horror = true,
	Charm = true,
    Root = true,
	DisorientSmall = true,
	Disarm = true,
	KydneyShot = true,
}

local drCategories = sArenaMixin.drCategories
local drList
local drTime = 18.5
local severityColor = {
    [1] = { 0, 1, 0, 1},
    [2] = { 1, 1, 0, 1},
    [3] = { 1, 0, 0, 1},
}


local GetTime = GetTime

function sArenaFrameMixin:FindDR(combatEvent, spellID)
    local category = drList[spellID]
    if ( not category ) then return end
    if ( not self.parent.db.profile.drCategories[category] ) then return end

    local frame = self[category]
    local currTime = GetTime()

    if ( combatEvent == "SPELL_AURA_REMOVED" or combatEvent == "SPELL_AURA_BROKEN" ) then
		local startTime, startDuration = frame.Cooldown:GetCooldownTimes()
		startTime, startDuration = startTime/1000, startDuration/1000
		
		-- Was unable to reproduce bug where CC would break 
		-- instantly after appliction (Shatter pet nova) but DR timer didnt start on SPELL_AURA_APPLIED
		-- So on SPELL_AURA_BROKEN frame.Cooldown:GetCooldownTimes() gave 0.
		
		if not ( startTime == 0 or startDuration == 0 ) then  
		
			local newDuration = drTime / (1 - ((currTime - startTime) / startDuration))
			local newStartTime = drTime + currTime - newDuration

			frame:Show()
			frame.Cooldown:SetCooldown(newStartTime, newDuration)
		else
			frame:Show()
			frame.Cooldown:SetCooldown(currTime, drTime)
		end
		return
    elseif ( combatEvent == "SPELL_AURA_APPLIED" or combatEvent == "SPELL_AURA_REFRESH" ) then
		local unit = self.unit

		for i = 1, 30 do
		    local _, _, _, _, duration, _, _, _, _, _spellID = UnitAura(unit, i, "HARMFUL")

		    if ( not _spellID ) then break end

		    if ( duration and spellID == _spellID ) then
				frame:Show()
				frame.Cooldown:SetCooldown(currTime, duration + drTime)
				break
		    end
		end
    end

    frame.Icon:SetTexture(select(3, GetSpellInfo(spellID)))
    frame.Border:SetVertexColor(unpack(severityColor[frame.severity]))

    frame.severity = frame.severity + 1
    if frame.severity > 3 then
		frame.severity = 3
    end
end

function sArenaFrameMixin:UpdateDRPositions()
    local layoutdb = self.parent.layoutdb
    local numActive = 0
    local frame, prevFrame
    local spacing = layoutdb.dr.spacing
    local growthDirection = layoutdb.dr.growthDirection

    for i = 1, #drCategories do
		frame = self[drCategories[i]]

		if ( frame:IsShown() ) then
		    frame:ClearAllPoints()
		    if ( numActive == 0 ) then
				frame:SetPoint("CENTER", self, "CENTER", layoutdb.dr.posX, layoutdb.dr.posY)
		    else
				if ( growthDirection == 4 ) then frame:SetPoint("RIGHT", prevFrame, "LEFT", -spacing, 0)
				elseif ( growthDirection == 3 ) then frame:SetPoint("LEFT", prevFrame, "RIGHT", spacing, 0)
				elseif ( growthDirection == 1 ) then frame:SetPoint("TOP", prevFrame, "BOTTOM", 0, -spacing)
				elseif ( growthDirection == 2 ) then frame:SetPoint("BOTTOM", prevFrame, "TOP", 0, spacing)
				end
		    end
		    numActive = numActive + 1
		    prevFrame = frame
		end
    end
end

function sArenaFrameMixin:ResetDR()
    for i = 1, #drCategories do
		self[drCategories[i]].Cooldown:Clear()
		--DR frames would somehow persist through several games, showing just icon and no DR, havent found the cause
		self[drCategories[i]]:Hide()
    end
end

drList = {
		 -- DRUID
		[33786] = "Disorient",		   				-- Cyclone
		[18658] = "Incapacitate",				  -- Hibernate R3
		[18657] = "Incapacitate",				  -- Hibernate R2
		[2637] = "Incapacitate",				  -- Hibernate R1 
		[26989] = "Root",		   				 -- Entangling roots R7
		[9853] = "Root",		   				 -- Entangling roots R6
		[9852] = "Root",		   				 -- Entangling roots R5
		[5196] = "Root",		   				 -- Entangling roots R4
		[5195] = "Root",		   				 -- Entangling roots R3
		[1062] = "Root",		   				 -- Entangling roots R2
		[339] = "Root",		   					 -- Entangling roots R1
		
		[19975]  = "Root",				-- Entangling Roots R1 (Nature's Grasp talent)
		[19974]  = "Root",				-- Entangling Roots R2 (Nature's Grasp talent)
		[19973]  = "Root",				-- Entangling Roots R3 (Nature's Grasp talent)
		[19972]  = "Root",				-- Entangling Roots R4 (Nature's Grasp talent)
		[19971]  = "Root",				-- Entangling Roots R5 (Nature's Grasp talent)
		[19970]  = "Root",				-- Entangling Roots R6 (Nature's Grasp talent)
		[27010] = "Root",		   		-- Entangling Roots R7 (Nature's Grasp talent)
		
		[8983] = "Stun",				    -- Bash R3
		[6798] = "Stun",				    -- Bash R2
		[5211] = "Stun",				    -- Bash R1
		
		[27006] = "Stun",				    -- Pounce R4
		[9827] = "Stun",				    -- Pounce R3
		[9823] = "Stun",				    -- Pounce R2
		[9005] = "Stun",				    -- Pounce R1
		
		[22570] = "Incapacitate",		      -- Maim

		-- HUNTER
		[14309] = "Incapacitate",		   -- Freezing Trap R3
		[14308] = "Incapacitate",		   -- Freezing Trap R2
		[3355] = "Incapacitate",		   -- Freezing Trap R1
		
		[27068] = "Incapacitate",				  -- Wyvern Sting R4
		[24133] = "Incapacitate",				  -- Wyvern Sting R3
		[24132] = "Incapacitate",				  -- Wyvern Sting R2
		[19386] = "Incapacitate",				  -- Wyvern Sting R1
		
		[19503] = "DisorientSmall",		    -- Scatter Shot
		[19577] = "Stun",				   -- Intimidation ?
		[24394] = "Stun",				   -- Intimidation Trigger
		
		[27067] = "Root",		   			-- Counterattack R1
		[20910] = "Root",		   			-- Counterattack R1
		[20909] = "Root",		   			-- Counterattack R1
		[19306] = "Root",		   			-- Counterattack R1
		
		[25999]  = "Root",				-- Boar Charge (Boar)
		[4167]   = "Root",				-- Web R1
		[4168]   = "Root",				-- Web R2
		[4169]   = "Root",				-- Web R3
		
		[14327]  = "Fear",					-- Scare Beast R3
		[14326]  = "Fear",					-- Scare Beast R2
		[1513]   = "Fear",					-- Scare Beast R1

		-- MAGE
		[12826] = "Incapacitate",		      -- Polymorph R4
		[12825] = "Incapacitate",		      -- Polymorph R3
		[12824] = "Incapacitate",		      -- Polymorph R2
		[118] = "Incapacitate",		     	 -- Polymorph R1
		
		[28271] = "Incapacitate",		      -- Polymorph: Turtle
		[28272] = "Incapacitate",		      -- Polymorph: Pig
		
		[33043] = "DisorientSmall",		  -- Dragon's Breath R4
		[33042] = "DisorientSmall",		  -- Dragon's Breath R3
		[33041] = "DisorientSmall",		  -- Dragon's Breath R2
		[31661] = "DisorientSmall",		  -- Dragon's Breath R1
		
		[27088] = "Root",				   -- Frost Nova R5
		[10230] = "Root",				   -- Frost Nova R4
		[6131] = "Root",				   -- Frost Nova R3
		[865] = "Root",			  			-- Frost Nova R2
		[122] = "Root",			  			-- Frost Nova R1
		
		[33395] = "Root",				   -- Freeze (Water Elemental)

		-- PALADIN
		[10308] = "Stun",				   -- Hammer of Justice R4
		[5589] = "Stun",				   -- Hammer of Justice R3
		[5588] = "Stun",				   -- Hammer of Justice R2
		[853] = "Stun",				   		-- Hammer of Justice R1
		[20066] = "Incapacitate",		     -- Repentance
		[10326]  = "Fear",					-- Turn Evil (rank 1)

		-- PRIEST
		[10890] = "Fear",				    -- Phychic Scream R4
		[10888] = "Fear",				    -- Phychic Scream R3
		[8124] = "Fear",				    -- Phychic Scream R2
		[8122] = "Fear",				    -- Phychic Scream R1
		
		[44047] = "Root",				   -- Chastise R6
		[44046] = "Root",				   -- Chastise R5
		[44045] = "Root",				   -- Chastise R4
		[44044] = "Root",				   -- Chastise R3
		[44043] = "Root",				   -- Chastise R2
		[44041] = "Root",				   -- Chastise R1
		
		[10912] = "Charm",				    -- Mind Control R3
		[10911] = "Charm",				    -- Mind Control R2
		[605] = "Charm",				    -- Mind Control R1

		-- ROGUE
		[11297] = "Incapacitate",			-- Sap R3
		[2070] = "Incapacitate",			-- Sap R2
		[6770] = "Incapacitate",			-- Sap R1
		[2094] = "Disorient",				-- Blind
		[1833] = "Stun",					-- Cheap Shot
		[8643] = "KidneyShot",				-- Kidney Shot
		
		[14251]  = "Disarm",		  -- Riposte
		
		[38764] = "Incapacitate",			-- Gouge R6
		[11286] = "Incapacitate",			-- Gouge R5
		[11285] = "Incapacitate",			-- Gouge R4
		[8629] = "Incapacitate",			-- Gouge R3
		[1777] = "Incapacitate",			-- Gouge R2
		[1776] = "Incapacitate",			-- Gouge R1


		-- WARLOCK
		[6215] = "Fear",				    -- Fear R3
		[6213] = "Fear",				    -- Fear R2
		[5782] = "Fear",				    -- Fear R1
		
		[27223] = "Horror",				 -- Death Coil R4
		[17926] = "Horror",				 -- Death Coil R3
		[17925] = "Horror",				 -- Death Coil R2
		[6789] = "Horror",				 -- Death Coil R1
		
		[30414] = "Stun",				   -- Shadowfury R3
		[30413] = "Stun",				   -- Shadowfury R2
		[30283] = "Stun",				   -- Shadowfury R1
		
		[6358] = "Fear",				    -- Seduction (Succubus)
		
		[17928] = "Fear",				    -- Howl of Terror R3
		[5484] = "Fear",				    -- Howl of Terror R1
		
		
		[30153] = "Stun", 					-- Intercept (Felguard) Rank 1
		[30195] = "Stun",  					-- Intercept (Felguard) Rank 2
		[30197] = "Stun",  					-- Intercept (Felguard) Rank 3


		-- WARRIOR
		[12809] = "Stun",				   -- Concussion Blow
		[25274] = "Stun",				   -- Intercept Stun
		[7922] = "Stun",				   -- Charge Stun
		[5246] = "Fear",				    -- Intimidating Shout
		[20511] = "Fear",				    -- Intimidating Shout??
		
		[676]  = "Disarm",		  			-- Disarm

		-- TAUREN
		[20549] = "Stun",				   -- War Stomp
  
}
