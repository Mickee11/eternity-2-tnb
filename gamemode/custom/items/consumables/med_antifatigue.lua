ITEM = class.Create("base_consumable")

ITEM.Name 				= "Anti-fatigue Rations"
ITEM.Description 		= "A small Combine-produced kit that contains half a dozen single-use syringes filled with some kind of amphetamines.\n\n%s"

ITEM.Model 				= Model("models/props_hla/lab/radiation_medical_kit.mdl")

ITEM.SelfString 		= "Use syringe"

ITEM.MaxUses 			= 6
ITEM.UsesLeft 			= ITEM.MaxUses

function ITEM:GetDescription()
	local desc

	if self.UsesLeft == 0 then
		desc = "The case is empty."
	elseif self.UsesLeft == 1 then
		desc = "There is one syringe left."
	else
		desc = "There are " .. self.UsesLeft .. " syringes left."
	end

	return string.format(self.Description, desc)
end

function ITEM:GetOptions(ply)
	local tab = {}

	if self.UsesLeft > 0 then
		table.insert(tab, {
			Name = "Use syringe",
			Callback = function()
				self:OnSelfUse(ply)
			end
		})
	end

	for _, v in pairs(self:ParentCall("GetOptions", ply)) do
		table.insert(tab, v)
	end

	return tab
end

if CLIENT then
	netstream.Hook("med_antifatigue", function()
		local duration = 600

		local rampup = 2
		local rampdown = 10

		local endtime = CurTime() + duration

		local charid = LocalPlayer():CharID()

		local function ramp(time, val1, val2, val3, val4) -- Should get some easing funcs
			return math.ClampedRemap(time, duration, duration - rampup, val1, val2) + math.ClampedRemap(time, rampdown, 0, val3, val4)
		end

		hook.Add("RenderScreenspaceEffects", "med_antifatigue", function()
			local time = endtime - CurTime()

			if time <= 0 or LocalPlayer():CharID() != charid or not LocalPlayer():Alive() then
				hook.Remove("RenderScreenspaceEffects", "med_antifatigue")

				return
			end

			local sharpen_contrast = math.ClampedRemap(time, duration, duration - rampup, 0, 1)
			local sharpen_distance = math.ClampedRemap(time, rampdown, 0, 1, 0)

			DrawSharpen(sharpen_contrast, sharpen_distance)

			local col_contrast = ramp(time, -0.2, 0, 1.2, 1)
			local col_mult = ramp(time, 1, 0.5, 0, 0.5)

			DrawColorModify({
				["$pp_colour_addr"] = 0,
				["$pp_colour_addg"] = 0,
				["$pp_colour_addb"] = 0,
				["$pp_colour_contrast"] = col_contrast,
				["$pp_colour_brightness"] = 0,
				["$pp_colour_colour"] = col_mult,
				["$pp_colour_mulr"] = 0,
				["$pp_colour_mulg"] = 0,
				["$pp_colour_mulb"] = 0
			})
		end)
	end)
else
	function ITEM:OnSelfUse(ply)
		netstream.Send("med_antifatigue", {}, ply)

		ply:SetHungerBar(ply:HungerBar() * 0.60)

		self.UsesLeft = self.UsesLeft - 1

		if self.UsesLeft == 1 then
			ply:SendChat("NOTICE", "You take the last syringe out of the case and use it on yourself.")
		else
			ply:SendChat("NOTICE", "You take a syringe out of the case and use it on yourself.")
		end
	end
end

return ITEM
