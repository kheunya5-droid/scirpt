-- Genesis FE Just A Baseplate GUI Script
-- Place this inside a LocalScript in StarterPlayer -> StarterPlayerScripts or StarterGui

local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

-- Parent ScreenGui safely
local parentContainer = LocalPlayer:FindFirstChildOfClass("PlayerGui") or CoreGui

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GenesisFEGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = parentContainer

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 320, 0, 420)
mainFrame.Position = UDim2.new(0.5, -160, 0.5, -210)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 8)
mainCorner.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Thickness = 2
mainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
mainStroke.Parent = mainFrame

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 8)
titleCorner.Parent = titleBar

local titleText = Instance.new("TextLabel")
titleText.Name = "TitleText"
titleText.Size = UDim2.new(1, -50, 1, 0)
titleText.Position = UDim2.new(0, 10, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "Genesis FE Just A Baseplate"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.TextSize = 16
titleText.Font = Enum.Font.SourceSansBold
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Parent = titleBar

-- Close Button inside TitleBar
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextSize = 16
closeButton.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeButton

-- Open/Close Toggle Button (Floating)
local toggleButton = Instance.new("TextButton")
toggleButton.Name = "GenesisToggle"
toggleButton.Size = UDim2.new(0, 120, 0, 35)
toggleButton.Position = UDim2.new(0, 15, 0.5, -17)
toggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
toggleButton.Text = "Open Genesis"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.TextSize = 14
toggleButton.Active = true
toggleButton.Draggable = true
toggleButton.Parent = screenGui

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 6)
toggleCorner.Parent = toggleButton

local toggleStroke = Instance.new("UIStroke")
toggleStroke.Thickness = 2
toggleStroke.Parent = toggleButton

-- Scrolling Frame for Script Buttons
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Name = "ButtonList"
scrollFrame.Size = UDim2.new(1, -20, 1, -55)
scrollFrame.Position = UDim2.new(0, 10, 0, 45)
scrollFrame.BackgroundTransparency = 1
scrollFrame.BorderSizePixel = 0
scrollFrame.ScrollBarThickness = 6
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollFrame.Parent = mainFrame

local uiListLayout = Instance.new("UIListLayout")
uiListLayout.Parent = scrollFrame
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout.Padding = UDim.new(0, 8)

local uiPadding = Instance.new("UIPadding")
uiPadding.PaddingTop = UDim.new(0, 4)
uiPadding.PaddingBottom = UDim.new(0, 4)
uiPadding.Parent = scrollFrame

-- Automatically adjust CanvasSize based on layout content size
uiListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, uiListLayout.AbsoluteContentSize.Y + 10)
end)

-- Button Data Array
local scriptButtonsData = {
    {
        Name = "Lighting Cannon",
        Script = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/kheunya5-droid/scirpt/refs/heads/kheunya5-droid-patch-1/obfuscated_script-1792196818549.lua"))()'
    },
    {
        Name = "Neko",
        Script = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/kheunya5-droid/scirpt/ce218a4cdc5def6e8b650eb55311b74cebdfba87/gemini-code-1792239657926.lua"))()'
    },
    {
        Name = "Neptunian V",
        Script = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/kheunya5-droid/scirpt/7a903ed8f5cb0ed5bfae074d3558e72a73ca1955/obfuscated_script-1792198362449.lua"))()'
    },
    {
        Name = "Sin Dragon",
        Script = '-- Add Sin Dragon loadstring here'
    },
    {
        Name = "Ban Hammer",
        Script = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/kheunya5-droid/scirpt/3a89bd457dafcf90663423b71e85543211c9e56a/obfuscated_script-1792199356231.lua"))()'
    },
    {
        Name = "Goner",
        Script = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/kheunya5-droid/scirpt/a59bb7f13276b1a9342f5ed36b90d7e8f624de5a/gemini-code-1792240068852.lua"))()'
    },
    {
        Name = "Motorcycle",
        Script = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/kheunya5-droid/scirpt/fa50c1fbb4d069b07fc86e9c6cb53afd9a2009b9/obfuscated_script-1792236527141.lua"))()'
    },
    {
        Name = "Good Cop Bad Cop",
        Script = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/kheunya5-droid/scirpt/75c04a446624d29503d5cb12f284443d17fba280/obfuscated_script-1792236924733.lua"))()'
    }
}

-- List to store elements that should cycle rainbow colors
local rainbowElements = {
    mainStroke,
    toggleStroke
}

-- Generate Action Buttons
for index, data in ipairs(scriptButtonsData) do
    local btn = Instance.new("TextButton")
    btn.Name = "Button_" .. data.Name
    btn.Size = UDim2.new(1, -6, 0, 38)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.Text = data.Name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 15
    btn.Parent = scrollFrame

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn

    local btnStroke = Instance.new("UIStroke")
    btnStroke.Thickness = 1.5
    btnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    btnStroke.Parent = btn

    table.insert(rainbowElements, btnStroke)

    -- Button Click Functionality
    btn.MouseButton1Click:Connect(function()
        if data.Script and data.Script ~= "" then
            local func, err = loadstring(data.Script)
            if func then
                task.spawn(func)
            else
                warn("Failed to load script for " .. data.Name .. ": " .. tostring(err))
            end
        end
    end)
end

-- Open/Close Logic
local isOpen = true

local function toggleGUI()
    isOpen = not isOpen
    mainFrame.Visible = isOpen
    if isOpen then
        toggleButton.Text = "Close Genesis"
    else
        toggleButton.Text = "Open Genesis"
    end
end

closeButton.MouseButton1Click:Connect(toggleGUI)
toggleButton.MouseButton1Click:Connect(toggleGUI)

-- Rainbow Color Shift Loop (2-second cycle duration)
task.spawn(function()
    local duration = 2
    while true do
        for i = 0, 1, 0.02 do
            local color = Color3.fromHSV(i, 0.8, 1)
            local tweenInfo = TweenInfo.new(duration * 0.02, Enum.EasingStyle.Linear)
            
            for _, element in ipairs(rainbowElements) do
                TweenService:Create(element, tweenInfo, {Color = color}):Play()
            end
            
            task.wait(duration * 0.02)
        end
    end
end)