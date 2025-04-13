local TweenService = game:GetService("TweenService")
local StarsUtil = require(game.ReplicatedStorage.Shared.Utils.Stats.StatsUtil)
local LocalData = require(game.ReplicatedStorage.Client.Framework.Services.LocalData)
local player = game.Players.LocalPlayer


local function teleport(cfr)
	local _, err = pcall(function()
		local args = {
			[1] = "Teleport",
			[2] = "Workspace.Worlds.The Overworld.FastTravel.Spawn"
		}

		game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))

		task.wait(0.5)

		local root = player.Character.PrimaryPart

		root.CFrame = root.CFrame + Vector3.new(0,1000,0)
		local mag = (root.Position - cfr.Position).Magnitude
		print(mag)

		local r1 = TweenService:Create(root, TweenInfo.new(10, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {CFrame = CFrame.new(cfr.Position.X, root.Position.Y, cfr.Position.Z)})
		r1:Play()
		r1.Completed:Connect(function()
			root.Anchored = true
			TweenService:Create(root, TweenInfo.new(0.2), {CFrame = cfr}):Play()
			task.wait(1)
			root.Anchored = false
		end)
	end)

	print(err)
end

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/RecryDv/sh0velprod/refs/heads/main/UIlibrary.luau"))()
local ui = lib.CreateWindow(1337, {
	Title = "Bubble gum simulator infinity v0.2",
	Auth = "by sh0vel",
	Size = UDim2.fromOffset(540, 365)

})

local AutoFarm = ui.CreateTab("Auto Farm")
local Rift = ui.CreateTab("Rift")
local Bubble = AutoFarm.AddSection("Auto Bubble")
local Gifts = AutoFarm.AddSection("Gifts")
local Collectables = AutoFarm.AddSection("Collectables")
local Eggs = Rift.AddSection("Eggs")
local Other = Rift.AddSection("Other")
local data = {
	auto_blow = false,
	auto_sell = false,
	auto_collect = false,
	auto_gifts = false,
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

local lucks = {"x5", "x10", "x25"}
local rifts = {
	["Chest"] = "golden-chest",
	["Gift"] = "gift-rift",
}

for _, luck in pairs(lucks) do
	Eggs.AddButton({
		Title = "Teleport to "..luck,
		Callback = function()
			local rifts1 = workspace.Rendered.Rifts:GetChildren()
			local r1 = {}
			for _ = 1, #rifts1 do
				local rnd = math.random(#rifts1)
				print(rnd)
				table.insert(r1, rifts1[rnd])
				table.remove(rifts1, rnd)
			end


			for _, egg in pairs(r1) do
				if egg:GetAttribute("Type") == "Egg" then
					if egg.Display.SurfaceGui.Icon.Luck.Text == luck then
						teleport(egg.Display.CFrame)
						break
					end
				end
			end
		end,
	})
end

for id, rift_m in pairs(rifts) do
	Other.AddButton({
		Title = "Teleport to "..id,
		Callback = function()
			local rifts1 = workspace.Rendered.Rifts:GetChildren()
			local r1 = {}
			for _ = 1, #rifts1 do
				local rnd = math.random(#rifts1)
				print(rnd)
				table.insert(r1, rifts1[rnd])
				table.remove(rifts1, rnd)
			end

			print(#r1,#rifts1)

			for _, rift in pairs(r1) do
				if rift.Name == rift_m then
					teleport(rift.Display.CFrame)
					break
				end
			end
		end,
	})
end

Gifts.AddToggle({
	Title = "Auto collect",
	Callback = function(val)
		data.auto_gifts = val
		
		task.spawn(function()
			while data.auto_gifts do
				for id = 1, 9 do
					local args = {
						[1] = "ClaimPlaytime",
						[2] = id
					}

					game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Function"):InvokeServer(unpack(args))
				end
				
				task.wait(1)
				
			end
		end)
	end,
})
