local main = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")

local closebutton = Instance.new("TextButton")
local executeButton = Instance.new("TextButton")
local playerNameInput = Instance.new("TextBox")
local suggestionList = Instance.new("Frame")
local suggestionTextList = {}

main.Name = "main"
main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false

Frame.Parent = main
Frame.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.Position = UDim2.new(0.100320168, 0, 0.379746825, 0)
Frame.Size = UDim2.new(0, 250, 0, 120) -- Increased the height to accommodate the input elements

closebutton.Name = "Close"
closebutton.Parent = Frame
closebutton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closebutton.Font = "SourceSans"
closebutton.Size = UDim2.new(0, 45, 0, 28)
closebutton.BorderColor3 = Color3.fromRGB(0, 0, 0)
closebutton.Text = "X"
closebutton.TextSize = 30
closebutton.Position = UDim2.new(0, 0, 0, 4)

executeButton.Name = "Execute"
executeButton.Parent = Frame
executeButton.BackgroundColor3 = Color3.fromRGB(0, 128, 0)
executeButton.Font = "SourceSans"
executeButton.Size = UDim2.new(0, 100, 0, 28)
executeButton.Text = "Execute Code"
executeButton.TextSize = 18
executeButton.Position = UDim2.new(0, 0, 0, 70)

playerNameInput.Name = "PlayerNameInput"
playerNameInput.Parent = Frame
playerNameInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
playerNameInput.Font = "SourceSans"
playerNameInput.Size = UDim2.new(0, 150, 0, 28)
playerNameInput.Position = UDim2.new(0, 100, 0, 40)
playerNameInput.PlaceholderText = "Enter Player Name"
playerNameInput.TextChanged:Connect(function()
    suggestionList:ClearAllChildren()
    suggestionList.Visible = false
    local partialName = playerNameInput.Text
    if #partialName >= 3 then
        local matches = {}
        for _, player in pairs(game.Players:GetPlayers()) do
            if string.find(player.Name:lower(), partialName:lower()) then
                table.insert(matches, player.Name)
            end
        end
        if #matches > 0 then
            suggestionList.Visible = true
            for i, match in ipairs(matches) do
                suggestionTextList[i] = Instance.new("TextLabel")
                suggestionTextList[i].Name = "SuggestionText"
                suggestionTextList[i].Parent = suggestionList
                suggestionTextList[i].Size = UDim2.new(1, 0, 0, 20)
                suggestionTextList[i].Position = UDim2.new(0, 0, 0, (i - 1) * 20)
                suggestionTextList[i].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                suggestionTextList[i].Text = match
                suggestionTextList[i].TextSize = 14
                suggestionTextList[i].TextXAlignment = Enum.TextXAlignment.Left
                suggestionTextList[i].MouseButton1Click:Connect(function()
                    playerNameInput.Text = match
                    suggestionList.Visible = false
                end)
            end
        end
    end
end)

suggestionList.Name = "SuggestionList"
suggestionList.Parent = Frame
suggestionList.Size = UDim2.new(0, 150, 0, 60)
suggestionList.Position = UDim2.new(0, 100, 0, 68)
suggestionList.Visible = false

-- Close Button
closebutton.MouseButton1Click:Connect(function()
    main:Destroy()
end)

-- Execute Button Click Event
executeButton.MouseButton1Click:Connect(function()
    local playerName = playerNameInput.Text
    local targetPlayer = game.Players:FindFirstChild(playerName)
    if targetPlayer then
        oyuncuyu bulma işlevi
function getPlayer(playerName, speaker)
    local players = {}
    for _, player in pairs(game.Players:GetPlayers()) do
        if player.Name == playerName and player ~= speaker then
            table.insert(players, player)
        end
    end
    return players
end

-- getTorso: Bir karakterin torsosunu almak için işlev (bu işlevi gereksinimlerinize göre özelleştirin)
function getTorso(character)
    -- Örneğin, torsosunu bu şekilde alabilirsiniz:
    return character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso")
end

-- getRoot: Bir karakterin root kısmını almak için işlev (bu işlevi gereksinimlerinize göre özelleştirin)
function getRoot(character)
    -- Örneğin, root'u bu şekilde alabilirsiniz:
    return character:FindFirstChild("HumanoidRootPart")
            end
    else
        warn("Player not found: " .. playerName)
    end
end)
