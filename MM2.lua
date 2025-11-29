local UIS = game:GetService('UserInputService')
local players = game:GetService("Players")
local tweenService = game:GetService("TweenService")
local runService = game:GetService("RunService")
local coreGui = game:GetService("CoreGui")

local Koshki = Instance.new("ScreenGui")
local TopBar = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local CoverOne = Instance.new("Frame")
local CoverTwo = Instance.new("Frame")
local Main = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local CoverTwo_2 = Instance.new("Frame")
local CoverThree = Instance.new("Frame")
local CoverFour = Instance.new("Frame")
local Button = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local UIPadding = Instance.new("UIPadding")
local TextLabel = Instance.new("TextLabel")
local ToggleActive = Instance.new("Frame")
local UICorner_4 = Instance.new("UICorner")
local UIPadding_3 = Instance.new("UIPadding")
local TextLabel_2 = Instance.new("TextLabel")
local Frame = Instance.new("Frame")
local UICorner_5 = Instance.new("UICorner")
local Frame_2 = Instance.new("Frame")
local UICorner_6 = Instance.new("UICorner")
local ToggleInactive = Instance.new("Frame")
local UICorner_7 = Instance.new("UICorner")
local UIPadding_4 = Instance.new("UIPadding")
local TextLabel_3 = Instance.new("TextLabel")
local Frame_3 = Instance.new("Frame")
local UICorner_8 = Instance.new("UICorner")
local Frame_4 = Instance.new("Frame")
local UICorner_9 = Instance.new("UICorner")
local Slider = Instance.new("Frame")
local UICorner_10 = Instance.new("UICorner")
local UIPadding_5 = Instance.new("UIPadding")
local TextLabel_4 = Instance.new("TextLabel")
local Value = Instance.new("TextLabel")
local SliderBack = Instance.new("Frame")
local UICorner_11 = Instance.new("UICorner")
local Draggable = Instance.new("Frame")
local UICorner_12 = Instance.new("UICorner")
local Frame_5 = Instance.new("Frame")
local UISizeConstraint = Instance.new("UISizeConstraint")
local UICorner_13 = Instance.new("UICorner")
local DropDown = Instance.new("Frame")
local UICorner_14 = Instance.new("UICorner")
local UIPadding_6 = Instance.new("UIPadding")
local TextLabel_5 = Instance.new("TextLabel")
local Dropdownbutton = Instance.new("TextButton")
local Arrow = Instance.new("ImageLabel")
local TextLabel_6 = Instance.new("TextLabel")
local UICorner_15 = Instance.new("UICorner")
local Frame_6 = Instance.new("Frame")
local UICorner_16 = Instance.new("UICorner")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout_2 = Instance.new("UIListLayout")
local dropdownbutton = Instance.new("TextButton")
local LineTwo = Instance.new("Frame")
local Line = Instance.new("Frame")
local Tabs = Instance.new("Frame")
local Line_2 = Instance.new("Frame")
local UICorner_17 = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local Profile = Instance.new("ImageLabel")
local UICorner_18 = Instance.new("UICorner")
local Name = Instance.new("TextLabel")
local Uptimetitle = Instance.new("TextLabel")
local Uptime = Instance.new("TextLabel")
local TabList = Instance.new("ScrollingFrame")
local UIListLayout_3 = Instance.new("UIListLayout")
local Tab_2 = Instance.new("TextButton")
local ImageLabel_2 = Instance.new("ImageLabel")
local UIPadding_8 = Instance.new("UIPadding")
local UICorner_20 = Instance.new("UICorner")
local Close = Instance.new("TextButton")

local UISettings = Instance.new("ScrollingFrame")
local UISettingsListLayout = Instance.new("UIListLayout")
local UISettingsPadding = Instance.new("UIPadding")

local UIShadow = Instance.new("Frame")
local umbraShadow = Instance.new("ImageLabel")
local penumbraShadow = Instance.new("ImageLabel")
local ambientShadow = Instance.new("ImageLabel")

local mobilegui = Instance.new("ScreenGui")
local mobilebutton = Instance.new("TextButton")
local UICorner420 = Instance.new("UICorner")
local uiScale = Instance.new("UIScale")

local Library = {}
GUI = {}

local BlurEnabled = true

local RunService = game:GetService("RunService")

UIS.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Keyboard then
		if input.KeyCode == Enum.KeyCode.Tab then
			if BlurEnabled == true then
				BlurEnabled = false
				tweenService:Create(uiScale, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Scale = 0}):Play()
				tweenService:Create(TopBar, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Position = TopBar.Position + UDim2.new(0,150,0,175)}):Play()
				wait(0.25)
				Koshki.Enabled = false
			else
				BlurEnabled = true
				Koshki.Enabled = true
				tweenService:Create(uiScale, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = 1}):Play()
				tweenService:Create(TopBar, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = TopBar.Position - UDim2.new(0,150,0,175)}):Play()
			end
		end
	end
end)


local RunService = game:GetService("RunService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")

UserGameSettings.Changed:Connect(function(property)
	if property == "SavedQualityLevel" then
		if UserGameSettings.SavedQualityLevel < 8 then
			RunService:UnbindFromRenderStep("BlurUpdater")
		else
			RunService:BindToRenderStep("BlurUpdater", Enum.RenderPriority.Camera.Value, function()

			end)
		end
	end
end)


function Library:validate(defaults, options)
	for i,v in pairs(defaults) do
		if options[i] == nil then
			options[i] = v
		end
	end
	return options
end

function Library:Init(options) 
	options = Library:validate({
		name = "Koshki",
		accentcolor = Color3.fromRGB(255,255,255)
	}, options or {})

	local GUI = {}

	accentcolor = options.accentcolor or Color3.fromRGB(255,255,255)
	Library.accentcolor = accentcolor

	Koshki.Name = "Koshki"
	Koshki.Parent = coreGui
	Koshki.Enabled = true
	Koshki.ResetOnSpawn = false
	Koshki.ZIndexBehavior = Enum.ZIndexBehavior.Global

	if UIS.TouchEnabled then

		mobilegui.Name = "KoshkiMobile"
		mobilegui.Parent = coreGui
		mobilegui.ResetOnSpawn = false
		mobilegui.ZIndexBehavior = Enum.ZIndexBehavior.Global

		uiScale.Scale = 0.6

		mobilebutton.Name = "mobilebutton"
		mobilebutton.Parent = mobilegui
		mobilebutton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		mobilebutton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		mobilebutton.BorderSizePixel = 0
		mobilebutton.Position = UDim2.new(0.1, 0, 0.1, 0)
		mobilebutton.Size = UDim2.new(0, 35, 0, 35)
		mobilebutton.Font = Enum.Font.GothamBold
		mobilebutton.Text = "K"
		mobilebutton.TextColor3 = Color3.fromRGB(255, 255, 255)
		mobilebutton.TextSize = 35
		mobilebutton.TextWrapped = true
		mobilebutton.MouseButton1Down:Connect(function()
			BlurEnabled = not BlurEnabled
			Koshki.Enabled = BlurEnabled
		end)
	end

	uiScale.Parent = TopBar
	UICorner420.Parent = mobilebutton

	TopBar.Name = "TopBar"
	TopBar.Parent = Koshki
	TopBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TopBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopBar.BorderSizePixel = 0
	TopBar.Position = UDim2.new(0.4, 0, 0.15, 0)
	TopBar.Size = UDim2.new(0, 500, 0, 50)

	local dragToggle = nil
	local dragSpeed = 0.1
	local dragStart = nil
	local startPos = nil

	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(TopBar, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end

	TopBar.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = TopBar.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end	
		end
	end)

	UIShadow.Name = "UI-Shadow"
	UIShadow.Parent = TopBar
	UIShadow.BackgroundTransparency = 1.000
	UIShadow.Position = UDim2.new(-0.400000006, -7, 0, -7)
	UIShadow.Size = UDim2.new(0, 715, 0, 564)
	UIShadow.ZIndex = -999999999

	umbraShadow.Name = "umbraShadow"
	umbraShadow.Parent = UIShadow
	umbraShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	umbraShadow.BackgroundTransparency = 1.000
	umbraShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	umbraShadow.Size = UDim2.new(1, 0, 1, 0)
	umbraShadow.Image = "rbxassetid://1316045217"
	umbraShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	umbraShadow.ImageTransparency = 0.860
	umbraShadow.ScaleType = Enum.ScaleType.Slice
	umbraShadow.SliceCenter = Rect.new(10, 10, 118, 118)

	penumbraShadow.Name = "penumbraShadow"
	penumbraShadow.Parent = UIShadow
	penumbraShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	penumbraShadow.BackgroundTransparency = 1.000
	penumbraShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	penumbraShadow.Size = UDim2.new(1, 0, 1, 0)
	penumbraShadow.Image = "rbxassetid://1316045217"
	penumbraShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	penumbraShadow.ImageTransparency = 0.880
	penumbraShadow.ScaleType = Enum.ScaleType.Slice
	penumbraShadow.SliceCenter = Rect.new(10, 10, 118, 118)

	ambientShadow.Name = "ambientShadow"
	ambientShadow.Parent = UIShadow
	ambientShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	ambientShadow.BackgroundTransparency = 1.000
	ambientShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	ambientShadow.Size = UDim2.new(1, 0, 1, 0)
	ambientShadow.Image = "rbxassetid://1316045217"
	ambientShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	ambientShadow.ImageTransparency = 0.880
	ambientShadow.ScaleType = Enum.ScaleType.Slice
	ambientShadow.SliceCenter = Rect.new(10, 10, 118, 118)

	CoverOne.Name = "CoverOne"
	CoverOne.Parent = TopBar
	CoverOne.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	CoverOne.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CoverOne.BorderSizePixel = 0
	CoverOne.Position = UDim2.new(0.980000019, 0, 0.800000012, 0)
	CoverOne.Size = UDim2.new(0, 10, 0, 10)

	CoverTwo.Name = "CoverTwo"
	CoverTwo.Parent = TopBar
	CoverTwo.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	CoverTwo.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CoverTwo.BorderSizePixel = 0
	CoverTwo.Size = UDim2.new(0, 10, 0, 50)

	Line.Name = "Line"
	Line.Parent = TopBar
	Line.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Line.BorderSizePixel = 0
	Line.Position = UDim2.new(0, 0, 1, -1)
	Line.Size = UDim2.new(1, 0, 0, 1)

	Main.Name = "Main"
	Main.Parent = TopBar
	Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0, 0, 0.999999702, 0)
	Main.Size = UDim2.new(0, 500, 0, 500)

	UISettings.Name = "Content"
	UISettings.Parent = Main
	UISettings.Active = true
	UISettings.Visible = true
	UISettings.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UISettings.BackgroundTransparency = 1.000
	UISettings.BorderColor3 = Color3.fromRGB(0, 0, 0)
	UISettings.BorderSizePixel = 0
	UISettings.Size = UDim2.new(1, 0, 1, 0)
	UISettings.ScrollBarImageColor3 = accentcolor
	UISettings.ScrollBarThickness = 5

	UISettingsListLayout.Parent = UISettings
	UISettingsListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UISettingsListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UISettingsListLayout.Padding = UDim.new(0, 1)

	UISettingsPadding.Parent = UISettings
	UISettingsPadding.PaddingTop = UDim.new(0, 10)

	local TextBox = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIPadding = Instance.new("UIPadding")
	local TextLabel = Instance.new("TextLabel")
	local TextBox_2 = Instance.new("TextBox")
	local UICorner_2 = Instance.new("UICorner")

	TextBox.Name = "TextBox"
	TextBox.Parent = UISettings
	TextBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextBox.BorderSizePixel = 0
	TextBox.Position = UDim2.new(0, 0, 0.496283472, 0)
	TextBox.Size = UDim2.new(0.96, 0, 0, 35)

	UICorner.CornerRadius = UDim.new(0, 4)
	UICorner.Parent = TextBox

	UIPadding.Parent = TextBox
	UIPadding.PaddingBottom = UDim.new(0, 6)
	UIPadding.PaddingLeft = UDim.new(0, 6)
	UIPadding.PaddingRight = UDim.new(0, 6)
	UIPadding.PaddingTop = UDim.new(0, 6)

	TextLabel.Parent = TextBox
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Size = UDim2.new(1, 0, 1, 0)
	TextLabel.Font = Enum.Font.GothamBold
	TextLabel.Text = "UI Color Picker"
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 14.000
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left

	TextBox_2.Parent = TextBox
	TextBox_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextBox_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextBox_2.BorderSizePixel = 0
	TextBox_2.Position = UDim2.new(0.795, 0, 0.0250000004, 0)
	TextBox_2.Size = UDim2.new(0.175, 0, 0.95, 0)
	TextBox_2.Font = Enum.Font.GothamBold
	TextBox_2.Text = "150,140,200"
	TextBox_2.TextColor3 = Color3.fromRGB(150, 140, 200)
	TextBox_2.TextSize = 15

	UICorner_2.CornerRadius = UDim.new(0, 5)
	UICorner_2.Parent = TextBox_2

	local BaseSize = TextBox_2.Size
	local BasePosition = TextBox_2.Position

	TextBox_2:GetPropertyChangedSignal("Text"):Connect(function()
		local TextColor = Color3.fromRGB(tonumber(string.split(TextBox_2.Text, ",")[1]), tonumber(string.split(TextBox_2.Text, ",")[2]), tonumber(string.split(TextBox_2.Text, ",")[3]))
		local Num = math.min(#TextBox_2.Text, 25)

		TextBox_2.TextColor3 = TextColor

		tweenService:Create(TextBox_2, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = BaseSize + UDim2.new(0, Num * 7, 0, 0)}):Play()
		tweenService:Create(TextBox_2, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Position = BasePosition - UDim2.new(0, Num * 7, 0, 0)}):Play()
	end)

	TextBox_2.FocusLost:Connect(function()
		local NewColor = Color3.fromRGB(tonumber(string.split(TextBox_2.Text, ",")[1]), tonumber(string.split(TextBox_2.Text, ",")[2]), tonumber(string.split(TextBox_2.Text, ",")[3]))

		local NewDarkOne = Color3.new(
			NewColor.R / 3,
			NewColor.G / 3,
			NewColor.B / 3
		)

		local NewDarkTwo = Color3.new(
			NewColor.R / 1.5,
			NewColor.G / 1.5,
			NewColor.B / 1.5
		)

		accentcolor = NewColor

		for _, children in Koshki:GetDescendants() do
			if children.Name == "Title" then
				children.TextColor3 = NewColor
			elseif children.Name == "Ripple" then
				children.BackgroundColor3 = NewColor
			elseif children.Name == "ToggleButton" then
				children.BackgroundColor3 = NewColor
			elseif children.Name == "ToggleFrame" then
				children.BackgroundColor3 = NewDarkOne
			elseif children.Name == "Draggable" then
				children.BackgroundColor3 = NewDarkTwo
			elseif children.Name == "SliderBall" then
				children.BackgroundColor3 = accentcolor
			elseif children.Name == "Arrow" then
				children.ImageColor3 = accentcolor
			elseif children.Name == "Uptime" then
				children.TextColor3 = NewColor
			elseif children.Name == "Content" then
				children.ScrollBarImageColor3 = accentcolor
			end
		end	
	end)

	local Settings = Instance.new("ImageButton")
	Settings.Name = "Settings"
	Settings.Parent = TopBar
	Settings.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Settings.BackgroundTransparency = 1.000
	Settings.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Settings.BorderSizePixel = 0
	Settings.Position = UDim2.new(0.900199711, -30, 0, 10)
	Settings.Size = UDim2.new(0, 30, 0, 30)
	Settings.Image = "rbxassetid://6031280882"
	Settings.MouseButton1Down:Connect(function()
		for _, container in pairs(Main:GetChildren()) do
			if container:IsA("ScrollingFrame") and container.Name == "Content" then
				container.Visible = false  
			end
		end

		for _, tabs in pairs(TabList:GetChildren()) do
			if tabs:IsA("TextButton") and tabs.Name == "Tab" then
				tweenService:Create(tabs, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
				tweenService:Create(tabs, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(100,100,100)}):Play()
				tweenService:Create(tabs.ImageLabel, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(100,100,100)}):Play()
			end
		end	
		UISettings.Visible = true
	end)

	Close.Name = "Close"
	Close.Parent = TopBar
	Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Close.BackgroundTransparency = 1.000
	Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Close.BorderSizePixel = 0
	Close.Position = UDim2.new(0.900199711, 0, 0, 0)
	Close.Size = UDim2.new(0, 50, 0, 50)
	Close.Font = Enum.Font.GothamBold
	Close.Text = "X"
	Close.TextColor3 = Color3.fromRGB(255, 255, 255)
	Close.TextSize = 25.000
	Close.TextWrapped = true
	Close.MouseButton1Down:Connect(function()
		Koshki:Destroy()
		RunService:UnbindFromRenderStep("BlurUpdater")
		RunService:UnbindFromRenderStep("NotificationBlurUpdater")
	end)

	CoverTwo_2.Name = "CoverTwo"
	CoverTwo_2.Parent = Main
	CoverTwo_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	CoverTwo_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CoverTwo_2.BorderSizePixel = 0
	CoverTwo_2.Position = UDim2.new(0, 0, 0.980000019, 0)
	CoverTwo_2.Size = UDim2.new(0, 10, 0, 10)

	CoverThree.Name = "CoverThree"
	CoverThree.Parent = Main
	CoverThree.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	CoverThree.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CoverThree.BorderSizePixel = 0
	CoverThree.Size = UDim2.new(0, 10, 0, 10)

	CoverFour.Name = "CoverFour"
	CoverFour.Parent = Main
	CoverFour.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	CoverFour.BorderColor3 = Color3.fromRGB(0, 0, 0)
	CoverFour.BorderSizePixel = 0
	CoverFour.Position = UDim2.new(0.980000019, 0, 0, 0)
	CoverFour.Size = UDim2.new(0, 10, 0, 10)

	LineTwo.Name = "LineTwo"
	LineTwo.Parent = Main
	LineTwo.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	LineTwo.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LineTwo.BorderSizePixel = 0
	LineTwo.Position = UDim2.new(0, 0, -0.0995999724, 0)
	LineTwo.Size = UDim2.new(0, 1, 1.09959996, 0)

	Tabs.Name = "Tabs"
	Tabs.Parent = TopBar
	Tabs.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Tabs.BackgroundTransparency = 0.100
	Tabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Tabs.BorderSizePixel = 0
	Tabs.Position = UDim2.new(-0.400000006, 0, -6.10351549e-07, 0)
	Tabs.Size = UDim2.new(0, 209, 0, 550)
	Tabs.ZIndex = 0

	task.spawn(function()
		local Lighting        = game:GetService("Lighting")
		local RunService      = game:GetService("RunService")
		local camera          = workspace.CurrentCamera

		local BLUR_SIZE         = Vector2.new(0, 0)
		local PART_SIZE         = 0.01
		local PART_TRANSPARENCY = 1 - 1e-7
		local START_INTENSITY   = 0.25

		local lastCameraCFrame = camera.CFrame
		local LastTopBarPosition = TopBar.Position
		local EPSILON = 0.0001

		script.Parent:SetAttribute("BlurIntensity", START_INTENSITY)

		local BLUR_OBJ          = Instance.new("DepthOfFieldEffect")
		BLUR_OBJ.Name = "GuiBlur"
		BLUR_OBJ.FarIntensity   = 0
		BLUR_OBJ.NearIntensity  = script.Parent:GetAttribute("BlurIntensity")
		BLUR_OBJ.FocusDistance  = 0.25
		BLUR_OBJ.InFocusRadius  = 0
		BLUR_OBJ.Parent         = Lighting

		local PartsList   = {}
		local BlursList   = {}
		local BlurObjects = {}

		local BlurredGui  = {}
		BlurredGui.__index = BlurredGui

		local function rayPlaneIntersect(planePos, planeNormal, rayOrigin, rayDirection)
			local v = rayOrigin - planePos
			local num = planeNormal:Dot(v)
			local den = planeNormal:Dot(rayDirection)
			local a = -num / den
			return rayOrigin + a * rayDirection
		end

		local function rebuildPartsList()
			PartsList = {}
			BlursList = {}
			for obj, part in pairs(BlurObjects) do
				PartsList[#PartsList+1] = part
				BlursList[#BlursList+1] = obj
			end
		end

		function BlurredGui.new(frame, shape)
			local blurPart = Instance.new("Part")
			blurPart.Size         = Vector3.new(PART_SIZE, PART_SIZE, PART_SIZE)
			blurPart.Anchored     = true
			blurPart.CanCollide   = false
			blurPart.CanTouch     = false
			blurPart.Material     = Enum.Material.Glass
			blurPart.Transparency = PART_TRANSPARENCY
			blurPart.Parent       = workspace.CurrentCamera

			local mesh
			if shape == "Rectangle" then
				mesh = Instance.new("BlockMesh")
			elseif shape == "Oval" then
				mesh = Instance.new("SpecialMesh")
				mesh.MeshType = Enum.MeshType.Sphere
			end
			mesh.Parent = blurPart

			local ignoreInset = false
			local parentObj = frame
			while parentObj and not parentObj:IsA("ScreenGui") do
				parentObj = parentObj.Parent
			end
			if parentObj then
				ignoreInset = parentObj.IgnoreGuiInset
			end

			local new = setmetatable({
				Frame          = frame,
				Part           = blurPart,
				Mesh           = mesh,
				IgnoreGuiInset = ignoreInset
			}, BlurredGui)

			BlurObjects[new] = blurPart
			rebuildPartsList()

			return new
		end

		local function updateGui(obj)
			local frame = obj.Frame
			local part  = obj.Part
			local mesh  = obj.Mesh

			if not frame.Visible then
				part.Transparency = 1
				return
			end

			part.Transparency = PART_TRANSPARENCY

			local camera = workspace.CurrentCamera

			local corner0 = frame.AbsolutePosition + BLUR_SIZE
			local corner1 = corner0 + frame.AbsoluteSize - BLUR_SIZE * 2

			local r0, r1
			if obj.IgnoreGuiInset then
				r0 = camera:ViewportPointToRay(corner0.X, corner0.Y, 1)
				r1 = camera:ViewportPointToRay(corner1.X, corner1.Y, 1)
			else
				r0 = camera:ScreenPointToRay(corner0.X, corner0.Y, 1)
				r1 = camera:ScreenPointToRay(corner1.X, corner1.Y, 1)
			end

			local planeOrigin = camera.CFrame.Position + camera.CFrame.LookVector * (0.05 - camera.NearPlaneZ)
			local planeNormal = camera.CFrame.LookVector

			local p0 = rayPlaneIntersect(planeOrigin, planeNormal, r0.Origin, r0.Direction)
			local p1 = rayPlaneIntersect(planeOrigin, planeNormal, r1.Origin, r1.Direction)

			p0 = camera.CFrame:PointToObjectSpace(p0)
			p1 = camera.CFrame:PointToObjectSpace(p1)

			local size   = p1 - p0
			local center = (p0 + p1) * 0.5

			mesh.Offset = center
			mesh.Scale  = size / PART_SIZE
		end

		RunService:BindToRenderStep("BlurUpdater", Enum.RenderPriority.Camera.Value + 1, function()

			if not BlurEnabled then
				BLUR_OBJ.NearIntensity = 0
				return
			end

			local camCFrame = camera.CFrame

			if (camCFrame.Position - lastCameraCFrame.Position).Magnitude > EPSILON
				or camCFrame.LookVector:Dot(lastCameraCFrame.LookVector) < 1 - EPSILON
				or LastTopBarPosition ~= TopBar.Position then

				lastCameraCFrame = camCFrame

				BLUR_OBJ.NearIntensity = script.Parent:GetAttribute("BlurIntensity")
				BLUR_OBJ.FocusDistance = 0.25 - camera.NearPlaneZ

				for i = 1, #BlursList do
					updateGui(BlursList[i])
				end

				local cframes = table.create(#BlursList, camCFrame)
				workspace:BulkMoveTo(PartsList, cframes, Enum.BulkMoveMode.FireCFrameChanged)
			end
		end)

		function BlurredGui:Destroy()
			self.Part:Destroy()
			BlurObjects[self] = nil
			rebuildPartsList()
		end

		BlurredGui.new(Tabs, "Rectangle")

		return BlurredGui
	end)

	Line_2.Name = "Line"
	Line_2.Parent = Tabs
	Line_2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Line_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Line_2.BorderSizePixel = 0
	Line_2.Position = UDim2.new(0, 0, 0.907272756, 0)
	Line_2.Size = UDim2.new(0.962, 0, 0, 1)

	TabList.Name = "TabList"
	TabList.Parent = Tabs
	TabList.Active = true
	TabList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabList.BackgroundTransparency = 1.000
	TabList.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabList.BorderSizePixel = 0
	TabList.Position = UDim2.new(0, 0, 0.116, 0)
	TabList.Size = UDim2.new(0.95, 0, 0, 435)
	TabList.ScrollBarThickness = 0

	Profile.Name = "Profile"
	Profile.Parent = Tabs
	Profile.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Profile.BackgroundTransparency = 1.000
	Profile.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Profile.BorderSizePixel = 0
	Profile.Position = UDim2.new(0.0250000004, 0, 0.917500019, 0)
	Profile.Size = UDim2.new(0, 40, 0, 40)
	Profile.Image = players:GetUserThumbnailAsync(players.LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)

	Name.Name = "Name"
	Name.Parent = Tabs
	Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Name.BackgroundTransparency = 1.000
	Name.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Name.BorderSizePixel = 0
	Name.Position = UDim2.new(0.258373201, 0, 0.909090936, 0)
	Name.Size = UDim2.new(0.741626799, 0, 0, 30)
	Name.Font = Enum.Font.GothamBold
	Name.Text = players.LocalPlayer.DisplayName
	Name.TextColor3 = Color3.fromRGB(255, 255, 255)
	Name.TextSize = 15.000
	Name.TextWrapped = true
	Name.TextXAlignment = Enum.TextXAlignment.Left

	local titletext = options.Title
	local middle = math.floor(#titletext / 2)
	local leftText = titletext:sub(1, middle)
	local rightText = titletext:sub(middle + 1)

	Title.Name = "Title"
	Title.Parent = Tabs
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title.BorderSizePixel = 0
	Title.Size = UDim2.new(0.95693779, 0, 0, 50)
	Title.Font = Enum.Font.GothamBold
	Title.RichText = true
	Title.Text = "<u>" .. leftText .. "<font color=\"#FFFFFF\">" .. rightText .. '</font>' .. "</u>"
	Title.TextColor3 = accentcolor
	Title.TextSize = 40.000

	Uptime.Name = "Uptime"
	Uptime.Parent = Tabs
	Uptime.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Uptime.BackgroundTransparency = 1.000
	Uptime.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Uptime.BorderSizePixel = 0
	Uptime.Position = UDim2.new(0.421052635, 0, 0.945454538, 0)
	Uptime.Size = UDim2.new(0.535885096, 0, 0, 30)
	Uptime.Font = Enum.Font.GothamBold
	Uptime.Text = "00:00:00"
	Uptime.TextColor3 = accentcolor
	Uptime.TextSize = 15.000
	Uptime.TextWrapped = true
	Uptime.TextXAlignment = Enum.TextXAlignment.Left
	task.spawn(function()
		while task.wait(1) do



			local seconds = math.floor(workspace.DistributedGameTime)
			local minutes = math.floor(seconds / 60)
			local hours = math.floor(minutes / 60)

			Uptime.Text = string.format("%02d:%02d:%02d", hours, minutes % 60, seconds % 60)
		end
	end)

	Uptimetitle.Name = "Uptimetitle"
	Uptimetitle.Parent = Tabs
	Uptimetitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Uptimetitle.BackgroundTransparency = 1.000
	Uptimetitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Uptimetitle.BorderSizePixel = 0
	Uptimetitle.Position = UDim2.new(0.258373201, 0, 0.945454538, 0)
	Uptimetitle.Size = UDim2.new(0.741626799, 0, 0, 30)
	Uptimetitle.Font = Enum.Font.GothamBold
	Uptimetitle.Text = "UPT:"
	Uptimetitle.TextColor3 = Color3.fromRGB(150, 150, 150)
	Uptimetitle.TextSize = 15.000
	Uptimetitle.TextWrapped = true
	Uptimetitle.TextXAlignment = Enum.TextXAlignment.Left

	UICorner_18.CornerRadius = UDim.new(1, 0)
	UICorner_18.Parent = Profile

	UIListLayout_3.Parent = TabList
	UIListLayout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout_3.Padding = UDim.new(0, 5)

	UICorner_2.CornerRadius = UDim.new(0, 3)
	UICorner_2.Parent = Main

	UICorner_17.CornerRadius = UDim.new(0, 3)
	UICorner_17.Parent = Tabs

	UICorner.CornerRadius = UDim.new(0, 3)
	UICorner.Parent = TopBar

end

function GUI:CreateTab(options)
	options = Library:validate({
		name = "Home",
		icon = "rbxassetid://2790547157"
	}, options or {})

	local tab = {}

	local Content = Instance.new("ScrollingFrame")
	Content.Name = "Content"
	Content.Parent = Main
	Content.Active = true
	Content.Visible = false
	Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Content.BackgroundTransparency = 1.000
	Content.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Content.BorderSizePixel = 0
	Content.Size = UDim2.new(1, 0, 1, 0)
	Content.ScrollBarImageColor3 = accentcolor
	Content.ScrollBarThickness = 5

	local Tab = Instance.new("TextButton")
	Tab.Name = "Tab"
	Tab.Parent = TabList
	Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Tab.BackgroundTransparency = 1
	Tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Tab.BorderSizePixel = 0
	Tab.Position = UDim2.new(0, 0, 0, 0)
	Tab.Size = UDim2.new(0.9, 0, 0, 40)
	Tab.Font = Enum.Font.GothamBold
	Tab.Text = options.Text
	Tab.TextColor3 = Color3.fromRGB(100, 100, 100)
	Tab.TextSize = 17.000
	Tab.TextWrapped = true
	Tab.TextXAlignment = Enum.TextXAlignment.Left
	Tab.AutoButtonColor = false
	Tab.ClipsDescendants = true

	local ImageLabel = Instance.new("ImageLabel")
	ImageLabel.Parent = Tab
	ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageLabel.BackgroundTransparency = 1.000
	ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ImageLabel.BorderSizePixel = 0
	ImageLabel.Position = UDim2.new(0, -43, 0, 5)
	ImageLabel.Size = UDim2.new(0, 30, 0, 30)
	ImageLabel.Image = options.icon
	ImageLabel.ImageColor3 = Color3.fromRGB(100,100,100)

	local UIPadding_7 = Instance.new("UIPadding")
	UIPadding_7.Parent = Tab
	UIPadding_7.PaddingLeft = UDim.new(0, 50)

	local UICorner_19 = Instance.new("UICorner")
	UICorner_19.CornerRadius = UDim.new(0, 5)
	UICorner_19.Parent = Tab

	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.Parent = Content
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 1)

	local UIPadding_2 = Instance.new("UIPadding")
	UIPadding_2.Parent = Content
	UIPadding_2.PaddingTop = UDim.new(0, 10)

	Tab.MouseButton1Click:Connect(function()
		for _, container in pairs(Main:GetChildren()) do
			if container:IsA("ScrollingFrame") and container.Name == "Content" then
				container.Visible = false  
			end
		end
		Content.Visible = true
	end)

	Tab.MouseButton1Click:Connect(function()
		for _, tabs in pairs(TabList:GetChildren()) do
			if tabs:IsA("TextButton") and tabs.Name == "Tab" then
				tweenService:Create(tabs, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
				tweenService:Create(tabs, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(100,100,100)}):Play()
				tweenService:Create(tabs.ImageLabel, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(100,100,100)}):Play()
			end
		end	
		tweenService:Create(Tab, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundTransparency = 0.95}):Play()
		tweenService:Create(Tab, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255,255,255)}):Play()
		tweenService:Create(ImageLabel, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {ImageColor3 = accentcolor}):Play()
	end)

	local rippleTemplate = Instance.new("Frame")
	rippleTemplate.Name = "Ripple"
	rippleTemplate.BackgroundColor3 = accentcolor
	rippleTemplate.BackgroundTransparency = 0.5
	rippleTemplate.Size = UDim2.new(0, 0, 0, 0)
	rippleTemplate.AnchorPoint = Vector2.new(0.5, 0.5)
	rippleTemplate.Visible = false
	rippleTemplate.ZIndex = 2
	rippleTemplate.ClipsDescendants = false

	local rippleCorner = Instance.new("UICorner")
	rippleCorner.CornerRadius = UDim.new(1, 0)
	rippleCorner.Parent = rippleTemplate

	rippleTemplate.Parent = Tab

	local TweenService = game:GetService("TweenService")

	Tab.MouseButton1Down:Connect(function(x, y)
		local ripple = rippleTemplate:Clone()
		ripple.Visible = true
		ripple.Parent = Tab

		local absPos = Tab.AbsolutePosition
		local relX = x - absPos.X - 47.5
		local relY = y - absPos.Y - 55

		ripple.Position = UDim2.new(0, relX, 0, relY)

		local maxSize = math.max(Tab.AbsoluteSize.X, Tab.AbsoluteSize.Y) * 2
		ripple.Size = UDim2.new(0, 0, 0, 0)

		local tween = TweenService:Create(ripple, TweenInfo.new(0.75, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Size = UDim2.new(0, maxSize, 0, maxSize),
			BackgroundTransparency = 1
		})

		tween:Play()
		tween.Completed:Connect(function()
			ripple:Destroy()
		end)
	end)

	Tab.MouseButton1Click:Connect(options.Callback)

	return Content
end

function GUI:TabSection(options)
	options = Library:validate({
		text = "Section",
	}, options or {})

	local TabSection = Instance.new("TextLabel")
	TabSection.Name = "TabSection"
	TabSection.Parent = TabList
	TabSection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabSection.BackgroundTransparency = 1.000
	TabSection.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabSection.BorderSizePixel = 0
	TabSection.Size = UDim2.new(0.85, 0, 0, 15)
	TabSection.Font = Enum.Font.GothamBold
	TabSection.Text = options.text
	TabSection.TextColor3 = Color3.fromRGB(100, 100, 100)
	TabSection.TextSize = 15
	TabSection.TextWrapped = true
	TabSection.TextXAlignment = Enum.TextXAlignment.Left

	return TabSection

end

function GUI:Section(options, tab)
	options = Library:validate({
		text = "Section"
	}, options or {})

	local SectionFrame = Instance.new("Frame")
	SectionFrame.Name = "SectionFrame"
	SectionFrame.Parent = tab
	SectionFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
	SectionFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SectionFrame.BorderSizePixel = 0
	SectionFrame.ClipsDescendants = false

	local Section = Instance.new("TextLabel")
	Section.Name = "Section"
	Section.Parent = SectionFrame
	Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Section.BackgroundTransparency = 1.000
	Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Section.BorderSizePixel = 0
	Section.Size = UDim2.new(1, 0, 0, 35)
	Section.Font = Enum.Font.GothamBold
	Section.Text = options.text
	Section.TextColor3 = Color3.fromRGB(255, 255, 255)
	Section.TextSize = 17.000
	Section.TextXAlignment = Enum.TextXAlignment.Left
	Section.ClipsDescendants = false

	local UICorner_2 = Instance.new("UICorner")
	UICorner_2.CornerRadius = UDim.new(0, 5)
	UICorner_2.Parent = SectionFrame

	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.Parent = SectionFrame
	UIListLayout.Padding = UDim.new(0, 5)
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

	local Padding = Instance.new("UIPadding")
	Padding.Parent = SectionFrame
	Padding.PaddingLeft = UDim.new(0.05, 0)

	local function updateSectionSize()
		local baseHeight = 5
		local totalHeight = baseHeight

		for _, child in ipairs(SectionFrame:GetChildren()) do
			if child:IsA("TextLabel") or child:IsA("TextButton") or child:IsA("Frame") then
				totalHeight = totalHeight + child.Size.Y.Offset + 5
			end
		end

		SectionFrame.Size = UDim2.new(0.9, 0, 0, totalHeight)
	end

	SectionFrame.ChildAdded:Connect(updateSectionSize)
	SectionFrame.ChildRemoved:Connect(updateSectionSize)

	updateSectionSize()

	return SectionFrame

end

function GUI:Button(options, parentFrame)
	options = Library:validate({
		text = "Button",
		Callback = function() end,
		initialPosition = nil  
	}, options or {})

	local button = Instance.new("TextButton")
	button.Name = "Button"
	button.Parent = parentFrame
	button.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	button.BorderColor3 = Color3.fromRGB(0, 0, 0)
	button.Font = Enum.Font.GothamBold
	button.Text = options.text
	button.TextSize = 15
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.BorderSizePixel = 0
	button.Position = UDim2.new(0, 0, 0, 0)
	button.Size = UDim2.new(0.95, 0, 0, 35)
	button.ClipsDescendants = true
	button.AutoButtonColor = false

	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(0, 3)
	UICorner.Parent = button

	local rippleTemplate = Instance.new("Frame")
	rippleTemplate.Name = "Ripple"
	rippleTemplate.BackgroundColor3 = accentcolor
	rippleTemplate.BackgroundTransparency = 0.5
	rippleTemplate.Size = UDim2.new(0, 0, 0, 0)
	rippleTemplate.AnchorPoint = Vector2.new(0.5, 0.5)
	rippleTemplate.Visible = false
	rippleTemplate.ZIndex = 2
	rippleTemplate.ClipsDescendants = true

	local rippleCorner = Instance.new("UICorner")
	rippleCorner.CornerRadius = UDim.new(1, 0)
	rippleCorner.Parent = rippleTemplate

	rippleTemplate.Parent = button

	local TweenService = game:GetService("TweenService")

	button.MouseButton1Down:Connect(function(x, y)
		local ripple = rippleTemplate:Clone()
		ripple.Visible = true
		ripple.Parent = button

		local absPos = button.AbsolutePosition
		local relX = x - absPos.X
		local relY = y - absPos.Y - 50

		ripple.Position = UDim2.new(0, relX, 0, relY)

		local maxSize = math.max(button.AbsoluteSize.X, button.AbsoluteSize.Y) * 2
		ripple.Size = UDim2.new(0, 0, 0, 0)

		local tween = TweenService:Create(ripple, TweenInfo.new(0.75, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Size = UDim2.new(0, maxSize, 0, maxSize),
			BackgroundTransparency = 1
		})

		tween:Play()
		tween.Completed:Connect(function()
			ripple:Destroy()
		end)
	end)

	button.MouseButton1Click:Connect(options.Callback)

	return button
end

function GUI:Toggle(options, parentFrame)
	options = options or {}
	local text = options.text or "Toggle"
	local callback = options.callback or function(state) end

	local accentColor = accentcolor

	local darker = Color3.new(
		accentColor.R / 3,
		accentColor.G / 3,
		accentColor.B / 3
	)


	local ToggleInactive = Instance.new("Frame")
	ToggleInactive.Name = "ToggleInactive"
	ToggleInactive.Parent = parentFrame
	ToggleInactive.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	ToggleInactive.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ToggleInactive.BorderSizePixel = 0
	ToggleInactive.Position = UDim2.new(0.02, 0, 0, 0)
	ToggleInactive.Size = UDim2.new(0.96, 0, 0, 35)

	local UICorner_10 = Instance.new("UICorner")
	UICorner_10.CornerRadius = UDim.new(0, 4)
	UICorner_10.Parent = ToggleInactive

	local UIPadding_4 = Instance.new("UIPadding")
	UIPadding_4.Parent = ToggleInactive
	UIPadding_4.PaddingBottom = UDim.new(0, 6)
	UIPadding_4.PaddingLeft = UDim.new(0, 6)
	UIPadding_4.PaddingRight = UDim.new(0, 6)
	UIPadding_4.PaddingTop = UDim.new(0, 6)

	local TextLabel_3 = Instance.new("TextLabel")
	TextLabel_3.Parent = ToggleInactive
	TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_3.BackgroundTransparency = 1.000
	TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel_3.BorderSizePixel = 0
	TextLabel_3.Position = UDim2.new(0, 0, -0.300000012, 0)
	TextLabel_3.Size = UDim2.new(1, 0, 0, 35)
	TextLabel_3.Font = Enum.Font.GothamBold
	TextLabel_3.Text = text
	TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_3.TextSize = 14.000
	TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left

	local Frame_3 = Instance.new("Frame")
	Frame_3.Name = "ToggleFrame"
	Frame_3.Parent = ToggleInactive
	Frame_3.BackgroundColor3 = darker
	Frame_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame_3.BorderSizePixel = 0
	Frame_3.Position = UDim2.new(0.86, 0, 0.15, 0)
	Frame_3.Size = UDim2.new(0, 50, 0, 15)

	local UICorner_11 = Instance.new("UICorner")
	UICorner_11.CornerRadius = UDim.new(1, 0)
	UICorner_11.Parent = Frame_3

	local Frame_4 = Instance.new("TextButton")
	Frame_4.Name = "ToggleButton"
	Frame_4.Parent = Frame_3
	Frame_4.BackgroundColor3 = accentcolor
	Frame_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame_4.Text = ""
	Frame_4.BorderSizePixel = 0
	Frame_4.Position = UDim2.new(0, 0, -0.2, 0)
	Frame_4.Size = UDim2.new(0, 20, 0, 20)
	Frame_4.AutoButtonColor = false

	local UICorner_12 = Instance.new("UICorner")
	UICorner_12.CornerRadius = UDim.new(1, 0)
	UICorner_12.Parent = Frame_4

	local originalYScale = Frame_4.Position.Y.Scale
	local originalYOffset = Frame_4.Position.Y.Offset

	local ToggleActive = false

	Frame_4.MouseButton1Click:Connect(function()
		if ToggleActive == false then
			Frame_4:TweenPosition(UDim2.new(1, -Frame_4.Size.X.Offset, originalYScale, originalYOffset), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.2, true)
			ToggleActive = true
		else
			ToggleActive = false
			Frame_4:TweenPosition(UDim2.new(0, 0, originalYScale, originalYOffset), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.2)
		end
	end)

	Frame_4.MouseButton1Click:Connect(function()
		callback(ToggleActive)
	end)
end



function GUI:Slider(options, parentFrame)
	options = Library:validate({
		text = options.text or "Slider",
		min = options.min or 0,
		max = options.max or 100,
		default = options.default or 16,
		callback = options.callback or function(v) print(v) end
	}, options or {})

	local slider = {}

	local accentColor = accentcolor

	local darker = Color3.new(
		accentColor.R / 1.5,
		accentColor.G / 1.5,
		accentColor.B / 1.5
	)

	local Slider = Instance.new("Frame")
	Slider.Name = "Slider"
	Slider.Parent = parentFrame
	Slider.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Slider.BorderSizePixel = 0
	Slider.Position = UDim2.new(0.02, 0, 0, 0)
	Slider.Size = UDim2.new(0.96, 0, 0, 50)

	local UICorner_6 = Instance.new("UICorner")
	UICorner_6.CornerRadius = UDim.new(0, 4)
	UICorner_6.Parent = Slider

	local UIPadding_3 = Instance.new("UIPadding")
	UIPadding_3.Parent = Slider
	UIPadding_3.PaddingBottom = UDim.new(0, 6)
	UIPadding_3.PaddingLeft = UDim.new(0, 6)
	UIPadding_3.PaddingRight = UDim.new(0, 6)
	UIPadding_3.PaddingTop = UDim.new(0, 6)

	local TextLabel_2 = Instance.new("TextLabel")
	TextLabel_2.Parent = Slider
	TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_2.BackgroundTransparency = 1.000
	TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel_2.BorderSizePixel = 0
	TextLabel_2.Position = UDim2.new(0, 0, -0.300000101, 0)
	TextLabel_2.Size = UDim2.new(0.921985805, 0, 0, 35)
	TextLabel_2.Font = Enum.Font.GothamBold
	TextLabel_2.Text = options.text
	TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_2.TextSize = 14.000
	TextLabel_2.TextWrapped = true
	TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

	local Value = Instance.new("TextLabel")
	Value.Name = "Value"
	Value.Parent = Slider
	Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Value.BackgroundTransparency = 1.000
	Value.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Value.BorderSizePixel = 0
	Value.Position = UDim2.new(0.955082715, 0, -0.157719657, 0)
	Value.Size = UDim2.new(0, 25, 0, 25)
	Value.Font = Enum.Font.GothamBold
	Value.Text = "0"
	Value.TextColor3 = Color3.fromRGB(255, 255, 255)
	Value.TextSize = 15.000
	Value.TextWrapped = true

	local SliderBack = Instance.new("Frame")
	SliderBack.Name = "SliderBack"
	SliderBack.Parent = Slider
	SliderBack.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	SliderBack.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SliderBack.BorderSizePixel = 0
	SliderBack.Position = UDim2.new(0, 0, 0.788598299, 0)
	SliderBack.Size = UDim2.new(1, 0, 0, 5)

	local UICorner_7 = Instance.new("UICorner")
	UICorner_7.Parent = SliderBack

	local Draggable = Instance.new("Frame")
	Draggable.Name = "Draggable"
	Draggable.Parent = SliderBack
	Draggable.BackgroundColor3 = darker
	Draggable.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Draggable.BorderSizePixel = 0
	Draggable.Size = UDim2.new(0.5, 0, 0, 5)

	local UICorner_8 = Instance.new("UICorner")
	UICorner_8.Parent = Draggable

	local Frame_2 = Instance.new("Frame")
	Frame_2.Name = "SliderBall"
	Frame_2.Parent = Draggable
	Frame_2.BackgroundColor3 = accentcolor
	Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame_2.BorderSizePixel = 0
	Frame_2.Position = UDim2.new(0.98, 0, -1, 0)
	Frame_2.Size = UDim2.new(0, 15, 0, 15)

	local UISizeConstraint = Instance.new("UISizeConstraint")
	UISizeConstraint.Parent = Frame_2
	UISizeConstraint.MinSize = Vector2.new(10, 10)

	local UICorner_9 = Instance.new("UICorner")
	UICorner_9.Parent = Frame_2

	local TweenService = game:GetService("TweenService")
	local UIS = game:GetService("UserInputService")

	local dragging = false
	local startSize = nil
	local startMousePosition = nil
	local sliderValue = options.default

	local sliderTweenTime = 0.1

	function slider:SetValue(value)
		sliderValue = value
		Value.Text = tostring(sliderValue)
		options.callback(sliderValue)
	end

	function slider:GetValue()
		return sliderValue
	end

	local function updateSlider(inputX)
		local sliderWidth = SliderBack.AbsoluteSize.X
		local delta = inputX - startMousePosition
		local newSize = math.clamp(startSize + (delta / sliderWidth), 0.01, 1)
		local newValue = math.floor(options.min + (newSize * (options.max - options.min) + 0.5))

		TweenService:Create(Draggable, TweenInfo.new(sliderTweenTime), {
			Size = UDim2.new(newSize, 0, 1, 0)
		}):Play()

		Value.Text = tostring(newValue)
		options.callback(newValue)
		sliderValue = newValue
	end

	local function onInputBegan(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			startSize = Draggable.Size.X.Scale
			startMousePosition = input.Position.X
		end
	end

	Draggable.InputBegan:Connect(onInputBegan)
	Frame_2.InputBegan:Connect(onInputBegan)

	UIS.InputChanged:Connect(function(input)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			updateSlider(input.Position.X)
		end
	end)

	UIS.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = false
		end
	end)

	return slider
end

function GUI:Dropdown(options, parentFrame)
	options = Library:validate({
		text = "Drop Down",
		Options = {},
		Default = "",
		Callback = function() end,
		initialPosition = nil  
	}, options or {})

	local DropDown = Instance.new("Frame")
	DropDown.Name = "DropDown"
	DropDown.Parent = parentFrame
	DropDown.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	DropDown.BorderSizePixel = 0
	DropDown.Position = UDim2.new(0.02, 0, 0, 0)
	DropDown.Size = UDim2.new(0.96, 0, 0, 40)
	DropDown.ClipsDescendants = false
	DropDown.ZIndex = 1

	local UICorner = Instance.new("UICorner", DropDown)
	UICorner.CornerRadius = UDim.new(0, 4)

	local UIPadding = Instance.new("UIPadding", DropDown)
	UIPadding.PaddingTop = UDim.new(0, 6)
	UIPadding.PaddingBottom = UDim.new(0, 6)
	UIPadding.PaddingLeft = UDim.new(0, 6)
	UIPadding.PaddingRight = UDim.new(0, 6)

	local TextLabel = Instance.new("TextLabel")
	TextLabel.Parent = DropDown
	TextLabel.BackgroundTransparency = 1
	TextLabel.Size = UDim2.new(1, 0, 1, 0)
	TextLabel.Font = Enum.Font.GothamBold
	TextLabel.Text = options.text
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 14
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel.ZIndex = 2

	local Dropdownbutton = Instance.new("TextButton")
	Dropdownbutton.Name = "Dropdownbutton"
	Dropdownbutton.Parent = DropDown
	Dropdownbutton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Dropdownbutton.BorderSizePixel = 0
	Dropdownbutton.Position = UDim2.new(0.7, 0, 0.05, 0)
	Dropdownbutton.Size = UDim2.new(0.28, 0, 0.9, 0)
	Dropdownbutton.Font = Enum.Font.GothamBold
	Dropdownbutton.Text = ""
	Dropdownbutton.TextColor3 = Color3.fromRGB(255, 255, 255)
	Dropdownbutton.TextSize = 14
	Dropdownbutton.ZIndex = 3
	Dropdownbutton.AutoButtonColor = false

	local UIstroke = Instance.new("UIStroke")
	UIstroke.Parent = Dropdownbutton
	UIstroke.Thickness = 1
	UIstroke.Color = Color3.fromRGB(35,35,35)
	UIstroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

	local Arrow = Instance.new("ImageLabel", Dropdownbutton)
	Arrow.Name = "Arrow"
	Arrow.BackgroundTransparency = 1
	Arrow.Position = UDim2.new(0.76, 0, 0.05, 0)
	Arrow.Size = UDim2.new(0.2, 0, 0.9, 0)
	Arrow.Image = "http://www.roblox.com/asset/?id=6034818372"
	Arrow.ImageColor3 = accentcolor
	Arrow.ZIndex = 4

	local TextLabel_2 = Instance.new("TextLabel", Dropdownbutton)
	TextLabel_2.BackgroundTransparency = 1
	TextLabel_2.Position = UDim2.new(0.08, 0, 0, 0)
	TextLabel_2.Size = UDim2.new(0.92, 0, 1, 0)
	TextLabel_2.Font = Enum.Font.GothamBold
	TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_2.TextSize = 14
	TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel_2.Text = ""
	TextLabel_2.ZIndex = 4

	local UICorner_2 = Instance.new("UICorner", Dropdownbutton)
	UICorner_2.CornerRadius = UDim.new(0, 5)

	local Framee = Instance.new("Frame")
	Framee.Name = "DropdownListFrame"
	Framee.Parent = DropDown
	Framee.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Framee.BorderSizePixel = 0
	Framee.Position = UDim2.new(0.69, 0, 1.1, 0)
	Framee.Size = UDim2.new(0, 120, 0, 0)
	Framee.Visible = false
	Framee.ClipsDescendants = true
	Framee.ZIndex = 5

	local UIstroke = Instance.new("UIStroke")
	UIstroke.Parent = Framee
	UIstroke.Thickness = 1
	UIstroke.Color = Color3.fromRGB(35,35,35)
	UIstroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

	local UICorner_3 = Instance.new("UICorner", Framee)
	UICorner_3.CornerRadius = UDim.new(0, 4)

	local ScrollingFrame = Instance.new("ScrollingFrame")
	ScrollingFrame.Parent = Framee
	ScrollingFrame.Active = true
	ScrollingFrame.BackgroundTransparency = 1
	ScrollingFrame.BorderSizePixel = 0
	ScrollingFrame.Position = UDim2.new(0.04, 0, 0.01, 0)
	ScrollingFrame.Size = UDim2.new(0.92, 0, 0.98, 0)
	ScrollingFrame.ScrollBarThickness = 0
	ScrollingFrame.ZIndex = 6

	local UIListLayout = Instance.new("UIListLayout", ScrollingFrame)
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 4)


	UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
	end)


	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.Parent = ScrollingFrame
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 1)

	if typeof(options.Options) == "table" then
		for _, item in ipairs(options.Options) do
			local dropdownbutton = Instance.new("TextButton")
			dropdownbutton.Parent = ScrollingFrame
			dropdownbutton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			dropdownbutton.BorderSizePixel = 0
			dropdownbutton.Size = UDim2.new(1, 0, 0, 30)
			dropdownbutton.Font = Enum.Font.GothamBold
			dropdownbutton.Text = tostring(item)
			dropdownbutton.TextColor3 = Color3.fromRGB(255, 255, 255)
			dropdownbutton.TextSize = 14
			dropdownbutton.TextXAlignment = Enum.TextXAlignment.Left
			dropdownbutton.ZIndex = 7
			dropdownbutton.AutoButtonColor = false

			dropdownbutton.MouseButton1Click:Connect(function()

				local TweenService = game:GetService("TweenService")

				TextLabel_2.Text = item
				TweenService:Create(Arrow, TweenInfo.new(0.25), {Rotation = 0}):Play()
				TweenService:Create(Framee, TweenInfo.new(0.25), {Size = UDim2.new(0, 120, 0, 0)}):Play()
				task.wait(0.25)
				Framee.Visible = false
				options.Callback(item)
			end)
		end
	end

	local selectedValue = options.Default or ""
	TextLabel_2.Text = selectedValue

	if selectedValue ~= "" then
		options.Callback(selectedValue)
	end


	local TweenService = game:GetService("TweenService")

	Dropdownbutton.MouseButton1Click:Connect(function()
		if not Framee.Visible then
			Arrow.Rotation = 0
			Framee.Visible = true
			TweenService:Create(Arrow, TweenInfo.new(0.25), {Rotation = 180}):Play()
			TweenService:Create(Framee, TweenInfo.new(0.25), {Size = UDim2.new(0, 120, 0, 100)}):Play()
		else
			TweenService:Create(Arrow, TweenInfo.new(0.25), {Rotation = 0}):Play()
			TweenService:Create(Framee, TweenInfo.new(0.25), {Size = UDim2.new(0, 120, 0, 0)}):Play()
			task.wait(0.25)
			Framee.Visible = false
		end
	end)
end

function GUI:Notification(options)
	options = Library:validate({
		Title = options.Title or "Title",
		Description = options.Description or "Description",
		Time = tonumber(options.Time) or 3
	}, options or {})

	local NotificationsGUI = game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("Notifications")
	if not NotificationsGUI then
		NotificationsGUI = Instance.new("ScreenGui")
		NotificationsGUI.Name = "Notifications"
		NotificationsGUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
		NotificationsGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	end

	local existingNotifications = NotificationsGUI:GetChildren()
	local yOffset = -85 * #existingNotifications
	local position = UDim2.new(1, 0, 0.875, yOffset)


	if UIS.TouchEnabled then
		yOffset = -42.5 * #existingNotifications
		position = UDim2.new(1, 0, 0.875, yOffset)
	end

	local NotificationFrame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Title = Instance.new("TextLabel")
	local ImageLabel = Instance.new("ImageLabel")
	local NotificationTimerBackground = Instance.new("Frame")
	local Description = Instance.new("TextLabel")
	local UIShadow = Instance.new("Frame")
	local umbraShadow = Instance.new("ImageLabel")
	local penumbraShadow = Instance.new("ImageLabel")
	local ambientShadow = Instance.new("ImageLabel")

	NotificationFrame.Name = "NotificationFrame"
	NotificationFrame.Parent = NotificationsGUI
	NotificationFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	NotificationFrame.BackgroundTransparency = 0.250
	NotificationFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	NotificationFrame.BorderSizePixel = 0
	NotificationFrame.Position = position
	NotificationFrame.Size = UDim2.new(0, 300, 0, 75)

	if UIS.TouchEnabled then

		local scale = Instance.new("UIScale")
		scale.Parent = NotificationFrame
		scale.Scale = 0.5

	end

	task.spawn(function()
		local Lighting        = game:GetService("Lighting")
		local RunService      = game:GetService("RunService")
		local camera          = workspace.CurrentCamera

		local BLUR_SIZE         = Vector2.new(0, 0)
		local PART_SIZE         = 0.01
		local PART_TRANSPARENCY = 1 - 1e-7
		local START_INTENSITY   = 0.25

		local lastCameraCFrame = camera.CFrame
		local LastTopBarPosition = NotificationFrame.Position
		local EPSILON = 0.0001

		script.Parent:SetAttribute("BlurIntensity", START_INTENSITY)

		local BLUR_OBJ          = Instance.new("DepthOfFieldEffect")
		BLUR_OBJ.FarIntensity   = 0
		BLUR_OBJ.NearIntensity  = script.Parent:GetAttribute("BlurIntensity")
		BLUR_OBJ.FocusDistance  = 0.25
		BLUR_OBJ.InFocusRadius  = 0
		BLUR_OBJ.Parent         = Lighting

		local PartsList   = {}
		local BlursList   = {}
		local BlurObjects = {}

		local BlurredGui  = {}
		BlurredGui.__index = BlurredGui

		local function rayPlaneIntersect(planePos, planeNormal, rayOrigin, rayDirection)
			local v = rayOrigin - planePos
			local num = planeNormal:Dot(v)
			local den = planeNormal:Dot(rayDirection)
			local a = -num / den
			return rayOrigin + a * rayDirection
		end

		local function rebuildPartsList()
			PartsList = {}
			BlursList = {}
			for obj, part in pairs(BlurObjects) do
				PartsList[#PartsList+1] = part
				BlursList[#BlursList+1] = obj
			end
		end

		function BlurredGui.new(frame, shape)
			local blurPart = Instance.new("Part")
			blurPart.Size         = Vector3.new(PART_SIZE, PART_SIZE, PART_SIZE)
			blurPart.Anchored     = true
			blurPart.CanCollide   = false
			blurPart.CanTouch     = false
			blurPart.Material     = Enum.Material.Glass
			blurPart.Transparency = PART_TRANSPARENCY
			blurPart.Parent       = workspace.CurrentCamera

			local mesh
			if shape == "Rectangle" then
				mesh = Instance.new("BlockMesh")
			elseif shape == "Oval" then
				mesh = Instance.new("SpecialMesh")
				mesh.MeshType = Enum.MeshType.Sphere
			end
			mesh.Parent = blurPart

			local ignoreInset = false
			local parentObj = frame
			while parentObj and not parentObj:IsA("ScreenGui") do
				parentObj = parentObj.Parent
			end
			if parentObj then
				ignoreInset = parentObj.IgnoreGuiInset
			end

			local new = setmetatable({
				Frame          = frame,
				Part           = blurPart,
				Mesh           = mesh,
				IgnoreGuiInset = ignoreInset
			}, BlurredGui)

			BlurObjects[new] = blurPart
			rebuildPartsList()

			return new
		end

		local function updateGui(obj)
			local frame = obj.Frame
			local part  = obj.Part
			local mesh  = obj.Mesh

			if not frame.Visible then
				part.Transparency = 1
				return
			end

			part.Transparency = PART_TRANSPARENCY

			local camera = workspace.CurrentCamera

			local corner0 = frame.AbsolutePosition + BLUR_SIZE
			local corner1 = corner0 + frame.AbsoluteSize - BLUR_SIZE * 2

			local r0, r1
			if obj.IgnoreGuiInset then
				r0 = camera:ViewportPointToRay(corner0.X, corner0.Y, 1)
				r1 = camera:ViewportPointToRay(corner1.X, corner1.Y, 1)
			else
				r0 = camera:ScreenPointToRay(corner0.X, corner0.Y, 1)
				r1 = camera:ScreenPointToRay(corner1.X, corner1.Y, 1)
			end

			local planeOrigin = camera.CFrame.Position + camera.CFrame.LookVector * (0.05 - camera.NearPlaneZ)
			local planeNormal = camera.CFrame.LookVector

			local p0 = rayPlaneIntersect(planeOrigin, planeNormal, r0.Origin, r0.Direction)
			local p1 = rayPlaneIntersect(planeOrigin, planeNormal, r1.Origin, r1.Direction)

			p0 = camera.CFrame:PointToObjectSpace(p0)
			p1 = camera.CFrame:PointToObjectSpace(p1)

			local size   = p1 - p0
			local center = (p0 + p1) * 0.5

			mesh.Offset = center
			mesh.Scale  = size / PART_SIZE
		end

		RunService:BindToRenderStep("NotificationBlurUpdater", Enum.RenderPriority.Camera.Value + 1, function()
			local camCFrame = camera.CFrame

			if (camCFrame.Position - lastCameraCFrame.Position).Magnitude > EPSILON
				or camCFrame.LookVector:Dot(lastCameraCFrame.LookVector) < 1 - EPSILON
				or LastTopBarPosition ~= NotificationFrame.Position then

				lastCameraCFrame = camCFrame

				BLUR_OBJ.NearIntensity = script.Parent:GetAttribute("BlurIntensity")
				BLUR_OBJ.FocusDistance = 0.25 - camera.NearPlaneZ

				for i = 1, #BlursList do
					updateGui(BlursList[i])
				end

				local cframes = table.create(#BlursList, camCFrame)
				workspace:BulkMoveTo(PartsList, cframes, Enum.BulkMoveMode.FireCFrameChanged)
			end
		end)

		function BlurredGui:Destroy()
			self.Part:Destroy()
			BlurObjects[self] = nil
			rebuildPartsList()
		end

		local blurInstance = BlurredGui.new(NotificationFrame, "Rectangle")

		local Debris = game:GetService("Debris")

		Debris:AddItem(blurInstance.Part, options.Time + 0.25)

		Debris:AddItem(BLUR_OBJ, options.Time + 0.25)

		return BlurredGui
	end)

	UICorner.CornerRadius = UDim.new(0, 3)
	UICorner.Parent = NotificationFrame

	Title.Name = "Title"
	Title.Parent = NotificationFrame
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0.150000006, 0, 0.0700000003, 0)
	Title.Size = UDim2.new(0, 260, 0, 30)
	Title.Font = Enum.Font.GothamBold
	Title.Text = options.Title
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 18.000
	Title.TextXAlignment = Enum.TextXAlignment.Left

	ImageLabel.Parent = NotificationFrame
	ImageLabel.BackgroundTransparency = 1.000
	ImageLabel.BorderSizePixel = 0
	ImageLabel.Position = UDim2.new(0.0267062318, 0, 0.109756097, 0)
	ImageLabel.Size = UDim2.new(0, 25, 0, 25)
	ImageLabel.Image = "http://www.roblox.com/asset/?id=6026568227"

	NotificationTimerBackground.Name = "NotificationTimerBackground"
	NotificationTimerBackground.Parent = NotificationFrame
	NotificationTimerBackground.BackgroundColor3 = accentcolor
	NotificationTimerBackground.BorderColor3 = Color3.fromRGB(0, 0, 0)
	NotificationTimerBackground.BorderSizePixel = 0
	NotificationTimerBackground.Position = UDim2.new(0, 0, 0.95, 0)
	NotificationTimerBackground.Size = UDim2.new(1, 0, 0, 4)

	Description.Name = "Description"
	Description.Parent = NotificationFrame
	Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Description.BackgroundTransparency = 1.000
	Description.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Description.BorderSizePixel = 0
	Description.Position = UDim2.new(0.15000014, 0, 0.41146329, 0)
	Description.Size = UDim2.new(0, 260, 0, 30)
	Description.Font = Enum.Font.GothamBold
	Description.Text = options.Description
	Description.TextColor3 = Color3.fromRGB(200, 200, 200)
	Description.TextSize = 15.000
	Description.TextXAlignment = Enum.TextXAlignment.Left

	UIShadow.Name = "UI-Shadow"
	UIShadow.Parent = NotificationFrame
	UIShadow.BackgroundTransparency = 1.000
	UIShadow.Position = UDim2.new(0, -7, 0, -7)
	UIShadow.Size = UDim2.new(0, 315, 0, 90)
	UIShadow.ZIndex = -999999999

	umbraShadow.Name = "umbraShadow"
	umbraShadow.Parent = UIShadow
	umbraShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	umbraShadow.BackgroundTransparency = 1.000
	umbraShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	umbraShadow.Size = UDim2.new(1, 0, 1, 0)
	umbraShadow.Image = "rbxassetid://1316045217"
	umbraShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	umbraShadow.ImageTransparency = 0.860
	umbraShadow.ScaleType = Enum.ScaleType.Slice
	umbraShadow.SliceCenter = Rect.new(10, 10, 118, 118)

	penumbraShadow.Name = "penumbraShadow"
	penumbraShadow.Parent = UIShadow
	penumbraShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	penumbraShadow.BackgroundTransparency = 1.000
	penumbraShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	penumbraShadow.Size = UDim2.new(1, 0, 1, 0)
	penumbraShadow.Image = "rbxassetid://1316045217"
	penumbraShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	penumbraShadow.ImageTransparency = 0.880
	penumbraShadow.ScaleType = Enum.ScaleType.Slice
	penumbraShadow.SliceCenter = Rect.new(10, 10, 118, 118)

	ambientShadow.Name = "ambientShadow"
	ambientShadow.Parent = UIShadow
	ambientShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	ambientShadow.BackgroundTransparency = 1.000
	ambientShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	ambientShadow.Size = UDim2.new(1, 0, 1, 0)
	ambientShadow.Image = "rbxassetid://1316045217"
	ambientShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	ambientShadow.ImageTransparency = 0.880
	ambientShadow.ScaleType = Enum.ScaleType.Slice
	ambientShadow.SliceCenter = Rect.new(10, 10, 118, 118)

	NotificationFrame:TweenPosition(UDim2.new(0.78, 0, 0.875, yOffset), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.25)

	NotificationTimerBackground:TweenSize(UDim2.new(0, 0, 0, 4), Enum.EasingDirection.In, Enum.EasingStyle.Linear, options.Time)

	wait(options.Time)
	NotificationFrame:TweenPosition(UDim2.new(1, 0, 0.875, yOffset), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.25)
	wait(0.5)
	game:GetService("RunService"):UnbindFromRenderStep("NotificationBlurUpdater")
	NotificationFrame:Destroy()
end


function GUI:TextBox(options, parentFrame)
	options = Library:validate({
		text = "Button",
		Callback = function() end,
		initialPosition = nil  
	}, options or {})

	local TextBox = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local UIPadding = Instance.new("UIPadding")
	local TextLabel = Instance.new("TextLabel")
	local TextBox_2 = Instance.new("TextBox")
	local UICorner_2 = Instance.new("UICorner")

	TextBox.Name = "TextBox"
	TextBox.Parent = parentFrame
	TextBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextBox.BorderSizePixel = 0
	TextBox.Position = UDim2.new(0, 0, 0.496283472, 0)
	TextBox.Size = UDim2.new(0.96, 0, 0, 35)

	UICorner.CornerRadius = UDim.new(0, 4)
	UICorner.Parent = TextBox

	UIPadding.Parent = TextBox
	UIPadding.PaddingBottom = UDim.new(0, 6)
	UIPadding.PaddingLeft = UDim.new(0, 6)
	UIPadding.PaddingRight = UDim.new(0, 6)
	UIPadding.PaddingTop = UDim.new(0, 6)

	TextLabel.Parent = TextBox
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Size = UDim2.new(1, 0, 1, 0)
	TextLabel.Font = Enum.Font.GothamBold
	TextLabel.Text = options.text
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 14.000
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left

	TextBox_2.Parent = TextBox
	TextBox_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	TextBox_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextBox_2.BorderSizePixel = 0
	TextBox_2.Position = UDim2.new(0.795, 0, 0.0250000004, 0)
	TextBox_2.Size = UDim2.new(0.175, 0, 0.95, 0)
	TextBox_2.Font = Enum.Font.GothamBold
	TextBox_2.Text = ""
	TextBox_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextBox_2.TextSize = 15

	UICorner_2.CornerRadius = UDim.new(0, 5)
	UICorner_2.Parent = TextBox_2

	local BaseSize = TextBox_2.Size
	local BasePosition = TextBox_2.Position

	TextBox_2:GetPropertyChangedSignal("Text"):Connect(function()
		local Num = math.min(#TextBox_2.Text, 25)

		tweenService:Create(TextBox_2, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = BaseSize + UDim2.new(0, Num * 7, 0, 0)}):Play()
		tweenService:Create(TextBox_2, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Position = BasePosition - UDim2.new(0, Num * 7, 0, 0)}):Play()
	end)

	TextBox_2.FocusLost:Connect(function()
		options.Callback(TextBox_2.Text)
	end)
end













function CREATEIHA(TIME, SIZE, CF)
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

local BHOP = false
local BHOPSPEED = 30

game:GetService("RunService").RenderStepped:Connect(function()
    if BHOP then
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("Humanoid") and character:FindFirstChild("HumanoidRootPart") then
            local humanoid = character.Humanoid
            local hrp = character.HumanoidRootPart
            local moveDir = humanoid.MoveDirection
            local velocity = hrp.Velocity
            local verticalVelocity = velocity.Y

            if moveDir.Magnitude > 0 then
                hrp.Velocity = moveDir.Unit * BHOPSPEED + Vector3.new(0, verticalVelocity, 0)
            else
                hrp.Velocity = Vector3.new(velocity.X, 0, velocity.Z) * 0 + Vector3.new(0, verticalVelocity, 0)
            end
        end
    end
end)

local antifling = false

task.spawn(function()
	while wait(0.1) do
		if antifling then
			for _, plr in pairs(Players:GetPlayers()) do
				for _, parts in plr.Character:GetChildren() do
					if parts then
						if parts:IsA("BasePart") then
							parts.CanCollide = false
						end
					end
				end
			end
		end
	end
end)


local Players = game:GetService("Players")

local silentaim = false

task.spawn(function()
    while task.wait(0.1) do
        pcall(function()
            if silentaim and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
                for _, enemy in pairs(Players:GetPlayers()) do
                    if enemy ~= LP and enemy.Character and enemy.Character:FindFirstChild("HumanoidRootPart") then
                        if enemy.Backpack:FindFirstChild("Knife") or enemy.Character:FindFirstChild("Knife") then
                            local startPos = LP.Character.HumanoidRootPart.Position
                            local endPos = enemy.Character.HumanoidRootPart.Position
							local endCF = enemy.Character.HumanoidRootPart.CFrame
                            local direction = (endPos - startPos).Unit * 500

                            local raycastParams = RaycastParams.new()
                            raycastParams.FilterDescendantsInstances = {LP.Character}
                            raycastParams.FilterType = Enum.RaycastFilterType.Blacklist

                            local result = workspace:Raycast(startPos, direction, raycastParams)

                            if not result or (result.Instance and result.Instance:IsDescendantOf(enemy.Character)) then
                                if LP.Character:FindFirstChild("Gun") and
                                   LP.Character.Gun:FindFirstChild("KnifeLocal") and
                                   LP.Character.Gun.KnifeLocal:FindFirstChild("CreateBeam") and
                                   LP.Character.Gun.KnifeLocal.CreateBeam:FindFirstChild("RemoteFunction") then
                                    LP.Character.Gun.KnifeLocal.CreateBeam.RemoteFunction:InvokeServer(1, endPos, "AH2")
									CREATEIHA(1, 15, endCF)
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)

local autogun = false

task.spawn(function()
    while task.wait(0.1) do
        pcall(function()
            if autogun and LP.Character and (not LP.Backpack:FindFirstChild("Knife") and not LP.Character:FindFirstChild("Knife")) then
                for _, models in pairs(workspace:GetChildren()) do
                    if models:FindFirstChild("GunDrop") and LP.Character:FindFirstChild("HumanoidRootPart") then
                        local hrp = LP.Character.HumanoidRootPart
                        local org = hrp.CFrame
                        hrp.CFrame = models.GunDrop.CFrame + Vector3.new(0, -2, 0)
                        task.wait(0.01)
                        hrp.CFrame = org
                    end
                end
            end
        end)
    end
end)

local infjump = false
game:GetService("UserInputService").JumpRequest:Connect(function()
    if infjump and LP.Character and LP.Character:FindFirstChildOfClass("Humanoid") then
        LP.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

local noclip = false

runService.Heartbeat:Connect(function()
        local char = LP.Character
		if noclip then
        if char then
            for _, parts in pairs(char:GetChildren()) do
                if parts:IsA("BasePart") then
                    parts.CanCollide = false
				end
            end
        end
    end
end)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LP = Players.LocalPlayer
local roles
local innocentesp = false
local murdesp = false
local sheriffesp = false


local function getRoot()
    if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        return LP.Character.HumanoidRootPart
    end
    return nil
end

function CreateHighlight()
    for _, v in pairs(Players:GetChildren()) do
        if v ~= LP and v.Character and not v.Character:FindFirstChild("Highlight") then
            local hl = Instance.new("Highlight", v.Character)
            hl.FillTransparency = 1
            hl.OutlineTransparency = 1
        end
    end
end

function UpdateHighlights()
    for _, v in pairs(Players:GetChildren()) do
        if v ~= LP and v.Character and v.Character:FindFirstChild("Highlight") then
            local Highlight = v.Character:FindFirstChild("Highlight")

            if sheriffesp and (v.Name == Sheriff or v.Backpack:FindFirstChild("Gun") or v.Character:FindFirstChild("Gun")) and IsAlive(v) then
                Highlight.FillColor = Color3.fromRGB(0, 0, 225)
                Highlight.FillTransparency = 0.5
                Highlight.OutlineTransparency = 0

            elseif murdesp and (v.Name == Murder or v.Backpack:FindFirstChild("Knife") or v.Character:FindFirstChild("Knife")) and IsAlive(v) then
                Highlight.FillColor = Color3.fromRGB(225, 0, 0)
                Highlight.FillTransparency = 0.5
                Highlight.OutlineTransparency = 0

            elseif sheriffesp and (v.Name == Hero or v.Backpack:FindFirstChild("Gun") or v.Character:FindFirstChild("Gun")) and IsAlive(v) and not IsAlive(game.Players[Sheriff]) then
                Highlight.FillColor = Color3.fromRGB(255, 250, 0)
                Highlight.FillTransparency = 0.5
                Highlight.OutlineTransparency = 0

            elseif innocentesp then
                Highlight.FillColor = Color3.fromRGB(0, 225, 0)
                Highlight.FillTransparency = 0.5
                Highlight.OutlineTransparency = 0
            end
        end
    end
end

function IsAlive(Player)
    for name, data in pairs(roles) do
        if Player.Name == name then
            return not data.Killed and not data.Dead
        end
    end
    return false
end

RunService.RenderStepped:Connect(function()
    roles = ReplicatedStorage:FindFirstChild("GetPlayerData", true):InvokeServer()

    for name, data in pairs(roles) do
        if data.Role == "Murderer" then
            Murder = name
        elseif data.Role == "Sheriff" then
            Sheriff = name
        elseif data.Role == "Hero" then
            Hero = name
        end
    end

    CreateHighlight()
    UpdateHighlights()
end)

local gunesp = false

task.spawn(function()
    while task.wait(0.1) do
        if gunesp then
            for _, model in pairs(workspace:GetChildren()) do
                local gunDrop = model:FindFirstChild("GunDrop")
                if gunDrop and not gunDrop:FindFirstChild("GunCham") then
                    local gp = Instance.new("Part")
                    gp.Size = Vector3.new(3, 3, 3)
                    gp.Position = gunDrop.Position
                    gp.Name = "GunCham"
                    gp.Anchored = true
                    gp.CanCollide = false
                    gp.Transparency = 0
                    gp.Color = Color3.fromRGB(255, 0, 255)
                    gp.Parent = gunDrop
					gp.Shap = Enum.PartType.Ball

                    local hl = Instance.new("Highlight")
                    hl.FillColor = Color3.fromRGB(255, 0, 255)
                    hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                    hl.Adornee = gp
                    hl.Parent = gp
                end
            end
        else
            for _, model in pairs(workspace:GetChildren()) do
                local gunDrop = model:FindFirstChild("GunDrop")
                if gunDrop then
                    local cham = gunDrop:FindFirstChild("GunCham")
                    if cham then cham:Destroy() end
                end
            end
        end
    end
end)

local coinesp = false
task.spawn(function()
    while task.wait(0.1) do
        if coinesp then
            for _, model in pairs(workspace:GetChildren()) do
                local coinContainer = model:FindFirstChild("CoinContainer")
                if coinContainer then
                    for _, coinServer in pairs(coinContainer:GetChildren()) do
                        if coinServer.Name == "Coin_Server" and not coinServer:FindFirstChild("CoinHighlight") then
                            local hl = Instance.new("Highlight")
                            hl.Name = "CoinHighlight"
                            hl.FillColor = Color3.fromRGB(255, 255, 0)
                            hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                            hl.OutlineTransparency = 0
                            hl.Adornee = coinServer
                            hl.Parent = coinServer
                        end
                    end
                end
            end
        end
    end
end)



local main = Library:Init { Title = "Koshki", accentcolor = Color3.fromRGB(150,140,200) }

local TabSection = GUI:TabSection({
	text = "Combat"
})

local Tab = GUI:CreateTab({
	Text = "Combat",
	icon = "rbxassetid://6034767608"
})

local section = GUI:Section({
	text = "Gun"
}, Tab)

local Toggle = GUI:Toggle({
	text = "Auto Shoot",
	callback = function(ToggleActive)
		if ToggleActive then
			silentaim = false
		else
			silentaim = true
		end
	end
}, section)

local Toggle = GUI:Toggle({
	text = "Gun Grabber",
	callback = function(ToggleActive)
		if ToggleActive then
			autogun = false
		else
			autogun = true
		end
	end
}, section)

local section = GUI:Section({
	text = "MoveMent"
}, Tab)

local section = GUI:Section({
	text = "MoveMent"
}, Tab)

local Toggle = GUI:Toggle({
	text = "Velocity",
	callback = function(ToggleActive)
		if ToggleActive then
			BHOP = false
		else
			BHOP = true
		end
	end
}, section)

local Toggle = GUI:Toggle({
	text = "Infinite Jump",
	callback = function(ToggleActive)
		if ToggleActive then
			infjump = false
		else
			infjump = true
		end
	end
}, section)

local Toggle = GUI:Toggle({
	text = "Noclip",
	callback = function(ToggleActive)
		if ToggleActive then
			noclip = false
		else
			noclip = true
		end
	end
}, section)

local Toggle = GUI:Toggle({
	text = "Anti Fling",
	callback = function(ToggleActive)
		if ToggleActive then
			antifling = false
		else
			antifling = true
		end
	end
}, section)

local TabSection = GUI:TabSection({
	text = "Esp"
})

local Tab = GUI:CreateTab({
	Text = "Visuals",
	icon = "rbxassetid://6034767608"
})

local Toggle = GUI:Toggle({
	text = "Murderer Esp",
	callback = function(ToggleActive)
		if ToggleActive then
			murdesp = false
		else
			murdesp = true
		end
	end
}, section)

local Toggle = GUI:Toggle({
	text = "Sheriff Esp",
	callback = function(ToggleActive)
		if ToggleActive then
			sheriffesp = false
		else
			sheriffesp = true
		end
	end
}, section)

local Toggle = GUI:Toggle({
	text = "Innocent Esp",
	callback = function(ToggleActive)
		if ToggleActive then
			innocentesp = false
		else
			innocentesp = true
		end
	end
}, section)

local Toggle = GUI:Toggle({
	text = "Gun Esp",
	callback = function(ToggleActive)
		if ToggleActive then
			gunesp = false
		else
			gunesp = true
		end
	end
}, section)

local Toggle = GUI:Toggle({
	text = "Coin Esp",
	callback = function(ToggleActive)
		if ToggleActive then
			coinesp = false
		else
			coinesp = true
		end
	end
}, section)
