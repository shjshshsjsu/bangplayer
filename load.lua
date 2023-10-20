local main = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local closebutton = Instance.new("TextButton")
local executeButton = Instance.new("TextButton")
local playerNameInput = Instance.new("TextBox")

main.Name = "main"
main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false

Frame.Parent = main
Frame.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.Position = UDim2.new(0.100320168, 0, 0.379746825, 0)
Frame.Size = UDim2.new(0, 250, 0, 90) -- Increased the height to accommodate the input elements

closebutton.Name = "Close"
closebutton.Parent = Frame
closebutton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closebutton.Font = "SourceSans"
closebutton.Size = UDim2.new(0, 45, 0, 28)
closebutton.BorderColor3 = Color3.fromRGB(0, 0, 0)
closebutton.Text = "X"
closebutton.TextSize = 30
closebutton.TextColor3 = Color3.fromRGB(0, 0, 0)
closebutton.Position = UDim2.new(0, 0, 0, 4)

executeButton.Name = "Execute"
executeButton.Parent = Frame
executeButton.BackgroundColor3 = Color3.fromRGB(0, 128, 0)
executeButton.Font = "SourceSans"
executeButton.Size = UDim2.new(0, 100, 0, 28)
executeButton.Text = "Run"
executeButton.TextSize = 18
executeButton.Position = UDim2.new(0, 0, 0, 40)

playerNameInput.Name = "PlayerNameInput"
playerNameInput.Parent = Frame
playerNameInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
playerNameInput.Font = "SourceSans"
playerNameInput.Size = UDim2.new(0, 150, 0, 28)
playerNameInput.Position = UDim2.new(0, 100, 0, 40)
playerNameInput.PlaceholderText = "Enter Player Name"

-- Close Button
closebutton.MouseButton1Click:Connect(function()
    main:Destroy()
end)

-- Execute Button Click Event
executeButton.MouseButton1Click:Connect(function()
    local playerName = playerNameInput.Text
    local targetPlayer = game.Players:FindFirstChild(playerName)
    if targetPlayer then
        local speaker = game.Players.LocalPlayer  -- You may need to get the local player reference
        local humanoid = speaker.Character:FindFirstChildWhichIsA("Humanoid")
        local bangAnim = Instance.new("Animation")
        bangAnim.AnimationId = not r15(speaker) and "rbxassetid://148840371" or "rbxassetid://5918726674"
        local bang = humanoid:LoadAnimation(bangAnim)
        bang:Play(0.1, 1, 1)
        bang:AdjustSpeed(args[2] or 3)
        local bangDied
        bangDied = humanoid.Died:Connect(function()
            bang:Stop()
            bangAnim:Destroy()
            bangDied:Disconnect()
            bangLoop:Disconnect()
        end)
        if args[1] then
            local players = getPlayer(args[1], speaker)
            local bangplr = targetPlayer.Name
            local bangOffet = CFrame.new(0, 0, 1.1)
            local bangLoop
            bangLoop = RunService.Stepped:Connect(function()
                pcall(function()
                    local otherRoot = getTorso(targetPlayer.Character)
                    getRoot(speaker.Character).CFrame = otherRoot.CFrame * bangOffet
                end)
            end)
        end
    else
        warn("Player not found: " .. playerName)
    end
end)
