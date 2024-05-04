repeat task.wait() until game.Loaded
local cloneref = cloneref or function(x) return x end
local gethui = gethui or function() return cloneref(game:FindFirstChildOfClass("CoreGui")) end

local Incognito = cloneref(game:FindFirstChildOfClass("CoreGui")):FindFirstChild("incognito") or Instance.new("ScreenGui")
local Player = cloneref(game:FindFirstChildOfClass("Players").LocalPlayer)
local Stats = cloneref(game:FindFirstChildOfClass("Stats"))

local IN_NEW = Instance.new
local C3_RGB = Color3.fromRGB
local U2_NEW = UDim2.new
local V2_NEW = Vector2.new(0.5,0.5)

local ScreenGui = IN_NEW("ScreenGui")
local Main = IN_NEW("Frame")
local Shadow = IN_NEW("ImageLabel")
local MainCorner = IN_NEW("UICorner")
local Terminal = IN_NEW("ScrollingFrame")
local UIListLayout = IN_NEW("UIListLayout")
local Assets = IN_NEW("Folder")
local Neofetch = IN_NEW("TextLabel")
local Specifications = IN_NEW("TextLabel")
local Line = IN_NEW("TextLabel")
local TextBox = IN_NEW("TextBox")

ScreenGui.Parent = gethui()
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = ScreenGui
Main.BackgroundColor3 = C3_RGB(39, 39, 39)
Main.BackgroundTransparency = 0.250
Main.BorderColor3 = C3_RGB(0, 0, 0)
Main.BorderSizePixel = 0
Main.Position = U2_NEW(0.341885775, 0, 0.303542256, 0)
Main.Size = U2_NEW(0, 481, 0, 331)

local function Drag(Frame)
	local dragToggle = nil
	local dragInput = nil
	local dragStart = nil

	local Delta, Position, startPos;

	local function updateInput(input)
		Delta = input.Position - dragStart
		Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		Frame.Position = Position
	end

	Frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
			dragToggle = true
			dragStart = input.Position
			startPos = Frame.Position

			input.Changed:Connect(function()
				if (input.UserInputState == Enum.UserInputState.End) then
					dragToggle = false
				end
			end)
		end
	end)

	Frame.InputChanged:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			dragInput = input
		end
	end)

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if (input == dragInput and dragToggle) then
			updateInput(input)
		end
	end)
end

Drag(Main)

Shadow.Name = "Shadow"
Shadow.Parent = Main
Shadow.AnchorPoint = V2_NEW
Shadow.BackgroundColor3 = C3_RGB(255, 255, 255)
Shadow.BackgroundTransparency = 1.000
Shadow.BorderColor3 = C3_RGB(0, 0, 0)
Shadow.BorderSizePixel = 0
Shadow.Position = U2_NEW(0.49953723, 0, 0.49995926, 0)
Shadow.Size = U2_NEW(1.10842884, 0, 1.10823059, 0)
Shadow.ZIndex = -2
Shadow.Image = "rbxassetid://5554236805"
Shadow.ImageColor3 = C3_RGB(0, 0, 0)

MainCorner.CornerRadius = UDim.new(0, 6)
MainCorner.Name = "MainCorner"
MainCorner.Parent = Main

Terminal.Name = "Terminal"
Terminal.Parent = Main
Terminal.Active = true
Terminal.AnchorPoint = V2_NEW
Terminal.BackgroundColor3 = C3_RGB(255, 255, 255)
Terminal.BackgroundTransparency = 1.000
Terminal.BorderColor3 = C3_RGB(0, 0, 0)
Terminal.BorderSizePixel = 0
Terminal.Position = U2_NEW(0.5, 0, 0.501510561, 0)
Terminal.Size = U2_NEW(0.954054117, 0, 0.945317268, 0)
Terminal.CanvasSize = U2_NEW(0, 0, 0, 0)
Terminal.ScrollBarThickness = 2
Terminal.AutomaticCanvasSize = Enum.AutomaticSize.Y

UIListLayout.Parent = Terminal
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 1)

Assets.Name = "Assets"
Assets.Parent = Main

Neofetch.Name = "Neofetch"
Neofetch.Parent = Assets
Neofetch.BackgroundColor3 = C3_RGB(255, 255, 255)
Neofetch.BackgroundTransparency = 1.000
Neofetch.BorderColor3 = C3_RGB(0, 0, 0)
Neofetch.BorderSizePixel = 0
Neofetch.Position = U2_NEW(0, 0, 0.0639181808, 0)
Neofetch.Size = U2_NEW(0, 182, 0, 205)
Neofetch.Visible = false
Neofetch.Font = Enum.Font.SourceSansBold
Neofetch.Text = [===[
.__                              
|__| ____   ____  ____   ____    
|  |/    \_/ ___\/  _ \ / ___\   
|  |   |  \  \__(  <_> ) /_/  >  
|__|___|  /\___  >____/\___  /   
        \/     \/     /_____/    
                .__  __          
           ____ |__|/  |_  ____  
          /    \|  \   __\/  _ \ 
         |   |  \  ||  | (  <_> )
         |___|  /__||__|  \____/ 
              \/                 
]===]
Neofetch.TextColor3 = C3_RGB(165, 214, 222)
Neofetch.TextSize = 13.000
Neofetch.TextYAlignment = Enum.TextYAlignment.Top

Specifications.Name = "Specifications"
Specifications.Parent = Neofetch
Specifications.BackgroundColor3 = C3_RGB(255, 255, 255)
Specifications.BackgroundTransparency = 1.000
Specifications.BorderColor3 = C3_RGB(0, 0, 0)
Specifications.BorderSizePixel = 0
Specifications.Position = U2_NEW(1.0580585, 0, -0.0056031011, 0)
Specifications.Size = U2_NEW(0, 190, 1, 0)
Specifications.Font = Enum.Font.Code
Specifications.Text = " "
Specifications.TextColor3 = C3_RGB(222, 222, 222)
Specifications.TextSize = 13.000
Specifications.TextXAlignment = Enum.TextXAlignment.Left
Specifications.TextYAlignment = Enum.TextYAlignment.Top

Line.Name = "Line"
Line.Parent = Assets
Line.BackgroundColor3 = C3_RGB(255, 255, 255)
Line.BackgroundTransparency = 1.000
Line.BorderColor3 = C3_RGB(0, 0, 0)
Line.BorderSizePixel = 0
Line.Position = U2_NEW(0.00217912393, 0, 0, 0)
Line.Size = U2_NEW(0, 25, 0, 20)
Line.Visible = false
Line.Font = Enum.Font.Code
Line.Text = "~/ >"
Line.TextColor3 = C3_RGB(222, 222, 222)
Line.TextSize = 13.000
Line.TextXAlignment = Enum.TextXAlignment.Left

TextBox.Parent = Line
TextBox.BackgroundColor3 = C3_RGB(255, 255, 255)
TextBox.BackgroundTransparency = 1.000
TextBox.BorderColor3 = C3_RGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Position = U2_NEW(1.32000005, 0, 0, 0)
TextBox.Size = U2_NEW(0, 420, 0, 20)
TextBox.ClearTextOnFocus = false
TextBox.Font = Enum.Font.Code
TextBox.Text = ""
TextBox.TextScaled = false
TextBox.TextColor3 = C3_RGB(222, 222, 222)
TextBox.TextSize = 13.000
TextBox.TextXAlignment = Enum.TextXAlignment.Left

local MaxSize = IN_NEW("UITextSizeConstraint")
MaxSize.MinTextSize = 2
MaxSize.MaxTextSize = 13
MaxSize.Parent = TextBox

local CurrentLine = nil
local CurrentTxb = nil
local CurrentEvent = nil
local Recreate = nil

Recreate = function()
	if CurrentTxb then
		CurrentTxb.TextEditable = false
		CurrentTxb.ShowNativeInput = false
	end

	if CurrentEvent then
		CurrentEvent:Disconnect()
	end
	
	local Archive = CurrentTxb or TextBox
	local New = Line:Clone(); CurrentLine = New
	local NewInput = New:WaitForChild("TextBox"); CurrentTxb = NewInput

	New.Visible = true
	NewInput.Visible = true
	CurrentEvent = NewInput.FocusLost:Connect(function(enterPressed, input)
		if enterPressed then
			local Message = string.split(NewInput.Text, " ")
			local Command = Message[1]
			table.remove(Message, 1)

			if Command == "neofetch" then
				task.wait(0.25)
				local NeofetchNew = Neofetch:Clone()
				NeofetchNew.Specifications.Text = Player.DisplayName.."@roblox"..[[ 
------------------]]..[[ 
Game: ]]..game.Name..[[ 
Resolution: ]]..tostring(workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or "idk")..[[ 
Shell: LuaU
UI: Incognito
UI Version: 1.0.0
UI Type: Internal (Kade's Take)
Memory: ]]..tostring(math.round(Stats:GetTotalMemoryUsageMb())).."MB"

				NeofetchNew.Visible = true
				NeofetchNew.Parent = Terminal

			elseif Command == "luau" then
				local restofthing = table.concat(Message, "")
				task.spawn(loadstring, restofthing)
			elseif Command == "clear" then
				for i,v in next, Terminal:GetChildren() do
					if v:IsA("TextLabel") then
						v:Destroy()
					end
				end
			elseif Command == "exit" then
				Incognito.Enabled = true
				ScreenGui:Destroy()
			end


			Recreate()
		end
	end)
	
	if string.len(Archive.Text) > 30 then
		Archive.Text = string.sub(Archive.Text, 1, 30).."..."
	end
	
	New.Parent = Terminal
	NewInput.Text = "touhou"	
	CurrentTxb.TextEditable = false
	task.wait()

	CurrentTxb.TextEditable = true
	NewInput:CaptureFocus()
	NewInput.Text = ""
end

Recreate()

Incognito.Enabled = false
