ITEM = class.Create("base_radio")

ITEM.Name 					= "Civil Protection Radio"
ITEM.Description 			= "A communications device synced to the Civil Protection's network.\n\nSelected channel: %s"

ITEM.OutlineColor 			= Color(127, 159, 255)

ITEM.ChannelCount 			= 3
ITEM.CanEncrypt 			= false
ITEM.CanSetFrequency		= false

ITEM.RadioPresets			= {
	[RADIOSET_CCAMAIN] = true,
	[RADIOSET_CCATACA] = true,
	[RADIOSET_CCATACB] = true,
	[RADIOSET_COTAMAIN] = true,
	[RADIOSET_WORKERMAIN] = true,
	[RADIOSET_ADMINSMAIN] = true,
}

ITEM.RadioGroups			= {
	[RADIOGROUP_CCA] = true,
}

function ITEM:GetDescription()
	return string.format(self.Description, self.PrimaryChannel)
end

return ITEM