ITEM = class.Create("base_radio")

ITEM.Name 					= "Combine Intelligence Radio"
ITEM.Description 			= "A communications device synced to the Combine's intelligence network.\n\nSelected channel: %s"

ITEM.OutlineColor 			= Color(127, 159, 255)

ITEM.ChannelCount 			= 4
ITEM.CanEncrypt 			= false
ITEM.CanSetFrequency		= false

ITEM.RadioPresets			= {
	[RADIOSET_CCAMAIN] = true,
	[RADIOSET_CCATACA] = true,
	[RADIOSET_CCATACB] = true,
	[RADIOSET_COTAMAIN] = true,
	[RADIOSET_COTATACA] = true,
	[RADIOSET_COTATACB] = true,
	[RADIOSET_WORKERMAIN] = true,
	[RADIOSET_WORKERA] = true,
	[RADIOSET_WORKERB] = true,
	[RADIOSET_ADMINSMAIN] = true,
	[RADIOSET_ADMINSALT] = true,
	[RADIOSET_INTELMAIN] = true,
	[RADIOSET_INTELOPA] = true,
	[RADIOSET_INTELOPB] = true,
}

ITEM.RadioGroups			= {
	[RADIOGROUP_CCA] = true,
	[RADIOGROUP_COTA] = true,
	[RADIOGROUP_INTEL] = true,
	[RADIOGROUP_CA] = true,
}

function ITEM:GetDescription()
	return string.format(self.Description, self.PrimaryChannel)
end

return ITEM