module("timedEvent", package.seeall)

local class = {}

function class:While(delta, callback)
	local ok = true
	local remaining = delta

	while ok do
		ok, remaining = self:NextEvent(remaining)

		callback()
	end
end

function class:NextEvent(delta)
	if delta >= self.Next then
		self.Next = self.Delay

		return true, delta - self.Next
	else
		self.Next = self.Next - delta

		return false
	end
end

function class:ResetRate(rate)
	self.Delay = 1 / rate
end

function New(rate)
	return setmetatable({
		Delay = 1 / rate,
		Next = 0
	}, {__index = class})
end
