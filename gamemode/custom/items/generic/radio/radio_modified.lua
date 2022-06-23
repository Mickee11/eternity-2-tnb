ITEM = class.Create("base_radio")

ITEM.Name 					= "Modified Handheld Radio"
ITEM.Description 			= "A handheld radio that's been modified with the internals of a Civil Protection transmitter.\n\nSelected channel: %s"

ITEM.OutlineColor 			= Color(127, 159, 255)

ITEM.ChannelCount 			= 3
ITEM.CanEncrypt 			= false

function ITEM:GetDescription()
	return string.format(self.Description, self.PrimaryChannel)
end

return ITEM
