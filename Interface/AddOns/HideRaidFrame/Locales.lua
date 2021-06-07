local _, S = ...

local L = {
	deDE = {
		BROKER_SHIFT_CLICK = "|cffFFFFFFShift-klickt|r, um dieses AddOn ein-/auszuschalten",
	},
	enUS = {
		BROKER_SHIFT_CLICK = "|cffFFFFFFShift-click|r to toggle this AddOn",
	},
	esES = {
		BROKER_SHIFT_CLICK = "|cffffffffMayús-clic|r para activar/desactivar",
	},
	--esMX = {},
	frFR = {
	},
	koKR = {
	},
	ptBR = {
	},
	ruRU = {
	},
	zhCN = {
		BROKER_SHIFT_CLICK = "|cffFFFFFFrShift-点击|r 启用或禁用插件",
	},
	zhTW = {
		BROKER_SHIFT_CLICK = "|cffFFFFFFrShift-點擊|r 啟用或禁用插件",
	},
}

L.esMX = L.esES

S.L = setmetatable(L[GetLocale()] or L.enUS, {__index = function(t, k)
	local v = rawget(L.enUS, k) or k
	rawset(t, k, v)
	return v
end})
