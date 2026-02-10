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

## TEST

```lua
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
end

local IHAESP = true

for _, players in game:GetService("Players"):GetPlayers() do
	CREATEIHACIRCLE(30, -3, players.Character.HumanoidRootPart)
end

for _, players in game:GetService("Players"):GetPlayers() do
	players.CharacterAdded:Connect(function(char)
		if IHAESP then
		CREATEIHACIRCLE(30, -3, char.HumanoidRootPart)
		end
	end)
	
	players.CharacterRemoving:Connect(function(char)
		for _, parts in workspace:GetChildren() do
			if parts:IsA("ImageHandleAdornment") then
				if parts.Adornee == char.HumanoidRootPart then
					parts:Destroy()
				end
			end
		end
	end)
end
```

## OUTLINE

```lua
function CreateBHA(part, CFrame, Size)
	local BHA = Instance.new("BoxHandleAdornment")
	BHA.Parent = workspace
	BHA.Adornee = part
	BHA.CFrame = CFrame
	BHA.Shading = Enum.AdornShading.AlwaysOnTop
	BHA.ZIndex = 1
	BHA.Size = Size
	BHA.Color3 = Color3.fromRGB(255,255,255)

	return BHA
end

function OutlineObject(part, Thickness)
	local ThicknessOffset = Thickness / 2

	local X = part.Size.X
	local Y = part.Size.Y
	local Z = part.Size.Z

	local BHAONE = CreateBHA(part, CFrame.new(0,-ThicknessOffset - Y / 2,ThicknessOffset - Z / 2), Vector3.new(X,Thickness,Thickness))
	local BHATWO = CreateBHA(part, CFrame.new(ThicknessOffset - X / 2,-ThicknessOffset - Y / 2,0), Vector3.new(Thickness,Thickness,Z))
	local BHATHREE = CreateBHA(part, CFrame.new(0,-ThicknessOffset - Y / 2,-ThicknessOffset + Z / 2), Vector3.new(-X,Thickness,Thickness))
	local BHAFOUR = CreateBHA(part, CFrame.new(-ThicknessOffset + X / 2,-ThicknessOffset - Y / 2,0), Vector3.new(Thickness,Thickness,-Z))

	local BHAFIVE = CreateBHA(part, CFrame.new(0,-ThicknessOffset + Y / 2,ThicknessOffset - Z / 2), Vector3.new(X,Thickness,Thickness))
	local BHASIX = CreateBHA(part, CFrame.new(ThicknessOffset - X / 2,-ThicknessOffset + Y / 2,0), Vector3.new(Thickness,Thickness,Z))
	local BHASEVEN = CreateBHA(part, CFrame.new(0,-ThicknessOffset + Y / 2,-ThicknessOffset + Z / 2), Vector3.new(-X,Thickness,Thickness))
	local BHAEIGHT = CreateBHA(part, CFrame.new(-ThicknessOffset + X / 2,-ThicknessOffset + Y / 2,0), Vector3.new(Thickness,Thickness,-Z))

	local BHANINE = CreateBHA(part, CFrame.new(ThicknessOffset - X / 2,0,ThicknessOffset - Z / 2), Vector3.new(Thickness,Y,Thickness))
	local BHATEN = CreateBHA(part, CFrame.new(ThicknessOffset - X / 2,0,-ThicknessOffset + Z / 2), Vector3.new(Thickness,Y,Thickness))
	local BHAELEVEN = CreateBHA(part, CFrame.new(-ThicknessOffset + X / 2,0,ThicknessOffset - Z / 2), Vector3.new(Thickness,Y,Thickness))
	local BHATWELVE = CreateBHA(part, CFrame.new(-ThicknessOffset + X / 2,0,-ThicknessOffset + Z / 2), Vector3.new(Thickness,Y,Thickness))
	
	local Outlines = {BHAONE, BHATWO, BHATHREE, BHAFOUR, BHAFIVE, BHASIX, BHASEVEN, BHAEIGHT, BHANINE, BHATEN, BHAELEVEN, BHATWELVE}
	return Outlines
end

function DeleteOutline(Outline)
	for _, Adornments in ipairs(Outline) do
		Adornments:Destroy()
	end
end

local Outline = OutlineObject(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, 0.025)
```

## SPEED

```lua
local VELOCITY = true
local VSPEED = 30

game:GetService("RunService").RenderStepped:Connect(function()
	if VELOCITY then
		local character = game.Players.LocalPlayer.Character
		if character and character:FindFirstChild("Humanoid") and character:FindFirstChild("HumanoidRootPart") then
			local humanoid = character.Humanoid
			local hrp = character.HumanoidRootPart
			local moveDir = humanoid.MoveDirection
			local velocity = hrp.Velocity
			local verticalVelocity = velocity.Y

			if moveDir.Magnitude > 0 then
				hrp.Velocity = moveDir.Unit * VSPEED + Vector3.new(0, verticalVelocity, 0)
			else
				hrp.Velocity = Vector3.new(velocity.X, 0, velocity.Z) * 0 + Vector3.new(0, verticalVelocity, 0)
			end
		end
	end
end)
```
