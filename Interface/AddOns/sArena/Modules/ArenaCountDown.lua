local ACDFrame = CreateFrame("Frame")

function ACDFrame:OnEvent(event, ...) 
	self[event](self, ...) 
end
ACDFrame:SetScript("OnEvent", ACDFrame.OnEvent)
ACDFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
ACDFrame:RegisterEvent("CHAT_MSG_BG_SYSTEM_NEUTRAL")

local ACDNumFrame = CreateFrame("Frame", "ACDNumFrame", UIParent)
ACDNumFrame:SetHeight(256)
ACDNumFrame:SetWidth(256)
ACDNumFrame:SetPoint("CENTER", 0, 128)
ACDNumFrame:Show()

local ACDNumTens = ACDNumFrame:CreateTexture("ACDNumTens", "HIGH")
ACDNumTens:SetWidth(256)
ACDNumTens:SetHeight(128)
ACDNumTens:SetPoint("CENTER", ACDNumFrame, "CENTER", -48, 0)

local ACDNumOnes = ACDNumFrame:CreateTexture("ACDNumOnes", "HIGH")
ACDNumOnes:SetWidth(256)
ACDNumOnes:SetHeight(128)
ACDNumOnes:SetPoint("CENTER", ACDNumFrame, "CENTER", 48, 0)

local ACDNumOne = ACDNumFrame:CreateTexture("ACDNumOne", "HIGH")
ACDNumOne:SetWidth(256)
ACDNumOne:SetHeight(128)
ACDNumOne:SetPoint("CENTER", ACDNumFrame, "CENTER", 0, 0)

function ACDFrame:PLAYER_ENTERING_WORLD()

	local inInstance, instanceType = IsInInstance()
		--print(IsActiveBattlefieldArena())
	if (( instanceType == "arena" )) then
		
			self.hidden = false
			self.countdown = -1
			self.texturePath = "Interface\\AddOns\\sArena\\Textures\\Countdown\\";
		--print("sjaj")
		ACDFrame:SetScript("OnUpdate", function(self, elapsed )
		
			if (self.countdown > 0 ) then
				self.hidden = false;
				--print("ss")
				if ((math.floor(self.countdown) ~= math.floor(self.countdown - elapsed)) and (math.floor(self.countdown - elapsed) >= 0)) then
					local str = tostring(math.floor(self.countdown - elapsed));
					
					if (math.floor(self.countdown - elapsed) == 0) then
						ACDNumTens:Hide();
						ACDNumOnes:Hide();		
						ACDNumOne:Hide();
					elseif (string.len(str) == 2) then			
						-- Display has 2 digits
						ACDNumTens:Show();
						ACDNumOnes:Show();
						
						ACDNumTens:SetTexture(self.texturePath.. string.sub(str,0,1));
						ACDNumOnes:SetTexture(self.texturePath.. string.sub(str,2,2));
						ACDNumFrame:SetScale(0.7)
					elseif (string.len(str) == 1) then		
						-- Display has 1 digit
						ACDNumOne:Show();
						ACDNumOne:SetTexture(self.texturePath.. string.sub(str,0,1));
						ACDNumOnes:Hide();
						ACDNumTens:Hide();
						ACDNumFrame:SetScale(1.0)
					end
				end
				self.countdown = self.countdown - elapsed;
			elseif (not hidden) then
				self.hidden = true;
				ACDNumTens:Hide();
				ACDNumOnes:Hide();
				ACDNumOne:Hide();
			end
		end)	
	end
end


function ACDFrame:CHAT_MSG_BG_SYSTEM_NEUTRAL(arg1)

	
		--print("headwdawoo")
		if (string.find(arg1, "until the Arena battle begins!")) then
		
		end
		if (string.find(arg1, "One minute until the Arena battle begins!")) then
			self.countdown = 61;
			return;
		end
		if (string.find(arg1, "Thirty seconds until the Arena battle begins!")) then
			self.countdown = 31;
			return;
		end
		if (string.find(arg1, "Fifteen seconds until the Arena battle begins!")) then
			self.countdown = 16;
			return;
		end	
		if (string.find(arg1, "The Arena battle has begun!")) then
		
			ACDFrame:SetScript("OnUpdate", nil)
			return;
			
		end			
	
end



