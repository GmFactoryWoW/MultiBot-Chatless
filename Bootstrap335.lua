-- MultiBot bootstrap for WoW 3.3.5a.
-- Supports both normal AddOns loading and embedding under Interface\FrameXML\MultiBot.
local addonName = ...

MultiBot_IS_FRAME_XML = addonName ~= "MultiBot"

if MultiBot_IS_FRAME_XML then
  MULTIBOT_ROOT = "Interface\\FrameXML\\MultiBot\\"

  -- FrameXML files are not backed by an AddOn TOC entry, therefore the
  -- SavedVariables declarations from MultiBot.toc are not applied. WoW 3.3.5a
  -- exposes RegisterForSave for persistent FrameXML globals.
  MultiBotSave = MultiBotSave or {}
  MultiBotDB = MultiBotDB or {}
  MultiBotSaved = MultiBotSaved or {}
  MultiBotGlobalSave = MultiBotGlobalSave or {}

  if type(RegisterForSave) == "function" then
    RegisterForSave("MultiBotSave")
    RegisterForSave("MultiBotDB")
    RegisterForSave("MultiBotSaved")
    RegisterForSave("MultiBotGlobalSave")
  end
else
  MULTIBOT_ROOT = "Interface\\AddOns\\MultiBot\\"
end

function MultiBot_Asset(relativePath)
  if type(relativePath) ~= "string" then
    return relativePath
  end
  relativePath = relativePath:gsub("/", "\\"):gsub("^\\+", "")
  return MULTIBOT_ROOT .. relativePath
end
