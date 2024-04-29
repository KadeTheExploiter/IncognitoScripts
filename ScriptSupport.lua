-- mini script supporter by Kade and others :33
-- should help 
if getfenv(0).OldEnv then
    for i,v in pairs(getfenv(0).OldEnv) do
        getfenv(0)[i] = v
    end
end

getfenv(0).OldEnv = getfenv(0)

if getfenv(0).Loaded then
    --return
end

local Global = getfenv(0)
local FakeCoreGuiEnv = Instance.new("ScreenGui", game:FindFirstChildOfClass("CoreGui"))
local VirtualInputManager = game:FindFirstChildOfClass("VirtualInputManager")

Global.Loaded = true
Global.getgenv = getgenv
Global.rconsoleprint = print

local nilinstances = {}
game.DescendantRemoving:Connect(function(Descendant)
	nilinstances[#nilinstances+1]=Descendant	
end)

game.DescendantAdded:Connect(function(Descendant)
	if table.find(nilinstances, Descendant) then
		nilinstances[Descendant] = nil
	end
end)

Global.sethiddenproperty = function(X, Y, Z) -- kade
    pcall(function()
        X[Y]=Z
    end)
end

Global.getexecutorname = function() -- kade
    return "Incognito"
end

Global.gethiddenproperty = function(X, Y)
    return select(2, pcall(function()
        local Result = X[Y]
        return Result
    end))
end

Global.isscriptable = gethiddenproperty
Global.setscriptable = sethiddenproperty

Global.getscripts = function() 
    local x = {}
    for i,v in pairs(game:GetDescendants()) do
        if v:IsA("Script") then
            x[#x+1]=v
        end
    end
    return x
end

Global.hookfunction = function(Old, New) -- kade
    Old = New
end

Global.isnetworkowner = function(Part) -- kade 
    return Part.ReceiveAge == 0
end

Global.gethui = function(Part) -- kade 
    return FakeCoreGuiEnv
end

Global.getinstances = function() -- kade 
    local x = {}
    for _,v in pairs(game:GetDescendants()) do
        if v:IsA("Instance") then
            x[#x+1]=v
        end
    end
    return x
end

Global.getnilinstances = function() -- kade 
    return nilinstances
end

Global.setclipboard = function(String) -- kade 
    print(String)
end

Global.toclipboard = setclipboard
Global.setrbxclipboard = setclipboard

Global.fireclickdetector = function(ClickDetector) -- pio
    if typeof(ClickDetector.Parent) ~= "Part" then
        return
    end

    local CameraCalc = workspace.CurrentCamera:WorldToViewportPoint(ClickDetector.Parent.Position)

    VirtualInputManager:SendMouseButtonEvent(res.X, res.Y, 0, true, game, 1)
    VirtualInputManager:SendMouseButtonEvent(res.X, res.Y, 0, false, game, 1)
end

Global.cloneref = function(X) -- kade
    return X:Clone()
end

Global.request = function(X) -- kade
    return game:FindFirstChildOfClass("HttpService"):RequestAsync(X)
end

Global.clonefunction = function(Old, New) -- kade
    local New = Old
    return New
end

Global.mouse1down = function() -- jxsh
    VirtualInputManager:SendMouseButtonEvent(0, 0, 1, true, game, 1)
end

Global.mouse1up = function() -- jxsh
    VirtualInputManager:SendMouseButtonEvent(0, 0, 1, false, game, 1)
end

Global.mouse1click = function() -- jxsh
    mouse1down()
    mouse1up()
end

Global.keypress = function(key) -- jxsh
    VirtualInputManager:SendKeyEvent(true, key, false, game)
end

Global.keyrelease = function(key) -- jxsh
    VirtualInputManager:SendKeyEvent(false, key, false, game)
end
