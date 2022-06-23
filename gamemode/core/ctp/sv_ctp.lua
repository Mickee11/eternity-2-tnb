if VERSION >= 150 then
	for key, value in pairs(file.Find("ctp/cvar_presets/*", "DATA")) do
		resource.AddFile("data/ctp/cvar_presets/" .. value)
	end

	for key, value in pairs(file.Find("ctp/default_cvar_presets/*", "DATA")) do
		resource.AddFile("data/ctp/default_cvar_presets/" .. value)
	end

	for key, value in pairs(file.Find("ctp/node_presets/*", "DATA")) do
		resource.AddFile("data/ctp/node_presets/" .. value)
	end
else
	for key, value in pairs(file.Find("ctp/cvar_presets/*")) do
		resource.AddFile("data/ctp/cvar_presets/" .. value)
	end

	for key, value in pairs(file.Find("ctp/default_cvar_presets/*")) do
		resource.AddFile("data/ctp/default_cvar_presets/" .. value)
	end

	for key, value in pairs(file.Find("ctp/node_presets/*")) do
		resource.AddFile("data/ctp/node_presets/" .. value)
	end
end

local META = FindMetaTable("Player")

function META:IsCTPEnabled()
	return CLIENT and GetConVar("ctp_enabled"):GetBool() == true or self:GetInfoNum("ctp_enabled", 0) == 1
end


util.AddNetworkString( "ctp_togglestate" );