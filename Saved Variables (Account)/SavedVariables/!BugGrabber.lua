
BugGrabberDB = {
	["session"] = 1352,
	["lastSanitation"] = 3,
	["errors"] = {
		{
			["message"] = "[ADDON_ACTION_BLOCKED] AddOn 'TextureScript' tried to call the protected function 'PartyMemberFrame2PetFrame:Hide()'.",
			["time"] = "2021/10/22 21:31:08",
			["locals"] = "InCombatSkipped",
			["stack"] = "[string \"@Interface\\AddOns\\!BugGrabber\\BugGrabber.lua\"]:519: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519>\n[string \"=[C]\"]: in function `Hide'\n[string \"@Interface\\FrameXML\\PartyMemberFrame.lua\"]:187: in function `PartyMemberFrame_UpdatePet'\n[string \"@Interface\\FrameXML\\PartyMemberFrame.lua\"]:363: in function `PartyMemberFrame_OnEvent'\n[string \"*:OnEvent\"]:1: in function <[string \"*:OnEvent\"]:1>",
			["session"] = 1348,
			["counter"] = 1,
		}, -- [1]
		{
			["message"] = "[ADDON_ACTION_BLOCKED] AddOn 'TextureScript' tried to call the protected function 'PartyMemberFrame1:Show()'.",
			["time"] = "2021/10/23 10:01:19",
			["locals"] = "InCombatSkipped",
			["stack"] = "[string \"@Interface\\AddOns\\!BugGrabber\\BugGrabber.lua\"]:519: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519>\n[string \"=[C]\"]: in function `Show'\n[string \"@Interface\\FrameXML\\PartyMemberFrame.lua\"]:150: in function `PartyMemberFrame_UpdateMember'\n[string \"@Interface\\FrameXML\\PartyMemberFrame.lua\"]:337: in function `PartyMemberFrame_OnEvent'\n[string \"*:OnEvent\"]:1: in function <[string \"*:OnEvent\"]:1>",
			["session"] = 1351,
			["counter"] = 1,
		}, -- [2]
		{
			["message"] = "[ADDON_ACTION_FORBIDDEN] AddOn 'LFGBulletinBoard' tried to call the protected function 'GuildControlSetRank()'.",
			["time"] = "2021/10/23 12:15:16",
			["stack"] = "[string \"@Interface\\AddOns\\!BugGrabber\\BugGrabber.lua\"]:519: in function <Interface\\AddOns\\!BugGrabber\\BugGrabber.lua:519>\n[string \"=[C]\"]: in function `GuildControlSetRank'\n[string \"@Interface_TBC\\FrameXML\\FriendsFrame.lua\"]:2503: in function `GuildControlPopupFrame_Initialize'\n[string \"@Interface_TBC\\FrameXML\\FriendsFrame.lua\"]:966: in function `FriendsFrame_OnEvent'\n[string \"*:OnEvent\"]:1: in function <[string \"*:OnEvent\"]:1>",
			["session"] = 1352,
			["counter"] = 1,
		}, -- [3]
	},
}
