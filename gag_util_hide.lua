local function set_transparency(val)
				
				for _, farm in pairs(workspace:WaitForChild("Farm"):GetChildren()) do
				if farm:FindFirstChild("Important") then
					for _, plant in pairs(farm:FindFirstChild("Important"):WaitForChild("Plants_Physical"):GetChildren()) do
						if math.random(1, 750) == 1 then
							task.wait()
						end
						for _, part in pairs(plant:GetChildren()) do
								if math.random(1, 250) == 1 then
									task.wait()
								end
							if part:IsA("BasePart") then
								local should = true
								
								pcall(function()
									if part.BrickColor == BrickColor.new("Medium stone grey") then
										should = false
									end
								end)
								
								if should then
									part.Transparency = val
								end
							end
						end 
					end
				  end
				end
			end

return set_transparency
