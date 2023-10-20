local main = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")

local closebutton = Instance.new("TextButton")

main.Name = "main"
main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false

Frame.Parent = main
Frame.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.Position = UDim2.new(0.100320168, 0, 0.379746825, 0)
Frame.Size = UDim2.new(0, 250, 0, 57)

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

-- Yan Yana
AutoParry.Position = UDim2.new(0, 0, 0, 0)
AutoClick.Position = UDim2.new(0, 110, 0, 0)

-- Bildirim
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Blade Ball V1",
    Text = "By Wreston",
    Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"
})
Duration = 5;


-- Close Button
closebutton.MouseButton1Click:Connect(function()
    main:Destroy()
end)
