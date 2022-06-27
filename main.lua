-- Gui to Lua
-- Version: 3.2

-- Instances:
local ESPEnabled = false
local ESP = Instance.new("ScreenGui")
local EnableESP = Instance.new("TextButton")
local ESPShade = Instance.new("Highlight")

--Properties:

ESP.Name = "ESP"
ESP.Parent = game.CoreGui
ESP.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ESPShade.Name = "ESPCell"
ESPShade.Parent = game.ReplicatedStorage
ESPShade.FillTransparency = getgenv.Transpar()
ESPShade.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
ESPShade.FillColor = getgenv.Fill()
ESPShade.Enabled = true
ESPShade.OutlineColor = getgenv.Outline()
ESPShade.OutlineTransparency = 0


EnableESP.Name = "EnableESP"
EnableESP.Parent = ESP
EnableESP.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
EnableESP.BorderSizePixel = 0
EnableESP.Position = UDim2.new(0.00777453929, 0, 0.0192307681, 0)
EnableESP.Size = UDim2.new(0, 200, 0, 50)
EnableESP.Font = Enum.Font.FredokaOne
EnableESP.Text = "Enable ESP"
EnableESP.TextColor3 = Color3.fromRGB(255, 255, 255)
EnableESP.TextScaled = true
EnableESP.TextSize = 14.000
EnableESP.TextWrapped = true
EnableESP.Draggable = true
EnableESP.Active = true

local function ESPTHING()
	if ESPEnabled then
		for i,v in pairs(game.Players:GetChildren()) do
			if game.Players[v.Name].Team == game.Players.LocalPlayer.Team then
				continue
			else
				print("Adding ESP")
				local EspShadeClone = ESPShade:Clone()
				EspShadeClone.Parent = game.Workspace[v.Name]
			EspShadeClone.Name = "ESP"
		end
		end
	else
		for i,v in pairs(game.Workspace:GetDescendants()) do
			if v.Name == "ESP" then
				print("Removing ESP")
				v:Destroy()
			end
		end
	end
end

game.Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function(Char)
		if ESPEnabled and game.Players[plr.Name].Team ~= game.Players.LocalPlayer.Team then
			if Char:FindFirstChild("ESP") then
				Char:FindFirstChild("ESP"):Destroy()
			end
			local EspShadeClone = ESPShade:Clone()
			EspShadeClone.Parent = Char
			EspShadeClone.Name = "ESP"
			ESPShade.Adornee = Char
			end
	end)
end)
EnableESP.MouseButton1Click:Connect(function()
	ESPEnabled = not ESPEnabled
	ESPTHING()
end)

while true do
	task.wait(5)
	ESPTHING()
end
