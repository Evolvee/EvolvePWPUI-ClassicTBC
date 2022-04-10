
BugGrabberDB = {
	["session"] = 2198,
	["lastSanitation"] = 3,
	["errors"] = {
		{
			["message"] = "[string \"print(GetCVars(\"chatMouseScroll\"))\"]:1: attempt to call global 'GetCVars' (a nil value)",
			["time"] = "2022/03/26 20:19:12",
			["locals"] = "(*temporary) = <function> defined @Interface\\FrameXML\\RestrictedInfrastructure.lua:118\n(*temporary) = nil\n(*temporary) = \"chatMouseScroll\"\n(*temporary) = \"attempt to call global 'GetCVars' (a nil value)\"\n",
			["stack"] = "[string \"print(GetCVars(\"chatMouseScroll\"))\"]:1: in main chunk\n[string \"=[C]\"]: in function `RunScript'\n[string \"@Interface\\FrameXML\\ChatFrame.lua\"]:2174: in function `?'\n[string \"@Interface\\FrameXML\\ChatFrame.lua\"]:4900: in function `ChatEdit_ParseText'\n[string \"@Interface\\FrameXML\\ChatFrame.lua\"]:4563: in function `ChatEdit_SendText'\n[string \"@Interface\\FrameXML\\ChatFrame.lua\"]:4599: in function `ChatEdit_OnEnterPressed'\n[string \"*:OnEnterPressed\"]:1: in function <[string \"*:OnEnterPressed\"]:1>",
			["session"] = 2132,
			["counter"] = 1,
		}, -- [1]
		{
			["message"] = "[string \"print(GetCVars(\"autoClearAFK\"))\"]:1: attempt to call global 'GetCVars' (a nil value)",
			["time"] = "2022/03/26 20:22:23",
			["locals"] = "(*temporary) = <function> defined @Interface\\FrameXML\\RestrictedInfrastructure.lua:118\n(*temporary) = nil\n(*temporary) = \"autoClearAFK\"\n(*temporary) = \"attempt to call global 'GetCVars' (a nil value)\"\n",
			["stack"] = "[string \"print(GetCVars(\"autoClearAFK\"))\"]:1: in main chunk\n[string \"=[C]\"]: in function `RunScript'\n[string \"@Interface\\FrameXML\\ChatFrame.lua\"]:2174: in function `?'\n[string \"@Interface\\FrameXML\\ChatFrame.lua\"]:4900: in function `ChatEdit_ParseText'\n[string \"@Interface\\FrameXML\\ChatFrame.lua\"]:4563: in function `ChatEdit_SendText'\n[string \"@Interface\\FrameXML\\ChatFrame.lua\"]:4599: in function `ChatEdit_OnEnterPressed'\n[string \"*:OnEnterPressed\"]:1: in function <[string \"*:OnEnterPressed\"]:1>",
			["session"] = 2132,
			["counter"] = 1,
		}, -- [2]
		{
			["message"] = "[string \"print(GetCVars(\"nameplateGlobalScale\"))\"]:1: attempt to call global 'GetCVars' (a nil value)",
			["time"] = "2022/03/26 20:24:47",
			["locals"] = "InCombatSkipped",
			["stack"] = "[string \"print(GetCVars(\"nameplateGlobalScale\"))\"]:1: in main chunk\n[string \"=[C]\"]: in function `RunScript'\n[string \"@Interface\\FrameXML\\ChatFrame.lua\"]:2174: in function `?'\n[string \"@Interface\\FrameXML\\ChatFrame.lua\"]:4900: in function `ChatEdit_ParseText'\n[string \"@Interface\\FrameXML\\ChatFrame.lua\"]:4563: in function `ChatEdit_SendText'\n[string \"@Interface\\FrameXML\\ChatFrame.lua\"]:4599: in function `ChatEdit_OnEnterPressed'\n[string \"*:OnEnterPressed\"]:1: in function <[string \"*:OnEnterPressed\"]:1>",
			["session"] = 2132,
			["counter"] = 1,
		}, -- [3]
		{
			["message"] = "[ADDON_ACTION_FORBIDDEN] AddOn 'Auctionator' tried to call the protected function 'GuildControlSetRank()'.",
			["time"] = "2022/03/27 17:33:20",
			["stack"] = "[string \"@Interface\\AddOns\\!BugGrabber\\BugGrabber.lua\"]:519: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519>\n[string \"=[C]\"]: in function `GuildControlSetRank'\n[string \"@Interface_TBC\\FrameXML\\FriendsFrame.lua\"]:2779: in function `GuildControlPopupFrameDropDownButton_ClickedRank'\n[string \"@Interface_TBC\\FrameXML\\FriendsFrame.lua\"]:2531: in function `GuildControlPopupFrame_Initialize'\n[string \"@Interface_TBC\\FrameXML\\FriendsFrame.lua\"]:978: in function `FriendsFrame_OnEvent'\n[string \"*:OnEvent\"]:1: in function <[string \"*:OnEvent\"]:1>",
			["session"] = 2135,
			["counter"] = 1,
		}, -- [4]
		{
			["message"] = "[ADDON_ACTION_BLOCKED] AddOn 'TextureScript' tried to call the protected function 'PartyMemberFrame1PetFrame:Hide()'.",
			["time"] = "2022/04/01 19:29:28",
			["locals"] = "InCombatSkipped",
			["stack"] = "[string \"@Interface\\AddOns\\!BugGrabber\\BugGrabber.lua\"]:519: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519>\n[string \"=[C]\"]: in function `Hide'\n[string \"@Interface\\FrameXML\\PartyMemberFrame.lua\"]:599: in function `PartyMemberFrame_UpdateOnlineStatus'\n[string \"@Interface\\FrameXML\\PartyMemberFrame.lua\"]:170: in function `PartyMemberFrame_UpdateMember'\n[string \"@Interface\\FrameXML\\PartyMemberFrame.lua\"]:337: in function `PartyMemberFrame_OnEvent'\n[string \"*:OnEvent\"]:1: in function <[string \"*:OnEvent\"]:1>",
			["session"] = 2157,
			["counter"] = 1,
		}, -- [5]
		{
			["message"] = "[ADDON_ACTION_FORBIDDEN] AddOn 'Gladdy' tried to call the protected function 'FocusUnit()'.",
			["time"] = "2022/04/01 19:40:18",
			["stack"] = "[string \"@Interface\\AddOns\\!BugGrabber\\BugGrabber.lua\"]:519: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519>\n[string \"=[C]\"]: in function `FocusUnit'\n[string \"@Interface\\FrameXML\\SecureTemplates.lua\"]:492: in function `handler'\n[string \"@Interface\\FrameXML\\SecureTemplates.lua\"]:625: in function <Interface\\FrameXML\\SecureTemplates.lua:569>",
			["session"] = 2157,
			["counter"] = 1,
		}, -- [6]
		{
			["message"] = "[ADDON_ACTION_BLOCKED] AddOn 'OmniCC' tried to call the protected function 'CompactRaidFrame1:Show()'.",
			["time"] = "2022/04/01 22:03:39",
			["locals"] = "InCombatSkipped",
			["stack"] = "[string \"@Interface\\AddOns\\!BugGrabber\\BugGrabber.lua\"]:519: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519>\n[string \"=[C]\"]: in function `Show'\n[string \"@Interface\\FrameXML\\CompactUnitFrame.lua\"]:359: in function `CompactUnitFrame_UpdateVisible'\n[string \"@Interface\\FrameXML\\CompactUnitFrame.lua\"]:292: in function <Interface\\FrameXML\\CompactUnitFrame.lua:290>\n[string \"=[C]\"]: in function `CompactUnitFrame_UpdateAll'\n[string \"@Interface\\FrameXML\\CompactUnitFrame.lua\"]:125: in function <Interface\\FrameXML\\CompactUnitFrame.lua:53>",
			["session"] = 2158,
			["counter"] = 1,
		}, -- [7]
		{
			["message"] = "[ADDON_ACTION_BLOCKED] AddOn 'TextureScript' tried to call the protected function 'PartyMemberFrame4PetFrame:Hide()'.",
			["time"] = "2022/04/05 17:48:38",
			["locals"] = "InCombatSkipped",
			["stack"] = "[string \"@Interface\\AddOns\\!BugGrabber\\BugGrabber.lua\"]:519: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519>\n[string \"=[C]\"]: in function `Hide'\n[string \"@Interface\\FrameXML\\PartyMemberFrame.lua\"]:187: in function `PartyMemberFrame_UpdatePet'\n[string \"@Interface\\FrameXML\\PartyMemberFrame.lua\"]:363: in function `PartyMemberFrame_OnEvent'\n[string \"*:OnEvent\"]:1: in function <[string \"*:OnEvent\"]:1>",
			["session"] = 2175,
			["counter"] = 1,
		}, -- [8]
		{
			["message"] = "[ADDON_ACTION_BLOCKED] AddOn 'ButtonForge' tried to call the protected function 'BFToolbar:SetSize()'.",
			["time"] = "2022/04/06 10:48:31",
			["locals"] = "InCombatSkipped",
			["stack"] = "[string \"@Interface\\AddOns\\!BugGrabber\\BugGrabber.lua\"]:519: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519>\n[string \"=[C]\"]: in function `SetSize'\n[string \"@Interface\\AddOns\\ButtonForge\\UILibToolbar.lua\"]:88: in function `ToggleAdvancedTools'\n[string \"@Interface\\AddOns\\ButtonForge\\Util.lua\"]:416: in function `Load'\n[string \"@Interface\\AddOns\\ButtonForge\\EventManager.lua\"]:254: in function <Interface\\AddOns\\ButtonForge\\EventManager.lua:225>",
			["session"] = 2182,
			["counter"] = 1,
		}, -- [9]
		{
			["message"] = "[ADDON_ACTION_BLOCKED] AddOn 'TextureScript' tried to call the protected function 'PartyMemberFrame1:Hide()'.",
			["time"] = "2022/03/23 18:28:11",
			["locals"] = "InCombatSkipped",
			["stack"] = "[string \"@Interface\\AddOns\\!BugGrabber\\BugGrabber.lua\"]:519: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519>\n[string \"=[C]\"]: in function `Hide'\n[string \"@Interface\\FrameXML\\PartyMemberFrame.lua\"]:163: in function `PartyMemberFrame_UpdateMember'\n[string \"@Interface\\FrameXML\\PartyMemberFrame.lua\"]:337: in function `PartyMemberFrame_OnEvent'\n[string \"*:OnEvent\"]:1: in function <[string \"*:OnEvent\"]:1>",
			["session"] = 2188,
			["counter"] = 14,
		}, -- [10]
		{
			["message"] = "[ADDON_ACTION_BLOCKED] AddOn 'TextureScript' tried to call the protected function 'PartyMemberFrame1:Show()'.",
			["time"] = "2022/04/08 17:28:57",
			["locals"] = "InCombatSkipped",
			["stack"] = "[string \"@Interface\\AddOns\\!BugGrabber\\BugGrabber.lua\"]:519: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519>\n[string \"=[C]\"]: in function `Show'\n[string \"@Interface\\FrameXML\\PartyMemberFrame.lua\"]:150: in function `PartyMemberFrame_UpdateMember'\n[string \"@Interface\\FrameXML\\PartyMemberFrame.lua\"]:337: in function `PartyMemberFrame_OnEvent'\n[string \"*:OnEvent\"]:1: in function <[string \"*:OnEvent\"]:1>",
			["session"] = 2189,
			["counter"] = 1,
		}, -- [11]
		{
			["message"] = "[ADDON_ACTION_BLOCKED] AddOn 'Auctionator' tried to call the protected function 'UIParent:SetAttribute()'.",
			["time"] = "2022/04/09 14:08:34",
			["locals"] = "InCombatSkipped",
			["stack"] = "[string \"@Interface\\AddOns\\!BugGrabber\\BugGrabber.lua\"]:519: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519>\n[string \"=[C]\"]: in function `SetAttribute'\n[string \"@Interface_TBC\\FrameXML\\UIParent.lua\"]:2210: in function `UpdateUIPanelPositions'\n[string \"@Interface_TBC\\FrameXML\\UIParent.lua\"]:1829: in function <Interface_TBC\\FrameXML\\UIParent.lua:1818>\n[string \"=[C]\"]: in function `SetAttribute'\n[string \"@Interface_TBC\\FrameXML\\UIParent.lua\"]:2839: in function <Interface_TBC\\FrameXML\\UIParent.lua:2837>\n[string \"=[C]\"]: ?\n[string \"=[C]\"]: in function `securecall'\n[string \"@Interface_TBC\\FrameXML\\UIParent.lua\"]:2105: in function `SetUIPanel'\n[string \"@Interface_TBC\\FrameXML\\UIParent.lua\"]:2018: in function `ShowUIPanel'\n[string \"@Interface_TBC\\FrameXML\\UIParent.lua\"]:1822: in function <Interface_TBC\\FrameXML\\UIParent.lua:1818>\n[string \"=[C]\"]: in function `SetAttribute'\n[string \"@Interface_TBC\\FrameXML\\UIParent.lua\"]:2596: in function <Interface_TBC\\FrameXML\\UIParent.lua:2575>\n[string \"=[C]\"]: in function `ShowUIPanel'\n[string \"@Interface\\FrameXML\\LootFrame.lua\"]:311: in function `LootFrame_Show'\n[string \"@Interface\\FrameXML\\LootFrame.lua\"]:37: in function <Interface\\FrameXML\\LootFrame.lua:24>",
			["session"] = 2193,
			["counter"] = 1,
		}, -- [12]
		{
			["message"] = "[ADDON_ACTION_BLOCKED] AddOn 'TextureScript' tried to call the protected function 'PartyMemberFrame2PetFrame:Hide()'.",
			["time"] = "2022/03/26 18:19:45",
			["locals"] = "InCombatSkipped",
			["stack"] = "[string \"@Interface\\AddOns\\!BugGrabber\\BugGrabber.lua\"]:519: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519>\n[string \"=[C]\"]: in function `Hide'\n[string \"@Interface\\FrameXML\\PartyMemberFrame.lua\"]:187: in function `PartyMemberFrame_UpdatePet'\n[string \"@Interface\\FrameXML\\PartyMemberFrame.lua\"]:363: in function `PartyMemberFrame_OnEvent'\n[string \"*:OnEvent\"]:1: in function <[string \"*:OnEvent\"]:1>",
			["session"] = 2194,
			["counter"] = 4,
		}, -- [13]
	},
}
