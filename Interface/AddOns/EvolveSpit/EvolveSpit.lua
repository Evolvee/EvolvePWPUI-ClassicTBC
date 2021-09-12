-- EvolveSpit


local f = CreateFrame("Frame")
f:RegisterEvent("UNIT_TARGET")
f:SetScript("OnEvent", function(self, event) 
for i=1,40 do
  local name=UnitAura("target",i);
  if name=="Reawakened Phase-Hunter" then
    SendChatMessage("spits on %t." ,"EMOTE")
    break
  end
end
end)