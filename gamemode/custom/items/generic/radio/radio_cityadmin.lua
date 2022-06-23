ITEM = class.Create("base_radio")

ITEM.Name 					= "Labor Administration Radio"
ITEM.Description 			= "A communications device synced to the City Administration's network.\n\nSelected channel: %s"

ITEM.OutlineColor 			= Color(127, 159, 255)

ITEM.ChannelCount 			= 2
ITEM.CanEncrypt 			= false
ITEM.CanSetFrequency		= false

ITEM.RadioPresets			= {
	[RADIOSET_CCAMAIN] = true,
	[RADIOSET_COTAMAIN] = true,
	[RADIOSET_WORKERMAIN] = true,
	[RADIOSET_WORKERA] = true,
	[RADIOSET_WORKERB] = true,
	[RADIOSET_ADMINSMAIN] = true,
	[RADIOSET_ADMINSALT] = true
}

ITEM.RadioGroups			= {
	[RADIOGROUP_CA] = true,
}

function ITEM:GetDescription()
	return string.format(self.Description, self.PrimaryChannel)
end

return ITEM