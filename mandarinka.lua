local TweenService = game:GetService("TweenService")
local StarsUtil = require(game.ReplicatedStorage.Shared.Utils.Stats.StatsUtil)
local LocalData = require(game.ReplicatedStorage.Client.Framework.Services.LocalData)


local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/RecryDv/sh0velprod/refs/heads/main/UIlibrary.luau"))()
local ui = lib.CreateWindow(1337, {
	Title = "Bubble gum simulator infinity v0.2",
	Auth = "by sh0vel",
    Size = UDim2.fromOffset(540, 365)

})

local AutoFarm = ui.CreateTab("Auto Farm")

local Bubble = AutoFarm.AddSection("Auto Bubble")
local Collectables = AutoFarm.AddSection("Collectables")

local data = {
	auto_blow = false,
	auto_sell = false,
	auto_collect = false,
}

Bubble.AddToggle({
	Title = "Auto blow bubbles",
	Callback = function(val)
		data.auto_blow = val
		
		task.spawn(function()
			while data.auto_blow do
				game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("BlowBubble")
				task.wait(0.5)
			end
		end)
	end,
})

Bubble.AddToggle({
	Title = "Auto sell bubbles",
	Callback = function(val)
		data.auto_sell = val

		task.spawn(function()
			while data.auto_sell do
				task.wait(0.1)
				pcall(function()
					local data = LocalData:Get()
					local old = game.Players.LocalPlayer.Character.PrimaryPart.CFrame
					if data.Bubble.Amount >= StarsUtil:GetBubbleStorage(data) then
						game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("SellBubble")
                     end
				end)
			end
		end)
	end,
})

local old_formula = require(game:GetService("ReplicatedStorage").Shared.Utils.Stats.StatsUtil).GetPickupRange
Collectables.AddButton({
	Title = "Auto collect",
	Callback = function(val)
		hookfunction(StarsUtil.GetPickupRange, function()
			return 13371337
		end)
	end
})
