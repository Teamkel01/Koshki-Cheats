## IHA

```lua
function CREATEIHA(TIME, SIZE)
	local TweenService = game:GetService("TweenService")
	
	local IHA = Instance.new("ImageHandleAdornment")
	IHA.Parent = workspace
	IHA.Color3 = Color3.fromRGB(150,140,200)
	IHA.Adornee = game.Workspace
	IHA.AlwaysOnTop = true
	IHA.Size = Vector2.new(0,0)
	IHA.Image = "rbxassetid://17608119070"
	IHA.ZIndex = 1
	IHA.CFrame = script.Parent.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90),0,0) - Vector3.new(0,3,0)
	
	game:GetService("Debris"):AddItem(IHA, TIME)
	TweenService:Create(IHA, TweenInfo.new(TIME), {Size = Vector2.new(SIZE,SIZE)}):Play()
	TweenService:Create(IHA, TweenInfo.new(TIME), {Transparency = 1}):Play()
end
```

## Function TIME, SIZE

```lua
CREATEIHA(1, 15)
```

## IHA Follow

```lua
function CREATEIHA(TIME, SIZE)
	local TweenService = game:GetService("TweenService")
	
	local IHA = Instance.new("ImageHandleAdornment")
	IHA.Parent = workspace
	IHA.Color3 = Color3.fromRGB(150,140,200)
	IHA.Adornee = game.Workspace
	IHA.AlwaysOnTop = true
	IHA.Size = Vector2.new(0,0)
	IHA.Image = "rbxassetid://17608119070"
	IHA.ZIndex = 1
	IHA.CFrame = script.Parent.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(90),0,0) - Vector3.new(0,3,0)
	
	game:GetService("Debris"):AddItem(IHA, TIME)
	TweenService:Create(IHA, TweenInfo.new(TIME), {Size = Vector2.new(SIZE,SIZE)}):Play()
	TweenService:Create(IHA, TweenInfo.new(TIME), {Transparency = 1}):Play()
end
```

## Function CYCLES, SIZE, PART

```lua
FOLLOWIHA(2, 5, game.Players.LocalPlayer.Character.HumanoidRootPart)
```
