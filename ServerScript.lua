local ReplicatedStorage = game:GetService("ReplicatedStorage")

local allFictionEvent = Instance.new("RemoteEvent")
allFictionEvent.Name = "AllFictionEvent"
allFictionEvent.Parent = ReplicatedStorage

local bookmakerEvent = Instance.new("RemoteEvent")
bookmakerEvent.Name = "BookmakerEvent"
bookmakerEvent.Parent = ReplicatedStorage

local undoEvent = Instance.new("RemoteEvent")
undoEvent.Name = "UndoEvent"
undoEvent.Parent = ReplicatedStorage

local mentalManipulationEvent = Instance.new("RemoteEvent")
mentalManipulationEvent.Name = "MentalManipulationEvent"
mentalManipulationEvent.Parent = ReplicatedStorage

local infiniteResetEvent = Instance.new("RemoteEvent")
infiniteResetEvent.Name = "InfiniteResetEvent"
infiniteResetEvent.Parent = ReplicatedStorage

-- "All Fiction" Ability
allFictionEvent.OnServerEvent:Connect(function(player, target)
    local pulse = Instance.new("ParticleEmitter")
    pulse.Color = ColorSequence.new(Color3.fromRGB(0, 0, 255), Color3.fromRGB(0, 0, 0))
    pulse.Size = NumberSequence.new(5, 0)
    pulse.Lifetime = NumberRange.new(1)
    pulse.Rate = 100
    pulse.Parent = target

    wait(1)
    target:Destroy()
end)

-- "Bookmaker" Ability
bookmakerEvent.OnServerEvent:Connect(function(player, target)
    local humanoid = target.Parent:FindFirstChildOfClass("Humanoid")
    if humanoid then
        local screws = Instance.new("Part")
        screws.Size = Vector3.new(1, 5, 1)
        screws.Anchored = true
        screws.CFrame = target.CFrame * CFrame.new(0, 3, 0)
        screws.Parent = game.Workspace
        
        humanoid.WalkSpeed = 0
        
        wait(5)
        screws:Destroy()
        humanoid.WalkSpeed = 16
    end
end)

-- "Undo" Ability
undoEvent.OnServerEvent:Connect(function(player)
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    
    if humanoid then
        local initialHealth = humanoid.Health
        wait(5)
        
        humanoid.Health = initialHealth
        -- Add glitched rewind effect here
    end
end)

-- "Mental Manipulation" Ability
mentalManipulationEvent.OnServerEvent:Connect(function(player)
    for i = 1, 5 do
        local clone = player.Character:Clone()
        clone.Parent = game.Workspace
        clone.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(math.random(-5, 5), 0, math.random(-5, 5))
        
        for j = 1, 10 do
            clone.Transparency = clone.Transparency == 0 and 0.5 or 0
            wait(0.1)
        end
        
        clone:Destroy()
    end
end)

-- "Infinite Reset" Ultimate Ability
infiniteResetEvent.OnServerEvent:Connect(function(player)
    for _, obj in pairs(game.Workspace:GetChildren()) do
        if obj:IsA("BasePart") then
            obj:Destroy()
        end
    end
    
    for _, player in pairs(game.Players:GetPlayers()) do
        player.Character:MoveTo(Vector3.new(0, 10, 0))
    end
end)
