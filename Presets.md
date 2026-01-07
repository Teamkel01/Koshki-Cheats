## VISUALS

## IHA CIRCLE

```lua
local ALLIHA = {}

function CREATEIHACIRCLE(SIZE, OFFSET, PART)

	local IHA = Instance.new("ImageHandleAdornment")
	IHA.Parent = workspace
	IHA.Color3 = Color3.fromRGB(150,140,200)
	IHA.Adornee = PART
	IHA.AlwaysOnTop = true
	IHA.Size = Vector2.new(SIZE,SIZE)
	IHA.Image = "rbxassetid://117208227488794"
	IHA.ZIndex = 1
	IHA.CFrame = CFrame.Angles(math.rad(90),0,0) + Vector3.new(0,OFFSET,0)

	local IHATWO = Instance.new("ImageHandleAdornment")
	IHATWO.Parent = workspace
	IHATWO.Color3 = Color3.fromRGB(150,140,200)
	IHATWO.Adornee = PART
	IHATWO.AlwaysOnTop = true
	IHATWO.Size = Vector2.new(SIZE,SIZE)
	IHATWO.Image = "rbxassetid://117208227488794"
	IHATWO.ZIndex = 1
	IHATWO.CFrame = CFrame.Angles(math.rad(270),0,0) + Vector3.new(0,OFFSET,0)

	local PAIR = {IHA, IHATWO}
	table.insert(ALLIHA, PAIR)
	return PAIR
end

function DELETEIHACIRCLE(PAIR)
	for i, v in ipairs(ALLIHA) do
		if v == PAIR then
			for _, adornment in ipairs(v) do
				adornment:Destroy()
			end
			table.remove(ALLIHA, i)
			break
		end
	end
end
```

## Function SIZE, PART

```lua
local IHA = CREATEIHACIRCLE(15, -3,	game.Players.LocalPlayer.Character.HumanoidRootPart)
```

## IHA RIPPLE

```lua
function CREATEIHARIPPLE(TIME, SIZE, CF)
	local TweenService = game:GetService("TweenService")

	local IHA = Instance.new("ImageHandleAdornment")
	IHA.Parent = workspace
	IHA.Color3 = Color3.fromRGB(150,140,200)
	IHA.Adornee = workspace
	IHA.AlwaysOnTop = true
	IHA.Size = Vector2.new(0,0)
	IHA.Image = "rbxassetid://117208227488794"
	IHA.ZIndex = 1
	IHA.CFrame = CF * CFrame.Angles(math.rad(90),0,0)
	
	local IHATWO = Instance.new("ImageHandleAdornment")
	IHATWO.Parent = workspace
	IHATWO.Color3 = Color3.fromRGB(150,140,200)
	IHATWO.Adornee = workspace
	IHATWO.AlwaysOnTop = true
	IHATWO.Size = Vector2.new(0,0)
	IHATWO.Image = "rbxassetid://117208227488794"
	IHATWO.ZIndex = 1
	IHATWO.CFrame = CF * CFrame.Angles(math.rad(270),0,0)

	game:GetService("Debris"):AddItem(IHA, TIME)
	TweenService:Create(IHA, TweenInfo.new(TIME), {Size = Vector2.new(SIZE,SIZE)}):Play()
	TweenService:Create(IHA, TweenInfo.new(TIME), {Transparency = 1}):Play()
	
	game:GetService("Debris"):AddItem(IHATWO, TIME)
	TweenService:Create(IHATWO, TweenInfo.new(TIME), {Size = Vector2.new(SIZE,SIZE)}):Play()
	TweenService:Create(IHATWO, TweenInfo.new(TIME), {Transparency = 1}):Play()
end
```

## Function TIME, SIZE, CFRAME

```lua
CREATEIHARIPPLE(1, 15, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
```

## IHA Follow

```lua
local ALLIHA = {}

function FOLLOWIHA(SIZE, OFFSET, PART)
	local TweenService = game:GetService("TweenService")
	local RunService = game:GetService("RunService")
	
	local IHA = Instance.new("ImageHandleAdornment")
	IHA.Parent = workspace
	IHA.Color3 = Color3.fromRGB(150,140,200)
	IHA.Adornee = PART
	IHA.AlwaysOnTop = true
	IHA.Size = Vector2.new(SIZE,SIZE)
	IHA.Image = "rbxassetid://117208227488794"
	IHA.ZIndex = 1
	IHA.CFrame = CFrame.Angles(math.rad(90),0,0) - Vector3.new(0,OFFSET,0)

	local IHATWO = Instance.new("ImageHandleAdornment")
	IHATWO.Parent = workspace
	IHATWO.Color3 = Color3.fromRGB(150,140,200)
	IHATWO.Adornee = PART
	IHATWO.AlwaysOnTop = true
	IHATWO.Size = Vector2.new(SIZE,SIZE)
	IHATWO.Image = "rbxassetid://117208227488794"
	IHATWO.ZIndex = 1
	IHATWO.CFrame = CFrame.Angles(math.rad(270),0,0) - Vector3.new(0,OFFSET,0)
	
	local IHATWEENUP = TweenService:Create(IHA, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.Angles(math.rad(90),0,0) + Vector3.new(0,OFFSET,0)})
	local IHATWOTWEENUP = TweenService:Create(IHATWO, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.Angles(math.rad(270),0,0) + Vector3.new(0,OFFSET,0)})
	
	local IHATWEENDOWN = TweenService:Create(IHA, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.Angles(math.rad(90),0,0) - Vector3.new(0,OFFSET,0)})
	local IHATWOTWEENDOWN = TweenService:Create(IHATWO, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.Angles(math.rad(270),0,0) - Vector3.new(0,OFFSET,0)})
	
	task.spawn(function()
		while IHA and IHATWO do
			IHATWEENUP:Play()
			IHATWOTWEENUP:Play()
			task.wait(1)
			IHATWEENDOWN:Play()
			IHATWOTWEENDOWN:Play()
			task.wait(1)
		end
	end)
	
	local PAIR = {IHA, IHATWO}
	table.insert(ALLIHA, PAIR)
	return PAIR
end

function DELETEIHACIRCLE(PAIR)
	for i, v in ipairs(ALLIHA) do
		if v == PAIR then
			for _, adornment in ipairs(v) do
				adornment:Destroy()
			end
			table.remove(ALLIHA, i)
			break
		end
	end
end
```

## Function SIZE, OFFSET, PART

```lua
local IHA = FOLLOWIHA(5, 2.5, game.Players.LocalPlayer.Character.HumanoidRootPart)
```
