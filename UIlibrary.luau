local TweenService = game:GetService("TweenService")


local util2 = {
	blur_inc = function(fr)
		if game:GetService("RunService"):IsClient() then
			local blur = loadstring(game:HttpGet("https://raw.githubusercontent.com/RecryDv/shovelprod/refs/heads/main/blur.lua"))()

			if blur ~= nil then
				local BlurDoF = Instance.new("DepthOfFieldEffect")
				BlurDoF.Enabled = true
				BlurDoF.FarIntensity = 0
				BlurDoF.FocusDistance = 51.6
				BlurDoF.InFocusRadius = 50
				BlurDoF.NearIntensity = 1
				BlurDoF.Name = "UIBlurDoF"
				BlurDoF.Parent = game.Lighting

				blur:BindFrame(fr, {
					Transparency = 0.98;
					BrickColor = BrickColor.new(Color3.new(1,1,1));
				})
			end
		end
	end,
}
return {
	CreateWindow = function(pass, data)
		if pass == 1337 then
			local util = {
				ButtonFx = function(button)
					if button:IsA("GuiButton") and button:FindFirstChildOfClass("UIScale") then
						local button: GuiButton = button
						local scale = button:FindFirstChildOfClass("UIScale")
						local thook = TweenInfo.new(0.125, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut)
						button.MouseEnter:Connect(function()
							TweenService:Create(scale, thook, {Scale = 1.05}):Play()
						end)

						button.MouseLeave:Connect(function()
							TweenService:Create(scale, thook, {Scale = 1}):Play()
						end)

						button.MouseButton1Down:Connect(function()
							TweenService:Create(scale, thook, {Scale = 0.9}):Play()
						end)

						button.MouseButton1Up:Connect(function()
							TweenService:Create(scale, thook, {Scale = 1}):Play()
						end)
					end
				end,
			}
			local ui = {}
			
			local load = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
			load.Name = "load"
			load.ResetOnSpawn = true
			
			if game:GetService("RunService"):IsStudio() == false then
				load.Parent = gethui()
			end
			
			local Frame_1 = Instance.new("Frame", load)
			Frame_1.AnchorPoint = Vector2.new(0.5, 0.5)
			Frame_1.BackgroundColor3 = Color3.new(0.10980392247438431, 0.062745101749897, 0.1725490242242813)
			Frame_1.BackgroundTransparency = 1
			Frame_1.BorderColor3 = Color3.new(0, 0, 0)
			Frame_1.BorderSizePixel = 0
			Frame_1.Position = UDim2.new(0.5,0,0.5,0)
			Frame_1.Size = UDim2.new(0,0,0,0)
			
			TweenService:Create(Frame_1, TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {Size = UDim2.new(0,360,0,240)}):Play()

			local LoadingTitle = Instance.new("TextLabel", Frame_1)
			LoadingTitle.Name = "LoadingTitle"
			LoadingTitle.BackgroundColor3 = Color3.new(1, 1, 1)
			LoadingTitle.BackgroundTransparency = 1
			LoadingTitle.BorderColor3 = Color3.new(0, 0, 0)
			LoadingTitle.BorderSizePixel = 0
			LoadingTitle.Position = UDim2.new(0,0,0.01500015240162611,0)
			LoadingTitle.Size = UDim2.new(1,0,0.26333338022232056,0)
			LoadingTitle.Font = Enum.Font.FredokaOne
			LoadingTitle.Text = "Loading"
			LoadingTitle.TextColor3 = Color3.new(1, 1, 1)
			LoadingTitle.TextScaled = true
			LoadingTitle.TextSize = 14
			LoadingTitle.TextWrapped = true

			local UIPadding = Instance.new("UIPadding", LoadingTitle)
			UIPadding.PaddingBottom = UDim.new(0.019999999552965164, 0)
			UIPadding.PaddingLeft = UDim.new(0.05000000074505806, 0)
			UIPadding.PaddingRight = UDim.new(0.05000000074505806, 0)
			UIPadding.PaddingTop = UDim.new(0.019999999552965164, 0)

			local shadow = Instance.new("ImageLabel", Frame_1)
			shadow.Name = "shadow"
			shadow.AnchorPoint = Vector2.new(0.5, 0.5)
			shadow.BackgroundColor3 = Color3.new(1, 1, 1)
			shadow.BackgroundTransparency = 1
			shadow.BorderColor3 = Color3.new(0, 0, 0)
			shadow.BorderSizePixel = 0
			shadow.Position = UDim2.new(0.5,0,0.5,0)
			shadow.Size = UDim2.new(1.0156251192092896,35,1.00124990940094,35)
			shadow.ZIndex = -1000
			shadow.Image = "rbxassetid://14001321443"
			shadow.ImageColor3 = Color3.new(0.32156863808631897, 0.18431372940540314, 0.38823533058166504)
			shadow.ImageTransparency = 0.6000000238418579
			shadow.ScaleType = Enum.ScaleType.Slice
			shadow.SliceCenter = Rect.new(50,50,150,150)

			local LoadingDesc = Instance.new("TextLabel", Frame_1)
			LoadingDesc.Name = "LoadingDesc"
			LoadingDesc.BackgroundColor3 = Color3.new(1, 1, 1)
			LoadingDesc.BackgroundTransparency = 1
			LoadingDesc.BorderColor3 = Color3.new(0, 0, 0)
			LoadingDesc.BorderSizePixel = 0
			LoadingDesc.Position = UDim2.new(0,0,0.27750009298324585,0)
			LoadingDesc.Size = UDim2.new(1,0,0.1016666442155838,0)
			LoadingDesc.Font = Enum.Font.FredokaOne
			LoadingDesc.Text = "Please wait!"
			LoadingDesc.TextColor3 = Color3.new(1, 1, 1)
			LoadingDesc.TextScaled = true
			LoadingDesc.TextSize = 14
			LoadingDesc.TextTransparency = 0.5
			LoadingDesc.TextWrapped = true

			local UIPadding_0 = Instance.new("UIPadding", LoadingDesc)
			UIPadding_0.PaddingBottom = UDim.new(0.05000000074505806, 0)
			UIPadding_0.PaddingLeft = UDim.new(0.05000000074505806, 0)
			UIPadding_0.PaddingRight = UDim.new(0.05000000074505806, 0)
			UIPadding_0.PaddingTop = UDim.new(0.05000000074505806, 0)

			local MainFrame = Instance.new("Frame", Frame_1)
			MainFrame.Name = "MainFrame"
			MainFrame.BackgroundColor3 = Color3.new(0.10980392247438431, 0.062745101749897, 0.1725490242242813)
			MainFrame.BackgroundTransparency = 0.6000000238418579
			MainFrame.BorderColor3 = Color3.new(0, 0, 0)
			MainFrame.BorderSizePixel = 0
			MainFrame.Size = UDim2.new(1,0,1,0)
			MainFrame.ZIndex = -999

			local UICorner = Instance.new("UICorner", MainFrame)
			UICorner.CornerRadius = UDim.new(0.02500000037252903, 0)

			local LoadingImage = Instance.new("ImageLabel", Frame_1)
			LoadingImage.Name = "LoadingImage"
			LoadingImage.AnchorPoint = Vector2.new(0.5, 0.800000011920929)
			LoadingImage.BackgroundColor3 = Color3.new(1, 1, 1)
			LoadingImage.BackgroundTransparency = 1
			LoadingImage.BorderColor3 = Color3.new(0, 0, 0)
			LoadingImage.BorderSizePixel = 0
			LoadingImage.Position = UDim2.new(0.5,0,0.800000011920929,0)
			LoadingImage.Rotation = 7
			LoadingImage.Size = UDim2.new(0.5,0,0.5,0)
			LoadingImage.Image = "rbxassetid://10723433935"
			LoadingImage.ScaleType = Enum.ScaleType.Crop

			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint", LoadingImage)
			
			local e = TweenService:Create(LoadingImage, TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 5, false), {Rotation = 361})
			e:Play()
	
			
			
			task.wait(2.5)
			local test2 = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
			test2.Name = "test2"
			test2.ResetOnSpawn = false
			
			
			if game:GetService("RunService"):IsStudio() == false then
				test2.Parent = gethui()
			end
			
			local Frame = Instance.new("Frame", test2)
			Frame.AnchorPoint = Vector2.new(0.5, 0.5)
			Frame.BackgroundColor3 = Color3.new(0.10980392247438431, 0.062745101749897, 0.1725490242242813)
			Frame.BackgroundTransparency = 1
			Frame.BorderColor3 = Color3.new(0, 0, 0)
			Frame.BorderSizePixel = 0
			Frame.Position = UDim2.new(0.5,0,0.5,0)
			Frame.Size = UDim2.new(0,544,0,400)
			Frame.Visible = false
			
			e.Completed:Connect(function()
				Frame.Visible = true
				load:Destroy()
			end)

			
			local detector = Instance.new("UIDragDetector", Frame)

			local TitleLabel = Instance.new("TextLabel", Frame)
			TitleLabel.Name = "TitleLabel"
			TitleLabel.BackgroundColor3 = Color3.new(1, 1, 1)
			TitleLabel.BackgroundTransparency = 1
			TitleLabel.BorderColor3 = Color3.new(0, 0, 0)
			TitleLabel.BorderSizePixel = 0
			TitleLabel.Position = UDim2.new(0,0,0.014999999664723873,0)
			TitleLabel.Size = UDim2.new(1,0,0.054999999701976776,0)
			TitleLabel.Font = Enum.Font.FredokaOne
			TitleLabel.Text = data.Title
			TitleLabel.TextColor3 = Color3.new(1, 1, 1)
			TitleLabel.TextScaled = true
			TitleLabel.TextSize = 14
			TitleLabel.TextWrapped = true
			TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

			local UIPadding = Instance.new("UIPadding", TitleLabel)
			UIPadding.PaddingBottom = UDim.new(0.019999999552965164, 0)
			UIPadding.PaddingLeft = UDim.new(0.05000000074505806, 0)
			UIPadding.PaddingRight = UDim.new(0.05000000074505806, 0)
			UIPadding.PaddingTop = UDim.new(0.019999999552965164, 0)

			local shadow = Instance.new("ImageLabel", Frame)
			shadow.Name = "shadow"
			shadow.AnchorPoint = Vector2.new(0.5, 0.5)
			shadow.BackgroundColor3 = Color3.new(1, 1, 1)
			shadow.BackgroundTransparency = 1
			shadow.BorderColor3 = Color3.new(0, 0, 0)
			shadow.BorderSizePixel = 0
			shadow.Position = UDim2.new(0.5,0,0.5,0)
			shadow.Size = UDim2.new(1.0156251192092896,35,1.00124990940094,35)
			shadow.ZIndex = -1000
			shadow.Image = "rbxassetid://14001321443"
			shadow.ImageColor3 = Color3.new(0.32156863808631897, 0.18431372940540314, 0.38823533058166504)
			shadow.ImageTransparency = 0.6000000238418579
			shadow.ScaleType = Enum.ScaleType.Slice
			shadow.SliceCenter = Rect.new(50,50,150,150)

			local Tabs = Instance.new("ScrollingFrame", Frame)
			Tabs.Name = "Tabs"
			Tabs.Active = true
			Tabs.BackgroundColor3 = Color3.new(1, 1, 1)
			Tabs.BackgroundTransparency = 1
			Tabs.BorderColor3 = Color3.new(0, 0, 0)
			Tabs.BorderSizePixel = 0
			Tabs.Position = UDim2.new(0,0,0.11500000208616257,0)
			Tabs.Size = UDim2.new(0.375,0,0.8849999904632568,0)
			Tabs.CanvasSize = UDim2.new(0,0,1.25,0)
			Tabs.ScrollBarImageColor3 = Color3.new(0, 0, 0)
			Tabs.ScrollBarImageTransparency = 1

			local UIListLayout = Instance.new("UIListLayout", Tabs)
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0.03999999910593033, 0)

			local UIPadding_0 = Instance.new("UIPadding", Tabs)
			UIPadding_0.PaddingTop = UDim.new(0.029999999329447746, 0)

			local MainTab = Instance.new("ScrollingFrame", Frame)
			MainTab.Name = "MainTab"
			MainTab.Active = true
			MainTab.BackgroundColor3 = Color3.new(1, 1, 1)
			MainTab.BackgroundTransparency = 1
			MainTab.BorderColor3 = Color3.new(0, 0, 0)
			MainTab.BorderSizePixel = 0
			MainTab.Position = UDim2.new(0.375,0,0.11500000208616257,0)
			MainTab.Size = UDim2.new(0.625,0,0.8849999904632568,0)
			MainTab.CanvasSize = UDim2.new(0,0,1.25,0)
			MainTab.ScrollBarImageColor3 = Color3.new(0, 0, 0)
			MainTab.ScrollBarImageTransparency = 1

			local UIListLayout_0 = Instance.new("UIListLayout", MainTab)
			UIListLayout_0.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout_0.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_0.Padding = UDim.new(0.014999999664723873, 0)

			local UIPadding_1 = Instance.new("UIPadding", MainTab)
			UIPadding_1.PaddingBottom = UDim.new(0.02500000037252903, 0)
			UIPadding_1.PaddingLeft = UDim.new(0.02500000037252903, 0)
			UIPadding_1.PaddingRight = UDim.new(0.02500000037252903, 0)
			UIPadding_1.PaddingTop = UDim.new(0.02500000037252903, 0)

			local UICorner = Instance.new("UICorner", MainTab)
			UICorner.CornerRadius = UDim.new(0.029999999329447746, 0)

			local AuthorLabel = Instance.new("TextLabel", Frame)
			AuthorLabel.Name = "AuthorLabel"
			AuthorLabel.BackgroundColor3 = Color3.new(1, 1, 1)
			AuthorLabel.BackgroundTransparency = 1
			AuthorLabel.BorderColor3 = Color3.new(0, 0, 0)
			AuthorLabel.BorderSizePixel = 0
			AuthorLabel.Position = UDim2.new(0,0,0.06499999761581421,0)
			AuthorLabel.Size = UDim2.new(1,0,0.05999999865889549,0)
			AuthorLabel.Font = Enum.Font.FredokaOne
			AuthorLabel.Text = data.Author
			AuthorLabel.TextColor3 = Color3.new(1, 1, 1)
			AuthorLabel.TextScaled = true
			AuthorLabel.TextSize = 14
			AuthorLabel.TextTransparency = 0.5
			AuthorLabel.TextWrapped = true
			AuthorLabel.TextXAlignment = Enum.TextXAlignment.Left

			local UIPadding_2 = Instance.new("UIPadding", AuthorLabel)
			UIPadding_2.PaddingBottom = UDim.new(0.05000000074505806, 0)
			UIPadding_2.PaddingLeft = UDim.new(0.05000000074505806, 0)
			UIPadding_2.PaddingRight = UDim.new(0.05000000074505806, 0)
			UIPadding_2.PaddingTop = UDim.new(0.05000000074505806, 0)

			local MainFrame = Instance.new("Frame", Frame)
			MainFrame.Name = "MainFrame"
			MainFrame.BackgroundColor3 = Color3.new(0.10980392247438431, 0.062745101749897, 0.1725490242242813)
			MainFrame.BackgroundTransparency = 0.6000000238418579
			MainFrame.BorderColor3 = Color3.new(0, 0, 0)
			MainFrame.BorderSizePixel = 0
			MainFrame.Size = UDim2.new(1,0,1,0)
			MainFrame.ZIndex = -999

			local UICorner_0 = Instance.new("UICorner", MainFrame)
			UICorner_0.CornerRadius = UDim.new(0.02500000037252903, 0)

		




			ui.tabs = 0
			ui.total_tabs = {}

			function ui.CreateTab(Title)
				ui.tabs -= 1
				local lo = 1
				local Example = Instance.new("TextButton", Tabs)
				Example.Name = "Example"
				Example.BackgroundColor3 = Color3.new(0.6784313917160034, 0.3137255012989044, 1)
				Example.BorderColor3 = Color3.new(0, 0, 0)
				Example.BorderSizePixel = 0
				Example.LayoutOrder = ui.tabs
				Example.Size = UDim2.new(0.8500000238418579,0,0.125,0)
				Example.ZIndex = 69
				Example.Font = Enum.Font.FredokaOne
				Example.Text = Title
				Example.TextColor3 = Color3.new(1, 1, 1)
				Example.TextScaled = true
				Example.TextSize = 14
				Example.TextWrapped = true

				local UICorner_0 = Instance.new("UICorner", Example)
				UICorner_0.CornerRadius = UDim.new(0.10000000149011612, 0)

				local button_shadow = Instance.new("ImageLabel", Example)
				button_shadow.Name = "button_shadow"
				button_shadow.AnchorPoint = Vector2.new(0.5, 0.5)
				button_shadow.BackgroundColor3 = Color3.new(1, 1, 1)
				button_shadow.BackgroundTransparency = 1
				button_shadow.BorderColor3 = Color3.new(0, 0, 0)
				button_shadow.BorderSizePixel = 0
				button_shadow.Position = UDim2.new(0.5,0,0.5,0)
				button_shadow.Size = UDim2.new(1.024999976158142,35,1.0049999952316284,25)
				button_shadow.ZIndex = 68
				button_shadow.Image = "rbxassetid://14001321443"
				button_shadow.ImageColor3 = Color3.new(0.05490196496248245, 0.0313725508749485, 0.06666667014360428)
				button_shadow.ImageTransparency = 0.699999988079071
				button_shadow.ScaleType = Enum.ScaleType.Slice
				button_shadow.SliceCenter = Rect.new(50,50,150,150)

				local UI_Button_Scale = Instance.new("UIScale", Example)
				UI_Button_Scale.Name = "UI_Button_Scale"

				local UIPadding_0 = Instance.new("UIPadding", Example)
				UIPadding_0.PaddingBottom = UDim.new(0.05000000074505806, 0)
				UIPadding_0.PaddingLeft = UDim.new(0.05000000074505806, 0)
				UIPadding_0.PaddingRight = UDim.new(0.05000000074505806, 0)
				UIPadding_0.PaddingTop = UDim.new(0.05000000074505806, 0)

				local MainTab = Instance.new("ScrollingFrame", Frame)
				MainTab.Name = "MainTab"
				MainTab.Active = true
				MainTab.BackgroundColor3 = Color3.new(1, 1, 1)
				MainTab.BackgroundTransparency = 1
				MainTab.BorderColor3 = Color3.new(0, 0, 0)
				MainTab.BorderSizePixel = 0
				MainTab.Position = UDim2.new(0.375,0,0.11500000208616257,0)
				MainTab.Size = UDim2.new(0.625,0,0.8849999904632568,0)
				MainTab.CanvasSize = UDim2.new(0,0,1.25,0)
				MainTab.ScrollBarImageColor3 = Color3.new(0, 0, 0)
				MainTab.ScrollBarImageTransparency = 1
				MainTab.AutomaticCanvasSize = Enum.AutomaticSize.Y
				MainTab.Visible = false

				local UIListLayout_0 = Instance.new("UIListLayout", MainTab)
				UIListLayout_0.HorizontalAlignment = Enum.HorizontalAlignment.Center
				UIListLayout_0.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout_0.Padding = UDim.new(0.014999999664723873, 0)

				local UIPadding_1 = Instance.new("UIPadding", MainTab)
				UIPadding_1.PaddingBottom = UDim.new(0.02500000037252903, 0)
				UIPadding_1.PaddingLeft = UDim.new(0.02500000037252903, 0)
				UIPadding_1.PaddingRight = UDim.new(0.02500000037252903, 0)
				UIPadding_1.PaddingTop = UDim.new(0.02500000037252903, 0)

				local UICorner_0 = Instance.new("UICorner", MainTab)
				UICorner_0.CornerRadius = UDim.new(0.029999999329447746, 0)

				table.insert(ui.total_tabs, MainTab)

				Example.Activated:Connect(function()
					for _, t in pairs(ui.total_tabs) do
						t.Visible = false
					end

					MainTab.Visible = true
				end)
				util.ButtonFx(Example)
				local tasks = {
					AddSection = function(Title)
						local lo2 = 0
						lo += 1
						local Section = Instance.new("TextButton", MainTab)
						Section.Name = Title
						Section.BackgroundColor3 = Color3.new(0.6784313917160034, 0.3137255012989044, 1)
						Section.BorderColor3 = Color3.new(0, 0, 0)
						Section.BorderSizePixel = 0
						Section.Size = UDim2.new(0.8500000238418579,0,0.10000000149011612,0)
						Section.ZIndex = 71
						Section.Font = Enum.Font.FredokaOne
						Section.Text = Title
						Section.TextColor3 = Color3.new(1, 1, 1)
						Section.TextScaled = true
						Section.TextSize = 14
						Section.TextWrapped = true
						Section.TextXAlignment = Enum.TextXAlignment.Left
						Section.LayoutOrder = lo

						local empty = Instance.new("Frame", MainTab)
						empty.Name = "empty"
						empty.BackgroundColor3 = Color3.new(1, 1, 1)
						empty.BackgroundTransparency = 1
						empty.BorderColor3 = Color3.new(0, 0, 0)
						empty.BorderSizePixel = 0
						empty.LayoutOrder = lo
						empty.Position = UDim2.new(0,0,0.2424323856830597,0)
						empty.Size = UDim2.new(0,276,0,160)
						lo += 1

						local UICorner_1 = Instance.new("UICorner", Section)
						UICorner_1.CornerRadius = UDim.new(0.30000001192092896, 0)

						local UIPadding_3 = Instance.new("UIPadding", Section)
						UIPadding_3.PaddingBottom = UDim.new(0.05000000074505806, 0)
						UIPadding_3.PaddingLeft = UDim.new(0.05000000074505806, 0)
						UIPadding_3.PaddingRight = UDim.new(0.05000000074505806, 0)
						UIPadding_3.PaddingTop = UDim.new(0.05000000074505806, 0)

						local button_shadow_0 = Instance.new("ImageLabel", Section)
						button_shadow_0.Name = "button_shadow"
						button_shadow_0.AnchorPoint = Vector2.new(0.5, 0.5)
						button_shadow_0.BackgroundColor3 = Color3.new(1, 1, 1)
						button_shadow_0.BackgroundTransparency = 1
						button_shadow_0.BorderColor3 = Color3.new(0, 0, 0)
						button_shadow_0.BorderSizePixel = 0
						button_shadow_0.Position = UDim2.new(0.5020233988761902,0,0.5000005960464478,0)
						button_shadow_0.Size = UDim2.new(1.0533291101455688,35,1.005000114440918,25)
						button_shadow_0.ZIndex = 70
						button_shadow_0.Image = "rbxassetid://14001321443"
						button_shadow_0.ImageColor3 = Color3.new(0.05490196496248245, 0.0313725508749485, 0.06666667014360428)
						button_shadow_0.ImageTransparency = 0.800000011920929
						button_shadow_0.ScaleType = Enum.ScaleType.Slice
						button_shadow_0.SliceCenter = Rect.new(50,50,150,150)

						local UIScale = Instance.new("UIScale", Section)

						local arror_down = Instance.new("ImageLabel", Section)
						arror_down.Name = "arror_down"
						arror_down.AnchorPoint = Vector2.new(1, 0.5)
						arror_down.BackgroundColor3 = Color3.new(1, 1, 1)
						arror_down.BackgroundTransparency = 1
						arror_down.BorderColor3 = Color3.new(0, 0, 0)
						arror_down.BorderSizePixel = 0
						arror_down.Position = UDim2.new(1,0,0.5,0)
						arror_down.Size = UDim2.new(1,0,1,0)
						arror_down.ZIndex = 71
						arror_down.Rotation = -180
						arror_down.Image = "rbxassetid://10709767827"

						local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint", arror_down)

						local SectionFrame = Instance.new("ScrollingFrame", Section)
						SectionFrame.Name = "SectionFrame"
						SectionFrame.Active = true
						SectionFrame.BackgroundColor3 = Color3.new(0.4627451002597809, 0.21568627655506134, 0.6901960968971252)
						SectionFrame.BorderColor3 = Color3.new(0, 0, 0)
						SectionFrame.BorderSizePixel = 0
						SectionFrame.Position = UDim2.new(-0.05700007826089859,0,0.0940011665225029,0)
						SectionFrame.Size = UDim2.new(1.117,0,0.95,0)
						SectionFrame.ZIndex = 69
						SectionFrame.CanvasSize = UDim2.new(0,0,1,0)
						SectionFrame.ScrollBarImageColor3 = Color3.new(0, 0, 0)
						SectionFrame.ScrollBarThickness = 0
						SectionFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

						local UICorner_2 = Instance.new("UICorner", SectionFrame)

						local UIListLayout_1 = Instance.new("UIListLayout", SectionFrame)
						UIListLayout_1.HorizontalAlignment = Enum.HorizontalAlignment.Center
						UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder
						UIListLayout_1.Padding = UDim.new(0.029999999329447746, 0)

						local void = Instance.new("Frame", SectionFrame)
						void.Name = "void"
						void.BackgroundColor3 = Color3.new(1, 1, 1)
						void.BackgroundTransparency = 1
						void.BorderColor3 = Color3.new(0, 0, 0)
						void.BorderSizePixel = 0
						void.LayoutOrder = -123
						void.Position = UDim2.new(0,0,-7.982207961276799e-08,0)
						void.Size = UDim2.new(1,0,0.18938395380973816,0)

						local opened = false

						task.spawn(function()
							while task.wait() do
								empty.Size = UDim2.new(1, 0, 0, SectionFrame.AbsoluteSize.Y - 35)
							end
						end)

						SectionFrame.Visible = false

						Section.Activated:Connect(function()
							opened = not opened
							if opened then
								SectionFrame.Visible = opened
							end

							if opened then
								TweenService:Create(SectionFrame, TweenInfo.new(0.45, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {Size = UDim2.new(1.117,0,6,0)}):Play()
							elseif not opened then
								local e = TweenService:Create(SectionFrame, TweenInfo.new(0.45, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {Size = UDim2.new(1.117,0,0.95,0)}):Play()
								
							end

							TweenService:Create(arror_down, TweenInfo.new(0.125, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {Rotation = arror_down.Rotation + 180}):Play()
						end)



						return {
							AddButton = function(data)
								lo2 += 1
								local Title = data.Title
								local Callback = data.Callback

								local ExampleButton = Instance.new("TextButton", SectionFrame)
								ExampleButton.Name = "ExampleButton"
								ExampleButton.BackgroundColor3 = Color3.new(0.7568628191947937, 0.3686274588108063, 1)
								ExampleButton.BorderColor3 = Color3.new(0, 0, 0)
								ExampleButton.BorderSizePixel = 0
								ExampleButton.Position = UDim2.new(0.07500027865171432,0,0.17000003159046173,0)
								ExampleButton.Size = UDim2.new(0.8500000238418579,0,0.166849747300148,0)
								ExampleButton.ZIndex = 69
								ExampleButton.Font = Enum.Font.FredokaOne
								ExampleButton.Text = Title
								ExampleButton.TextColor3 = Color3.new(1, 1, 1)
								ExampleButton.TextScaled = true
								ExampleButton.TextSize = 14
								ExampleButton.TextWrapped = true
								ExampleButton.TextXAlignment = Enum.TextXAlignment.Left
								ExampleButton.LayoutOrder = lo2
								
								local scale = Instance.new("UIScale", ExampleButton)

								local UIPadding_4 = Instance.new("UIPadding", ExampleButton)
								UIPadding_4.PaddingBottom = UDim.new(0.05000000074505806, 0)
								UIPadding_4.PaddingLeft = UDim.new(0.05000000074505806, 0)
								UIPadding_4.PaddingRight = UDim.new(0.05000000074505806, 0)
								UIPadding_4.PaddingTop = UDim.new(0.05000000074505806, 0)

								local button_shadow_1 = Instance.new("ImageLabel", ExampleButton)
								button_shadow_1.Name = "button_shadow"
								button_shadow_1.AnchorPoint = Vector2.new(0.5, 0.5)
								button_shadow_1.BackgroundColor3 = Color3.new(1, 1, 1)
								button_shadow_1.BackgroundTransparency = 1
								button_shadow_1.BorderColor3 = Color3.new(0, 0, 0)
								button_shadow_1.BorderSizePixel = 0
								button_shadow_1.Position = UDim2.new(0.5,0,0.5,0)
								button_shadow_1.Size = UDim2.new(1.024999976158142,35,1.0049999952316284,25)
								button_shadow_1.ZIndex = 68
								button_shadow_1.Image = "rbxassetid://14001321443"
								button_shadow_1.ImageColor3 = Color3.new(0.05490196496248245, 0.0313725508749485, 0.06666667014360428)
								button_shadow_1.ImageTransparency = 0.699999988079071
								button_shadow_1.ScaleType = Enum.ScaleType.Slice
								button_shadow_1.SliceCenter = Rect.new(50,50,150,150)

								local ImageLabel = Instance.new("ImageLabel", ExampleButton)
								ImageLabel.AnchorPoint = Vector2.new(1, 0.5)
								ImageLabel.BackgroundColor3 = Color3.new(1, 1, 1)
								ImageLabel.BackgroundTransparency = 1
								ImageLabel.BorderColor3 = Color3.new(0, 0, 0)
								ImageLabel.BorderSizePixel = 0
								ImageLabel.Position = UDim2.new(1,0,0.5,0)
								ImageLabel.Size = UDim2.new(0.7599999904632568,0,0.7599999904632568,0)
								ImageLabel.ZIndex = 70
								ImageLabel.Image = "rbxassetid://10734929723"
								ImageLabel.ScaleType = Enum.ScaleType.Tile

								local UIAspectRatioConstraint_0 = Instance.new("UIAspectRatioConstraint", ImageLabel)

								local UICorner_3 = Instance.new("UICorner", ExampleButton)
								UICorner_3.CornerRadius = UDim.new(1, 0)

								util.ButtonFx(ExampleButton)

								ExampleButton.Activated:Connect(function()
									Callback()
								end)
							end,

							AddToggle = function(data)
								lo2 += 1
								local Title = data.Title
								local Callback = data.Callback
								local Default = data.Default or false

								Callback(Default)

								local ExampleToggle = Instance.new("Frame", SectionFrame)
								ExampleToggle.Name = "ExampleToggle"
								ExampleToggle.BackgroundColor3 = Color3.new(1, 1, 1)
								ExampleToggle.BackgroundTransparency = 1
								ExampleToggle.BorderColor3 = Color3.new(0, 0, 0)
								ExampleToggle.BorderSizePixel = 0
								ExampleToggle.LayoutOrder = 1
								ExampleToggle.Size = UDim2.new(0.8500000238418579,0,0.16699999570846558,0)
								ExampleToggle.ZIndex = 69
								ExampleToggle.LayoutOrder = lo2

								local ToggleButton = Instance.new("TextButton", ExampleToggle)
								ToggleButton.Name = "ToggleButton"
								ToggleButton.AnchorPoint = Vector2.new(1, 0.5)
								ToggleButton.BackgroundColor3 = Color3.new(0.3019607961177826, 0.10588236153125763, 0.4274510145187378)
								ToggleButton.BorderColor3 = Color3.new(0, 0, 0)
								ToggleButton.BorderSizePixel = 0
								ToggleButton.Position = UDim2.new(1,0,0.5,0)
								ToggleButton.Size = UDim2.new(0.800000011920929,0,0.800000011920929,0)
								ToggleButton.ZIndex = 69
								ToggleButton.Font = Enum.Font.SourceSans
								ToggleButton.Text = ""
								ToggleButton.TextColor3 = Color3.new(0, 0, 0)
								ToggleButton.TextSize = 14

								local UIAspectRatioConstraint_1 = Instance.new("UIAspectRatioConstraint", ToggleButton)

								local UIStroke = Instance.new("UIStroke", ToggleButton)
								UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
								UIStroke.Thickness = 3

								local check = Instance.new("ImageLabel", ToggleButton)
								check.Name = "check"
								check.BackgroundColor3 = Color3.new(1, 1, 1)
								check.BackgroundTransparency = 1
								check.BorderColor3 = Color3.new(0, 0, 0)
								check.BorderSizePixel = 0
								check.Size = UDim2.new(1,0,1,0)
								check.Visible = false
								check.ZIndex = 70
								check.Image = "rbxassetid://10709790644"

								local UICorner_4 = Instance.new("UICorner", ToggleButton)
								UICorner_4.CornerRadius = UDim.new(0.10000000149011612, 0)

								local TextLabel_0 = Instance.new("TextLabel", ExampleToggle)
								TextLabel_0.BackgroundColor3 = Color3.new(1, 1, 1)
								TextLabel_0.BackgroundTransparency = 1
								TextLabel_0.BorderColor3 = Color3.new(0, 0, 0)
								TextLabel_0.BorderSizePixel = 0
								TextLabel_0.Size = UDim2.new(0.800000011920929,0,1,0)
								TextLabel_0.ZIndex = 69
								TextLabel_0.Font = Enum.Font.FredokaOne
								TextLabel_0.Text = Title
								TextLabel_0.TextColor3 = Color3.new(1, 1, 1)
								TextLabel_0.TextScaled = true
								TextLabel_0.TextSize = 14
								TextLabel_0.TextWrapped = true
								TextLabel_0.TextXAlignment = Enum.TextXAlignment.Left


								ToggleButton.Activated:Connect(function()
									Default = not Default
									check.Visible = Default

									if Default then
										TweenService:Create(ToggleButton, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.new(0.623529, 0.45098, 0.866667)}):Play()
									elseif not Default then
										TweenService:Create(ToggleButton, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {BackgroundColor3 = Color3.new(0.3019607961177826, 0.10588236153125763, 0.4274510145187378)}):Play()
									end

									Callback(Default)
								end)
							end,
							
							AddMultiTable = function(data)
								local title = data.Title
								local tasks = data.Options or {}
								
								local values = {}
								
								local TableValueFrame = Instance.new("Frame", Frame)
								TableValueFrame.Name = "TableValueFrame"
								TableValueFrame.BackgroundColor3 = Color3.new(1, 1, 1)
								TableValueFrame.BackgroundTransparency = 1
								TableValueFrame.BorderColor3 = Color3.new(0, 0, 0)
								TableValueFrame.BorderSizePixel = 0
								TableValueFrame.Size = UDim2.new(1,0,1,0)

								local CanvasGroup = Instance.new("CanvasGroup", TableValueFrame)
								CanvasGroup.BackgroundColor3 = Color3.new(0, 0, 0)
								CanvasGroup.BackgroundTransparency = 0.6000000238418579
								CanvasGroup.BorderColor3 = Color3.new(0, 0, 0)
								CanvasGroup.BorderSizePixel = 0
								CanvasGroup.Size = UDim2.new(1,0,1,0)
								CanvasGroup.Visible = true
								CanvasGroup.ZIndex = 1000

								local UICorner_1 = Instance.new("UICorner", CanvasGroup)
								UICorner_1.CornerRadius = UDim.new(0.02500000037252903, 0)

								local CanvasFrame = Instance.new("Frame", CanvasGroup)
								CanvasFrame.Name = "CanvasFrame"
								CanvasFrame.AnchorPoint = Vector2.new(0.5, 0.5)
								CanvasFrame.BackgroundColor3 = Color3.new(0.10980392247438431, 0.062745101749897, 0.1725490242242813)
								CanvasFrame.BorderColor3 = Color3.new(0, 0, 0)
								CanvasFrame.BorderSizePixel = 0
								CanvasFrame.Position = UDim2.new(0.5,0,0.5,0)
								CanvasFrame.Size = UDim2.new(0.6000000238418579,0,0.6000000238418579,0)
								CanvasFrame.ZIndex = 998

								local UICorner_2 = Instance.new("UICorner", CanvasFrame)
								UICorner_2.CornerRadius = UDim.new(0.02500000037252903, 0)

								local shadow_0 = Instance.new("ImageLabel", CanvasFrame)
								shadow_0.Name = "shadow"
								shadow_0.AnchorPoint = Vector2.new(0.5, 0.5)
								shadow_0.BackgroundColor3 = Color3.new(1, 1, 1)
								shadow_0.BackgroundTransparency = 1
								shadow_0.BorderColor3 = Color3.new(0, 0, 0)
								shadow_0.BorderSizePixel = 0
								shadow_0.Position = UDim2.new(0.4908088743686676,0,0.49166664481163025,0)
								shadow_0.Size = UDim2.new(0.9788603186607361,35,1.026249885559082,35)
								shadow_0.ZIndex = 997
								shadow_0.Image = "rbxassetid://14001321443"
								shadow_0.ImageColor3 = Color3.new(0.6745098233222961, 0.38823533058166504, 0.8196079134941101)
								shadow_0.ImageTransparency = 0.800000011920929
								shadow_0.ScaleType = Enum.ScaleType.Slice
								shadow_0.SliceCenter = Rect.new(50,50,150,50)

								local ConfTitle = Instance.new("TextLabel", CanvasFrame)
								ConfTitle.Name = "ConfTitle"
								ConfTitle.BackgroundColor3 = Color3.new(1, 1, 1)
								ConfTitle.BackgroundTransparency = 1
								ConfTitle.BorderColor3 = Color3.new(0, 0, 0)
								ConfTitle.BorderSizePixel = 0
								ConfTitle.Position = UDim2.new(0,0,0.015000088140368462,0)
								ConfTitle.Size = UDim2.new(1,0,0.1341666728258133,0)
								ConfTitle.ZIndex = 1001
								ConfTitle.Font = Enum.Font.FredokaOne
								ConfTitle.Text = title
								ConfTitle.TextColor3 = Color3.new(1, 1, 1)
								ConfTitle.TextScaled = true
								ConfTitle.TextSize = 14
								ConfTitle.TextWrapped = true

								local UIPadding_3 = Instance.new("UIPadding", ConfTitle)
								UIPadding_3.PaddingBottom = UDim.new(0.019999999552965164, 0)
								UIPadding_3.PaddingLeft = UDim.new(0.05000000074505806, 0)
								UIPadding_3.PaddingRight = UDim.new(0.05000000074505806, 0)
								UIPadding_3.PaddingTop = UDim.new(0.019999999552965164, 0)

								local Tab = Instance.new("Frame", CanvasFrame)
								Tab.Name = "Tab"
								Tab.BackgroundColor3 = Color3.new(1, 1, 1)
								Tab.BackgroundTransparency = 1
								Tab.BorderColor3 = Color3.new(0, 0, 0)
								Tab.BorderSizePixel = 0
								Tab.Position = UDim2.new(0,0,0.1458333283662796,0)
								Tab.Size = UDim2.new(1,0,0.8640000224113464,0)
								Tab.ZIndex = 1001
								
								local uil = Instance.new("UIListLayout", Tab)
								uil.Padding = UDim.new(0.025, 0)

								local Save = Instance.new("TextButton", CanvasFrame)
								Save.AnchorPoint = Vector2.new(0.5, 0.949999988079071)
								Save.BackgroundColor3 = Color3.new(0.7411764860153198, 0.3803921937942505, 1)
								Save.BorderColor3 = Color3.new(0, 0, 0)
								Save.BorderSizePixel = 0
								Save.Position = UDim2.new(0.5,0,0.949999988079071,0)
								Save.Size = UDim2.new(0.5,0,0.10000000149011612,0)
								Save.ZIndex = 1004
								Save.Font = Enum.Font.FredokaOne
								Save.Text = "Save"
								Save.TextColor3 = Color3.new(1, 1, 1)
								Save.TextScaled = true
								Save.TextSize = 14
								Save.TextWrapped = true
								
								local scale = Instance.new("UIScale", Save)
								util.ButtonFx(Save)

								local UIPadding_6 = Instance.new("UIPadding", Save)
								UIPadding_6.PaddingBottom = UDim.new(0.05000000074505806, 0)
								UIPadding_6.PaddingLeft = UDim.new(0.05000000074505806, 0)
								UIPadding_6.PaddingRight = UDim.new(0.05000000074505806, 0)
								UIPadding_6.PaddingTop = UDim.new(0.05000000074505806, 0)

								local UICorner_4 = Instance.new("UICorner", Save)
								UICorner_4.CornerRadius = UDim.new(0.20000000298023224, 0)

								local shadow_1 = Instance.new("ImageLabel", Save)
								shadow_1.Name = "shadow"
								shadow_1.AnchorPoint = Vector2.new(0.5, 0.5)
								shadow_1.BackgroundColor3 = Color3.new(1, 1, 1)
								shadow_1.BackgroundTransparency = 1
								shadow_1.BorderColor3 = Color3.new(0, 0, 0)
								shadow_1.BorderSizePixel = 0
								shadow_1.Position = UDim2.new(0.4908088743686676,0,0.49166664481163025,0)
								shadow_1.Size = UDim2.new(0.9788603186607361,10,1.0260000228881836,10)
								shadow_1.ZIndex = 1003
								shadow_1.Image = "rbxassetid://14001321443"
								shadow_1.ImageColor3 = Color3.new(0.6745098233222961, 0.38823533058166504, 0.8196079134941101)
								shadow_1.ImageTransparency = 0.800000011920929
								shadow_1.ScaleType = Enum.ScaleType.Slice
								shadow_1.SliceCenter = Rect.new(50,50,150,50)
								
								for _, task_c in pairs(tasks) do
									local Example = Instance.new("Frame", Tab)
									Example.Name = task_c.Title
									Example.BackgroundColor3 = Color3.new(1, 1, 1)
									Example.BackgroundTransparency = 1
									Example.BorderColor3 = Color3.new(0, 0, 0)
									Example.BorderSizePixel = 0
									Example.Size = UDim2.new(1,0,0.20000000298023224,0)
									Example.Visible = true
									Example.ZIndex = 1002
									Example:SetAttribute("IsTab", true)

									local Desc = Instance.new("TextLabel", Example)
									Desc.Name = "Desc"
									Desc.BackgroundColor3 = Color3.new(1, 1, 1)
									Desc.BackgroundTransparency = 1
									Desc.BorderColor3 = Color3.new(0, 0, 0)
									Desc.BorderSizePixel = 0
									Desc.Position = UDim2.new(0,0,0.014999999664723873,0)
									Desc.Size = UDim2.new(0.550000011920929,0,1,0)
									Desc.ZIndex = 1003
									Desc.Font = Enum.Font.FredokaOne
									Desc.Text = task_c.Title
									Desc.TextColor3 = Color3.new(1, 1, 1)
									Desc.TextScaled = true
									Desc.TextSize = 14
									Desc.TextWrapped = true
									Desc.TextXAlignment = Enum.TextXAlignment.Left

									local UIPadding_4 = Instance.new("UIPadding", Desc)
									UIPadding_4.PaddingBottom = UDim.new(0.10000000149011612, 0)
									UIPadding_4.PaddingLeft = UDim.new(0.05000000074505806, 0)
									UIPadding_4.PaddingRight = UDim.new(0.10000000149011612, 0)
									UIPadding_4.PaddingTop = UDim.new(0.10000000149011612, 0)

									local UITextSizeConstraint = Instance.new("UITextSizeConstraint", Desc)
									UITextSizeConstraint.MinTextSize = 12

									local Input = Instance.new("TextBox", Example)
									Input.Name = "Input"
									Input.AnchorPoint = Vector2.new(0.8999999761581421, 0.5)
									Input.BackgroundColor3 = Color3.new(0.8235294818878174, 0.4117647409439087, 1)
									Input.BorderColor3 = Color3.new(0, 0, 0)
									Input.BorderSizePixel = 0
									Input.Position = UDim2.new(0.8999999761581421,0,0.5,0)
									Input.Size = UDim2.new(0.4000000059604645,0,0.8999999761581421,0)
									Input.ZIndex = 1004
									Input.Font = Enum.Font.FredokaOne
									Input.TextColor3 = Color3.new(1, 1, 1)
									Input.TextScaled = true
									Input.Text = ""
									Input.PlaceholderText = "Value"
									Input.PlaceholderColor3 = Color3.fromRGB(191, 191, 191)
									Input.TextSize = 14
									Input.TextWrapped = true

									local UICorner_3 = Instance.new("UICorner", Input)
									UICorner_3.CornerRadius = UDim.new(0.20000000298023224, 0)

									local UIPadding_5 = Instance.new("UIPadding", Input)
									UIPadding_5.PaddingBottom = UDim.new(0.05000000074505806, 0)
									UIPadding_5.PaddingLeft = UDim.new(0.05000000074505806, 0)
									UIPadding_5.PaddingRight = UDim.new(0.05000000074505806, 0)
									UIPadding_5.PaddingTop = UDim.new(0.05000000074505806, 0)
									
									Save.Activated:Connect(function()
										task_c.Callback(Input.Text)
										TableValueFrame:Destroy()
									end)
									
								end
								
								

								
								
							end,
						}
					end,
				}


				return tasks
			end
			Frame.Size = UDim2.fromOffset(0,0)
			repeat
				task.wait()
			until Frame.Visible == true
			task.wait(0.5)

			local s = TweenService:Create(Frame, TweenInfo.new(0.625, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {Size = data.Size})
			s:Play()

			pcall(function()
				util2.blur_inc(Frame)
			end)

			return ui
		end
	end,
}
