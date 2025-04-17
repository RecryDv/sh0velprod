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
		local r1 = TweenService:Create(root, TweenInfo.new(8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {CFrame = CFrame.new(cfr.Position.X, root.Position.Y, cfr.Position.Z)})
		r1:Play()
		r1.Completed:Connect(function()
			TweenService:Create(root, TweenInfo.new(1), {CFrame = cfr}):Play()
			task.wait(1)
		end)
	end)

	print(err)
end

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/RecryDv/sh0velprod/refs/heads/main/UIlibrary.luau"))()
local ui = lib.CreateWindow(1337, {
	Title = "Bubble gum simulator infinity v0.525",
	Author = "by sh0vel",
	Size = UDim2.fromOffset(540, 365)

})

local AutoFarm = ui.CreateTab("Auto Farm")
local Rift = ui.CreateTab("Rift")
local Bubble = AutoFarm.AddSection("Auto Bubble")
local Gifts = AutoFarm.AddSection("Gifts")
local Chests = AutoFarm.AddSection("Chests")
local Collectables = AutoFarm.AddSection("Collectables")
local Eggs = Rift.AddSection("Eggs")
local Other = Rift.AddSection("Other")

local Enchants = ui.CreateTab("Enchants")
local EncConfig = Enchants.AddSection("Enchant Config")
local EncGems = Enchants.AddSection("Method: Gems")
local EncOther = Enchants.AddSection("Method: Rerolls")

local data = {
	auto_blow = false,
	auto_sell = false,
	auto_collect = false,
	auto_gifts = false,
	auto_open_gifts = false,
	auto_enchant = {
		enchant = "",
		level = 0,
		gems = false,
		other = false,
	},
	auto_gc = false,
	auto_rc = false,
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
	["Royal"] = "royal-chest",
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

Gifts.AddToggle({
	Title = "Auto open",
	Callback = function(val)
		data.auto_open_gifts = val
		
		while data.auto_open_gifts do
			local args = {
				[1] = "UseGift",
				[2] = "Mystery Box",
				[3] = 5
			}

			game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
			
			local args = {
				[1] = "UseGift",
				[2] = "Mystery Box",
				[3] = 1
			}

			game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))


			
			
			for _, gift in pairs(workspace.Rendered.Gifts:GetChildren()) do
				
				local args = {
					[1] = "ClaimGift",
					[2] = gift.Name
				}

				game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
				task.delay(0.5, function()
					gift:Destroy()
				end)
			end
			
			task.wait(0.05)
		end
	end,
})

EncConfig.AddButton({
	Title = "Open config",
	Callback = function()
		EncConfig.AddMultiTable({
			Title = "Enchant Config",
			Options = {
				{
					Title = "Enchant",
					Callback = function(val)
						data.auto_enchant.enchant = val
					end,
				},
				
				{
					Title = "Enchant Level",
					Callback = function(val)
						data.auto_enchant.level = tonumber(val)
					end,
				},
			}
		})
	end,
})

EncGems.AddToggle({
	Title = "Auto enchant",
	Callback = function(val)
		data.auto_enchant.gems = val
		if data.auto_enchant.gems then
			local All_Enchants = require(game:GetService("ReplicatedStorage").Shared.Data.Enchants)
			local l_name = data.auto_enchant.enchant:lower()
			
			local correct = false
			
			for id, _ in pairs(All_Enchants) do
				if id == l_name then
					correct = true
					break
				end
			end

			if not correct then
				local msg = Instance.new("Message", workspace)
				msg.Text = "Invalid enchant id! Avaible IDs: looter, bubbler, team-up, gleaming"

				task.delay(1, function()
					msg:Destroy()
				end)
				return
			end
			
			local petID = ""

			local old_nmc
			old_nmc = hookmetamethod(game, "__namecall", function(self, ...)
				local method = getnamecallmethod()
				if method == "InvokeServer" then
					local args = {...}

					if args[1] == "RerollEnchants" and petID == "" then
						petID = args[2]
					end
				end

				return old_nmc(self, ...)
			end)


			local msg = Instance.new("Message", workspace)
			msg.Text = "Enchant your pet (with using gems) and auto enchant will start!"

			task.delay(5, function()
				msg:Destroy()
			end)


			local found_enchant = false
			repeat
				task.wait()
			until petID ~= ""

			repeat
				local save = LocalData:Get()
				local petData
				for _, pet in pairs(save.Pets) do
					if pet.Id == petID then
						petData = pet
						break
					end
				end

				if petData == nil then
					break
				end

				local enchants = petData.Enchants or {}

				for _, enc_data in pairs(enchants) do
					print(enc_data.Id, enc_data.Level)
					print(l_name, data.auto_enchant.level)
					if enc_data.Id == l_name and enc_data.Level >= data.auto_enchant.level then
						found_enchant = true
					end
				end

				if not found_enchant then
					game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Function"):InvokeServer("RerollEnchants", petID)
				end

				task.wait(0.015)
			until found_enchant == true or data.auto_enchant.gems == false
		end
	end,
})

EncOther.AddToggle({
	Title = "Auto enchant",
	Callback = function(val)
		data.auto_enchant.gems = val
		if data.auto_enchant.gems then
			local All_Enchants = require(game:GetService("ReplicatedStorage").Shared.Data.Enchants)
			local l_name = data.auto_enchant.enchant:lower()

			local correct = false

			for id, _ in pairs(All_Enchants) do
				if id == l_name then
					correct = true
					break
				end
			end

			if not correct then
				local msg = Instance.new("Message", workspace)
				msg.Text = "Invalid enchant id! Avaible IDs: looter, bubbler, team-up, gleaming"

				task.delay(1, function()
					msg:Destroy()
				end)
				return
			end

			local petID = ""

			local old_nmc
			old_nmc = hookmetamethod(game, "__namecall", function(self, ...)
				local method = getnamecallmethod()
				if method == "InvokeServer" then
					local args = {...}

					if args[1] == "RerollEnchants" and petID == "" then
						petID = args[2]
					end
				end

				return old_nmc(self, ...)
			end)


			local msg = Instance.new("Message", workspace)
			msg.Text = "Enchant your pet (with using gems) and auto enchant will start!"

			task.delay(5, function()
				msg:Destroy()
			end)


			local found_enchant = false
			repeat
				task.wait()
			until petID ~= ""

			repeat
				local save = LocalData:Get()
				local petData
				for _, pet in pairs(save.Pets) do
					if pet.Id == petID then
						petData = pet
						break
					end
				end

				if petData == nil then
					break
				end

				local enchants = petData.Enchants or {}

				for _, enc_data in pairs(enchants) do
					print(enc_data.Id, enc_data.Level)
					print(l_name, data.auto_enchant.level)
					if enc_data.Id == l_name and enc_data.Level >= data.auto_enchant.level then
						found_enchant = true
					end
				end

				if not found_enchant then
					local args = {
						[1] = "RerollEnchant",
						[2] = petID,
						[3] = 1
					}

					game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer(unpack(args))
				end

				task.wait(0.015)
			until found_enchant == true or data.auto_enchant.gems == false
		end
	end,
})


Chests.AddToggle({
	Title = "Auto open golden",
	Callback = function(val)
		data.auto_gc  = val
		
		while data.auto_gc do
			task.wait(1)
			game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("UnlockRiftChest", "golden-chest")
		end
	end,
})

Chests.AddToggle({
	Title = "Auto open royal",
	Callback = function(val)
		data.auto_rc  = val

		while data.auto_rc do
			task.wait(1) 
			game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Framework"):WaitForChild("Network"):WaitForChild("Remote"):WaitForChild("Event"):FireServer("UnlockRiftChest", "royal-chest")
		end
	end,
})
