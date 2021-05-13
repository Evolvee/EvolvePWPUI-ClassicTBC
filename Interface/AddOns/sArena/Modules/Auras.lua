sArenaMixin.interruptList = {

     -- Interrupts
  
	[38768] = 5,	-- Kick (Rogue) R5
	[1769] = 5,	-- Kick (Rogue) R4
	[1768] = 5,	-- Kick (Rogue) R3
	[1767] = 5,	-- Kick (Rogue) R2
	[1766] = 5,   -- Kick (Rogue) R1
	
    [2139] = 8,   -- Counterspell (Mage)
	--[18469] = 2,  -- Counterspell - Silenced
	
    [6552] = 5,   -- Pummel (Warrior) R1
	[6554] = 5,   -- Pummel (Warrior) R2
	
	[29704] = 6,	-- Shield Bash (Warrior) R4
	[1672] = 6,	-- Shield Bash (Warrior) R3
	[1671] = 6,	-- Shield Bash (Warrior) R2
	[72] = 6,		-- Shield Bash (Warrior) R1
	
    [19647] = 6,  -- Spell Lock (Warlock) R2
	--[19244] = 2,  -- Spell Lock - Effect
	[24259] = 5,	-- Spell Lock (Warlock) R1
	[31117] = 5,  	-- Unstable Affliction - Silence 1
	[43523] = 5,	-- Unstable Affliction - Silence 2

	[19675] = 4,	-- Feral Charge - Interrupt Effect
	
	--[34490] = 3,	-- Silencing Shot - Effect
	
	[26679] = 3,	-- Deadly Throw - Interrupt
	--[1330] = 3,	-- Garrote - Silence
};

sArenaMixin.auraList = tInvert({
    -- Higher up = higher priority

    -- CCs
	-- Stun
	33786,	-- Cyclone
	
	10912,	-- Mind Control R3
	10911,	-- Mind Control R2
	605,	-- Mind Control R1
	
	8643,	-- Kidney Shot
	10308,	-- Hammer of Justice R4
	
	8983,	-- Bash R3
	12809,	-- Concussion Blow
	5589,	-- Hammer of Justice R3
	
	1833,	-- Cheap Shot
	
	27006,	-- Pounce
	9827,	-- Pounce
	9823,	-- Pounce
	9005,	-- Pounce
	
	25274,	-- Intercept Stun
	
	30153,	-- Intercept (Felguard) Rank 1
	30195, 	-- Intercept (Felguard) Rank 2
	30197, 	-- Intercept (Felguard) Rank 3
	
	5588,	-- Hammer of Justice R2
	6798,	-- Bash R2
	
	30414,	-- Shadowfury R3
	30413,	-- Shadowfury R2
	30283,	-- Shadowfury R1
	20549,	-- War Stomp

	5211,	-- Bash R1
	853,	-- Hammer of Justice R1
	
	19577,	-- Intimidation ?
	24394,	-- Intimidation Trigger

	
	7922,	-- Charge Stun
	
	27223,	-- Death Coil R4
	17926,	-- Death Coil R3
	17925,	-- Death Coil R2
	6789,	-- Death Coil R1

	-- Stun Proc
	
	34510,	-- Stormheral Stun
	5530,	-- Mace Specialization
	19410,	-- Improved Concussive Shot
	28445,	-- Improved Concussive Shot
	20170,	-- Seal of Justice Stun
	18093,  -- Pyroclasm ???
	16922,	-- Starfire Stun
	15269,	-- Blackout
	12355,	-- Impact
	23454,	-- Brutal Earthstorm Diamond
	
	-- Disorient / Incapacitate / Fear / Charm

	2094,	-- Blind
	19503,	-- Scatter Shot
	33043,	-- Dragon's Breath R4
	33042,	-- Dragon's Breath R3
	33041,	-- Dragon's Breath R2
	31661,	-- Dragon's Breath R1
	
	18658,	-- Hibernate R3
	18657,	-- Hibernate R2
	2637,	-- Hibernate R1 
	14309,	-- Freezing Trap -Effect R3
	14308,	-- Freezing Trap - Effect R2
	3355,	-- Freezing Trap - Effect R1
	
	27068,	-- Wyvern Sting R4
	24133,	-- Wyvern Sting R3
	24132,	-- Wyvern Sting R2
	19386,	-- Wyvern Sting R1
	
	12826,	-- Polymorph R4
	12825,	-- Polymorph R3
	12824,	-- Polymorph R2
	118,	-- Polymorph R1
	
	28271,	-- Polymorph: Turtle
	28272,	-- Polymorph: Pig
	
	
	6358,	-- Seduction (Succubus)
	
	17928,	-- Howl of Terror R3
	5484,	-- Howl of Terror R1
	
	6215,	-- Fear R3
	6213,	-- Fear R2
	5782,	-- Fear R1
	
	10890,	-- Phychic Scream R4
	10888,	-- Phychic Scream R3
	8124,	-- Phychic Scream R2
	8122,	-- Phychic Scream R1
	
	5246,				    -- Intimidating Shout
	20511,				    -- Intimidating Shout??
	
	10326,-- Turn Evil (rank 1)
	
	
	20066,	-- Repentance
	22570,	-- Maim
	
	
	11297,	-- Sap R3
	2070,	-- Sap R2
	6770,	-- Sap R1
	
	38764,	-- Gouge R6
	11286,	-- Gouge R5
	11285,	-- Gouge R4
	8629,	-- Gouge R3
	1777,	-- Gouge R2
	1776,	-- Gouge R1
	
	


    -- Immunities
    1020,   -- Divine Shield R2
	642,    -- Divine Shield R1
	5573,	-- Divine Protection KEKW
	498,	-- Divine Protection KEKW
    45438,  -- Ice Block
	34692, 	-- The Beast Within
	26064,	-- Shell Shield (damage taken reduced 50%) (Turtle)
	19574,	-- Bestial Wrath 
	3411,	-- Intervene
	10278,  -- Blessing of Protection
    1044, 	-- Blessing of Freedom
	
	--6346,	-- Fear Ward (!)
	
	4511,	-- Phase Shift
	
	20594,	-- Stoneform (dwarf racial)
   
	31224,  -- Cloak of Shadows

	27827, 	--Spirit of Redemption


    -- Interrupts
  
	38768,	-- Kick (Rogue) R5
	1769,	-- Kick (Rogue) R4
	1768,	-- Kick (Rogue) R3
	1767,	-- Kick (Rogue) R2
	1766,   -- Kick (Rogue) R1
	
    2139,   -- Counterspell (Mage)
	18469,  -- Counterspell - Silenced
	
    6552,   -- Pummel (Warrior) R1
	6554,   -- Pummel (Warrior) R2
	
	29704,	-- Shield Bash (Warrior) R4
	1672,	-- Shield Bash (Warrior) R3
	1671,	-- Shield Bash (Warrior) R2
	72,		-- Shield Bash (Warrior) R1
	
    19647,  -- Spell Lock (Warlock) R2
	19244,  -- Spell Lock - Effect
	24259,	-- Spell Lock (Warlock) R1
	31117,  -- Unstable Affliction - Silence 1
	43523,	-- Unstable Affliction - Silence 2

	19675,	-- Feral Charge - Interrupt Effect
	
	34490,	-- Silencing Shot - Effect
	18498,	-- Shield Bash - Silenced (Improved Shield Bash talent)
	
	26679,	-- Deadly Throw - Interrupt
	1330,	-- Garrote - Silence


    -- Anti CCs
    23920,  -- Spell Reflection
	8178,   -- Grounding Totem Effect
    27148,	-- Blessing of Sacrifice

    5384,   -- Hunter: Feign Death



    -- Disarms
	676,	--Disarm (Warrior)
    14251,	-- Riposte

    -- Roots
	26989,	-- Entangling roots R7
	9853,	-- Entangling roots R6
	9852,	-- Entangling roots R5
	5196,	-- Entangling roots R4
	5195,	-- Entangling roots R3
	1062,	-- Entangling roots R2
	339,	-- Entangling roots R1
	
	19975,	-- Entangling Roots R1 (Nature's Grasp talent)
	19974,	-- Entangling Roots R2 (Nature's Grasp talent)
	19973,	-- Entangling Roots R3 (Nature's Grasp talent)
	19972,	-- Entangling Roots R4 (Nature's Grasp talent)
	19971,	-- Entangling Roots R5 (Nature's Grasp talent)
	19970,	-- Entangling Roots R6 (Nature's Grasp talent)
	27010,	-- Entangling Roots R7 (Nature's Grasp talent)
	
	25999,	-- Boar Charge (Boar)
	4167,	-- Web R1
	4168,	-- Web R2
	4169,	-- Web R3
	
	27088,	-- Frost Nova R5
	10230,	-- Frost Nova R4
	6131,	-- Frost Nova R3
	865,	-- Frost Nova R2
	122,	-- Frost Nova R1
	
	33395,	-- Freeze (Water Elemental)
	
	27067,	-- Counterattack R4
	20910,	-- Counterattack R3
	20909,	-- Counterattack R2
	19306,	-- Counterattack R1
	
	44047,	-- Chastise R6
	44046,	-- Chastise R5
	44045,	-- Chastise R4
	44044,	-- Chastise R3
	44043,	-- Chastise R2
	44041,	-- Chastise R1
	
	-- Root Proc
	
	19229,	-- Improved Wing Clip
	19185,	-- Entrapment
	12494,	-- Frostbite
	23694,	-- Improved Hamstring
	

    -- Refreshments
    32453,	-- Star's Tears
    34062, 	-- Conjured Manna Biscuit
	30703,	-- Conjured Mountain Spring Water
	22018,	-- Conjured Glacier Water
	28612,	-- Cojured Food
	33717,	-- Cojured Food
	
	
	
    -- Offensive Buffs
	--[[
	16689,				-- Nature's Grasp R1
	16810,				-- Nature's Grasp R2
	16811,				-- Nature's Grasp R3
	16812,				-- Nature's Grasp R4
	16813,				-- Nature's Grasp R5
	17329,				-- Nature's Grasp R6
	27009,				-- Nature's Grasp R7
	--]]
	29166,				-- Innervate
	
    3045,	-- Rapid Fire
	
	12042,	-- Arcane Power
	28682,	-- Combustion
	12472,	-- Icy Veins
	
	31884,	-- Avenging Wrath
	
	10060,	-- Power Infusion
	
	13750,	-- Adrenaline Rush
	
	34936,	-- Backlash
	
	17941,	-- Nightfall
	18708,	-- Fel Domination (talent) (!)
	
	13877,	-- Blade Flurry
	
	12292,	-- Deathwish
	12328,	-- Sweeping Strikes
	
	
	
	
	
	

    -- Defensive Buffs
	
	33206,	-- Pain Suppresion
	
	--[[
	33405,	-- Ice Barrier R6
	27134,	-- Ice Barrier R5
	13033,	-- Ice Barrier R4
	13032,	-- Ice Barrier R3
	13031,	-- Ice Barrier R2
	11426,	-- Ice Barrier R1
	
	27131,	-- Mana Shield R7
	10193,	-- Mana Shield R6
	10192,	-- Mana Shield R5
	10191,	-- Mana Shield R4
	8495,	-- Mana Shield R3
	8494,	-- Mana Shield R2
	1463,	-- Mana Shield R1
	--]]
	
	46989,	-- Improved Blink R2
	47000,	-- Improved Blink R1
	
	
	
	
	26669,	-- Evasion R2
	5277,	-- Evasion R1
	
	
	30823,	-- Shamanistic Rage
	
	
	18499,	-- Berserker Rage
	
	
	31842,	-- Divine Illumination
	
	
	22812,	-- Barkskin
	
	
	19263,	-- Deterrance
	
	--[[
	25218,	-- Power Word: Shield R12
	25217,	-- Power Word: Shield R11
	10901,	-- Power Word: Shield R10
	10900,	-- Power Word: Shield R9
	10899,	-- Power Word: Shield R8
	10898,	-- Power Word: Shield R7
	6066,	-- Power Word: Shield R6
	6065,	-- Power Word: Shield R5
	3747,	-- Power Word: Shield R4
	600,	-- Power Word: Shield R3
	592,	-- Power Word: Shield R2
	17,		-- Power Word: Shield R1
	--]]

    -- Miscellaneous

    41425,  -- Hypothermia
    66,     -- Invisibility fade effect
 
})
