-- Genesis FE - Custom Roblox Script Hub
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Clean up existing instance if re-executed
if PlayerGui:FindFirstChild("GenesisFE_GUI") then
    PlayerGui["GenesisFE_GUI"]:Destroy()
end

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GenesisFE_GUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

-- Main Frame (GUI Container)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 320, 0, 420)
mainFrame.Position = UDim2.new(0.5, -160, 0.5, -210)
mainFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 10)
frameCorner.Parent = mainFrame

local frameStroke = Instance.new("UIStroke")
frameStroke.Thickness = 2
frameStroke.Color = Color3.fromRGB(255, 255, 255)
frameStroke.Parent = mainFrame

-- Title Label
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Genesis FE"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 22
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.Parent = mainFrame

-- Scroll / Button Container
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Name = "ButtonContainer"
scrollFrame.Size = UDim2.new(1, -20, 1, -60)
scrollFrame.Position = UDim2.new(0, 10, 0, 45)
scrollFrame.BackgroundTransparency = 1
scrollFrame.BorderSizePixel = 0
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 420)
scrollFrame.ScrollBarThickness = 6
scrollFrame.Parent = mainFrame

local listLayout = Instance.new("UIListLayout")
listLayout.Parent = scrollFrame
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Padding = UDim.new(0, 8)

-- Open/Close Toggle Button
local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleButton"
toggleButton.Size = UDim2.new(0, 100, 0, 35)
toggleButton.Position = UDim2.new(0, 15, 0, 15)
toggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
toggleButton.Text = "Close"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextSize = 16
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.Parent = screenGui

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 8)
toggleCorner.Parent = toggleButton

toggleButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
    if mainFrame.Visible then
        toggleButton.Text = "Close"
    else
        toggleButton.Text = "Open"
    end
end)

-- Button Data & Scripts
local buttonData = {
    {
        Name = "Lighting Cannon",
        Script = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/kheunya5-droid/scirpt/refs/heads/kheunya5-droid-patch-1/obfuscated_script-1792196818549.lua"))()]]
    },
    {
        Name = "Neko",
        Script = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/kheunya5-droid/scirpt/f26245be2b61c696955f175784d18075fd29f4d8/obfuscated_script-1792197848106.lua"))()]]
    },
    {
        Name = "Neptunian V",
        Script = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/kheunya5-droid/scirpt/7a903ed8f5cb0ed5bfae074d3558e72a73ca1955/obfuscated_script-1792198362449.lua"))()]]
    },
    {
        Name = "Sin Dragon",
        Script = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/kheunya5-droid/scirpt/321ae3ac92b3f9e0eaf8c621271fb0a84f2adfe1/obfuscated_script-1792198963848.lua"))()]]
    },
    {
        Name = "Ban Hammer",
        Script = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/kheunya5-droid/scirpt/3a89bd457dafcf90663423b71e85543211c9e56a/obfuscated_script-1792199356231.lua"))()]]
    },
    {
        Name = "Goner",
        Script = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/kheunya5-droid/scirpt/3a89bd457dafcf90663423b71e85543211c9e56a/goner%20scirpt"))()]]
    },
    {
        Name = "Motorcycle",
        Script = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/kheunya5-droid/scirpt/fa50c1fbb4d069b07fc86e9c6cb53afd9a2009b9/obfuscated_script-1792236527141.lua"))()]]
    },
    {
        Name = "Good Cop Bad Cop",
        Script = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/kheunya5-droid/scirpt/75c04a446624d29503d5cb12f284443d17fba280/obfuscated_script-1792236924733.lua"))()]]
    }
}

-- List to track objects that change colors
local colorableObjects = { mainFrame, toggleButton }

-- Build Buttons
for idx, data in ipairs(buttonData) do
    local btn = Instance.new("TextButton")
    btn.Name = "Btn_" .. idx
    btn.Size = UDim2.new(1, -10, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    btn.Text = data.Name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 16
    btn.Font = Enum.Font.SourceSansBold
    btn.Parent = scrollFrame

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn

    table.insert(colorableObjects, btn)

    btn.MouseButton1Click:Connect(function()
        local func, err = loadstring(data.Script)
        if func then
            task.spawn(func)
        else
            warn("Failed to execute script for " .. data.Name .. ": " .. tostring(err))
        end
    end)
end

-- Rainbow Cycle Effect (Cycles full spectrum every 2 seconds)
task.spawn(function()
    local cycleDuration = 2.0
    while task.wait() do
        local hue = (tick() % cycleDuration) / cycleDuration
        local rainbowColor = Color3.fromHSV(hue, 0.8, 1)

        for _, obj in ipairs(colorableObjects) do
            obj.BackgroundColor3 = rainbowColor
        end
    end
end)