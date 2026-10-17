-- Genesis FE GUI Script
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

-- ScreenGui Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GenesisFE_GUI"
ScreenGui.ResetOnSpawn = false

-- Parent to CoreGui if possible (for exploits/executors), else PlayerGui
if syn and syn.protect_gui then
    syn.protect_gui(ScreenGui)
    ScreenGui.Parent = CoreGui
elseif gethui then
    ScreenGui.Parent = gethui()
else
    ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
end

-- Open/Close Button
local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Size = UDim2.new(0, 100, 0, 35)
ToggleButton.Position = UDim2.new(0, 10, 0.5, -17.5)
ToggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Text = "Toggle GUI"
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.TextSize = 16
ToggleButton.Active = true
ToggleButton.Draggable = true
ToggleButton.Parent = ScreenGui

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 8)
ToggleCorner.Parent = ToggleButton

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 220, 0, 380)
MainFrame.Position = UDim2.new(0.5, -110, 0.5, -190)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = true
MainFrame.Parent = ScreenGui

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 10)
FrameCorner.Parent = MainFrame

-- Title Bar
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Genesis FE Just a Baseplate"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 16
Title.Parent = MainFrame

-- Scrolling Frame for Buttons
local Container = Instance.new("ScrollingFrame")
Container.Name = "Container"
Container.Size = UDim2.new(1, -20, 1, -50)
Container.Position = UDim2.new(0, 10, 0, 40)
Container.BackgroundTransparency = 1
Container.ScrollBarThickness = 4
Container.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = Container
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)

-- Rainbow Color Cycling Functionality (Every 2 Seconds)
local rainbowElements = { MainFrame, ToggleButton }

local function startRainbowCycle()
    task.spawn(function()
        local hue = 0
        while task.wait(2) do
            hue = (hue + 0.1) % 1
            local targetColor = Color3.fromHSV(hue, 0.7, 0.8)
            
            for _, element in ipairs(rainbowElements) do
                TweenService:Create(element, TweenInfo.new(1.8, Enum.EasingStyle.Linear), {
                    BackgroundColor3 = targetColor
                }):Play()
            end
        end
    end)
end

-- Helper Function to Create Buttons
local function createScriptButton(name, scriptUrl)
    local button = Instance.new("TextButton")
    button.Name = name .. "Button"
    button.Size = UDim2.new(1, -6, 0, 35)
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Text = name
    button.Font = Enum.Font.SourceSansSemibold
    button.TextSize = 14
    button.Parent = Container

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = button

    table.insert(rainbowElements, button)

    button.MouseButton1Click:Connect(function()
        local success, err = pcall(function()
            loadstring(game:HttpGet(scriptUrl))()
        end)
        if not success then
            warn("Failed to run " .. name .. ": " .. tostring(err))
        end
    end)
end

-- Create 7 Buttons with provided URLs
createScriptButton("Lighting Cannon", "https://raw.githubusercontent.com/kheunya5-droid/scirpt/refs/heads/kheunya5-droid-patch-1/obfuscated_script-1792196818549.lua")
createScriptButton("Neko", "https://raw.githubusercontent.com/kheunya5-droid/scirpt/ce218a4cdc5def6e8b650eb55311b74cebdfba87/gemini-code-1792239657926.lua")
createScriptButton("Neptunian V", "https://raw.githubusercontent.com/kheunya5-droid/scirpt/7a903ed8f5cb0ed5bfae074d3558e72a73ca1955/obfuscated_script-1792198362449.lua")
createScriptButton("Ban Hammer", "https://raw.githubusercontent.com/kheunya5-droid/scirpt/3a89bd457dafcf90663423b71e85543211c9e56a/obfuscated_script-1792199356231.lua")
createScriptButton("Goner", "https://raw.githubusercontent.com/kheunya5-droid/scirpt/a59bb7f13276b1a9342f5ed36b90d7e8f624de5a/gemini-code-1792240068852.lua")
createScriptButton("Motorcycle", "https://raw.githubusercontent.com/kheunya5-droid/scirpt/fa50c1fbb4d069b07fc86e9c6cb53afd9a2009b9/obfuscated_script-1792236527141.lua")
createScriptButton("Good Cop Bad Cop", "https://raw.githubusercontent.com/kheunya5-droid/scirpt/75c04a446624d29503d5cb12f284443d17fba280/obfuscated_script-1792236924733.lua")

-- Auto Canvas Size adjustment
Container.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    Container.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
end)

-- Toggle GUI Visibility Logic
ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Start Rainbow Animation Loop
startRainbowCycle()