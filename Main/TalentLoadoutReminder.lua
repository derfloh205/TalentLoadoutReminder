TalentLoadoutReminderAddonName, TalentLoadoutReminder = ...

TalentLoadoutReminder.MAIN = CreateFrame("Frame")
TalentLoadoutReminder.MAIN:SetScript("OnEvent", function(self, event, ...) self[event](self, ...) end)
TalentLoadoutReminder.MAIN:RegisterEvent("ADDON_LOADED")

TalentLoadoutReminderDB = nil
TalentLoadoutReminderBossDB = nil

local DEFAULT_BACKDROP_OPTIONS = {
    bgFile = "Interface\\CharacterFrame\\UI-Party-Background",
    borderOptions = {
        edgeFile = "Interface\\PVPFrame\\UI-Character-PVP-Highlight", -- this one is neat
        edgeSize = 16,
        insets = { left = 8, right = 6, top = 8, bottom = 8 },
    }
}


function TalentLoadoutReminder.MAIN:ADDON_LOADED(addon_name)
	if addon_name ~= TalentLoadoutReminderAddonName then
		return
	end

	-- show info
	---@type GGUI.Frame
	local frame = TalentLoadoutReminder.GGUI.Frame({title=addon_name, sizeX=500, sizeY=130, offsetY=-20, closeable=true, backdropOptions=DEFAULT_BACKDROP_OPTIONS})
	local LR = TalentLoadoutReminder.GUTIL:ColorizeText("LoadoutReminder", TalentLoadoutReminder.GUTIL.COLORS.LEGENDARY)
	local TLR = TalentLoadoutReminder.GUTIL:ColorizeText(addon_name, TalentLoadoutReminder.GUTIL.COLORS.BRIGHT_BLUE)

	frame.content.info = TalentLoadoutReminder.GGUI.Text({parent=frame.content, anchorParent=frame.content, 
		text="TalentLoadoutReminder was merged into a new addon called\n" .. LR ..
		"\nwith support for talent sets, addons, equip sets and specializations!\nYou can safely delete " .. TLR .. "\nand download " .. LR
    })

end