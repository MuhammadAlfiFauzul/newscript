-- Simple UI tanpa external library
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 250)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -125)
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Text = "MT Auto Executor"
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Parent = MainFrame

local function createButton(name, position, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.8, 0, 0, 40)
    button.Position = position
    button.Text = name
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Parent = MainFrame
    
    button.MouseButton1Click:Connect(callback)
    return button
end

-- Fungsi untuk execute script
local function executeScript(url)
    local success, errorMsg = pcall(function()
        local scriptContent = game:HttpGet(url)
        loadstring(scriptContent)()
    end)
    return success, errorMsg
end

-- Tombol MT Atin
createButton("Execute MT Atin", UDim2.new(0.1, 0, 0.2, 0), function()
    local success, errorMsg = executeScript("https://raw.githubusercontent.com/AlfiFazulul/script/refs/heads/main/jembutatin.lua")
    if success then
        print("MT Atin executed successfully!")
    else
        warn("Error loading MT Atin:", errorMsg)
    end
end)

-- Tombol MT Yahayuk
createButton("Execute MT Yahayuk", UDim2.new(0.1, 0, 0.5, 0), function()
    local success, errorMsg = executeScript("https://raw.githubusercontent.com/AlfiFazulul/script/refs/heads/main/jembutyahayuk.lua")
    if success then
        print("MT Yahayuk executed successfully!")
    else
        warn("Error loading MT Yahayuk:", errorMsg)
    end
end)

print("Simple MT Executor UI loaded!")
