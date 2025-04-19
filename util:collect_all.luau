-- hello!
local StatsUtil = require(game.ReplicatedStorage.Shared.Utils.Stats.StatsUtil)

hookfunction(StatsUtil.GetPickupRange, function()
			return 13371337
end)
