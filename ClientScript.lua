local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = game.Players.LocalPlayer

-- Initialize the main GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MisogiKumagawaMenu"
screenGui.Parent = player:WaitForChild("PlayerGui")

local mainMenu = Instance.new("Frame")
mainMenu.Size = UDim2.new(0.5, 0, 0.5, 0)
mainMenu.Position = UDim2.new(0.25, 0, 0.25, 0)
mainMenu.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
mainMenu.BackgroundTransparency = 0.5
mainMenu.BorderSizePixel = 0
mainMenu.Parent = screenGui

-- Add a floating panel with shifting text
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 0.1, 0)
textLabel.Position = UDim2.new(0, 0, 0, 0)
textLabel.BackgroundTransparency = 1
textLabel.TextScaled = true
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.Font = Enum.Font.SourceSans
textLabel.Text = "Misogi Kumagawa Menu"
textLabel.Parent = mainMenu

local function shiftText()
    while true do
        textLabel.Text = "Misogi Kumagawa Menu"
        wait(0.5)
        textLabel.Text = "M1s0g1 Kum4g4w4 M3nu"
        wait(0.5)
    end
end

spawn(shiftText)

-- Add a close button to the menu
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0.1, 0, 0.1, 0)
closeButton.Position = UDim2.new(0.9, -5, 0, 5)
closeButton.Text = "Close"
closeButton.Parent = mainMenu

closeButton.MouseButton1Click:Connect(function()
    mainMenu.Visible = false
end)

-- Abilities
local allFictionEvent = ReplicatedStorage:WaitForChild("AllFictionEvent")
local bookmakerEvent = ReplicatedStorage:WaitForChild("BookmakerEvent")
local undoEvent = ReplicatedStorage:WaitForChild("UndoEvent")
local mentalManipulationEvent = ReplicatedStorage:WaitForChild("MentalManipulationEvent")
local infiniteResetEvent = ReplicatedStorage:WaitForChild("InfiniteResetEvent")

-- "All Fiction" Ability
local allFictionTool = Instance.new("Tool")
allFictionTool.Name = "All Fiction"
allFictionTool.RequiresHandle = false
allFictionTool.Parent = player.Backpack

local lastUsedAllFiction = 0
local cooldownAllFiction = 15

allFictionTool.Activated:Connect(function()
    if tick() - lastUsedAllFiction < cooldownAllFiction then return end
    lastUsedAllFiction = tick()
    
    local mouse = player:GetMouse()
    local target = mouse.Target
    
    if target then
        allFictionEvent:FireServer(target)
    end
end)

-- "Bookmaker" Ability
local bookmakerTool = Instance.new("Tool")
bookmakerTool.Name = "Bookmaker"
bookmakerTool.RequiresHandle = false
bookmakerTool.Parent = player.Backpack

local lastUsedBookmaker = 0
local cooldownBookmaker = 10

bookmakerTool.Activated:Connect(function()
    if tick() - lastUsedBookmaker < cooldownBookmaker then return end
    lastUsedBookmaker = tick()
    
    local mouse = player:GetMouse()
    local target = mouse.Target
    
    if target and target.Parent:FindFirstChildOfClass("Humanoid") then
        bookmakerEvent:FireServer(target)
    end
end)

-- "Undo" Ability
local undoTool = Instance.new("Tool")
undoTool.Name = "Undo"
undoTool.RequiresHandle = false
undoTool.Parent = player.Backpack

local lastUsedUndo = 0
local cooldownUndo = 20

undoTool.Activated:Connect(function()
    if tick() - lastUsedUndo < cooldownUndo then return end
    lastUsedUndo = tick()
    
    undoEvent:FireServer()
end)

-- "Mental Manipulation" Ability
local mentalManipulationTool = Instance.new("Tool")
mentalManipulationTool.Name = "Mental Manipulation"
mentalManipulationTool.RequiresHandle = false
mentalManipulationTool.Parent = player.Backpack

local lastUsedMentalManipulation = 0
local cooldownMentalManipulation = 30

mentalManipulationTool.Activated:Connect(function()
    if tick() - lastUsedMentalManipulation < cooldownMentalManipulation then return end
    lastUsedMentalManipulation = tick()
    
    mentalManipulationEvent:FireServer()
end)

-- "Infinite Reset" Ultimate Ability
local infiniteResetTool = Instance.new("Tool")
infiniteResetTool.Name = "Infinite Reset"
infiniteResetTool.RequiresHandle = false
infiniteResetTool.Parent = player.Backpack

local lastUsedInfiniteReset = 0
local cooldownInfiniteReset = 300

infiniteResetTool.Activated:Connect(function()
    if tick() - lastUsedInfiniteReset < cooldownInfiniteReset then return end
    lastUsedInfiniteReset = tick()
    
    infiniteResetEvent:FireServer()
end)

-- Power Customization Menu
local customizationFrame = Instance.new("Frame")
customizationFrame.Size = UDim2.new(1, 0, 0.5, 0)
customizationFrame.Position = UDim2.new(0, 0, 0.5, 0)
customizationFrame.BackgroundTransparency = 1
customizationFrame.Parent = mainMenu

local allFictionCooldownLabel = Instance.new("TextLabel")
allFictionCooldownLabel.Size = UDim2.new(0.5, 0, 0.1, 0)
allFictionCooldownLabel.Position = UDim2.new(0, 0, 0, 0)
allFictionCooldownLabel.Text = "All Fiction Cooldown: 15s"
allFictionCooldownLabel.Parent = customizationFrame

local allFictionCooldownSlider = Instance.new("TextButton")
allFictionCooldownSlider.Size = UDim2.new(0.5, 0, 0.1, 0)
allFictionCooldownSlider.Position = UDim2.new(0.5, 0, 0, 0)
allFictionCooldownSlider.Text = "Adjust"
allFictionCooldownSlider.Parent = customizationFrame

allFictionCooldownSlider.MouseButton1Click:Connect(function()
    cooldownAllFiction = math.max(cooldownAllFiction - 1, 1)
    allFictionCooldownLabel.Text = "All Fiction Cooldown: " .. cooldownAllFiction .. "s"
end)
