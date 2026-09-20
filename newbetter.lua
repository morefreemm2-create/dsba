local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local Detecting = false
local M1Bully = false
local Michar = player.Character or player.CharacterAdded:Wait()

player.CharacterAdded:Connect(function(char)
	Michar = char
end)
local TweenService = game:GetService("TweenService")

--//========================================================
--// LOSTTOKYO PANEL - REDESIGNED UI
--//========================================================

local gui = Instance.new("ScreenGui")
gui.Name = "LostTokyoPanel"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = playerGui

--// COLORS
local COLORS = {
	Background = Color3.fromRGB(10, 11, 14),
	Panel = Color3.fromRGB(16, 18, 22),
	Panel2 = Color3.fromRGB(20, 22, 27),
	Panel3 = Color3.fromRGB(24, 27, 33),

	Accent = Color3.fromRGB(0, 190, 220),
	AccentDark = Color3.fromRGB(0, 115, 140),

	Text = Color3.fromRGB(235, 238, 242),
	SubText = Color3.fromRGB(145, 151, 162),
	Muted = Color3.fromRGB(95, 101, 112),

	Success = Color3.fromRGB(70, 210, 135),
	Danger = Color3.fromRGB(220, 70, 80),
}

--//========================================================
--// MAIN PANEL
--//========================================================

local frame = Instance.new("Frame")
frame.Name = "MainPanel"
frame.Size = UDim2.new(0, 760, 0, 470)
frame.Position = UDim2.new(0.5, -380, 0.5, -235)
frame.BackgroundColor3 = COLORS.Background
frame.BorderSizePixel = 0
frame.Parent = gui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 12)
frameCorner.Parent = frame

local frameStroke = Instance.new("UIStroke")
frameStroke.Color = Color3.fromRGB(42, 47, 56)
frameStroke.Thickness = 1
frameStroke.Parent = frame

--// Subtle gradient
local frameGradient = Instance.new("UIGradient")
frameGradient.Color = ColorSequence.new{
	ColorSequenceKeypoint.new(0, Color3.fromRGB(11, 13, 17)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(18, 20, 25))
}
frameGradient.Rotation = 90
frameGradient.Parent = frame

--//========================================================
--// TOP BAR
--//========================================================

local topBar = Instance.new("Frame")
topBar.Name = "TopBar"
topBar.Size = UDim2.new(1, 0, 0, 58)
topBar.BackgroundColor3 = COLORS.Panel
topBar.BorderSizePixel = 0
topBar.Parent = frame

local topCorner = Instance.new("UICorner")
topCorner.CornerRadius = UDim.new(0, 12)
topCorner.Parent = topBar

-- Cover bottom corners
local topFix = Instance.new("Frame")
topFix.Size = UDim2.new(1, 0, 0, 15)
topFix.Position = UDim2.new(0, 0, 1, -15)
topFix.BackgroundColor3 = COLORS.Panel
topFix.BorderSizePixel = 0
topFix.Parent = topBar

-- Accent line
local accentLine = Instance.new("Frame")
accentLine.Size = UDim2.new(0, 4, 0, 28)
accentLine.Position = UDim2.new(0, 18, 0.5, -14)
accentLine.BackgroundColor3 = COLORS.Accent
accentLine.BorderSizePixel = 0
accentLine.Parent = topBar

local accentCorner = Instance.new("UICorner")
accentCorner.CornerRadius = UDim.new(1, 0)
accentCorner.Parent = accentLine

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0, 300, 0, 25)
title.Position = UDim2.new(0, 32, 0, 8)
title.Text = "LostTokyo"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = COLORS.Text
title.BackgroundTransparency = 1
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = topBar

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(0, 300, 0, 18)
subtitle.Position = UDim2.new(0, 33, 0, 30)
subtitle.Text = "UTILITY PANEL  •  v1.0"
subtitle.Font = Enum.Font.GothamMedium
subtitle.TextSize = 10
subtitle.TextColor3 = COLORS.Muted
subtitle.BackgroundTransparency = 1
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = topBar

--// Hide button
local hideButton = Instance.new("TextButton")
hideButton.Size = UDim2.new(0, 70, 0, 30)
hideButton.Position = UDim2.new(1, -155, 0.5, -15)
hideButton.Text = "HIDE"
hideButton.Font = Enum.Font.GothamBold
hideButton.TextSize = 11
hideButton.TextColor3 = COLORS.SubText
hideButton.BackgroundColor3 = COLORS.Panel3
hideButton.BorderSizePixel = 0
hideButton.Parent = topBar

local hideCorner = Instance.new("UICorner")
hideCorner.CornerRadius = UDim.new(0, 6)
hideCorner.Parent = hideButton

--// Destroy button
local destroyButton = Instance.new("TextButton")
destroyButton.Size = UDim2.new(0, 70, 0, 30)
destroyButton.Position = UDim2.new(1, -78, 0.5, -15)
destroyButton.Text = "CLOSE"
destroyButton.Font = Enum.Font.GothamBold
destroyButton.TextSize = 11
destroyButton.TextColor3 = Color3.fromRGB(240, 130, 135)
destroyButton.BackgroundColor3 = Color3.fromRGB(38, 20, 23)
destroyButton.BorderSizePixel = 0
destroyButton.Parent = topBar

local destroyCorner = Instance.new("UICorner")
destroyCorner.CornerRadius = UDim.new(0, 6)
destroyCorner.Parent = destroyButton

--//========================================================
--// SIDEBAR
--//========================================================

local playerPanel = Instance.new("Frame")
playerPanel.Name = "PlayerPanel"
playerPanel.Size = UDim2.new(0, 210, 1, -58)
playerPanel.Position = UDim2.new(0, 0, 0, 58)
playerPanel.BackgroundColor3 = COLORS.Panel
playerPanel.BorderSizePixel = 0
playerPanel.Parent = frame

-- Sidebar separator
local separator = Instance.new("Frame")
separator.Size = UDim2.new(0, 1, 1, -20)
separator.Position = UDim2.new(1, -1, 0, 10)
separator.BackgroundColor3 = Color3.fromRGB(38, 42, 49)
separator.BorderSizePixel = 0
separator.Parent = playerPanel

local playerHeader = Instance.new("TextLabel")
playerHeader.Size = UDim2.new(1, -25, 0, 25)
playerHeader.Position = UDim2.new(0, 15, 0, 14)
playerHeader.Text = "PLAYERS"
playerHeader.Font = Enum.Font.GothamBold
playerHeader.TextSize = 11
playerHeader.TextColor3 = COLORS.SubText
playerHeader.BackgroundTransparency = 1
playerHeader.TextXAlignment = Enum.TextXAlignment.Left
playerHeader.Parent = playerPanel

local playerCount = Instance.new("TextLabel")
playerCount.Size = UDim2.new(0, 35, 0, 20)
playerCount.Position = UDim2.new(1, -50, 0, 15)
playerCount.Text = "0"
playerCount.Font = Enum.Font.GothamBold
playerCount.TextSize = 10
playerCount.TextColor3 = COLORS.Accent
playerCount.BackgroundTransparency = 1
playerCount.Parent = playerPanel

local playerList = Instance.new("ScrollingFrame")
playerList.Size = UDim2.new(1, -20, 1, -55)
playerList.Position = UDim2.new(0, 10, 0, 45)
playerList.BackgroundTransparency = 1
playerList.BorderSizePixel = 0
playerList.CanvasSize = UDim2.new(0, 0, 0, 1500)
playerList.ScrollBarThickness = 3
playerList.ScrollBarImageColor3 = COLORS.AccentDark
playerList.Parent = playerPanel

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 5)
layout.Parent = playerList

--//========================================================
--// CONTENT AREA
--//========================================================

local content = Instance.new("Frame")
content.Name = "Content"
content.Size = UDim2.new(1, -210, 1, -58)
content.Position = UDim2.new(0, 210, 0, 58)
content.BackgroundTransparency = 1
content.Parent = frame

--//========================================================
--// SECTION TABS
--//========================================================

local tabBar = Instance.new("Frame")
tabBar.Size = UDim2.new(1, -30, 0, 45)
tabBar.Position = UDim2.new(0, 15, 0, 12)
tabBar.BackgroundColor3 = COLORS.Panel
tabBar.BorderSizePixel = 0
tabBar.Parent = content

local tabCorner = Instance.new("UICorner")
tabCorner.CornerRadius = UDim.new(0, 8)
tabCorner.Parent = tabBar

local tabPadding = Instance.new("UIPadding")
tabPadding.PaddingLeft = UDim.new(0, 6)
tabPadding.PaddingRight = UDim.new(0, 6)
tabPadding.PaddingTop = UDim.new(0, 6)
tabPadding.PaddingBottom = UDim.new(0, 6)
tabPadding.Parent = tabBar

local tabLayout = Instance.new("UIListLayout")
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.Padding = UDim.new(0, 6)
tabLayout.Parent = tabBar

local function createTab(text)
	local button = Instance.new("TextButton")
	button.Size = UDim2.new(0, 145, 1, 0)
	button.Text = text
	button.Font = Enum.Font.GothamBold
	button.TextSize = 11
	button.TextColor3 = COLORS.SubText
	button.BackgroundColor3 = COLORS.Panel2
	button.BorderSizePixel = 0
	button.AutoButtonColor = false
	button.Parent = tabBar

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 6)
	corner.Parent = button

	return button
end

local SectionOneButton = createTab("DSBA  /  MAIN")
SectionOneButton.Name = "Section1B"

local SectionTwoButton = createTab("MM2  /  MAIN")
SectionTwoButton.Name = "Section2B"

local SectionThreeButton = createTab("DSBA  /  PVP")
SectionThreeButton.Name = "DSBAPVP"

--//========================================================
--// FRAMES
--//========================================================

local SectionOneFrame = Instance.new("Frame")
SectionOneFrame.Name = "SectionOneFrame"
SectionOneFrame.Size = UDim2.new(1, -30, 1, -125)
SectionOneFrame.Position = UDim2.new(0, 15, 0, 70)
SectionOneFrame.BackgroundTransparency = 1
SectionOneFrame.Visible = false
SectionOneFrame.Parent = content

local SectionTwoFrame = Instance.new("Frame")
SectionTwoFrame.Name = "SectionTwoFrame"
SectionTwoFrame.Size = UDim2.new(1, -30, 1, -125)
SectionTwoFrame.Position = UDim2.new(0, 15, 0, 70)
SectionTwoFrame.BackgroundTransparency = 1
SectionTwoFrame.Visible = false
SectionTwoFrame.Parent = content

local SectionThirdFrame = Instance.new("Frame")
SectionThirdFrame.Name = "SectionThreeFrame"
SectionThirdFrame.Size = UDim2.new(1, -30, 1, -125)
SectionThirdFrame.Position = UDim2.new(0, 15, 0, 70)
SectionThirdFrame.BackgroundTransparency = 1
SectionThirdFrame.Visible = false
SectionThirdFrame.Parent = content

--// Button grids
local function setupGrid(parent)
	local grid = Instance.new("UIGridLayout")
	grid.CellSize = UDim2.new(0, 145, 0, 42)
	grid.CellPadding = UDim2.new(0, 8, 0, 8)
	grid.SortOrder = Enum.SortOrder.LayoutOrder
	grid.Parent = parent
	return grid
end

local grid = setupGrid(SectionOneFrame)
local grid2 = setupGrid(SectionTwoFrame)
local grid3 = setupGrid(SectionThirdFrame)

--//========================================================
--// BUTTON CREATOR
--//========================================================

local function createButton(name, par)
	local b = Instance.new("TextButton")

	b.Name = name
	b.Size = UDim2.new(0, 145, 0, 42)
	b.Text = name
	b.Font = Enum.Font.GothamBold
	b.TextSize = 12
	b.TextColor3 = COLORS.Text
	b.BackgroundColor3 = COLORS.Panel2
	b.BorderSizePixel = 0
	b.AutoButtonColor = false
	b.Parent = par

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 7)
	corner.Parent = b

	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(39, 43, 51)
	stroke.Thickness = 1
	stroke.Transparency = 0.25
	stroke.Parent = b

	b.MouseEnter:Connect(function()
		b.BackgroundColor3 = Color3.fromRGB(29, 33, 40)
		stroke.Color = COLORS.Accent
		stroke.Transparency = 0.35
	end)

	b.MouseLeave:Connect(function()
		b.BackgroundColor3 = COLORS.Panel2
		stroke.Color = Color3.fromRGB(39, 43, 51)
		stroke.Transparency = 0.25
	end)

	b.MouseButton1Click:Connect(function()
		b.BackgroundColor3 = Color3.fromRGB(35, 42, 48)

		task.delay(0.12, function()
			if b and b.Parent then
				b.BackgroundColor3 = COLORS.Panel2
			end
		end)
	end)

	return b
end

--//========================================================
--// TRACKING DISPLAY
--//========================================================

local trackingBox = Instance.new("Frame")
trackingBox.Size = UDim2.new(0, 300, 0, 70)
trackingBox.Position = UDim2.new(1, -320, 1, -85)
trackingBox.BackgroundColor3 = COLORS.Panel
trackingBox.BorderSizePixel = 0
trackingBox.Parent = content

local trackingCorner = Instance.new("UICorner")
trackingCorner.CornerRadius = UDim.new(0, 8)
trackingCorner.Parent = trackingBox

local trackingStroke = Instance.new("UIStroke")
trackingStroke.Color = Color3.fromRGB(40, 45, 53)
trackingStroke.Thickness = 1
trackingStroke.Parent = trackingBox

local trackingTitle = Instance.new("TextLabel")
trackingTitle.Size = UDim2.new(1, -20, 0, 20)
trackingTitle.Position = UDim2.new(0, 10, 0, 8)
trackingTitle.Text = "CURRENT TARGET"
trackingTitle.Font = Enum.Font.GothamBold
trackingTitle.TextSize = 9
trackingTitle.TextColor3 = COLORS.Muted
trackingTitle.BackgroundTransparency = 1
trackingTitle.TextXAlignment = Enum.TextXAlignment.Left
trackingTitle.Parent = trackingBox

local trackedLabel = Instance.new("TextLabel")
trackedLabel.Size = UDim2.new(1, -20, 0, 30)
trackedLabel.Position = UDim2.new(0, 10, 0, 28)
trackedLabel.Text = "None"
trackedLabel.Font = Enum.Font.GothamBold
trackedLabel.TextSize = 14
trackedLabel.TextColor3 = COLORS.Text
trackedLabel.BackgroundTransparency = 1
trackedLabel.TextXAlignment = Enum.TextXAlignment.Left
trackedLabel.Parent = trackingBox

-- Old external tracking label retained
local trackedLabel2 = Instance.new("TextLabel")
trackedLabel2.Visible = false
trackedLabel2.Size = UDim2.new(0, 105, 0, 39)
trackedLabel2.Position = UDim2.new(0, 87, 0, 10)
trackedLabel2.TextScaled = true
trackedLabel2.TextColor3 = Color3.new(1,1,1)
trackedLabel2.BackgroundTransparency = 1
trackedLabel2.Font = Enum.Font.GothamBold
trackedLabel2.Text = "Tracking: None"
trackedLabel2.Parent = gui

--//========================================================
--// CLEAR TRACKING
--//========================================================

local clearButton = Instance.new("TextButton")
clearButton.Size = UDim2.new(0, 145, 0, 38)
clearButton.Position = UDim2.new(0, 15, 1, -53)
clearButton.Text = "CLEAR TARGET"
clearButton.Font = Enum.Font.GothamBold
clearButton.TextSize = 10
clearButton.TextColor3 = COLORS.SubText
clearButton.BackgroundColor3 = COLORS.Panel2
clearButton.BorderSizePixel = 0
clearButton.Parent = content

local clearCorner = Instance.new("UICorner")
clearCorner.CornerRadius = UDim.new(0, 7)
clearCorner.Parent = clearButton

--//========================================================
--// ARGUMENT BOX
--//========================================================

local argumentBox = Instance.new("Frame")
argumentBox.Size = UDim2.new(0, 210, 0, 55)
argumentBox.Visible = false
argumentBox.Position = UDim2.new(1, -225, 1, -53)
argumentBox.BackgroundColor3 = COLORS.Panel
argumentBox.BorderSizePixel = 0
--argumentBox.Parent = content

local argumentCorner = Instance.new("UICorner")
argumentCorner.CornerRadius = UDim.new(0, 7)
--argumentCorner.Parent = argumentBox

local TextBoxArguments = Instance.new("TextBox")
TextBoxArguments.Size = UDim2.new(1, -10, 1, -10)
TextBoxArguments.Position = UDim2.new(0, 5, 0, 5)
TextBoxArguments.BackgroundColor3 = COLORS.Panel3
TextBoxArguments.TextColor3 = COLORS.Text
TextBoxArguments.PlaceholderColor3 = COLORS.Muted
TextBoxArguments.PlaceholderText = "Arguments to send..."
TextBoxArguments.Text = ""
TextBoxArguments.TextSize = 12
TextBoxArguments.Font = Enum.Font.GothamMedium
TextBoxArguments.TextXAlignment = Enum.TextXAlignment.Center
TextBoxArguments.ClearTextOnFocus = false
TextBoxArguments.BorderSizePixel = 0
TextBoxArguments.Visible = false
--TextBoxArguments.Parent = argumentBox

local argumentCorner2 = Instance.new("UICorner")
argumentCorner2.CornerRadius = UDim.new(0, 5)
argumentCorner2.Parent = TextBoxArguments

--//========================================================
--// REMOTE LIST
--//========================================================

local remoteList = Instance.new("ScrollingFrame")
remoteList.Name = "RemoteList"
remoteList.Visible = false
remoteList.Size = UDim2.new(0, 280, 0, 170)
remoteList.Position = UDim2.new(1, -295, 1, -240)
remoteList.BackgroundColor3 = COLORS.Panel
remoteList.BackgroundTransparency = 0
remoteList.CanvasSize = UDim2.new(0, 0, 0, 1500)
remoteList.BorderSizePixel = 0
remoteList.ScrollBarThickness = 3
remoteList.ScrollBarImageColor3 = COLORS.Accent
remoteList.Parent = frame

local remoteCorner = Instance.new("UICorner")
remoteCorner.CornerRadius = UDim.new(0, 8)
remoteCorner.Parent = remoteList

local layoutrem = Instance.new("UIListLayout")
layoutrem.Padding = UDim.new(0, 5)
layoutrem.Parent = remoteList

local function createremotes(rem)
	local button = Instance.new("TextButton")

	button.Size = UDim2.new(1, -10, 0, 32)
	button.Text = "  " .. rem.Name
	button.TextXAlignment = Enum.TextXAlignment.Left
	button.Font = Enum.Font.GothamMedium
	button.TextSize = 11
	button.TextColor3 = COLORS.Text
	button.BackgroundColor3 = COLORS.Panel2
	button.BorderSizePixel = 0
	button.Parent = remoteList

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 5)
	corner.Parent = button

	button.MouseButton1Click:Connect(function()
		rem:FireServer(TextBoxArguments.Text)
	end)
end

--//========================================================
--// OUTSIDE PLAYER LIST
--//========================================================

local playerListOustide = Instance.new("ScrollingFrame")
playerListOustide.Name = "PlayerListOutside"
playerListOustide.Visible = false
playerListOustide.Size = UDim2.new(0, 190, 0, 250)
playerListOustide.Position = UDim2.new(0, 15, 0, 60)
playerListOustide.BackgroundColor3 = COLORS.Panel
playerListOustide.BackgroundTransparency = 0
playerListOustide.CanvasSize = UDim2.new(0, 0, 0, 1500)
playerListOustide.BorderSizePixel = 0
playerListOustide.ScrollBarThickness = 3
playerListOustide.ScrollBarImageColor3 = COLORS.Accent
playerListOustide.Parent = gui

local outsideCorner = Instance.new("UICorner")
outsideCorner.CornerRadius = UDim.new(0, 8)
outsideCorner.Parent = playerListOustide

local layoutOutside = Instance.new("UIListLayout")
layoutOutside.Padding = UDim.new(0, 5)
layoutOutside.Parent = playerListOustide

--//========================================================
--// SHOW BUTTON
--//========================================================

local showButton = Instance.new("TextButton")
showButton.Size = UDim2.new(0, 85, 0, 34)
showButton.Position = UDim2.new(0, 15, 0, 15)
showButton.Text = "OPEN"
showButton.Visible = false
showButton.Font = Enum.Font.GothamBold
showButton.TextSize = 11
showButton.TextColor3 = COLORS.Text
showButton.BackgroundColor3 = COLORS.Panel
showButton.BorderSizePixel = 0
showButton.Parent = gui

local showCorner = Instance.new("UICorner")
showCorner.CornerRadius = UDim.new(0, 7)
showCorner.Parent = showButton

local showStroke = Instance.new("UIStroke")
showStroke.Color = COLORS.Accent
showStroke.Thickness = 1
showStroke.Parent = showButton

--//========================================================
--// TAB STATE
--//========================================================

local function setTab(activeButton, activeFrame)
	local buttons = {
		SectionOneButton,
		SectionTwoButton,
		SectionThreeButton
	}

	local frames = {
		SectionOneFrame,
		SectionTwoFrame,
		SectionThirdFrame
	}

	for _, button in ipairs(buttons) do
		button.BackgroundColor3 = COLORS.Panel2
		button.TextColor3 = COLORS.SubText
	end

	for _, sectionFrame in ipairs(frames) do
		sectionFrame.Visible = false
	end

	activeButton.BackgroundColor3 = Color3.fromRGB(0, 65, 78)
	activeButton.TextColor3 = COLORS.Accent
	activeFrame.Visible = true
end

-- Default tab
setTab(SectionOneButton, SectionOneFrame)

--//========================================================
--// VISUAL EFFECT
--//========================================================

local glow = Instance.new("UIStroke")
glow.Name = "AccentGlow"
glow.Color = COLORS.Accent
glow.Thickness = 1
glow.Transparency = 0.65
glow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
glow.Parent = frame

local Rs = game:GetService("ReplicatedStorage")

for i, v in ipairs(Rs:GetDescendants()) do
	if v:IsA("RemoteEvent") then
		createremotes(v)
	end
end

hideButton.MouseButton1Click:Connect(function()
	frame.Visible = false
	showButton.Visible = true
	playerListOustide.Visible = true
	trackedLabel2.Visible = true
end)

showButton.MouseButton1Click:Connect(function()
	frame.Visible = true
	showButton.Visible = false
	playerListOustide.Visible = false
	trackedLabel2.Visible = false
end)

SectionOneButton.MouseButton1Click:Connect(function()
	SectionOneFrame.Visible = true
	SectionTwoFrame.Visible = false
	SectionThirdFrame.Visible = false
end)

SectionTwoButton.MouseButton1Click:Connect(function()
	SectionOneFrame.Visible = false
	SectionTwoFrame.Visible = true
	SectionThirdFrame.Visible = false
end)

SectionThreeButton.MouseButton1Click:Connect(function()
	SectionOneFrame.Visible = false
	SectionTwoFrame.Visible = false
	SectionThirdFrame.Visible = true
end)

local detectButton = createButton("Detect Animations", SectionOneFrame)
local flybutton = createButton("Fly", SectionOneFrame)
local tpbutton = createButton("Teleport", SectionOneFrame)
local escapeButton = createButton("Escape", SectionOneFrame)
local safebutton = createButton("Safe Floor", SectionOneFrame)
local m1sbutton = createButton("Counter", SectionOneFrame)
local Flierbutton = createButton("Continuous Fly", SectionOneFrame)
local jork = createButton("JerkFE", SectionOneFrame)
local EmergencyDip = createButton("EmergencyDip", SectionOneFrame)

local Flierbutton2 = createButton("Fly", SectionTwoFrame)
local tpbutton2 = createButton("Teleport", SectionTwoFrame)
local jork2 = createButton("JerkFE", SectionTwoFrame)
local AntiFling = createButton("AntiFling", SectionTwoFrame)

local detectButtonPVP = createButton("Detect Animations", SectionThirdFrame)
local AntiFlingTo = false
local LastPos = nil
local heavytext = Instance.new("TextLabel")
heavytext.Size = UDim2.new(0,600,0,100)
heavytext.Text = "They are using Heavy"
heavytext.Position = UDim2.new(0.5,-300,0.5,-400)
heavytext.BackgroundColor3 = Color3.fromRGB(90, 90, 89)
heavytext.BackgroundTransparency = 1
heavytext.TextColor3 = Color3.new(177, 177, 177)
heavytext.TextScaled = true
heavytext.Font = Enum.Font.GothamBold
heavytext.TextStrokeTransparency = 0
heavytext.Parent = gui
heavytext.Visible = false

local function addHover(button)

	button.MouseEnter:Connect(function()
		TweenService:Create(button,TweenInfo.new(0.15),{
			BackgroundColor3 = Color3.fromRGB(55,55,55)
		}):Play()
	end)

	button.MouseLeave:Connect(function()
		TweenService:Create(button,TweenInfo.new(0.15),{
			BackgroundColor3 = Color3.fromRGB(35,35,35)
		}):Play()
	end)

end

for _,v in pairs(SectionOneFrame:GetChildren()) do
	if v:IsA("TextButton") then
		addHover(v)
	end
end

for _,v in pairs(SectionTwoFrame:GetChildren()) do
	if v:IsA("TextButton") then
		addHover(v)
	end
end

local targhrp

local TweenService = game:GetService("TweenService")

destroyButton.MouseButton1Click:Once(function()
	gui:Destroy()
end)

jork.MouseButton1Click:Once(function()
	loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))("Spider Script")
end)

jork2.MouseButton1Click:Once(function()
	loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
end)

local trackedPlayers = {}

local EmergGencDip = false

detectButtonPVP.MouseButton1Click:Connect(function()
	if Detecting == false then
		Detecting = true
		detectingtwo = false
		detectButtonPVP.Text = "Detect Animations: On"
		detectButton.Text = "Detect Animations: On"
	else
		Detecting = false
		detectingtwo = false
		detectButtonPVP.Text = "Detect Animations: Off"
		detectButton.Text = "Detect Animations: Off"
	end
end)
local AutoBlockButton = createButton("AutoBlock", SectionThirdFrame)
local IsAutoBlocking = false

AutoBlockButton.MouseButton1Click:Connect(function()
	if IsAutoBlocking == false then
		IsAutoBlocking = true
		AutoBlockButton.Text = "Auto Block: On"
	else
		IsAutoBlocking = false
		AutoBlockButton.Text = "Auto Block: Off"
	end
end)

local AutoPBButton = createButton("AutoPB", SectionThirdFrame)
local ProtectGBSButton = createButton("ProtectGBS", SectionThirdFrame)
local IsAutoPB = false
local ProtectGBS2 = false
local CanClimb = false
local TargetAnyoneNearby = false

AutoPBButton.MouseButton1Click:Connect(function()
	if IsAutoPB == false then
		IsAutoPB = true
		AutoPBButton.Text = "Auto PB: On"
	else
		IsAutoPB = false
		AutoPBButton.Text = "Auto PB: Off"
	end
end)
ProtectGBSButton.MouseButton1Click:Connect(function()
	if ProtectGBS2 == false then
		ProtectGBS2 = true
		ProtectGBSButton.Text = "Protect GBS: On"
	else
		ProtectGBS2 = false
		ProtectGBSButton.Text = "Protect GBS: Off"
	end
end)

local FightForPlayerButton = createButton("Fight For You - Buggy:", SectionThirdFrame)
local FightingForYou = false
FightForPlayerButton.MouseButton1Click:Connect(function()
	if FightingForYou == false then
		FightingForYou = true
		FightForPlayerButton.Text = "Fighting For You: On"
	else
		FightingForYou = false
		FightForPlayerButton.Text = "Fighting For You: Off"
	end
end)

local DexButton = createButton("Dex", SectionThirdFrame)

DexButton.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://github.com/AZYsGithub/DexPlusPlus/releases/latest/download/out.lua"))()
end)

local RS = game:GetService("ReplicatedStorage")
if RS:FindFirstChild("events") then
	local Events = RS.events
	local combatremote = Events.remote
	local OnlyUseM1sBtt = false
	local TrackedNpcs = {}
	local AnimsTableSet = {

		["m2swordlower"] = {
			id = "rbxassetid://13989097696",
			dur = 0.45,
			M2 = true,
		},

		["m2swordhigh"] = {
			id = "rbxassetid://13989069332",
			dur = 0.45,
			M2 = true,
		},

		["m2beastswordhigh"] = {
			id = "rbxassetid://13989267219",
			dur = 0.45,
			M2 = true,
		},

		["m2beastswordlow"] = {
			id = "rbxassetid://13989277783",
			dur = 0.45,
			M2 = true,
		},

		["m2slap"] = {
			id = "rbxassetid://13989286742",
			dur = 0.45,
			M2 = true,
		},

		["m2high"] = {
			id = "rbxassetid://13989307542",
			dur = 0.45,
			M2 = true,
		},

		["moondragonringtail"] = {
			id = "rbxassetid://13989120297",
			dur = 0.8,
		},
		["bodyspike"] = {
			id = "rbxassetid://13988514756",
			dur = 0.5,
		},
		["spikeslash"] = {
			id = "rbxassetid://13988542072",
			dur = 0.58,
			bb = 1,
		},
		["beastswordm1s"] = {
			dur = 0.15,
			bb = 1,
			id1 = "rbxassetid://13989233126",
			id2 = "rbxassetid://13989241225",
			id3 = "rbxassetid://13989245673",
			id4 = "rbxassetid://13989263378",
			id5 = "rbxassetid://13989236874",
		},
		["normswordm1s"] = {
			dur = 0.15,
			bb = 1,
			id1 = "rbxassetid://13989049115",
			id2 = "rbxassetid://13989052970",
			id3 = "rbxassetid://13989056506",
			id4 = "rbxassetid://13989059881",
			id5 = "rbxassetid://13989062804",
		},
		["normfistm1s"] = {
			dur = 0.15,
			bb = 1,
			id1 = "rbxassetid://13988178570",
			id2 = "rbxassetid://13988184267",
			id3 = "rbxassetid://13988288330",
			id4 = "rbxassetid://13988293512",
			id5 = "rbxassetid://13988298623",
			id6 = "rbxassetid://13988303070",
		},
		["watersurfaceslash"] = {
			id = "rbxassetid://13988063065",
			dur = 0.11,
		},
		["WaterfallJar"] = {
			id = "rbxassetid://13988068068",
			dur = 0.5,
			bb = 1,
		},
		["Waterdashlong"] = {
			id = "rbxassetid://13988052725",
			dur = 0.9,
			bb = 1,
		},
		["UNdolation"] = {
			id = "rbxassetid://13988329201",
			dur = 0.3,
			bb = 1,
		},
		["FlameTiger"] = {
			id = "rbxassetid://13988421264",
			dur = 0.6,
			bb = 2,
		},
		["Rengoku"] = {
			id = "rbxassetid://13988433903",
			dur = 0.7,
			bb = 1,
		},
		["UnknowingFire"] = {
			id = "rbxassetid://13988324543",
			dur = 0.3,
		},
		["ConstantResounding"] = {
			id = "rbxassetid://13989501276",
			dur = 0.5,
			bb = 2,
		},
		["Roar"] = {
			id = "rbxassetid://13989553001",
			dur = 0.4,
		},
		["Roar2"] = {
			id = "rbxassetid://13988553001",
			dur = 0.4,
		},
		["LovePang"] = {
			id = "rbxassetid://13989021037",
			dur = 0.2,
		},
		["CatLeggedWinds"] = {
			id = "rbxassetid://13989030437",
			dur = 0.3,
			bb = 4,
			d = 1,
		},
		["CatLoveShower"] = {
			id = "rbxassetid://13989025505",
			dur = 0.3,
			bb = 5,
		},
		["ShiversOfFirstLove"] = {
			id = "rbxassetid://13988574089",
			dur = 0.3,
			bb = 1,
		},
		["MoonbowHalfMoonTheHighOne"] = {
			id = "rbxassetid://13989030437",
			dur = 0.3,
			bb = 4,
			d = 2,
		},
		["MoonHeavenJunk"] = {
			id = "rbxassetid://13989127627",
			dur = 1,
			bb = 3,
			d = 0.8,
			multi = true,
		},
		["LunarShine"] = {
			id = "rbxassetid://13989124131",
			dur = 0.4,
			bb = 6,
		},
		["RockSkin"] = {
			id = "rbxassetid://13989116431",
			dur = 0.15,
			bb = 3,
			d = 0.8,
			multi = true,
		},
		["UpperSmash"] = {
			id = "rbxassetid://13987473679",
			dur = 0.3,
			bb = 5,
		},
		["CleanStorm"] = {
			id = "rbxassetid://13988538432",
			dur = 0.11,
		},
		["SunThrow"] = {
			id = "rbxassetid://13988481801",
			dur = 0.6,
			bb = 1,
			d = 0.7
		},
		["SunDash"] = {
			id = "rbxassetid://13988470113",
			dur = 0.2,
		},
		["Peonies"] = {
			id = "rbxassetid://13988189351",
			dur = 0.11,
		},
		["WhrilingPeach"] = {
			id = "rbxassetid://13989045422",
			dur = 0.5,
		},
		["HonoreableShadowPlum"] = {
			id = "rbxassetid://13989039330",
			dur = 0.3,
			bb = 3,
			d = 0.65,
			multi = true,
		},
		["WidningSerpentSlash"] = {
			id = "rbxassetid://13989107776",
			dur = 0.11,
		},
		["VenomFangs"] = {
			id = "rbxassetid://13989112602",
			dur = 0.11,
			bb = 10,
		},
		["MadCleave"] = {
			id = "rbxassetid://13988227789",
			dur = 0.11,
			bb = 1,
		},
		["CircularFangs"] = {
			id = "rbxassetid://13988232291",
			dur = 0.11,
			bb = 3,
			d = 1,
			multi = true,
		},
		["PierceExtract"] = {
			id = "rbxassetid://13988223461",
			dur = 0.2,
		},
		["RipDevour"] = {
			id = "rbxassetid://13988218049",
			dur = 0.4,
		},
		["ZigZag"] = {
			id = "rbxassetid://13988194148",
			dur = 0.6,
			bb = 1,
		},
		["Frolic"] = {
			id = "rbxassetid://14268572848",
			dur = 0.8,
			bb = 1,
		},
		["MereFluttering"] = {
			id = "rbxassetid://13988160813",
			dur = 1,
			bb = 1,
		},
		["Haze"] = {
			id = "rbxassetid://13989387103",
			dur = 0.11,
			bb = 1,
		},
		["RagingSunSpin"] = {
			id = "rbxassetid://13988475178",
			dur = 0.11,
		},
		["SolarHeatHaze"] = {
			id = "rbxassetid://13988485977",
			dur = 0.4,
			bb = 1,
		},
		["LightningBall"] = {
			id = "rbxassetid://13988073088",
			dur = 0.11,
			bb = 1,
		},
		["ThunderClap"] = {
			id = "rbxassetid://13989131565",
			dur = 0.11,
		},
		["FleshSeeds"] = {
			id = "rbxassetid://13989608756",
			dur = 0.11,
		},
		["DemonBlade"] = {
			id = "rbxassetid://13987429910",
			dur = 0.8,
		},
		["LeapKick"] = {
			id = "rbxassetid://13988119350",
			dur = 0.85,
		},
		["DemonPunch"] = {
			id = "rbxassetid://13988198516",
			dur = 0.1,
			bb = 1,
			d = 0.1
		},
		["VoidStyle"] = {
			id = "rbxassetid://13989135322",
			dur = 0.1,
			bb = 1,
		},
		["DestructionStyle"] = {
			id = "rbxassetid://13989139079",
			dur = 0.5,
		},
		["BlueSilverAfterGlow"] = {
			id = "rbxassetid://13989147454",
			dur = 0.2,
			bb = 3,
			d = 0.8,
			multi = true,
		},
		["HantenguSpears"] = {
			id = "rbxassetid://13989346936",
			dur = 0.1,
			bb = 3,
			d = 0.5,
			multi = true,
		},
		["StrongKickNez"] = {
			id = "rbxassetid://13988454333",
			dur = 0.1,
			bb = 1,
		},
		["WaterPot"] = {
			id = "rbxassetid://13989161281",
			dur = 0.1,
			bb = 1,
		},
		["TenThousand"] = {
			id = "rbxassetid://13989192230",
			dur = 0.1,
			bb = 3,
			d = 0.5,
			multi = true,
		},
		["ThousandNeedle"] = {
			id = "rbxassetid://13987223038",
			dur = 0.1,
			bb = 3,
			d = 1.2,
			multi = true,
		},
		["CuttingThread"] = {
			id = "rbxassetid://13989397913",
			dur = 0.1,
			bb = 1,
		},
		["RampantArc"] = {
			id = "rbxassetid://13987204906",
			dur = 0.1,
		},
		["FlingingArrow"] = {
			id = "rbxassetid://13989197964",
			dur = 0,
			bb = 1,
		},
		["FreezingClouds"] = {
			id = "rbxassetid://13989161281",
			dur = 0.1,
		},
		["BarrenHanging"] = {
			id = "rbxassetid://13989156491",
			dur = 0.1,
			bb = 3,
			d = 0.4,
			multi = true,
		},
		["blocks"] = {
			swordblock = "rbxassetid://13988308375",
			fistblock = "rbxassetid://13987820892",
		},

	}

	local function DashAway()
		local LocalPlayer = game.Players.LocalPlayer

		if not (LocalPlayer.Injury.BrokenLegs.Value <= 1) or (LocalPlayer.states:FindFirstChild("DashCD") or (LocalPlayer.states:FindFirstChild("stun") or (LocalPlayer.states:FindFirstChild("selfstun") or (LocalPlayer.states:FindFirstChild("RD") or (LocalPlayer.Character:FindFirstChild("ForceField") or (LocalPlayer.states:FindFirstChild("Killable") or (LocalPlayer.states:FindFirstChild("Bexeing") or LocalPlayer.states:FindFirstChild("exeing")))))))) then
			return false
		end
		local DashCD = Instance.new("Folder")

		DashCD.Name = "DashCD"
		DashCD.Parent = Players.LocalPlayer.states
		game.Debris:AddItem(DashCD, 1)
		local Character = Players.LocalPlayer.Character
		local HumanoidRootPart = Character.HumanoidRootPart

		-- Random dash direction: Left, Right, or Back
		local directions = {
			-HumanoidRootPart.CFrame.RightVector, -- Left
			HumanoidRootPart.CFrame.RightVector,  -- Right
			-HumanoidRootPart.CFrame.LookVector,  -- Back
		}

		local dashDirection = directions[math.random(1, #directions)]

		Character.Humanoid.AutoRotate = true

		if (game.Players.LocalPlayer.Character.Humanoid.MaxHealth - 100) / 2 <= 10 then
			local v4 = game.ReplicatedStorage.DashWithNoDelay:InvokeServer("Dash", "flip")
			local v5 = tick()

			repeat
				wait(0.0001)
			until tick() - v5 >= 0.1 or (v4 == "finished" or v4 == "failed")

			if v4 == "failed" then
				return
			end

			if tick() - v5 >= 0.1 then
				return
			end

			local Character3 = game.Players.LocalPlayer.Character
			local HumanoidRootPart2 = Character3.HumanoidRootPart
			local s = Instance.new("BodyVelocity")

			s.Name = "s"
			s.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			game.Debris:AddItem(s, 0.3)
			s.Velocity = dashDirection * 80
			s.Parent = Character3.HumanoidRootPart
		else
			game.ReplicatedStorage.DashWithNoDelay:InvokeServer("Dash")

			local Character3 = game.Players.LocalPlayer.Character
			local HumanoidRootPart2 = Character3.HumanoidRootPart
			local s = Instance.new("BodyVelocity")

			s.Name = "s"
			s.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			game.Debris:AddItem(s, 0.12)
			s.Velocity = dashDirection * 140
			s.Parent = Character3.HumanoidRootPart
		end
	end

	local function DashAwayForward()
		local LocalPlayer = game.Players.LocalPlayer

		if not (LocalPlayer.Injury.BrokenLegs.Value <= 1) or (LocalPlayer.states:FindFirstChild("DashCD") or (LocalPlayer.states:FindFirstChild("stun") or (LocalPlayer.states:FindFirstChild("selfstun") or (LocalPlayer.states:FindFirstChild("RD") or (LocalPlayer.Character:FindFirstChild("ForceField") or (LocalPlayer.states:FindFirstChild("Killable") or (LocalPlayer.states:FindFirstChild("Bexeing") or LocalPlayer.states:FindFirstChild("exeing")))))))) then
			return false
		end
		local DashCD = Instance.new("Folder")

		DashCD.Name = "DashCD"
		DashCD.Parent = Players.LocalPlayer.states
		game.Debris:AddItem(DashCD, 1)
		local Character = Players.LocalPlayer.Character
		local HumanoidRootPart = Character.HumanoidRootPart

		-- Random dash direction: Left, Right, or Back
		local directions = {
			HumanoidRootPart.CFrame.LookVector,  -- Back
		}

		local dashDirection = directions[math.random(1, #directions)]

		Character.Humanoid.AutoRotate = true

		if (game.Players.LocalPlayer.Character.Humanoid.MaxHealth - 100) / 2 <= 10 then
			local v4 = game.ReplicatedStorage.DashWithNoDelay:InvokeServer("Dash", "flip")
			local v5 = tick()

			repeat
				wait(0.0001)
			until tick() - v5 >= 0.1 or (v4 == "finished" or v4 == "failed")

			if v4 == "failed" then
				return
			end

			if tick() - v5 >= 0.1 then
				return
			end

			local Character3 = game.Players.LocalPlayer.Character
			local HumanoidRootPart2 = Character3.HumanoidRootPart
			local s = Instance.new("BodyVelocity")

			s.Name = "s"
			s.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			game.Debris:AddItem(s, 0.3)
			s.Velocity = dashDirection * 80
			s.Parent = Character3.HumanoidRootPart
		else
			game.ReplicatedStorage.DashWithNoDelay:InvokeServer("Dash")

			local Character3 = game.Players.LocalPlayer.Character
			local HumanoidRootPart2 = Character3.HumanoidRootPart
			local s = Instance.new("BodyVelocity")

			s.Name = "s"
			s.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			game.Debris:AddItem(s, 0.12)
			s.Velocity = dashDirection * 140
			s.Parent = Character3.HumanoidRootPart
		end
	end


	local function RiskChecker(targetPlayer, track, amount)
		local ourstates = Players[Players.LocalPlayer.Name].states
		--local block = ourstates:FindFirstChild("block")
		--if block then
		--if block.Value <= amount then
		--return "RiskyBlock"
		--end
		--end
		if 3 <= amount then
			return "RiskyBlock"
		end
		return "no risk"
	end

	task.spawn(function()
		--while gui.Parent ~= nil do
		--RS.events.ClientEvents:Fire("Sprint", true)
		--task.wait()
		--combatremote:FireServer("manacharges")
		--end
	end)
	local TARGPLR = nil
	local EnemyToFocusOn = nil
	local NpcEnemyToFocusOn = nil
	local function AutoM1()
		if Players.LocalPlayer.Character:FindFirstChild("Katana") then
			Players.LocalPlayer.Character.Katana:Activate()
		else
			combatremote:FireServer("NormalAttack")
		end
	end

	local curranimplaying

	local CanDoStuffExe = false

	local function AutoM2()
		if Players.LocalPlayer.Character:FindFirstChild("Katana") then
			combatremote:FireServer("StrongAttack")
		else
			combatremote:FireServer("StrongAttack")
		end
	end

	local function AutoPB(targetPlayer, track)
		task.spawn(function()
			local CHeckIFPlayer = Players:FindFirstChild(targetPlayer.Name)
			local theirstates
			local theircds
			local Character
			if CHeckIFPlayer then
				theirstates = Players[targetPlayer.Name].states
				theircds = Players[targetPlayer.Name].cds
				Character = targetPlayer.Character
			else
				theirstates = nil
				theircds = nil
				Character = targetPlayer
			end
			local ourstates = Players[Players.LocalPlayer.Name].states
			--local theircds = Players[targetPlayer.Name].cds
			local ourcds = Players[Players.LocalPlayer.Name].cds
			if IsAutoPB == false then return end
			local anim = track.Animation
			if not anim then return end
			if ourstates:FindFirstChild("block") then
				combatremote:FireServer("blockend")
				local res = DashAway()
				if res == false then
					AutoM1()
				end
				return
			end
			local OURCD = ourcds:FindFirstChild("blockstart")
			if OURCD and not ourstates:FindFirstChild("block") then
				local random = math.random(1,2)
				if random == 1 then
					local res = DashAway()
					if res == false then
						AutoM1()
					end
				else
					AutoM1()
				end
				return
			end
			local id = anim.AnimationId
			if id == AnimsTableSet.m2swordhigh.id then
				task.delay(AnimsTableSet.m2swordhigh.dur - 0.1, function()
					if not theirstates or not theirstates:FindFirstChild("block") then
						combatremote:FireServer("blockstart")
						task.wait(0.5)
						combatremote:FireServer("blockend")
					end
				end)
			elseif id == AnimsTableSet.m2swordlower.id then
				task.delay(AnimsTableSet.m2swordlower.dur - 0.1, function()
					if not theirstates or not theirstates:FindFirstChild("block") then
						combatremote:FireServer("blockstart")
						task.wait(0.5)
						combatremote:FireServer("blockend")
					end
				end)
			elseif id == AnimsTableSet.m2high.id then
				task.delay(AnimsTableSet.m2high.dur - 0.1, function()
					if not theirstates or not theirstates:FindFirstChild("block") then
						combatremote:FireServer("blockstart")
						task.wait(0.5)
						combatremote:FireServer("blockend")
					end
				end)
			elseif id == AnimsTableSet.m2slap.id then
				task.delay(AnimsTableSet.m2slap.dur - 0.1, function()
					if not theirstates or not theirstates:FindFirstChild("block") then
						combatremote:FireServer("blockstart")
						task.wait(0.5)
						combatremote:FireServer("blockend")
					end
				end)
			elseif id == AnimsTableSet.moondragonringtail.id then
				task.delay(AnimsTableSet.moondragonringtail.dur - 0.1, function()
					if not theirstates or not theirstates:FindFirstChild("block") then
						combatremote:FireServer("blockstart")
						task.wait(0.5)
						combatremote:FireServer("blockend")
					end
				end)
			elseif id == AnimsTableSet.bodyspike.id then
				task.delay(AnimsTableSet.bodyspike.dur - 0.1, function()
					if not theirstates or not theirstates:FindFirstChild("block") then
						combatremote:FireServer("blockstart")
						task.wait(0.5)
						combatremote:FireServer("blockend")
					end
				end)
			else
				for key, value in pairs(AnimsTableSet) do
					if key and value.id and value.id == id then
						task.delay(value.dur - 0.1, function()
							if ourcds:FindFirstChild("blockstart") and not ourstates:FindFirstChild("block") then
								AutoM1()
							elseif ourcds:FindFirstChild("NormalAttack") and ourcds:FindFirstChild("blockstart") then
								DashAway()
							else
								combatremote:FireServer("blockstart")
								task.wait(0.3)
								combatremote:FireServer("blockend")
								if theirstates and theirstates:FindFirstChild("block") then
									AutoM2()
								else
									AutoM1()
								end
							end
						end)
						break
					end
				end
			end
		end)

	end

	UIS.InputBegan:Connect(function(input, gpe)
		if input.KeyCode == Enum.KeyCode.Z then
			AutoM1()
		end
	end)

	local function FollowEnemy(Enemy)
		task.spawn(function()
			if FightingForYou == false then
				return
			end
			local CHeckIFPlayer = Players:FindFirstChild(Enemy.Name)
			local EnemyCharacter 
			if CHeckIFPlayer then
				EnemyCharacter = Enemy.Character
			else
				EnemyCharacter = Enemy
			end
			local EnemyHRP = EnemyCharacter:FindFirstChild("HumanoidRootPart")
			if not EnemyHRP then return end
			local EnemyHum = EnemyCharacter.Humanoid
			local Player = Players.LocalPlayer
			local Character = Player.Character
			local HRP = Character.HumanoidRootPart
			local Hum = Character.Humanoid
			local Distance = (HRP.Position - EnemyHRP.Position).Magnitude
			if Distance <= 1000 and Distance >= 10 and HRP then
				if Distance >= 10 then
					RS.events.ClientEvents:Fire("Sprint", true)
					Hum:MoveTo(EnemyHRP.Position)
					if Distance > 40 then
						DashAwayForward()
					end
				else
					RS.events.ClientEvents:Fire("Sprint", false)
					Hum:MoveTo(EnemyHRP.Position)
				end
			end
		end)
	end
	local CDThing = false
	local function RandomSpecials(Enemy)
		task.spawn(function()
			if CDThing == true then
				return
			end
			combatremote:FireServer("manacharges")
			local CHeckIFPlayer = Players:FindFirstChild(Enemy.Name)
			local EnemyCharacter 
			if CHeckIFPlayer then
				EnemyCharacter = Enemy.Character
			else
				EnemyCharacter = Enemy
			end
			local EnemyHRP = EnemyCharacter:FindFirstChild("HumanoidRootPart")
			if not EnemyHRP then return end
			local EnemyHum = EnemyCharacter.Humanoid
			local Player = Players.LocalPlayer
			local ourcds = player.cds
			local ourstates = player.states
			if ourstates:FindFirstChild("exeing") and not CHeckIFPlayer then
				return
			end
			if CanDoStuffExe == true then
				return
			end
			local Character = Player.Character
			local HRP = Character.HumanoidRootPart
			local Hum = Character.Humanoid
			local PlayerBackpack = Player.Backpack
			local Distance = (HRP.Position - EnemyHRP.Position).Magnitude
			local AbilitySkills = {}
			if Distance <= 25 and Distance >= 0 then
				for i, v in ipairs(PlayerBackpack:GetChildren()) do
					if v:FindFirstChild("BreathingMove") or v:FindFirstChild("DemonArt") and not ourcds:FindFirstChild(v.Name) then
						table.insert(AbilitySkills, v.Name)
					end
				end
				for i, v in ipairs(Character:GetChildren()) do
					if v:IsA("Tool") then
						v.Parent = PlayerBackpack
					end
				end
				--select random skill
				if #AbilitySkills > 0 then
					local random = math.random(1, #AbilitySkills)
					local randomSkill = AbilitySkills[random]
					local TargTool = PlayerBackpack[randomSkill]
					if TargTool then
						CDThing = true
						--Events.remote:FireServer(TargTool.Name)
						TargTool.Parent = Character
						TargTool:Activate()
						--print("UsimgBreathMove")
						task.delay(0, function()
							TargTool.Parent = PlayerBackpack
							local Katana = PlayerBackpack:FindFirstChild("Katana")
							if Katana then
								Katana.Parent = Character
							end
							task.delay(2, function()
								CDThing = false
							end)
						end)
					end
				end
			end
			table.clear(AbilitySkills)
			AbilitySkills = nil
		end)
	end

	local function AutoGrip(Enemy)
		task.spawn(function()
			local CHeckIFPlayer = Players:FindFirstChild(Enemy.Name)
			local EnemyCharacter
			local Character
			if CHeckIFPlayer then
				EnemyCharacter = Enemy.Character
			else
				EnemyCharacter = Enemy
			end
			local EnemyHRP = EnemyCharacter:FindFirstChild("HumanoidRootPart")
			if not EnemyHRP then return end
			local EnemyHum = EnemyCharacter.Humanoid
			local theirstates
			local theircds
			if CHeckIFPlayer then
				theirstates = Players[Enemy.Name].states
				theircds = Players[Enemy.Name].cds
			else
				theirstates = nil
				theircds = nil
			end
			local Player = Players.LocalPlayer
			local ourcds = player.cds
			local Character = Player.Character
			local HRP = Character.HumanoidRootPart
			local Hum = Character.Humanoid
			local Distance = (HRP.Position - EnemyHRP.Position).Magnitude
			if theirstates then
				if Distance <= 3 and theirstates:FindFirstChild("Killable")  then
					combatremote:FireServer("Execute")
				end
			else
				if Distance <= 14 then
					combatremote:FireServer("Execute")
				end
			end
		end)
	end

	local function RandomAttacks(Enemy)
		task.spawn(function()
			local CHeckIFPlayer = Players:FindFirstChild(Enemy.Name)
			local EnemyCharacter 
			if CHeckIFPlayer then
				EnemyCharacter = Enemy.Character
			else
				EnemyCharacter = Enemy
			end
			local EnemyHRP = EnemyCharacter:FindFirstChild("HumanoidRootPart")
			if not EnemyHRP then return end
			local EnemyHum = EnemyCharacter.Humanoid
			local Player = Players.LocalPlayer
			local ourstates = Player.states
			if ourstates:FindFirstChild("exeing") and not CHeckIFPlayer then
				return
			end
			if CanDoStuffExe == true then
				return
			end
			local ourcds = player.cds
			local Character = Player.Character
			local HRP = Character.HumanoidRootPart
			local Hum = Character.Humanoid
			local Distance = (HRP.Position - EnemyHRP.Position).Magnitude
			if Distance <= 7 and Distance >= 1 then
				local random = math.random(1,2)
				if random == 1 then
					local ourstates = Player.states
					if ourstates:FindFirstChild("exeing") and not CHeckIFPlayer then
						return
					end
					local StrongAttack = ourcds:FindFirstChild("StrongAttack")
					if StrongAttack then
						AutoM1()
					else
						AutoM2()
					end
				else
					AutoM1()
				end
			end
		end)
	end

	local function UseSTW()
		if player.Backpack:FindFirstChild("See-Through World") then
			local ourstates = player.states
			local ourcds = player.cds
			if not ourstates:FindFirstChild("SeeThrough") then
				if not ourcds:FindFirstChild("See-Through World") then
					local TargetTool = player.Backpack:FindFirstChild("See-Through World")
					if TargetTool then
						player.Character.Humanoid:UnequipTools()
						TargetTool.Parent = player.Character
						TargetTool:Activate()
						task.wait(0.1)
						TargetTool.Parent = player.Backpack
					end
				end
			end
		end
	end

	task.spawn(function()
		while true do
			task.wait()
			if gui.Parent ~= nil and FightingForYou == true and EnemyToFocusOn ~= nil then
				local CHeckIFPlayer = Players:FindFirstChild(EnemyToFocusOn.Name)
				if CHeckIFPlayer then
					local EnemyCharacter = EnemyToFocusOn.Character
					if EnemyCharacter ~= nil then
						FollowEnemy(EnemyToFocusOn)
						RandomAttacks(EnemyToFocusOn)
						AutoGrip(EnemyToFocusOn)
					end
				else
					local EnemyCharacter = EnemyToFocusOn
					if EnemyCharacter ~= nil then
						FollowEnemy(EnemyToFocusOn)
						local ourstates = player.states
						if not CanDoStuffExe then
							AutoGrip(EnemyToFocusOn)
						end
						if ourstates:FindFirstChild("exeing") then
							CanDoStuffExe = true
							task.delay(5, function()
								if not ourstates:FindFirstChild("exeing") then
									CanDoStuffExe = false
								end
							end)
						end
						RandomAttacks(EnemyToFocusOn)
					end
				end
			end
			if gui.Parent == nil then
				break
			end
			--RS.events.ClientEvents:Fire("Sprint", true)
			--task.wait()
			--combatremote:FireServer("manacharges")
		end
	end)

	task.spawn(function()
		while true do
			task.wait()
			if gui.Parent ~= nil and FightingForYou == true and EnemyToFocusOn ~= nil then
				if OnlyUseM1sBtt == false then
					local CHeckIFPlayer = Players:FindFirstChild(EnemyToFocusOn.Name)
					if CHeckIFPlayer then
						local EnemyCharacter = EnemyToFocusOn.Character
						if EnemyCharacter ~= nil then
							RandomSpecials(EnemyToFocusOn)
						end
					else
						local EnemyCharacter = EnemyToFocusOn
						if EnemyCharacter ~= nil then
							RandomSpecials(EnemyToFocusOn)
						end
					end
				end
			end
			if gui.Parent == nil then
				break
			end
			--RS.events.ClientEvents:Fire("Sprint", true)
			--task.wait()
			--combatremote:FireServer("manacharges")
		end
	end)
	
	task.spawn(function()
		while true do
			task.wait(1)
			if gui.Parent ~= nil and FightingForYou == true and EnemyToFocusOn ~= nil then
				if OnlyUseM1sBtt == false then
					UseSTW()
				end
			end
			if gui.Parent == nil then
				break
			end
			--RS.events.ClientEvents:Fire("Sprint", true)
			--task.wait()
			--combatremote:FireServer("manacharges")
		end
	end)

	local StoredPbMoves = {
		["Clean Storm Wind Tree"] = {
			D = 1,
		},
		["Dust Whirlwind Cutter"] = {
			D = 1,
		},
		["Moon Dragon Ringtail"] = {
			--D = 0,
			D = 0.2,
		},
		["Coil Choke"] = {
			D = 0.5,
		},
		["Winding Serpent Slash"] = {
			--D = 0.1,
			D = 0.4,
		},
		["Unknowing Fire"] = {
			--D = 0.1,
			D = 0.4,
		},
		["Water Surface Slash"] = {
			--D = 0.1,
			D = 0.4,
		},
		["Rapid Conquest"] = {
			--D = 0.1,
			D = 0.4,
		},
		["Bite And InfectOG"] = {
			D = 0.4,
		},
		["Rat's ClawOG"] = {
			D = 0.5,
		},
		["Roar"] = {
			D = 0.4,
		},
		["Explosive Slash"] = {
			D = 0.4,
		},
		["String Performance"] = {
			D = 0.4,
		},
		["Rip and Devour"] = {
			D = 0.2,
		},
		["Pierce and Extract"] = {
			D = 0.4,
		},
		["Whirling Peach"] = {
			D = 0.4,
		},
		["Peonies of Futility"] = {
			D = 0.4
		},
		["Flaming Thunder God"] = {
			D = 0.4
		},
		["Love Pang"] = {
			D = 0.4
		},
	}


	local function ProtectGBS(targetPlayer, track)
		task.spawn(function()
			local CHeckIFPlayer = Players:FindFirstChild(targetPlayer.Name)
			local theirstates
			local theircds
			if CHeckIFPlayer then
				theirstates = Players[targetPlayer.Name].states
				theircds = Players[targetPlayer.Name].cds
			else
				theirstates = nil
				theircds = nil
			end
			local ourstates = Players[Players.LocalPlayer.Name].states
			--local theircds = Players[targetPlayer.Name].cds
			local ourcds = Players[Players.LocalPlayer.Name].cds
			if ProtectGBS2 == false then return end
			local HeavyAlert = ourcds:FindFirstChild("HeavyAlert")
			if HeavyAlert then
				if theirstates then
					theirstates.ChildAdded:Once(function(ch)
						if ch.Name == "PerfectBlock" then
							if theirstates:FindFirstChild("block") then
								combatremote:FireServer("blockstart")
								task.wait(1)
								combatremote:FireServer("blockend")
							end
						end
					end)
				end
			end
			local StrongAttack = ourcds:FindFirstChild("StrongAttackggggg")
			if StrongAttack then
				if theirstates then
					theirstates.ChildAdded:Once(function(ch)
						if ch.Name == "PerfectBlock" then
							if theirstates:FindFirstChild("block") then
								combatremote:FireServer("blockstart")
								task.wait(1)
								combatremote:FireServer("blockend")
							end
						end
					end)
				end
			end
			for _, cd in ipairs(ourcds:GetChildren()) do
				local moveData = StoredPbMoves[cd.Name]

				if moveData then
					if theirstates then
						theirstates.ChildAdded:Once(function(ch)
							if ch.Name == "PerfectBlock" then
								if theirstates:FindFirstChild("block") then
									combatremote:FireServer("blockstart")
									task.wait(moveData.D)
									combatremote:FireServer("blockend")
								end
							end
						end)
					end
					break
				end
			end
		end)
	end

	local function AutoBlock(targetPlayer, track)
		task.spawn(function()
			local CHeckIFPlayer = Players:FindFirstChild(targetPlayer.Name)
			local theirstates
			local theircds
			if CHeckIFPlayer then
				theirstates = Players[targetPlayer.Name].states
				theircds = Players[targetPlayer.Name].cds
			else
				theirstates = nil
				theircds = nil
			end
			local ourstates = Players[Players.LocalPlayer.Name].states
			local ourcds = Players[Players.LocalPlayer.Name].cds
			if IsAutoBlocking == false then return end
			local Res = RiskChecker(targetPlayer, track, AnimsTableSet.normswordm1s.bb)
			if Res == "RiskyBlock" and ourstates:FindFirstChild("block") then
				combatremote:FireServer("blockend")
				local res = DashAway()
				if res == false then
					AutoM1()
				end
				return
			end
			local OURCD = ourcds:FindFirstChild("blockstart")
			if OURCD and not ourstates:FindFirstChild("block") then
				local random = math.random(1,2)
				if random == 1 then
					local res = DashAway()
					if res == false then
						AutoM1()
					end
				else
					AutoM1()
				end
				return
			end
			local Character
			if CHeckIFPlayer then
				Character = targetPlayer.Character
			else
				Character = targetPlayer
			end
			local anim = track.Animation
			if not anim then return end
			local id = anim.AnimationId
			for key, value in pairs(AnimsTableSet.normswordm1s) do
				if key ~= "dur" and value == id then
					task.delay(AnimsTableSet.normswordm1s.dur - 0.1, function()
						if not theirstates or not theirstates:FindFirstChild("block") then
							local Res = RiskChecker(targetPlayer, track, AnimsTableSet.normswordm1s.bb)
							if Res == "RiskyBlock" then
								DashAway()
							else
								if ourcds:FindFirstChild("blockstart") and not ourstates:FindFirstChild("block") then
									AutoM1()
								elseif ourcds:FindFirstChild("NormalAttack") and ourcds:FindFirstChild("blockstart") then
									DashAway()
								else
									local Conti = true
									local c1
									if theirstates then
										c1 = theirstates.ChildAdded:Connect(function(ch)
											if ch.Name == "PerfectBlock" then
												Conti = false
												--heavytext.Text = "YOU GOTTA MOVE!"
												--heavytext.Visible = true
												AutoM2()
												--	DashAway()
												task.wait(2)
												--heavytext.Visible = false
											end
										end)
									end
									if Conti == true then
										combatremote:FireServer("blockstart")
										task.wait(0.3)
										combatremote:FireServer("blockend")
										if theirstates and theirstates:FindFirstChild("block") then
											AutoM2()
										else
											task.wait(0.3)
											if Conti == true then
												--heavytext.Text = "m1ing rlly good"
												AutoM1()
											end
										end
									end
									task.wait(1.5)
									if c1 then
										c1:Disconnect()
									end
								end
							end
						end
					end)
					break
				end
			end
			for key, value in pairs(AnimsTableSet.beastswordm1s) do
				if key ~= "dur" and value == id then
					task.delay(AnimsTableSet.beastswordm1s.dur - 0.1, function()
						if not theirstates or not theirstates:FindFirstChild("block") then
							local Res = RiskChecker(targetPlayer, track, AnimsTableSet.beastswordm1s.bb)
							if Res == "RiskyBlock" then
								local random = math.random(1,2)
								if random == 1 then
									DashAway()
								else
									AutoM1()
								end
							else
								if ourcds:FindFirstChild("blockstart") and not ourstates:FindFirstChild("block") then
									AutoM1()
								elseif ourcds:FindFirstChild("NormalAttack") and ourcds:FindFirstChild("blockstart") then
									DashAway()
								else
									local Conti = true
									local c1
									if theirstates then
										c1 = theirstates.ChildAdded:Connect(function(ch)
											if ch.Name == "PerfectBlock" then
												Conti = false
												--heavytext.Text = "YOU GOTTA MOVE!"
												--heavytext.Visible = true
												AutoM2()
												--	DashAway()
												task.wait(2)
												--heavytext.Visible = false
											end
										end)
									end
									if Conti == true then
										combatremote:FireServer("blockstart")
										task.wait(0.3)
										combatremote:FireServer("blockend")
										if theirstates and theirstates:FindFirstChild("block") then
											AutoM2()
										else
											task.wait(0.3)
											if Conti == true then
												--heavytext.Text = "m1ing rlly good"
												AutoM1()
											end
										end
									end
									task.wait(1.5)
									if c1 then
										c1:Disconnect()
									end
								end
							end
						end
					end)
					break
				end
			end
			for key, value in pairs(AnimsTableSet.normfistm1s) do
				if key ~= "dur" and value == id then
					task.delay(AnimsTableSet.normfistm1s.dur - 0.1, function()
						if not theirstates or not theirstates:FindFirstChild("block") then
							local Res = RiskChecker(targetPlayer, track, AnimsTableSet.normfistm1s.bb)
							if Res == "RiskyBlock" then
								local random = math.random(1,2)
								if random == 1 then
									DashAway()
								else
									AutoM1()
								end
							else
								if ourcds:FindFirstChild("blockstart") and not ourstates:FindFirstChild("block") then
									AutoM1()
								elseif ourcds:FindFirstChild("NormalAttack") and ourcds:FindFirstChild("blockstart") then
									DashAway()
								else
									local Conti = true
									local c1
									if theirstates then
										c1 = theirstates.ChildAdded:Connect(function(ch)
											if ch.Name == "PerfectBlock" then
												Conti = false
												--heavytext.Text = "YOU GOTTA MOVE!"
												--heavytext.Visible = true
												AutoM2()
												--	DashAway()
												task.wait(2)
												--heavytext.Visible = false
											end
										end)
									end
									if Conti == true then
										combatremote:FireServer("blockstart")
										task.wait(0.3)
										combatremote:FireServer("blockend")
										if theirstates and theirstates:FindFirstChild("block") then
											AutoM2()
										else
											task.wait(0.3)
											if Conti == true then
												--heavytext.Text = "m1ing rlly good"
												AutoM1()
											end
										end
									end
									task.wait(1.5)
									if c1 then
										c1:Disconnect()
									end
								end
							end
						end
					end)
					break
				end
			end
			if id == AnimsTableSet.spikeslash.id then
				if not theirstates or not theirstates:FindFirstChild("block") then
					local Res = RiskChecker(targetPlayer, track, AnimsTableSet.spikeslash.bb)
					if Res == "RiskyBlock" then
						local random = math.random(1,2)
						if random == 1 then
							DashAway()
						else
							AutoM1()
						end
					else
						if ourcds:FindFirstChild("blockstart") and not ourstates:FindFirstChild("block") then
							AutoM1()
						elseif ourcds:FindFirstChild("NormalAttack") and ourcds:FindFirstChild("blockstart") then
							DashAway()
						else
							combatremote:FireServer("blockstart")
							task.wait(0.4)
							combatremote:FireServer("blockend")
							if theirstates and theirstates:FindFirstChild("block") then
								AutoM2()
							else
								AutoM1()
							end
						end
					end
				end
			elseif id == AnimsTableSet.m2swordlower.id then
				task.delay(AnimsTableSet.m2swordlower.dur - 0.1, function()
					if not theirstates or not theirstates:FindFirstChild("block") then
						combatremote:FireServer("blockstart")
						task.wait(0.1)
						combatremote:FireServer("blockend")
						task.wait(0.1)
						combatremote:FireServer("NormalAttack")
					end
				end)
			else
				for key, value in pairs(AnimsTableSet) do
					if key and value.id and value.id == id then
						task.delay(value.dur - 0.1, function()
							if not theirstates or not theirstates:FindFirstChild("block") then
								local Res = RiskChecker(targetPlayer, track, value.bb)
								if Res == "RiskyBlock" and not value.multi then
									local random = math.random(1,2)
									if random == 1 then
										local res = DashAway()
										if res == false then
											AutoM1()
										end
									else
										AutoM1()
									end
								elseif Res == "RiskyBlock" and value.multi then
									combatremote:FireServer("blockstart")
									if value.d then
										task.wait(value.d / 1.5)
									end
									combatremote:FireServer("blockend")
									if theirstates and theirstates:FindFirstChild("block") then
										local res = DashAway()
										if res == false then
											AutoM1()
										end
									else
										AutoM1()
									end
									--DashAway()
								else
									if ourcds:FindFirstChild("blockstart") and not ourstates:FindFirstChild("block") then
										AutoM1()
									elseif ourcds:FindFirstChild("NormalAttack") and ourcds:FindFirstChild("blockstart") then
										DashAway()
									else
										combatremote:FireServer("blockstart")
										if value.d then
											task.wait(value.d)
										else
											task.wait(0.4)
										end
										combatremote:FireServer("blockend")
										if theirstates and theirstates:FindFirstChild("block") then
											AutoM2()
										else
											AutoM1()
										end
									end
								end
							end
						end)
						break
					end
				end
			end
		end)
	end

	local function Dodge4(targetPlayer, track)

		if IsAutoBlocking == false then return end

		local targetChar = targetPlayer.Character
		local myChar = game.Players.LocalPlayer.Character
		if not targetChar or not myChar then return end

		local hrp = targetChar:FindFirstChild("HumanoidRootPart")
		local myhrp = myChar:FindFirstChild("HumanoidRootPart")
		if not hrp or not myhrp then return end

		if (hrp.Position - myhrp.Position).Magnitude > 200 then return end

		myChar:PivotTo(hrp.CFrame * CFrame.new(-15,0,5))

		if track then
			track.Stopped:Once(function()

				local newTargetChar = targetPlayer.Character
				local newHRP = newTargetChar and newTargetChar:FindFirstChild("HumanoidRootPart")

				if newHRP and myChar then
					myChar:PivotTo(newHRP.CFrame * CFrame.new(0,0,-3))
				end

			end)
		end
	end

	local animationTriggers = {
		["rbxassetid://128005402860390"] = function(targetPlayer)
			print("Jump animation detected from", targetPlayer.Name)

			local char = targetPlayer.Character
			if not char then return end

			local highlight = Instance.new("Highlight")
			highlight.FillColor = Color3.fromRGB(255, 0, 0)
			highlight.Parent = char

			task.wait(2)
			highlight:Destroy()
		end,

		[AnimsTableSet.beastswordm1s.id1] = AutoBlock,
		[AnimsTableSet.beastswordm1s.id2] = AutoBlock,
		[AnimsTableSet.beastswordm1s.id3] = AutoBlock,
		[AnimsTableSet.beastswordm1s.id4] = AutoBlock,
		[AnimsTableSet.beastswordm1s.id5] = AutoBlock,
		[AnimsTableSet.normswordm1s.id1] = AutoBlock,
		[AnimsTableSet.normswordm1s.id2] = AutoBlock,
		[AnimsTableSet.normswordm1s.id3] = AutoBlock,
		[AnimsTableSet.normswordm1s.id4] = AutoBlock,
		[AnimsTableSet.normswordm1s.id5] = AutoBlock,
		[AnimsTableSet.normfistm1s.id1] = AutoBlock,
		[AnimsTableSet.normfistm1s.id2] = AutoBlock,
		[AnimsTableSet.normfistm1s.id3] = AutoBlock,
		[AnimsTableSet.normfistm1s.id4] = AutoBlock,
		[AnimsTableSet.normfistm1s.id5] = AutoBlock,
		[AnimsTableSet.normfistm1s.id6] = AutoBlock,
		[AnimsTableSet.blocks.fistblock] = ProtectGBS,
		[AnimsTableSet.blocks.swordblock] = ProtectGBS,

		[AnimsTableSet.DemonPunch.id] = AutoBlock,
		[AnimsTableSet.LeapKick.id] = AutoPB,
		[AnimsTableSet.DemonBlade.id] = AutoPB,

		--rivosfsm1
		["rbxassetid://81538235954358"] = nil,

		["rbxassetid://92509099075919"] = nil,--rivofireblast
		[AnimsTableSet.LovePang.id] = AutoPB,
		[AnimsTableSet.CatLeggedWinds.id] = AutoBlock,
		[AnimsTableSet.CatLoveShower.id] = AutoBlock,
		[AnimsTableSet.ShiversOfFirstLove.id] = AutoBlock,
		[AnimsTableSet.Waterdashlong.id] = AutoBlock,
		[AnimsTableSet.WaterfallJar.id] = AutoBlock,
		--GroundSpike
		["rbxassetid://13988506187"] = nil,
		[AnimsTableSet.bodyspike.id] = AutoPB,
		--SpikeSlash
		[AnimsTableSet.spikeslash.id] = AutoBlock,
		--FlyingBloodSickles
		["rbxassetid://13987191385"] = nil,
		[AnimsTableSet.RampantArc.id] = AutoPB,
		--RotatingSlashesOSns
		["rbxassetid://13987199303"] = nil,
		[AnimsTableSet.CuttingThread.id] = AutoBlock,
		--DumbTamayoKnockMove
		["rbxassetid://13989614620"] = nil,
		[AnimsTableSet.FleshSeeds.id] = AutoPB,
		[AnimsTableSet.StrongKickNez.id] = AutoBlock,
		--BloodMine
		["rbxassetid://13988114619"] = nil,
		[AnimsTableSet.FlingingArrow.id] = AutoBlock,
		[AnimsTableSet.BarrenHanging.id] = AutoBlock,
		[AnimsTableSet.FreezingClouds.id] = AutoPB,
		[AnimsTableSet.HantenguSpears.id] = AutoBlock,
		--SonicScream
		["rbxassetid://13989333281"] = nil,
		[AnimsTableSet.ThousandNeedle.id] = AutoBlock,
		[AnimsTableSet.TenThousand.id] = AutoBlock,
		[AnimsTableSet.WaterPot.id] = AutoBlock,
		[AnimsTableSet.BlueSilverAfterGlow.id] = AutoBlock,
		[AnimsTableSet.DestructionStyle.id] = AutoPB,
		[AnimsTableSet.VoidStyle.id] = AutoBlock,
		--BallThrow
		["rbxassetid://13988238363"] = nil,
		--BallKick
		["rbxassetid://13987391354"] = nil,
		--BallBarrage
		["rbxassetid://13988243685"] = nil,
		--Daki1
		["rbxassetid://13987852579"] = nil,
		--Daki1
		["rbxassetid://13987905193"] = nil,
		--Daki1
		["rbxassetid://13987898088"] = nil,
		--Daki1
		["rbxassetid://15780361276"] = nil,
		[AnimsTableSet.UnknowingFire.id] = AutoPB,
		[AnimsTableSet.UNdolation.id] = AutoBlock,
		[AnimsTableSet.Rengoku.id] = AutoBlock,
		[AnimsTableSet.FlameTiger.id] = AutoBlock,
		[AnimsTableSet.ThunderClap.id] = AutoPB,
		[AnimsTableSet.LightningBall.id] = AutoBlock,
		[AnimsTableSet.LunarShine.id] = AutoBlock,
		--[AnimsTableSet.MoonbowHalfMoonTheHighOne.id] = AutoBlock,
		[AnimsTableSet.MoonHeavenJunk.id] = AutoBlock,
		[AnimsTableSet.moondragonringtail.id] = AutoPB,
		[AnimsTableSet.watersurfaceslash.id] = AutoPB,
		[AnimsTableSet.WidningSerpentSlash.id] = AutoPB,
		[AnimsTableSet.VenomFangs.id] = AutoBlock,
		[AnimsTableSet.ZigZag.id] = AutoBlock,
		[AnimsTableSet.Frolic.id] = AutoBlock,
		[AnimsTableSet.MereFluttering.id] = AutoBlock,
		[AnimsTableSet.RagingSunSpin.id] = AutoPB,
		[AnimsTableSet.SunThrow.id] = AutoBlock,
		[AnimsTableSet.SunDash.id] = AutoPB,
		[AnimsTableSet.SolarHeatHaze.id] = AutoBlock,
		[AnimsTableSet.Roar.id] = AutoPB,
		[AnimsTableSet.Roar2.id] = AutoPB,
		[AnimsTableSet.ConstantResounding.id] = AutoBlock,
		[AnimsTableSet.RockSkin.id] = AutoBlock,
		[AnimsTableSet.UpperSmash.id] = AutoBlock,
		[AnimsTableSet.HonoreableShadowPlum.id] = AutoBlock,
		[AnimsTableSet.Peonies.id] = AutoPB,
		[AnimsTableSet.MadCleave.id] = AutoBlock,
		[AnimsTableSet.CircularFangs.id] = AutoBlock,
		[AnimsTableSet.PierceExtract.id] = AutoPB,
		[AnimsTableSet.RipDevour.id] = AutoPB,
		--Gale Wind
		["rbxassetid://13988533435"] = nil,
		[AnimsTableSet.CleanStorm.id] = AutoPB,
		[AnimsTableSet.WhrilingPeach.id] = AutoPB,
		--Moonlit
		["rbxassetid://13988268938"] = nil,
		[AnimsTableSet.Haze.id] = AutoBlock,

		[AnimsTableSet.m2swordhigh.id] = AutoPB,
		[AnimsTableSet.m2swordlower.id] = AutoPB,
		[AnimsTableSet.m2high.id] = AutoPB,
		[AnimsTableSet.m2slap.id] = AutoPB,
		[AnimsTableSet.m2beastswordhigh.id] = AutoPB,
		[AnimsTableSet.m2beastswordlow.id] = AutoPB,

		["rbxassetid://507777826"] = function(targetPlayer)
			print("Running animation detected from", targetPlayer.Name)
		end
	}

	local function ShowInfo(Value)
		for i, plr in ipairs(Players:GetChildren()) do
			local theirstates = plr.states
			local CharStats = plr.CharStats
			local Data = plr:FindFirstChild("Data")
			local TargChar = plr.Character
			local TargHum = TargChar:FindFirstChild("Humanoid")
			if TargHum then
				local Race = CharStats.Race.Value
				local Level
				if Data then
					Level = Data.Level.Value
				end
				if Value == true then
					for i, v in pairs(TargChar:GetChildren()) do
						if v.Name == "InfoHighlight" then
							v:Destroy()
						end
					end
					local InfoHighlight = Instance.new("Highlight")
					InfoHighlight.Name = "InfoHighlight"
					if Race == "Human" then
						InfoHighlight.FillColor = Color3.fromRGB(71, 200, 255)
					elseif Race == "Demon" then
						InfoHighlight.FillColor = Color3.fromRGB(149, 0, 0)
					elseif Race == "Hybrid" then
						InfoHighlight.FillColor = Color3.fromRGB(176, 39, 255)
					end
					InfoHighlight.Parent = TargChar
					InfoHighlight.FillTransparency = 0.75
					TargHum.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOn
					if Data then
						TargHum.DisplayName = plr.Name .. " / ".. Race .. " / " .. tostring(Level)
					else
						TargHum.DisplayName = plr.Name .. " / ".. Race
					end
				else
					local InfoHighlight = TargChar:FindFirstChild("InfoHighlight")
					if InfoHighlight then
						InfoHighlight:Destroy()
					end
					TargHum.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
					TargHum.DisplayName = plr.Name
				end
			end
		end
	end

	local InfoButton = createButton("GeneralInfo", SectionThirdFrame)
	local GeneralInfoOn = false
	InfoButton.MouseButton1Click:Connect(function()
		if GeneralInfoOn == false then
			GeneralInfoOn = true
			InfoButton.Text = "GeneralInfo: On"
			ShowInfo(true)
		else
			GeneralInfoOn = false
			InfoButton.Text = "GeneralInfo: Off"
			ShowInfo(false)
		end
	end)

	local flying = false
	local ContinusFlying = false
	local flySpeed = 300

	local Flierbutton3 = createButton("Fly", SectionThirdFrame)

	local function flyu()
		if flying == true then return end

		ContinusFlying = not ContinusFlying

		if ContinusFlying then
			Flierbutton3.Text = "Flying: Active"
		else
			Flierbutton3.Text = "Flying: Inactive"
		end

		if not Michar then return end
		local hrp = Michar:FindFirstChild("HumanoidRootPart")
		if not hrp then return end

		if ContinusFlying then

			task.spawn(function()

				while ContinusFlying and hrp.Parent do

					local bv = Instance.new("BodyVelocity")
					bv.Name = "gggg"
					bv.MaxForce = Vector3.new(100000,100000,100000)
					bv.Velocity = Vector3.zero
					bv.Parent = hrp

					local bg = Instance.new("BodyGyro")
					bg.Name = "gggg"
					bg.MaxTorque = Vector3.new(100000,100000,100000)
					bg.CFrame = hrp.CFrame
					bg.Parent = hrp

					local cam = workspace.CurrentCamera

					local startTime = tick()

					while ContinusFlying and tick() - startTime < 7 and hrp.Parent do

						local move = Vector3.zero

						if UIS:IsKeyDown(Enum.KeyCode.W) then
							move += cam.CFrame.LookVector
						end

						if UIS:IsKeyDown(Enum.KeyCode.S) then
							move -= cam.CFrame.LookVector
						end

						if UIS:IsKeyDown(Enum.KeyCode.A) then
							move -= cam.CFrame.RightVector
						end

						if UIS:IsKeyDown(Enum.KeyCode.D) then
							move += cam.CFrame.RightVector
						end

						bv.Velocity = move * 200
						bg.CFrame = cam.CFrame

						task.wait()
					end

					bv:Destroy()
					bg:Destroy()

				end

			end)

		end
	end

	Flierbutton3.MouseButton1Click:Connect(function()
		flyu()
	end)
	-- Update tracked players display
	local function updateTrackedDisplay()

		local names = {}

		for plr,_ in pairs(trackedPlayers) do
			print(plr)
			table.insert(names, plr.Name)
		end

		if #names == 0 then
			trackedLabel.Text = "Tracking: None"
			trackedLabel2.Text = "Tracking: None"
		else
			trackedLabel.Text = "Tracking: "..table.concat(names,", ")
			trackedLabel2.Text = "Tracking: "..table.concat(names,", ")
		end

	end

	-- Start tracking a player
	local function watchPlayerAnimations(targetPlayer)
		if trackedPlayers[targetPlayer] then
			return
		end

		local data = {}

		local function hookCharacter(character)
			-- Disconnect previous animation connection (if they respawn)
			if data.targetAnimConnection then
				data.targetAnimConnection:Disconnect()
				data.targetAnimConnection = nil
			end

			local humanoid = character:WaitForChild("Humanoid")

			data.targetAnimConnection = humanoid.AnimationPlayed:Connect(function(track)
				if gui.Parent == nil then return end
				if not targetPlayer or not targetPlayer.Parent then return end
				if not (Detecting or detectingtwo) then return end

				local anim = track.Animation
				if not anim then return end

				local id = anim.AnimationId

				if id == "rbxassetid://15215952540" then return end
				if id == "rbxassetid://15215921487" then return end
				if id == "rbxassetid://13989102174" then return end
				if id == "rbxassetid://13989317090" then return end
				if id == "rbxassetid://13987893395" then return end
				if id == "rbxassetid://13989696751" then return end
				if id == "rbxassetid://13989690978" then return end
				if id == "rbxassetid://13989415110" then return end

				if not animationTriggers[id] then
					print("Animation from", targetPlayer.Name, ":", id)
				end

				if animationTriggers[id] then
					animationTriggers[id](targetPlayer, track)
				end
			end)

			targhrp = character:WaitForChild("HumanoidRootPart")
		end

		if targetPlayer.Character then
			hookCharacter(targetPlayer.Character)
		end

		data.charConnection = targetPlayer.CharacterAdded:Connect(hookCharacter)

		trackedPlayers[targetPlayer] = data

		updateTrackedDisplay()
	end


	-- Stop tracking one player
	local function stopTrackingPlayer(plr)
		local data = trackedPlayers[plr]
		if not data then
			return
		end

		if data.targetAnimConnection then
			data.targetAnimConnection:Disconnect()
			data.targetAnimConnection = nil
		end

		if data.charConnection then
			data.charConnection:Disconnect()
			data.charConnection = nil
		end
		if data.NpctargetAnimConnection then
			data.NpctargetAnimConnection:Disconnect()
			data.NpctargetAnimConnection = nil
		end
		trackedPlayers[plr] = nil

		--print("Stopped tracking:", plr.Name)

		updateTrackedDisplay()
	end

	local function watchNpcnimations(targetNpc)
		if trackedPlayers[targetNpc] then
			return
		end

		local data = {}

		local function hookCharacter(character)
			-- Disconnect previous animation connection (if they respawn)
			if data.NpctargetAnimConnection then
				data.NpctargetAnimConnection:Disconnect()
				data.NpctargetAnimConnection = nil
			end

			local humanoid = character:WaitForChild("Humanoid")

			data.NpctargetAnimConnection = humanoid.AnimationPlayed:Connect(function(track)
				if gui.Parent == nil then return end
				if not targetNpc or not targetNpc.Parent then
					trackedPlayers[targetNpc] = nil
					return
				end
				if not (Detecting or detectingtwo) then return end

				local anim = track.Animation
				if not anim then return end

				local id = anim.AnimationId

				if id == "rbxassetid://15215952540" then return end
				if id == "rbxassetid://15215921487" then return end
				if id == "rbxassetid://13989102174" then return end
				if id == "rbxassetid://13989317090" then return end
				if id == "rbxassetid://13987893395" then return end
				if id == "rbxassetid://13989696751" then return end
				if id == "rbxassetid://13989690978" then return end
				if id == "rbxassetid://13989415110" then return end

				if not animationTriggers[id] then
					print("Animation from", targetNpc.Name, ":", id)
				end

				if animationTriggers[id] then
					animationTriggers[id](targetNpc, track)
				end
			end)

			targhrp = character:WaitForChild("HumanoidRootPart")
		end

		hookCharacter(targetNpc)

		trackedPlayers[targetNpc] = data

		updateTrackedDisplay()
	end
	-- Clear all tracked players
	local function clearTrackedPlayers()
		for plr, data in pairs(trackedPlayers) do
			if data.targetAnimConnection then
				data.targetAnimConnection:Disconnect()
				data.targetAnimConnection = nil
			end

			if data.charConnection then
				data.charConnection:Disconnect()
				data.charConnection = nil
			end

			if data.NpctargetAnimConnection then
				data.NpctargetAnimConnection:Disconnect()
				data.NpctargetAnimConnection = nil
			end
		end
		TARGPLR = nil
		EnemyToFocusOn = nil

		table.clear(trackedPlayers)

		--print("Cleared all tracked players")

		updateTrackedDisplay()
	end

	local guis = game.Players.LocalPlayer.PlayerGui.guis
	local healthbar = guis.BottomFrame.Health.f
	local Level = guis.BottomFrame.Exp.Level
	Level.LevelText.Text = "Winner"
	healthbar.ImageTransparency = 1
	healthbar.BackgroundColor3 = Color3.fromRGB(70, 149, 206)
	--RunService.Heartbeat:Connect(function()
	task.spawn(function()
		healthbar:getPropertyChangedSignal("BackgroundTransparency"):Connect(function()
			if gui.Parent ~= nil then
				healthbar.BackgroundColor3 = Color3.fromRGB(70, 149, 206)
			end
		end)
	end)
	--end)
	-- Player buttons
	local function createPlayerButton(plr)
		local display = plr.DisplayName
		local button = Instance.new("TextButton")
		button.Size = UDim2.new(1,-10,0,30)
		button.Text = plr.Name .. " / ".. display
		button.Parent = playerList
		button.Name = plr.Name
		button.MouseButton1Click:Connect(function()
			if trackedPlayers[plr] then
				stopTrackingPlayer(plr)
				EnemyToFocusOn = nil
			else
				local CheckIFPlayer = Players:FindFirstChild(plr.Name)
				if CheckIFPlayer then
					TARGPLR = plr.Character
					EnemyToFocusOn = plr
					--print("Monitoring animations for", plr.Name)
					watchPlayerAnimations(plr)
				else
					TARGPLR = plr
					EnemyToFocusOn = plr
					--print("Monitoring animations for", plr.Name)
					watchNpcnimations(plr)
				end
			end

		end)
		local button2 = Instance.new("TextButton")
		button2.Size = UDim2.new(1,-10,0,30)
		button2.Text = plr.Name .. " / ".. display
		button2.Parent = playerListOustide
		button2.Name = plr.Name
		button2.MouseButton1Click:Connect(function()
			if trackedPlayers[plr] then
				stopTrackingPlayer(plr)
				EnemyToFocusOn = nil
			else
				local CheckIFPlayer = Players:FindFirstChild(plr.Name)
				if CheckIFPlayer then
					TARGPLR = plr.Character
					EnemyToFocusOn = plr
					--print("Monitoring animations for", plr.Name)
					watchPlayerAnimations(plr)
				else
					TARGPLR = plr
					EnemyToFocusOn = plr
					--print("Monitoring animations for", plr.Name)
					watchNpcnimations(plr)
				end
			end

		end)
	end

	local localAnimConnection

	for i, v in ipairs(Players[Players.LocalPlayer.Name].cds:GetChildren()) do
		if v.Name == "HeavyAlert" then
			v:Destroy()
		end
	end

	local function hookLocalPlayer()
		local character = Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()
		local humanoid = character:WaitForChild("Humanoid")

		if localAnimConnection then
			localAnimConnection:Disconnect()
		end

		localAnimConnection = humanoid.AnimationPlayed:Connect(function(track)
			if gui.Parent == nil then
				return
			end
			local anim = track.Animation
			if anim then
				curranimplaying = anim.AnimationId
				for key, value in pairs(AnimsTableSet) do
					if key and value.id and value.id == anim.AnimationId then
						if value.M2 then
							local HeavyAlertValue = Instance.new("StringValue")
							HeavyAlertValue.Name = "HeavyAlert"
							HeavyAlertValue.Parent = Players[Players.LocalPlayer.Name].cds
							game.Debris:AddItem(HeavyAlertValue, track.Length + 0.2)
							--heavytext.Text = "Playing ".. key .. " Heavy"
							--heavytext.Visible = true
							--task.wait(5)
							--heavytext.Visible = false
						end
					end
				end
			end
		end)
	end

	hookLocalPlayer()
	Players.LocalPlayer.CharacterAdded:Connect(function(chara)
		hookLocalPlayer(chara)
		if GeneralInfoOn == true then
			ShowInfo(true)
		end
	end)
	-- Populate player list
	for _,plr in pairs(Players:GetPlayers()) do
		createPlayerButton(plr)
	end
	local npcfolder = workspace.npc
	local CombatNpcs = npcfolder.npcs
	local TargetAbleNpcs = {
		"Flame Apprentice",

	}

	local SelectButton = createButton("SelectThem", SectionThirdFrame)
	SelectButton.MouseButton1Click:Connect(function()
		if player.Character then
			local SelectTool = player.Character:FindFirstChild("SelectTool") or player.Backpack:FindFirstChild("SelectTool")
			if SelectTool then
				--SelectTool:Destroy()
			end
			local ClearTool = player.Character:FindFirstChild("ClearTool") or player.Backpack:FindFirstChild("ClearTool")
			if ClearTool then
				--ClearTool:Destroy()
			end
			SelectTool = Instance.new("Tool")
			SelectTool.Name = "SelectTool"
			SelectTool.RequiresHandle = false
			SelectTool.Parent = player.Backpack
			local selectedPlayer
			local clickConnection

			SelectTool.Equipped:Connect(function(mouse)

				clickConnection = mouse.Button1Down:Connect(function()
					local target = mouse.Target
					if not target then return end

					local character = target:FindFirstAncestorOfClass("Model")
					local clickedPlayer = character and Players:GetPlayerFromCharacter(character)
					if clickedPlayer and clickedPlayer ~= player then
						selectedPlayer = clickedPlayer
						print("Selected:", selectedPlayer.Name)
						print("boom")
						if trackedPlayers[selectedPlayer] then
							stopTrackingPlayer(selectedPlayer)
							EnemyToFocusOn = nil
						else
							local CheckIFPlayer = Players:FindFirstChild(selectedPlayer.Name)
							if CheckIFPlayer then
								TARGPLR = selectedPlayer.Character
								EnemyToFocusOn = selectedPlayer
								--print("Monitoring animations for", plr.Name)
								watchPlayerAnimations(selectedPlayer)
							else
								TARGPLR = selectedPlayer
								EnemyToFocusOn = selectedPlayer
								--print("Monitoring animations for", plr.Name)
								watchNpcnimations(selectedPlayer)
							end
						end
					elseif character and character:FindFirstChild("Humanoid") then

						if trackedPlayers[character] then
							print("No longer Monitoring animations for", character.Name)
							stopTrackingPlayer(character)
							EnemyToFocusOn = nil
						else
							TARGPLR = character
							EnemyToFocusOn = character
							print("Monitoring animations for", character.Name)
							watchNpcnimations(character)
							character.Destroying:Once(function()
								if trackedPlayers[character] then
									print("No longer Monitoring animations for", character.Name)
									stopTrackingPlayer(character)
									EnemyToFocusOn = nil
								end
							end)
						end
					end
				end)

			end)

			SelectTool.Unequipped:Connect(function()
				if clickConnection then
					clickConnection:Disconnect()
					clickConnection = nil
				end

				selectedPlayer = nil
			end)
			ClearTool = Instance.new("Tool")
			ClearTool.Name = "ClearTool"
			ClearTool.RequiresHandle = false
			ClearTool.Parent = player.Backpack
			ClearTool.Activated:Connect(function()
				clearTrackedPlayers()
			end)
		end
	end)

	local OnlyM1sNpc = createButton("OnlyM1sNpc", SectionThirdFrame)
	OnlyM1sNpc.MouseButton1Click:Connect(function()
		if OnlyUseM1sBtt == false then
			OnlyUseM1sBtt = true
			OnlyM1sNpc.Text = "AutoFightNpcs: On"
		else
			OnlyUseM1sBtt = false
			OnlyM1sNpc.Text = "AutoFightNpcs: Off"
		end
	end)
	
	local CanClimbButton = createButton("CanClimb", SectionThirdFrame)
		CanClimbButton.MouseButton1Click:Connect(function()
			if CanClimb == false then
				CanClimb = true
				CanClimbButton.Text = "CanClimb: On"
		else
				CanClimb = false
				CanClimbButton.Text = "CanClimb: Off"
		end
		end)

	local WasClimbing = false
	local TopTriggered = false

	local function IsCharacterPart(instance)
		if not instance then
			return false
		end

		local model = instance:FindFirstAncestorOfClass("Model")

		if model and model:FindFirstChildOfClass("Humanoid") then
			return true
		end

		return false
	end

	task.spawn(function()
		while true do
			task.wait(0.5)

			if CanClimb then
				local Character = player.Character
				local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
				local RootPart = Character and Character:FindFirstChild("HumanoidRootPart")

				if Humanoid and RootPart and gui.Parent ~= nil then

					local RayParams = RaycastParams.new()
					RayParams.FilterType = Enum.RaycastFilterType.Exclude
					RayParams.FilterDescendantsInstances = {Character}

					-- Wall directly in front of the player's body
					local WallResult = workspace:Raycast(
						RootPart.Position,
						RootPart.CFrame.LookVector * 3,
						RayParams
					)

					-- Only treat it as a wall if it isn't part of a character
					if WallResult
						and WallResult.Normal.Y < 0.5
						and not IsCharacterPart(WallResult.Instance)
					then
						WasClimbing = true
						TopTriggered = false

						-- Push upward
						RootPart.AssemblyLinearVelocity = Vector3.new(
							RootPart.AssemblyLinearVelocity.X,
							86,
							RootPart.AssemblyLinearVelocity.Z
						)

						Humanoid.Jump = true

						local Animation = Humanoid.Animator:LoadAnimation(
							player.PlayerGui.WallJumps.WallJumpTopAnim
						)

						Animation:Play()
					end

					-- Only check for the ledge if we're actually climbing
					if WasClimbing and not TopTriggered then

						-- Check from above the player's head
						local HeadOrigin =
							RootPart.Position + Vector3.new(0, 3, 0)

						local HeadWall = workspace:Raycast(
							HeadOrigin,
							RootPart.CFrame.LookVector * 3,
							RayParams
						)

						-- Check for a surface in front of the player
						local TopOrigin =
							RootPart.Position
							+ RootPart.CFrame.LookVector * 2
							+ Vector3.new(0, 2, 0)

						local TopSurface = workspace:Raycast(
							TopOrigin,
							Vector3.new(0, -5, 0),
							RayParams
						)

						-- Make sure the detected objects aren't character parts
						local HeadIsCharacterPart =
							HeadWall and IsCharacterPart(HeadWall.Instance)

						local TopIsCharacterPart =
							TopSurface and IsCharacterPart(TopSurface.Instance)

						-- Head cleared the wall AND there's a real surface
						if not HeadWall
							and TopSurface
							and not TopIsCharacterPart
						then
							TopTriggered = true
							WasClimbing = false

							DashAwayForward()
						end
					end
				end
			else
				WasClimbing = false
				TopTriggered = false
			end
		end
	end)
	local TargetAnyoneNearbyButton = createButton("TargetAnyoneNearby", SectionThirdFrame)
	TargetAnyoneNearbyButton.MouseButton1Click:Connect(function()
		if TargetAnyoneNearby == false then
			TargetAnyoneNearby = true
			TargetAnyoneNearbyButton.Text = "TargetAnyoneNearby: On"
		else
			TargetAnyoneNearby = false
			TargetAnyoneNearbyButton.Text = "TargetAnyoneNearby: Off"
		end
	end)
	local blockedUsers = {
		"benjialt",
		"benjiboy",
		"lostto"
	}

	local function isBlockedUser(playerName)
		playerName = playerName:lower()

		for _, blockedName in ipairs(blockedUsers) do
			if playerName:find(blockedName, 1, true) then
				return true
			end
		end

		return false
	end

	task.spawn(function()

		while true do
			task.wait(0.05)
			clearTrackedPlayers()
			if TargetAnyoneNearby == true then
				local Character = player.Character
				local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
				local RootPart = Character and Character:FindFirstChild("HumanoidRootPart")

				if Humanoid and RootPart and gui.Parent ~= nil and FightingForYou == true then
					local ourstates = player:FindFirstChild("states")

					if ourstates and ourstates:FindFirstChild("CT") then
						local NearestTarget = nil
						local NearestDistance = 100

						for _, otherPlayer in pairs(Players:GetPlayers()) do
							if otherPlayer ~= player then

								-- Don't target blocked players
								if isBlockedUser(otherPlayer.Name) then
									continue
								end

								local otherCharacter = otherPlayer.Character
								local otherHumanoid = otherCharacter
									and otherCharacter:FindFirstChildOfClass("Humanoid")

								local otherRootPart = otherCharacter
									and otherCharacter:FindFirstChild("HumanoidRootPart")

								local otherStates = otherPlayer:FindFirstChild("states")

								if otherHumanoid and otherRootPart and otherStates then
									local distance =
										(RootPart.Position - otherRootPart.Position).Magnitude

									if distance < NearestDistance then
										NearestTarget = otherPlayer
										NearestDistance = distance
									end
								end
							end
						end

						if NearestTarget and NearestDistance <= 1000 then
							local CheckIFThisPlayer =
								Players:GetPlayerFromCharacter(NearestTarget)

							if not CheckIFThisPlayer then
								TARGPLR = NearestTarget
								EnemyToFocusOn = NearestTarget
								watchNpcnimations(NearestTarget)
							else
								TARGPLR = NearestTarget.Character
								EnemyToFocusOn = NearestTarget
								watchPlayerAnimations(NearestTarget)
							end
						else
							clearTrackedPlayers()
						end
					end
				end
			end
		end
	end)

	Players.PlayerAdded:Connect(createPlayerButton)
	Players.PlayerRemoving:Connect(function(plr)

		if trackedPlayers[plr] then
			stopTrackingPlayer(plr)
		end
		local targbutton = playerList:FindFirstChild(plr.Name)
		if targbutton then
			targbutton:Destroy()
		end
		local targbutton2 = playerListOustide:FindFirstChild(plr.Name)
		if targbutton2 then
			targbutton2:Destroy()
		end
	end)

	-- Clear tracking button

	clearButton.MouseButton1Click:Connect(function()
		clearTrackedPlayers()
	end)

	local dragging
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		frame.Position = UDim2.new(startPos.X.Scale,startPos.X.Offset + delta.X,startPos.Y.Scale,startPos.Y.Offset + delta.Y)
	end

	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = frame.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			update(input)
		end
	end)
else
	-- Player buttons
	local function createPlayerButton(plr)
		local display = plr.DisplayName
		local button = Instance.new("TextButton")
		button.Size = UDim2.new(1,-10,0,30)
		button.Text = plr.Name .. " / ".. display
		button.Parent = playerList
		button.Name = plr.Name
		local button2 = Instance.new("TextButton")
		button2.Size = UDim2.new(1,-10,0,30)
		button2.Text = plr.Name .. " / ".. display
		button2.Parent = playerListOustide
		button2.Name = plr.Name
	end

	local localAnimConnection
	-- Populate player list
	for _,plr in pairs(Players:GetPlayers()) do
		createPlayerButton(plr)
	end

	Players.PlayerAdded:Connect(createPlayerButton)
	Players.PlayerRemoving:Connect(function(plr)

		local targbutton = playerList:FindFirstChild(plr.Name)
		if targbutton then
			targbutton:Destroy()
		end
		local targbutton2 = playerListOustide:FindFirstChild(plr.Name)
		if targbutton2 then
			targbutton2:Destroy()
		end
	end)

	-- Clear tracking button

	local dragging
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		frame.Position = UDim2.new(startPos.X.Scale,startPos.X.Offset + delta.X,startPos.Y.Scale,startPos.Y.Offset + delta.Y)
	end

	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = frame.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			update(input)
		end
	end)
end
