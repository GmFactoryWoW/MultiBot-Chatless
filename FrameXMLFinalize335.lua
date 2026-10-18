-- Final FrameXML lifecycle bridge for MultiBot 3.3.5a.
-- Saved globals registered through RegisterForSave are consumed only after the
-- normal UI bootstrap; PLAYER_LOGIN is the safe point to initialize AceDB and
-- restore the state that normally depends on ADDON_LOADED("MultiBot").
if MultiBot_IS_FRAME_XML then
  local frame = CreateFrame("Frame")
  frame:RegisterEvent("PLAYER_LOGIN")
  frame:SetScript("OnEvent", function(self, event)
    if event ~= "PLAYER_LOGIN" then
      return
    end

    self:UnregisterEvent("PLAYER_LOGIN")

    if MultiBot and MultiBot.OnInitialize then
      MultiBot:OnInitialize()
    end
    if MultiBot and MultiBot.OnEnable then
      MultiBot:OnEnable()
    end
    if MultiBot and MultiBot.DispatchEvent then
      MultiBot.DispatchEvent("ADDON_LOADED", "MultiBot")
    end
  end)
end
