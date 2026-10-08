--- This UI/Loader script is open-source for anyone who wants it :3
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--==================================================
-- CONFIG
--==================================================

local TITLE = "SaveExplorer"

--==================================================
-- SCREEN GUI
--==================================================

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SaveExplorerLoader"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = playerGui

--==================================================
-- SHADOW
--==================================================

local Shadow = Instance.new("Frame")
Shadow.Name = "Shadow"
Shadow.Size = UDim2.fromOffset(390, 138)
Shadow.Position = UDim2.fromScale(0.5, 0.5)
Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
Shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Shadow.BackgroundTransparency = 0.55
Shadow.BorderSizePixel = 0
Shadow.ZIndex = 1
Shadow.Parent = ScreenGui

local ShadowCorner = Instance.new("UICorner")
ShadowCorner.CornerRadius = UDim.new(0, 18)
ShadowCorner.Parent = Shadow

--==================================================
-- MAIN CARD
--==================================================

local Card = Instance.new("Frame")
Card.Name = "Card"
Card.Size = UDim2.fromOffset(370, 118)
Card.Position = UDim2.fromScale(0.5, 0.5)
Card.AnchorPoint = Vector2.new(0.5, 0.5)
Card.BackgroundColor3 = Color3.fromRGB(15, 17, 23)
Card.BorderSizePixel = 0
Card.ZIndex = 2
Card.Parent = ScreenGui

local CardCorner = Instance.new("UICorner")
CardCorner.CornerRadius = UDim.new(0, 16)
CardCorner.Parent = Card

local CardStroke = Instance.new("UIStroke")
CardStroke.Color = Color3.fromRGB(55, 59, 72)
CardStroke.Thickness = 1
CardStroke.Transparency = 0.2
CardStroke.Parent = Card

--==================================================
-- TOP LIGHT
--==================================================

local TopGlow = Instance.new("Frame")
TopGlow.Name = "TopGlow"
TopGlow.Size = UDim2.new(1, -30, 0, 2)
TopGlow.Position = UDim2.fromOffset(15, 0)
TopGlow.BackgroundColor3 = Color3.fromRGB(110, 120, 255)
TopGlow.BorderSizePixel = 0
TopGlow.ZIndex = 3
TopGlow.Parent = Card

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(1, 0)
TopCorner.Parent = TopGlow

local TopGradient = Instance.new("UIGradient")
TopGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(90, 100, 255)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(150, 90, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(90, 100, 255))
})
TopGradient.Parent = TopGlow

--==================================================
-- ICON
--==================================================

local Icon = Instance.new("Frame")
Icon.Name = "Icon"
Icon.Size = UDim2.fromOffset(42, 42)
Icon.Position = UDim2.fromOffset(18, 20)
Icon.BackgroundColor3 = Color3.fromRGB(27, 29, 39)
Icon.BorderSizePixel = 0
Icon.ZIndex = 4
Icon.Parent = Card

local IconCorner = Instance.new("UICorner")
IconCorner.CornerRadius = UDim.new(0, 12)
IconCorner.Parent = Icon

local IconStroke = Instance.new("UIStroke")
IconStroke.Color = Color3.fromRGB(76, 82, 110)
IconStroke.Transparency = 0.25
IconStroke.Parent = Icon

local IconText = Instance.new("TextLabel")
IconText.Size = UDim2.fromScale(1, 1)
IconText.BackgroundTransparency = 1
IconText.Text = "S"
IconText.TextColor3 = Color3.fromRGB(165, 170, 255)
IconText.TextSize = 22
IconText.Font = Enum.Font.GothamBold
IconText.ZIndex = 5
IconText.Parent = Icon

--==================================================
-- TITLE
--==================================================

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -85, 0, 25)
Title.Position = UDim2.fromOffset(72, 17)
Title.BackgroundTransparency = 1
Title.Text = TITLE
Title.TextColor3 = Color3.fromRGB(245, 246, 250)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 4
Title.Parent = Card

--==================================================
-- STATUS
--==================================================

local Status = Instance.new("TextLabel")
Status.Name = "Status"
Status.Size = UDim2.new(1, -85, 0, 20)
Status.Position = UDim2.fromOffset(72, 41)
Status.BackgroundTransparency = 1
Status.Text = "Initializing..."
Status.TextColor3 = Color3.fromRGB(145, 149, 160)
Status.TextSize = 12
Status.Font = Enum.Font.Gotham
Status.TextXAlignment = Enum.TextXAlignment.Left
Status.ZIndex = 4
Status.Parent = Card

--==================================================
-- PERCENTAGE
--==================================================

local Percentage = Instance.new("TextLabel")
Percentage.Name = "Percentage"
Percentage.Size = UDim2.fromOffset(45, 20)
Percentage.Position = UDim2.new(1, -60, 0, 40)
Percentage.BackgroundTransparency = 1
Percentage.Text = "0%"
Percentage.TextColor3 = Color3.fromRGB(175, 178, 194)
Percentage.TextSize = 11
Percentage.Font = Enum.Font.GothamMedium
Percentage.TextXAlignment = Enum.TextXAlignment.Right
Percentage.ZIndex = 4
Percentage.Parent = Card

--==================================================
-- PROGRESS BACKGROUND
--==================================================

local ProgressBackground = Instance.new("Frame")
ProgressBackground.Name = "ProgressBackground"
ProgressBackground.Size = UDim2.new(1, -36, 0, 5)
ProgressBackground.Position = UDim2.fromOffset(18, 88)
ProgressBackground.BackgroundColor3 = Color3.fromRGB(29, 31, 40)
ProgressBackground.BorderSizePixel = 0
ProgressBackground.ZIndex = 4
ProgressBackground.Parent = Card

local ProgressCorner = Instance.new("UICorner")
ProgressCorner.CornerRadius = UDim.new(1, 0)
ProgressCorner.Parent = ProgressBackground

--==================================================
-- PROGRESS
--==================================================

local Progress = Instance.new("Frame")
Progress.Name = "Progress"
Progress.Size = UDim2.new(0, 0, 1, 0)
Progress.BackgroundColor3 = Color3.fromRGB(110, 120, 255)
Progress.BorderSizePixel = 0
Progress.ZIndex = 5
Progress.Parent = ProgressBackground

local ProgressCorner2 = Instance.new("UICorner")
ProgressCorner2.CornerRadius = UDim.new(1, 0)
ProgressCorner2.Parent = Progress

local ProgressGradient = Instance.new("UIGradient")
ProgressGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(90, 105, 255)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(140, 95, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(180, 110, 255))
})
ProgressGradient.Parent = Progress

--==================================================
-- SMALL STATUS DOT
--==================================================

local Dot = Instance.new("Frame")
Dot.Name = "Dot"
Dot.Size = UDim2.fromOffset(6, 6)
Dot.Position = UDim2.fromOffset(72, 65)
Dot.BackgroundColor3 = Color3.fromRGB(105, 220, 155)
Dot.BorderSizePixel = 0
Dot.ZIndex = 5
Dot.Parent = Card

local DotCorner = Instance.new("UICorner")
DotCorner.CornerRadius = UDim.new(1, 0)
DotCorner.Parent = Dot

--==================================================
-- ANIMATIONS
--==================================================

local originalCardPos = Card.Position
local originalShadowPos = Shadow.Position

Card.Position = UDim2.fromScale(0.5, 0.53)
Card.BackgroundTransparency = 1

Shadow.Position = UDim2.fromScale(0.5, 0.53)
Shadow.BackgroundTransparency = 1

local enterInfo = TweenInfo.new(
	0.55,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.Out
)

TweenService:Create(Card, enterInfo, {
	Position = originalCardPos,
	BackgroundTransparency = 0
}):Play()

TweenService:Create(Shadow, enterInfo, {
	Position = originalShadowPos,
	BackgroundTransparency = 0.55
}):Play()

--==================================================
-- LOADING FUNCTION
--==================================================

local function SetProgress(value, text)
	value = math.clamp(value, 0, 1)

	Status.Text = text
	Percentage.Text = math.floor(value * 100) .. "%"

	TweenService:Create(
		Progress,
		TweenInfo.new(
			0.45,
			Enum.EasingStyle.Quint,
			Enum.EasingDirection.Out
		),
		{
			Size = UDim2.new(value, 0, 1, 0)
		}
	):Play()
end

--==================================================
-- LOADING STEPS
--==================================================

task.wait(0.35)

SetProgress(0.18, "Preparing environment...")
task.wait(0.45)

SetProgress(0.36, "Loading explorer...")
task.wait(0.45)

SetProgress(0.55, "Scanning workspace...")
task.wait(0.45)

SetProgress(0.72, "Preparing save system...")
task.wait(0.45)

SetProgress(0.88, "Almost ready...")
task.wait(0.5)

SetProgress(1, "Ready")

--==================================================
-- SUCCESS ANIMATION
--==================================================

TweenService:Create(
	Icon,
	TweenInfo.new(0.25, Enum.EasingStyle.Quad),
	{
		BackgroundColor3 = Color3.fromRGB(28, 45, 39)
	}
):Play()

TweenService:Create(
	IconText,
	TweenInfo.new(0.25, Enum.EasingStyle.Quad),
	{
		TextColor3 = Color3.fromRGB(115, 235, 170)
	}
):Play()

Dot.BackgroundColor3 = Color3.fromRGB(115, 235, 170)

task.wait(0.55)

--==================================================
-- EXIT
--==================================================

local exitInfo = TweenInfo.new(
	0.4,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.In
)

TweenService:Create(Card, exitInfo, {
	Position = UDim2.fromScale(0.5, 0.53),
	BackgroundTransparency = 1
}):Play()

TweenService:Create(Shadow, exitInfo, {
	Position = UDim2.fromScale(0.5, 0.53),
	BackgroundTransparency = 1
}):Play()

task.wait(0.4)

ScreenGui:Destroy()

--==================================================
-- SAVEEXPLORER START
--==================================================
loadstring(game:HttpGet("https://raw.githubusercontent.com/Arthur508555/SaveExplorer/refs/heads/main/main.lua"))()
print("SaveExplorer initialized! Thank you very much for using our script.")
