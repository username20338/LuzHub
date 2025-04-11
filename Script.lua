local function moonSecV3(protectedFunc)
    local success, err = pcall(protectedFunc)
    if not success then
        warn("MoonSecV3 Error:", err)
    end
end

moonSecV3(function()

-- // Variáveis de reputação e sistema de classes
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local reputation = 100
local useTime = 0
local lastUse = tick()
local banned = false

-- // Função para sistema de classes
local function updateClass()
    local class = "Default"
    
    if banned then
        class = "Banned"
    elseif useTime >= 86400 and reputation >= 100 then
        class = "The God"
    elseif reputation >= 100 then
        class = "Developer Zone Ultra"
    elseif reputation >= 80 then
        class = "Developer Zone Super"
    elseif reputation >= 50 then
        class = "Default"
    elseif reputation <= 10 then
        class = "Developer Fake"
    elseif reputation <= 5 then
        class = "Gay Developers"
    end
    
    return class
end

-- // Detecção IA avançada
local function detectAI()
    local userInputService = game:GetService("UserInputService")
    if not userInputService.MouseEnabled and not userInputService.KeyboardEnabled then
        banned = true
        return true
    end
    return false
end

-- // Loop de reputação e uso
task.spawn(function()
    while true do
        task.wait(1)
        useTime += 1
        if tick() - lastUse > 60 then
            reputation = reputation - 1
        else
            reputation = reputation + 0.2
        end
        
        if detectAI() then
            warn("IA detectada! Jogador banido.")
        end

        if reputation < 0 then
            banned = true
        end

        if updateClass() == "Gay Developers" then
            warn("Você está na classe Gay Developers! Apenas um comando de fly que não funciona.")
        elseif updateClass() == "Developer Zone Ultra" then
            print("Continue assim! Você poderá acessar o Discord oficial.")
        elseif updateClass() == "Developer Fake" then
            warn("Você foi movido para a Developer Zone Fake.")
        elseif updateClass() == "The God" then
            print("Você atingiu a Classe The God! Você pode pedir um script personalizado ao criador.")
        end
    end
end)

-- // Tela Inicial
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "LuzHubUI"

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Position = UDim2.new(0.25, 0, 0.25, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 30)
MainFrame.BorderSizePixel = 0

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0.1, 0)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "🌌 LuzHub - Free Premium"
Title.TextColor3 = Color3.fromRGB(100, 170, 255)
Title.Font = Enum.Font.SciFi
Title.TextScaled = true

-- // Sistema de Key
local keyBox = Instance.new("TextBox", MainFrame)
keyBox.Size = UDim2.new(0.6, 0, 0.1, 0)
keyBox.Position = UDim2.new(0.2, 0, 0.2, 0)
keyBox.PlaceholderText = "Digite a Key (Dica: Nome do script)"
keyBox.Text = ""
keyBox.Font = Enum.Font.SciFi
keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyBox.BackgroundColor3 = Color3.fromRGB(20, 20, 50)

local confirmButton = Instance.new("TextButton", MainFrame)
confirmButton.Size = UDim2.new(0.4, 0, 0.1, 0)
confirmButton.Position = UDim2.new(0.3, 0, 0.35, 0)
confirmButton.Text = "Entrar"
confirmButton.Font = Enum.Font.SciFi
confirmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
confirmButton.BackgroundColor3 = Color3.fromRGB(30, 30, 80)

confirmButton.MouseButton1Click:Connect(function()
    if keyBox.Text == "LuzHub" then
        MainFrame:Destroy()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/username20338/LuzHub/main/Interface.lua"))()
    else
        keyBox.Text = "Chave incorreta"
    end
end)

-- // Developer Zone com detecção de arquivo
local devKeyPath = "DevKey.txt"
local function checkDeveloperKey()
    local devFile = isfile and isfile(devKeyPath) and readfile(devKeyPath)
    if devFile == "GptChat032" then
        return true
    else
        return false
    end
end

_G.checkDevZone = function(enteredKey)
    if enteredKey == "GptChat032" and checkDeveloperKey() then
        return "access"
    elseif enteredKey == "GptChat032" and not checkDeveloperKey() then
        return "fake"
    else
        return "denied"
    end
end

end)
