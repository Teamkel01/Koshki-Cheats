## VISUALS

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
```

## PART, THICKNESS

```lua
local Outline = OutlineObject(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, 0.025)
```

## FILLED OUTLINE

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
	
	local BHATHIRTEEN = CreateBHA(part, CFrame.new(0,0,0), Vector3.new(X,Y,Z))
	BHATHIRTEEN.Transparency = 0.5

	local Outlines = {BHAONE, BHATWO, BHATHREE, BHAFOUR, BHAFIVE, BHASIX, BHASEVEN, BHAEIGHT, BHANINE, BHATEN, BHAELEVEN, BHATWELVE, BHATHIRTEEN}
	return Outlines
end

function DeleteOutline(Outline)
	for _, Adornments in ipairs(Outline) do
		Adornments:Destroy()
	end
end
```

## PART, THICKNESS

```lua
local Outline = OutlineObject(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, 0.025)
```

## CIRCLE

```lua
function CreateBHA(part, CFrame, Size, Transparency)
	local BHA = Instance.new("BoxHandleAdornment")
	BHA.Parent = workspace
	BHA.Adornee = part
	BHA.CFrame = CFrame
	BHA.Shading = Enum.AdornShading.AlwaysOnTop
	BHA.ZIndex = 1
	BHA.Size = Size
	BHA.Transparency = Transparency
	BHA.Color3 = Color3.fromRGB(255,255,255)

	return BHA
end

function CircleObject(part, Sides, Radius, Thickness, Offset, Transparency)

	local Circles = {}

	for i = 1, Sides do
		local Angle = 360 / Sides * i
		local Rotation = -360 / Sides * i
		local Length = 2 * Radius * math.tan(math.pi / Sides)

		local Circle = CreateBHA(part, CFrame.new(math.cos(math.rad(Angle)) * Radius, Offset ,math.sin(math.rad(Angle)) * Radius) * CFrame.Angles(0,math.rad(Rotation),0), Vector3.new(Thickness,Thickness,Length), Transparency)

		table.insert(Circles, Circle)
	end
	
	return Circles
end

function UpdateCircle(Part, Sides, Radius, Thickness, Offset, Transparency, Circle)
	
	local Circles = {}
	
	for i = 1, Sides do
		if #Circle >= i then
			local Angle = 360 / Sides * i
			local Rotation = -360 / Sides * i
			local Length = 2 * Radius * math.tan(math.pi / Sides)

			Circle[i].CFrame = CFrame.new(math.cos(math.rad(Angle)) * Radius, Offset ,math.sin(math.rad(Angle)) * Radius) * CFrame.Angles(0,math.rad(Rotation),0)
			Circle[i].Size = Vector3.new(Thickness,Thickness,Length)
			Circle[i].Adornee = Part
			Circle[i].Transparency = Transparency
			
			table.insert(Circles, Circle[i])
		else
			local Angle = 360 / Sides * i
			local Rotation = -360 / Sides * i
			local Length = 2 * Radius * math.tan(math.pi / Sides)

			local Circle = CreateBHA(Part, CFrame.new(math.cos(math.rad(Angle)) * Radius, Offset ,math.sin(math.rad(Angle)) * Radius) * CFrame.Angles(0,math.rad(Rotation),0), Vector3.new(Thickness,Thickness,Length), Transparency)

			table.insert(Circles, Circle)
		end
	end
	
	return Circles
end

function DeleteCircle(Circle)
	for _, Adornments in ipairs(Circle) do
		Adornments:Destroy()
	end
end
```

## PART, SIDES, RADIUS, THICKNESS, OFFSET, TRANSPARENCY

```lua
local Circle = CircleObject(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, 100, 10, 0.025, 0, 0)
```

## UPDATE CIRCLE

## PART, SIDES, RADIUS, THICKNESS, OFFSET, TRANSPARENCY, CIRCLE

```lua
Circle = UpdateCircle(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, 100, 10, 0.025, 0, 0, Circle)
```

## TRACER

```lua
local Tracers = {}

function CreateBHA(part, CFrame, Size)
	local BHA = Instance.new("BoxHandleAdornment")
	BHA.Parent = workspace
	BHA.Adornee = workspace
	BHA.CFrame = CFrame
	BHA.Shading = Enum.AdornShading.AlwaysOnTop
	BHA.ZIndex = 1
	BHA.Size = Size
	BHA.Color3 = Color3.fromRGB(255,255,255)

	return BHA
end

game:GetService("RunService").Heartbeat:Connect(function()
	for _, Data in ipairs(Tracers) do
		local Tracer = Data.Tracer
		local Part = Data.Part
		local TargetPart = Data.TargetPart
		local Offset = Data.Offset
		local TargetOffset = Data.TargetOffset
		local Thickness = Data.Thickness
		local Transparency = Data.Transparency

		local Start = Part.Position + Vector3.new(0,Offset,0)
		local End = TargetPart.Position + Vector3.new(0,TargetOffset,0)
		local Direction = End - Start
		local Distance = Direction.Magnitude

		Tracer.Transparency = Transparency
		Tracer.Size = Vector3.new(Thickness, Thickness, Distance)
		Tracer.CFrame = CFrame.lookAt(Start, End) * CFrame.new(0,0,-Distance / 2)
	end
end)

function TraceObject(Part, TargetPart, Offset, TargetOffset, Thickness, Transparency)
	local Tracer = CreateBHA(Part, CFrame.new(0,0,0), Vector3.new(0,0,0))
	local Table = {Tracer = Tracer, Part = Part, TargetPart = TargetPart, Offset = Offset, TargetOffset = TargetOffset, Thickness = Thickness, Transparency = Transparency}
	table.insert(Tracers, Table)
	return Table
end

function DeleteTracer(Tracer)
	for i, Data in ipairs(Tracers) do
		Data.Tracer:Destroy()
		table.remove(Tracers, i)
	end
end
```

## PART, TARGET, OFFSET, TARGETOFFSET, THICKNESS, TRANSPARENCY

```lua
local Tracer = TraceObject(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, nil, -3, 0, 0.025, 0)
```

## TRACER WITH CIRCLE

```lua
local Tracers = {}

function CreateBHA(part, CFrame, Size)
	local BHA = Instance.new("BoxHandleAdornment")
	BHA.Parent = workspace
	BHA.Adornee = workspace
	BHA.CFrame = CFrame
	BHA.Shading = Enum.AdornShading.AlwaysOnTop
	BHA.ZIndex = 1
	BHA.Size = Size
	BHA.Color3 = Color3.fromRGB(255,255,255)

	return BHA
end

game:GetService("RunService").Heartbeat:Connect(function()
	for _, Data in ipairs(Tracers) do
		local Tracer = Data.Tracer
		local Part = Data.Part
		local TargetPart = Data.TargetPart
		local Offset = Data.Offset
		local Thickness = Data.Thickness
		local Transparency = Data.Transparency
		local Radius = Data.Radius
		local CircleOffset = Data.CircleOffset

		local Start = Part.Position + Vector3.new(0,Offset,0)
		local TargetPos = TargetPart.Position + Vector3.new(0,CircleOffset,0)

		local FlatDir = (Start - TargetPos) * Vector3.new(1,0,1)

		if FlatDir.Magnitude > 0 then
			FlatDir = FlatDir.Unit
		end

		local End = TargetPos + FlatDir * Radius

		local Direction = End - Start
		local Distance = Direction.Magnitude

		Tracer.Transparency = Transparency
		Tracer.Size = Vector3.new(Thickness, Thickness, Distance)
		Tracer.CFrame = CFrame.lookAt(Start, End) * CFrame.new(0,0,-Distance/2)
	end
end)

function TraceObject(Part, TargetPart, Offset, Thickness, Transparency, Sides, Radius, CircleOffset)
	local Tracer = CreateBHA(Part, CFrame.new(0,0,0), Vector3.new(0,0,0))

	local Circles = {}

	for i = 1, Sides do
		local Angle = 360 / Sides * i
		local Rotation = -360 / Sides * i
		local Length = 2 * Radius * math.tan(math.pi / Sides)

		local Circle = CreateBHA(TargetPart, CFrame.new(math.cos(math.rad(Angle)) * Radius, CircleOffset ,math.sin(math.rad(Angle)) * Radius) * CFrame.Angles(0,math.rad(Rotation),0), Vector3.new(Thickness,Thickness,Length), Transparency)
		Circle.Adornee = TargetPart

		table.insert(Circles, Circle)
	end

	local Table = {Tracer = Tracer, Part = Part, TargetPart = TargetPart, Offset = Offset, Thickness = Thickness, Transparency = Transparency, Circles = Circles, Radius = Radius, CircleOffset = CircleOffset}
	table.insert(Tracers, Table)
	return Table
end

function DeleteTracer(Tracer)
	for i, Data in ipairs(Tracers) do
		Data.Tracer:Destroy()

		for _, Parts in Data.Circles do
			Parts:Destroy()
		end

		table.remove(Tracers, i)
	end
end
```

## PART, TARGET, OFFSET, THICKNESS, TRANSPARENCY, SIDES, RADIUS, CIRCLEOFFSET

```lua
local Tracer = TraceObject(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, workspace.Cube, -3, 0.025, 0, 100, 3, 0)
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
