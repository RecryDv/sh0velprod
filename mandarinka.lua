local TweenService = game:GetService("TweenService")
local StarsUtil = require(game.ReplicatedStorage.Shared.Utils.Stats.StatsUtil)
local LocalData = require(game.ReplicatedStorage.Client.Framework.Services.LocalData)
local args = {
    [1] = "Teleport",
    [2] = "Workspace.Worlds.The Overworld.Islands.Twilight.Island.Portal.Spawn"
}

game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))

task.wait(1)
local coins_chunker = nil
for _, pos_chunker in pairs(workspace.Rendered:GetChildren()) do
if pos_chunker.Name == "Chunker" and #pos_chunker:GetChildren() > 3 then
coins_chunker = pos_chunker
end
end


local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/RecryDv/sh0velprod/refs/heads/main/UIlibrary.luau"))()
local ui = lib.CreateWindow(1337, {
	Title = "Bubble gum simulator infinity v0.1",
	Auth = "by sh0vel",
	
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

Collectables.AddToggle({
    Title = "Auto collect coins & gems",
    Callback = function(val)
    data.auto_collect = val
    task.spawn(function()
			while data.auto_collect do
				pcall(function()  
                
                for _, l in pairs(workspace.Rendered.Chunker_1:GetChildren()) do
                l:Destroy()
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Pickups"):WaitForChild("CollectPickup"):FireServer(l.Name)
                end
                end)

                task.wait(2)

			end
		end)
    end
})
