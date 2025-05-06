local Supported = {
	[6504986360] = "https://raw.githubusercontent.com/RecryDv/sh0velprod/refs/heads/main/bgsi.lua",
        [7436755782] = "https://raw.githubusercontent.com/RecryDv/sh0velprod/refs/heads/main/garden.luau"
}

local ID = game.GameId
local gm = Supported[ID]

if gm == nil then
	warn("sh0vel prod. -> Game is not supported")
	return
end

loadstring(game:HttpGet(gm))()

