## IHA WATER

```lua
function CREATEIHAWATER(TIME, SIZE, CF)
	local TweenService = game:GetService("TweenService")

	local IHA = Instance.new("ImageHandleAdornment")
	IHA.Parent = workspace
	IHA.Color3 = Color3.fromRGB(150,140,200)
	IHA.Adornee = game.Workspace
	IHA.AlwaysOnTop = true
	IHA.Size = Vector2.new(0,0)
	IHA.Image = "rbxassetid://17608119070"
	IHA.ZIndex = 1
	IHA.CFrame = CF * CFrame.Angles(math.rad(90),0,0) - Vector3.new(0,3,0)

	game:GetService("Debris"):AddItem(IHA, TIME)
	TweenService:Create(IHA, TweenInfo.new(TIME), {Size = Vector2.new(SIZE,SIZE)}):Play()
	TweenService:Create(IHA, TweenInfo.new(TIME), {Transparency = 1}):Play()
end
```

## Function TIME, SIZE, CFRAME

```lua
CREATEIHAWATER(1, 15, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
```

## IHA Follow

```lua
function FOLLOWIHA(CYCLES, SIZE, PART)
	local TweenService = game:GetService("TweenService")
	local RunService = game:GetService("RunService")
	local Offset = Instance.new("NumberValue")
	Offset.Value = -3
	local function MakeIHA(angleDeg)
		local IHA = Instance.new("ImageHandleAdornment")
		IHA.Parent = workspace
		IHA.Color3 = Color3.fromRGB(150, 140, 200)
		IHA.Adornee = workspace
		IHA.AlwaysOnTop = true
		IHA.Size = Vector2.new(SIZE, SIZE)
		IHA.Image = "rbxassetid://17608119070"
		IHA.ZIndex = 1
		local rot = CFrame.Angles(math.rad(angleDeg), 0, 0)
		RunService.Heartbeat:Connect(function()
			local pos = PART.Position
			IHA.CFrame = CFrame.new(pos.X, pos.Y + Offset.Value, pos.Z) * rot
		end)
		game:GetService("Debris"):AddItem(IHA, CYCLES * 2)
	end
	
	MakeIHA(90)
	MakeIHA(270)
	game:GetService("Debris"):AddItem(Offset, CYCLES * 2)

	task.spawn(function()
	while Offset do
	TweenService:Create(Offset,TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{Value = 3}):Play()

	task.wait(1)

	TweenService:Create(Offset,TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),{Value = -3}):Play()
	
	task.wait(1)
		end
	end)
end
```

## Function CYCLES, SIZE, PART

```lua
FOLLOWIHA(2, 5, game.Players.LocalPlayer.Character.HumanoidRootPart)
```
