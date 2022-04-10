
ButtonForgeGlobalSettings = {
	["Version"] = 1,
	["UseCollectionsFavoriteMountButton"] = false,
	["ForceOffCastOnKeyDown"] = false,
	["MacroCheckDelay"] = 3,
	["RemoveMissingMacros"] = true,
	["VersionMinor"] = 0.5,
}
ButtonForgeGlobalProfiles = {
}
ButtonForgeGlobalBackup = {
	["Magetest-Classic Arena - EU"] = {
		["AdvancedMode"] = false,
		["AddonName"] = "Button Forge",
		["ConfigureMode"] = true,
		["RightClickSelfCast"] = false,
		["Bars"] = {
		},
		["Version"] = 1,
		["VersionMinor"] = 0.5,
	},
	["Evolvepwe-Classic Arena - EU"] = {
		["AdvancedMode"] = false,
		["AddonName"] = "Button Forge",
		["ConfigureMode"] = false,
		["RightClickSelfCast"] = false,
		["Bars"] = {
		},
		["Version"] = 1,
		["VersionMinor"] = 0.5,
	},
	["Evolvepwp-Earthshaker"] = {
		["AdvancedMode"] = true,
		["AddonName"] = "Button Forge",
		["ConfigureMode"] = false,
		["RightClickSelfCast"] = false,
		["Bars"] = {
			{
				["ButtonsLocked"] = true,
				["VDriver"] = "",
				["Label"] = "",
				["Scale"] = 0.8082588391426282,
				["Rows"] = 1,
				["Left"] = 1281.2890625,
				["Cols"] = 2,
				["HVehicle"] = true,
				["HSpec1"] = false,
				["HBonusBar"] = true,
				["KeyBindText"] = true,
				["HSpec3"] = false,
				["GridAlwaysOn"] = true,
				["TooltipsOn"] = false,
				["BonusBar"] = false,
				["Alpha"] = 1,
				["HSpec4"] = false,
				["HSpec2"] = false,
				["GUI"] = true,
				["Enabled"] = true,
				["MacroText"] = true,
				["Order"] = 0,
				["Top"] = 84.37237548828125,
				["ButtonGap"] = 6,
				["Buttons"] = {
					{
						["MacroName"] = "DMG",
						["MacroIndex"] = 9,
						["Mode"] = "macro",
						["KeyBinding"] = "MOUSEWHEELDOWN",
						["MacroBody"] = "/equip Gladiator's Gavel\n/equip Karaborian Talisman\n",
					}, -- [1]
					{
						["MacroName"] = "Heal",
						["MacroIndex"] = 19,
						["Mode"] = "macro",
						["KeyBinding"] = "MOUSEWHEELUP",
						["MacroBody"] = "/equip Gladiator's Salvation\n/equip Tears of Heaven\n",
					}, -- [2]
				},
			}, -- [1]
			{
				["ButtonsLocked"] = true,
				["VDriver"] = "",
				["Label"] = "",
				["Scale"] = 0.817374987479968,
				["Rows"] = 1,
				["Left"] = 1280.578125,
				["Cols"] = 2,
				["HVehicle"] = true,
				["HSpec1"] = false,
				["HBonusBar"] = true,
				["KeyBindText"] = true,
				["HSpec3"] = false,
				["GridAlwaysOn"] = true,
				["Buttons"] = {
					{
						["MacroName"] = "r1",
						["MacroIndex"] = 30,
						["Mode"] = "macro",
						["KeyBinding"] = "SHIFT-3",
						["MacroBody"] = "#showtooltip Mind Flay(Rank 1)\n/cqs\n/cast [nochanneling] Mind Flay(Rank 1)\n",
					}, -- [1]
					{
						["MacroName"] = "party2",
						["MacroIndex"] = 27,
						["Mode"] = "macro",
						["KeyBinding"] = "CTRL-C",
						["MacroBody"] = "/cqs\n/cast [target=party2] Dispel Magic(Rank 2)\n/TargetLastTarget();\n",
					}, -- [2]
				},
				["BonusBar"] = false,
				["Alpha"] = 1,
				["HSpec4"] = false,
				["HSpec2"] = false,
				["GUI"] = true,
				["Enabled"] = true,
				["MacroText"] = true,
				["Top"] = 50.42549896240234,
				["Order"] = 1,
				["ButtonGap"] = 6,
				["TooltipsOn"] = false,
			}, -- [2]
			{
				["ButtonsLocked"] = true,
				["VDriver"] = "",
				["Label"] = "",
				["Scale"] = 0.7969089084201388,
				["Rows"] = 1,
				["Left"] = 1247.81884765625,
				["Cols"] = 1,
				["HVehicle"] = true,
				["HSpec1"] = false,
				["HBonusBar"] = true,
				["KeyBindText"] = true,
				["HSpec3"] = false,
				["GridAlwaysOn"] = true,
				["Buttons"] = {
					{
						["ItemName"] = "Skull of Impending Doom",
						["KeyBinding"] = "SHIFT-MOUSEWHEELDOWN",
						["Mode"] = "item",
						["ItemLink"] = "|cff1eff00|Hitem:4984::::::::70::::::::|h[Skull of Impending Doom]|h|r",
						["ItemId"] = 4984,
					}, -- [1]
				},
				["BonusBar"] = false,
				["Alpha"] = 1,
				["HSpec4"] = false,
				["TooltipsOn"] = false,
				["GUI"] = true,
				["Enabled"] = true,
				["MacroText"] = true,
				["Top"] = 49.68872833251953,
				["Order"] = 2,
				["ButtonGap"] = 6,
				["HSpec2"] = false,
			}, -- [3]
			{
				["ButtonsLocked"] = true,
				["VDriver"] = "",
				["Label"] = "",
				["Scale"] = 0.7888844807942709,
				["Rows"] = 1,
				["Left"] = 1214.685791015625,
				["Cols"] = 1,
				["HVehicle"] = true,
				["HSpec1"] = false,
				["HBonusBar"] = true,
				["KeyBindText"] = true,
				["HSpec3"] = false,
				["GridAlwaysOn"] = true,
				["Buttons"] = {
					{
						["MacroName"] = "cancel chicken",
						["MacroIndex"] = 6,
						["Mode"] = "macro",
						["KeyBinding"] = "SHIFT-MOUSEWHEELUP",
						["MacroBody"] = "/cancelaura Flee\n",
					}, -- [1]
				},
				["BonusBar"] = false,
				["Alpha"] = 1,
				["HSpec4"] = false,
				["TooltipsOn"] = false,
				["GUI"] = true,
				["Enabled"] = true,
				["MacroText"] = true,
				["Top"] = 49.68872833251953,
				["Order"] = 3,
				["ButtonGap"] = 6,
				["HSpec2"] = false,
			}, -- [4]
		},
		["Version"] = 1,
		["VersionMinor"] = 0.5,
	},
	["Evolvexd-Classic Arena - EU"] = {
		["AdvancedMode"] = true,
		["AddonName"] = "Button Forge",
		["ConfigureMode"] = false,
		["RightClickSelfCast"] = false,
		["Bars"] = {
			{
				["ButtonsLocked"] = true,
				["VDriver"] = "",
				["Label"] = "",
				["Scale"] = 0.8082588391426282,
				["Rows"] = 1,
				["Left"] = 1281.2890625,
				["Cols"] = 2,
				["HVehicle"] = true,
				["HSpec1"] = false,
				["HBonusBar"] = true,
				["KeyBindText"] = true,
				["HSpec3"] = false,
				["GridAlwaysOn"] = true,
				["TooltipsOn"] = false,
				["BonusBar"] = false,
				["Alpha"] = 1,
				["HSpec4"] = false,
				["HSpec2"] = false,
				["GUI"] = true,
				["Enabled"] = true,
				["MacroText"] = true,
				["Order"] = 0,
				["Top"] = 84.37236022949219,
				["ButtonGap"] = 6,
				["Buttons"] = {
					{
						["MacroName"] = "DMG",
						["MacroBody"] = "/equip Gladiator's Gavel\n/equip Gladiator's Endgame\n/equip Gladiator's Touch of Defeat\n",
						["Mode"] = "macro",
						["KeyBinding"] = "MOUSEWHEELDOWN",
						["MacroIndex"] = 128,
					}, -- [1]
					{
						["MacroName"] = "HEAL",
						["MacroBody"] = "/equip Light's Justice\n/equip Tears of Heaven\n/equip Blue Diamond Witchwand\n",
						["Mode"] = "macro",
						["KeyBinding"] = "MOUSEWHEELUP",
						["MacroIndex"] = 138,
					}, -- [2]
				},
			}, -- [1]
			{
				["ButtonsLocked"] = true,
				["VDriver"] = "",
				["Label"] = "",
				["Scale"] = 0.817374987479968,
				["Rows"] = 1,
				["Left"] = 1280.578125,
				["Cols"] = 2,
				["HVehicle"] = true,
				["HSpec1"] = false,
				["HBonusBar"] = true,
				["KeyBindText"] = true,
				["HSpec3"] = false,
				["GridAlwaysOn"] = true,
				["Buttons"] = {
					{
						["MacroName"] = "r1",
						["MacroBody"] = "#showtooltip Mind Flay(Rank 1)\n/cqs\n/cast [nochanneling] Mind Flay(Rank 1)\n",
						["Mode"] = "macro",
						["KeyBinding"] = "SHIFT-3",
						["MacroIndex"] = 13,
					}, -- [1]
					{
						["MacroName"] = "party2",
						["MacroBody"] = "/cqs\n/cast [target=party2] Dispel Magic(Rank 2)\n/TargetLastTarget();\n",
						["Mode"] = "macro",
						["KeyBinding"] = "CTRL-C",
						["MacroIndex"] = 9,
					}, -- [2]
				},
				["BonusBar"] = false,
				["Alpha"] = 1,
				["HSpec4"] = false,
				["HSpec2"] = false,
				["GUI"] = true,
				["Enabled"] = true,
				["MacroText"] = true,
				["Top"] = 50.42549896240234,
				["Order"] = 1,
				["ButtonGap"] = 6,
				["TooltipsOn"] = false,
			}, -- [2]
		},
		["Version"] = 1,
		["VersionMinor"] = 0.5,
	},
	["Evolvebank-Gehennas"] = {
		["AdvancedMode"] = false,
		["AddonName"] = "Button Forge",
		["ConfigureMode"] = true,
		["RightClickSelfCast"] = false,
		["Bars"] = {
		},
		["Version"] = 1,
		["VersionMinor"] = 0.5,
	},
	["Evolve-Classic Arena - EU"] = {
		["AdvancedMode"] = true,
		["AddonName"] = "Button Forge",
		["ConfigureMode"] = false,
		["RightClickSelfCast"] = false,
		["Bars"] = {
			{
				["ButtonsLocked"] = true,
				["VDriver"] = "",
				["Label"] = "",
				["Scale"] = 0.8082588391426282,
				["Rows"] = 1,
				["Left"] = 1281.2890625,
				["Cols"] = 2,
				["HVehicle"] = true,
				["HSpec1"] = false,
				["HBonusBar"] = true,
				["KeyBindText"] = true,
				["HSpec3"] = false,
				["GridAlwaysOn"] = true,
				["TooltipsOn"] = false,
				["BonusBar"] = false,
				["Alpha"] = 1,
				["HSpec4"] = false,
				["HSpec2"] = false,
				["GUI"] = true,
				["Enabled"] = true,
				["MacroText"] = true,
				["Order"] = 0,
				["Top"] = 84.37236022949219,
				["ButtonGap"] = 6,
				["Buttons"] = {
					{
						["MacroName"] = "DMG",
						["MacroIndex"] = 128,
						["Mode"] = "macro",
						["KeyBinding"] = "MOUSEWHEELDOWN",
						["MacroBody"] = "/equip Gladiator's Gavel\n/equip Gladiator's Endgame\n/equip Gladiator's Touch of Defeat\n",
					}, -- [1]
					{
						["MacroName"] = "HEAL",
						["MacroIndex"] = 138,
						["Mode"] = "macro",
						["KeyBinding"] = "MOUSEWHEELUP",
						["MacroBody"] = "/equip Light's Justice\n/equip Tears of Heaven\n/equip Blue Diamond Witchwand\n",
					}, -- [2]
				},
			}, -- [1]
			{
				["ButtonsLocked"] = true,
				["VDriver"] = "",
				["Label"] = "",
				["Scale"] = 0.817374987479968,
				["Rows"] = 1,
				["Left"] = 1280.578125,
				["Cols"] = 2,
				["HVehicle"] = true,
				["HSpec1"] = false,
				["HBonusBar"] = true,
				["KeyBindText"] = true,
				["HSpec3"] = false,
				["GridAlwaysOn"] = true,
				["Buttons"] = {
					{
						["MacroName"] = "r1",
						["MacroIndex"] = 13,
						["Mode"] = "macro",
						["KeyBinding"] = "SHIFT-3",
						["MacroBody"] = "#showtooltip Mind Flay(Rank 1)\n/cqs\n/cast [nochanneling] Mind Flay(Rank 1)\n",
					}, -- [1]
					{
						["MacroName"] = "party2",
						["MacroIndex"] = 9,
						["Mode"] = "macro",
						["KeyBinding"] = "CTRL-C",
						["MacroBody"] = "/cqs\n/cast [target=party2] Dispel Magic(Rank 2)\n/TargetLastTarget();\n",
					}, -- [2]
				},
				["BonusBar"] = false,
				["Alpha"] = 1,
				["HSpec4"] = false,
				["HSpec2"] = false,
				["GUI"] = true,
				["Enabled"] = true,
				["MacroText"] = true,
				["Top"] = 50.42549896240234,
				["Order"] = 1,
				["ButtonGap"] = 6,
				["TooltipsOn"] = false,
			}, -- [2]
		},
		["Version"] = 1,
		["VersionMinor"] = 0.5,
	},
	["Evolvebanned-Gehennas"] = {
		["AdvancedMode"] = true,
		["AddonName"] = "Button Forge",
		["ConfigureMode"] = false,
		["RightClickSelfCast"] = false,
		["Bars"] = {
			{
				["ButtonsLocked"] = true,
				["VDriver"] = "",
				["Label"] = "",
				["Scale"] = 0.8073253142528045,
				["Rows"] = 1,
				["Left"] = 1280.578125,
				["Cols"] = 2,
				["HVehicle"] = true,
				["HSpec1"] = false,
				["HBonusBar"] = true,
				["KeyBindText"] = true,
				["HSpec3"] = false,
				["GridAlwaysOn"] = true,
				["Buttons"] = {
					{
						["MacroName"] = "DMG",
						["MacroBody"] = "/equip Vengeful Gladiator's Spellblade\n/equip Vengeful Gladiator's Endgame\n/equip Merciless Gladiator's Touch of Defeat\n",
						["Mode"] = "macro",
						["KeyBinding"] = "MOUSEWHEELDOWN",
						["MacroIndex"] = 10,
					}, -- [1]
					{
						["MacroName"] = "Heal",
						["MacroBody"] = "/equip Merciless Gladiator's Salvation\n/equip Merciless Gladiator's Reprieve\n/equip Naaru-Blessed Life Rod\n",
						["Mode"] = "macro",
						["KeyBinding"] = "MOUSEWHEELUP",
						["MacroIndex"] = 21,
					}, -- [2]
				},
				["BonusBar"] = false,
				["Alpha"] = 1,
				["HSpec4"] = false,
				["TooltipsOn"] = false,
				["GUI"] = true,
				["Enabled"] = true,
				["MacroText"] = true,
				["Top"] = 116.6561126708984,
				["Order"] = 2,
				["ButtonGap"] = 6,
				["HSpec2"] = false,
			}, -- [1]
			{
				["ButtonsLocked"] = true,
				["VDriver"] = "",
				["Label"] = "",
				["Scale"] = 0.817374987479968,
				["Rows"] = 1,
				["Left"] = 1280.578125,
				["Cols"] = 2,
				["HVehicle"] = true,
				["HSpec1"] = false,
				["HBonusBar"] = true,
				["KeyBindText"] = true,
				["HSpec3"] = false,
				["GridAlwaysOn"] = true,
				["TooltipsOn"] = false,
				["BonusBar"] = false,
				["Alpha"] = 1,
				["HSpec4"] = false,
				["HSpec2"] = false,
				["GUI"] = true,
				["Enabled"] = true,
				["MacroText"] = true,
				["Order"] = 3,
				["Top"] = 50.42551040649414,
				["ButtonGap"] = 6,
				["Buttons"] = {
					{
						["MacroName"] = "r1",
						["MacroBody"] = "#showtooltip Mind Flay(Rank 1)\n/cqs\n/cast [nochanneling] Mind Flay(Rank 1)\n",
						["Mode"] = "macro",
						["KeyBinding"] = "SHIFT-3",
						["MacroIndex"] = 36,
					}, -- [1]
					{
						["MacroName"] = "party2",
						["MacroBody"] = "/cqs\n/cast [target=party2] Dispel Magic(Rank 2)\n/TargetLastTarget();\n",
						["Mode"] = "macro",
						["KeyBinding"] = "CTRL-C",
						["MacroIndex"] = 33,
					}, -- [2]
				},
			}, -- [2]
			{
				["ButtonsLocked"] = true,
				["VDriver"] = "",
				["Label"] = "",
				["Scale"] = 0.7982076009114584,
				["Rows"] = 1,
				["Left"] = 1280.578125,
				["Cols"] = 2,
				["HVehicle"] = true,
				["HSpec1"] = false,
				["HBonusBar"] = true,
				["KeyBindText"] = true,
				["HSpec3"] = false,
				["GridAlwaysOn"] = true,
				["HSpec2"] = false,
				["BonusBar"] = false,
				["Alpha"] = 1,
				["HSpec4"] = false,
				["TooltipsOn"] = false,
				["GUI"] = true,
				["Enabled"] = true,
				["MacroText"] = true,
				["Order"] = 0,
				["Top"] = 83.95020294189453,
				["ButtonGap"] = 6,
				["Buttons"] = {
					{
						["MacroName"] = "DP",
						["MacroBody"] = "",
						["Mode"] = "macro",
						["KeyBinding"] = "SHIFT-MOUSEWHEELDOWN",
						["MacroIndex"] = 11,
					}, -- [1]
					{
						["MacroName"] = "mp5",
						["MacroBody"] = "/equip Staff of Dark Mending\n/equip Naaru-Blessed Life Rod\n",
						["Mode"] = "macro",
						["KeyBinding"] = "ALT-MOUSEWHEELUP",
						["MacroIndex"] = 30,
					}, -- [2]
				},
			}, -- [3]
			{
				["ButtonsLocked"] = true,
				["VDriver"] = "",
				["Label"] = "",
				["Scale"] = 0.7888844807942709,
				["Rows"] = 1,
				["Left"] = 1247.445190429688,
				["Cols"] = 1,
				["HVehicle"] = true,
				["HSpec1"] = false,
				["HBonusBar"] = true,
				["KeyBindText"] = true,
				["HSpec3"] = false,
				["GridAlwaysOn"] = true,
				["HSpec2"] = false,
				["BonusBar"] = false,
				["Alpha"] = 1,
				["HSpec4"] = false,
				["TooltipsOn"] = false,
				["GUI"] = true,
				["Enabled"] = true,
				["MacroText"] = true,
				["Order"] = 1,
				["Top"] = 50.42551040649414,
				["ButtonGap"] = 6,
				["Buttons"] = {
					{
						["MacroName"] = "spirit",
						["MacroBody"] = "/equip Ethereum Life-Staff\n/equip Naaru-Blessed Life Rod\n",
						["Mode"] = "macro",
						["KeyBinding"] = "SHIFT-MOUSEWHEELUP",
						["MacroIndex"] = 42,
					}, -- [1]
				},
			}, -- [4]
		},
		["Version"] = 1,
		["VersionMinor"] = 0.5,
	},
}
