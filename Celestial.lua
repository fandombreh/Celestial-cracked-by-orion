--[[
██████╗███████╗██╗     ███████╗███████╗████████╗██╗ █████╗ ██╗     
██╔════╝██╔════╝██║     ██╔════╝██╔════╝╚══██╔══╝██║██╔══██╗██║     
██║     █████╗  ██║     █████╗  ███████╗   ██║   ██║███████║██║     
██║     ██╔══╝  ██║     ██╔══╝  ╚════██║   ██║   ██║██╔══██║██║     
╚██████╗███████╗███████╗███████╗███████║   ██║   ██║██║  ██║███████╗
 ╚═════╝╚══════╝╚══════╝╚══════╝╚══════╝   ╚═╝   ╚═╝╚═╝  ╚═╝╚══════╝
]]

-- No key system – direct load
-- i own u guys lmaooo
-- Notification Library (kept for hub notifications)
_G.ActiveNotifications = {}
local TweenService = game:GetService("TweenService")

function Notify(Name, Msg, Duration)
	local Noti = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Top = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local Title = Instance.new("TextLabel")
	local TopBar = Instance.new("Frame")
	local Message = Instance.new("TextLabel")
	local ProgressBar = Instance.new("Frame")

	Noti.Name = "Noti"
	Noti.DisplayOrder = 10
	Noti.Parent = game:GetService("CoreGui")

	Main.Name = "Main"
	Main.Parent = Noti
	Main.AnchorPoint = Vector2.new(1, 1)
	Main.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
	Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(1, 170, 1, -20)
	Main.Size = UDim2.new(0, 169.5, 0, 90) 

	UICorner.CornerRadius = UDim.new(0, 3)
	UICorner.Parent = Main

	Top.Name = "Top"
	Top.Parent = Main
	Top.BackgroundColor3 = Color3.fromRGB(0, 81, 255)
	Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Top.BorderSizePixel = 0
	Top.Size = UDim2.new(0, 169, 0, 19.5)

	UICorner_2.CornerRadius = UDim.new(0, 3)
	UICorner_2.Parent = Top

	Title.Name = "Title"
	Title.Parent = Top
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0.0207100585, 0, 0.102564104, 0)
	Title.Size = UDim2.new(0, 162, 0, 15.5)
	Title.ZIndex = 3
	Title.Font = Enum.Font.Gotham
	Title.Text = Name
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 12.5

	TopBar.Name = "TopBar"
	TopBar.Parent = Main
	TopBar.BackgroundColor3 = Color3.fromRGB(0, 81, 255)
	TopBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopBar.BorderSizePixel = 0
	TopBar.Position = UDim2.new(0, 0, 0.157894731, 0)
	TopBar.Size = UDim2.new(0, 169, 0, 6)

	Message.Name = "Message"
	Message.Parent = Main
	Message.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Message.BackgroundTransparency = 1.000
	Message.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Message.BorderSizePixel = 0
	Message.Position = UDim2.new(0.0177601501, 0, 0.35, 0) 
	Message.Size = UDim2.new(0, 162, 0, 40) 
	Message.ZIndex = 3
	Message.Font = Enum.Font.Gotham
	Message.Text = Msg
	Message.TextColor3 = Color3.fromRGB(255, 255, 255)
	Message.TextSize = 11
	Message.TextWrapped = true
	Message.TextXAlignment = Enum.TextXAlignment.Center 
	Message.TextYAlignment = Enum.TextYAlignment.Center 

	ProgressBar.Name = "ProgressBar"
	ProgressBar.Parent = Main
	ProgressBar.BackgroundColor3 = Color3.fromRGB(0, 81, 255)
	ProgressBar.BorderSizePixel = 0
	ProgressBar.Position = UDim2.new(0, 0, 1, -3) 
	ProgressBar.Size = UDim2.new(0, 0, 0, 3) 

	for i, activeNoti in ipairs(_G.ActiveNotifications) do
		local newYPos = UDim2.new(1, -20, 1, -20 - (Main.Size.Y.Offset + 10) * i)
		TweenService:Create(activeNoti, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
			Position = newYPos
		}):Play()
	end

	table.insert(_G.ActiveNotifications, Main)

	local tweenIn = game.TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
		Position = UDim2.new(1, -20, 1, -20)
	})
	tweenIn:Play()
	tweenIn.Completed:Wait()

	local progressTween = game.TweenService:Create(ProgressBar, TweenInfo.new(Duration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
		Size = UDim2.new(1, 0, 0, 3)
	})
	progressTween:Play()

	task.wait(Duration)

	local tweenOut = game.TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
		Position = UDim2.new(1, 170, 1, -20)
	})
	tweenOut:Play()
	tweenOut.Completed:Wait()

	Noti:Destroy()

	for i, activeNoti in ipairs(_G.ActiveNotifications) do
		if activeNoti == Main then
			table.remove(_G.ActiveNotifications, i)
			break
		end
	end

	for i, activeNoti in ipairs(_G.ActiveNotifications) do
		local newYPos = UDim2.new(1, -20, 1, -20 - (Main.Size.Y.Offset + 10) * (i - 1))
		game.TweenService:Create(activeNoti, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
			Position = newYPos
		}):Play()
	end
end

--// Loadstring for hub loader here

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local VirtualInputService = game:GetService("VirtualInputManager")

-- No key system – premium is always true
local IsPremium = true
local License = "no_key_required"  -- dummy value, not used

local Services = setmetatable({}, {
	__index = function(t, k)
		return game.GetService(game, k)
	end
})

local AdminRainbowTextColors, NonAdminColors, Bools, HttpReqs, Vars, toggleNames, Tables, Celestial = {
	Color3.fromRGB(255, 0, 0),   
	Color3.fromRGB(255, 127, 0), 
	Color3.fromRGB(255, 255, 0), 
	Color3.fromRGB(0, 255, 0),   
	Color3.fromRGB(0, 0, 255),   
	Color3.fromRGB(75, 0, 130),  
	Color3.fromRGB(148, 0, 211)  
}, {
	ThemeColor,
	Color3.fromRGB(255, 255, 255)  
}, {
	ShutdownActive = false,
	Multi_InstanceKick = false,
	desktopdetected = false,
	mobiledetected = false,
	BetterGraphics = false,
	AlwaysDay = false,
	AlwaysNight = false,
}, {
}, {
	LP = game.Players.LocalPlayer,
	WalkspeedValue = 16
}, {
	"LoadingScreen", "RainbowAdminStatus",
}, {
	FlySettings = {
		FlightSpeedNum = 150,
		FlightKey = "q",
		FlightEnabled = false,
		speed = 5000,
		ctrl = { f = 0, b = 0, l = 0, r = 0 },
		lastctrl = { f = 0, b = 0, l = 0, r = 0 },
	}
}, {}

local Character = Vars.LP.Character or Vars.LP.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

local toggleStates = {
	Theme = {0, 81, 255}  
}

local ThemeColor = Color3.fromRGB(0, 81, 255)  

local ConfigData = {
	baseFolderPath = "Celestial",
	configFolderPath = "Celestial/Config",
	configName = "Template_Config"
}

function Celestial:initializeToggleStates()
	for _, name in ipairs(toggleNames) do
		if name == "LoadingScreen" then
			toggleStates[name] = true
		elseif name == "ToggleAntiAFK" then
			toggleStates[name] = true
		elseif name == "InvertGameUI" then
			toggleStates[name] = true
		else
			toggleStates[name] = false
		end
	end
end

function Celestial:DebugLog(FeatureUsed, Message)
	local LogFolder = "Celestial/Logs/Debug"
	local LogFile = LogFolder .. "/DebugLogs.txt" 
	if not isfolder(LogFolder) then
		makefolder(LogFolder)
	end
	if not isfile(LogFile) then
		local header = "Celestial Debug Log - " .. os.date("%Y-%m-%d %H:%M:%S") .. "\n"
		writefile(LogFile, header)
	end
	local logMessage = "[" .. FeatureUsed .. "] - " .. Message .. "\n"
	appendfile(LogFile, logMessage)
end

function Celestial:ensureFoldersExist()
	if not isfolder(ConfigData.baseFolderPath) then
		makefolder(ConfigData.baseFolderPath)
		Celestial:DebugLog("Celestial Folder Verification", "No Celestial folder found, creating folder")
	end
	if not isfolder(ConfigData.configFolderPath) then
		makefolder(ConfigData.configFolderPath)
	end
end

function Celestial:loadConfig()
	Celestial:ensureFoldersExist()
	local filePath = ConfigData.configFolderPath .. "/" .. ConfigData.configName .. ".txt"
	if isfile(filePath) then
		print("[ CelestialHub ] - Loading Config...")
		local fileContent = readfile(filePath)
		local success, loadedStates = pcall(loadstring(fileContent))
		if success and type(loadedStates) == "table" then
			for key, value in pairs(loadedStates) do
				if toggleStates[key] ~= nil then
					toggleStates[key] = value
				end
			end
			if type(toggleStates["Theme"]) == "table" then
				local r, g, b = unpack(toggleStates["Theme"])
				ThemeColor = Color3.fromRGB(r, g, b)
			end
		else
			Celestial:DebugLog("Celestial Configuration", "Failed to load config or invalid data: " .. (loadedStates or ""))
		end
	else
		print("[ CelestialHub ] - No Config Found. Using default states.")
	end
end

function Celestial:saveConfig()
	Celestial:ensureFoldersExist()
	local filePath = ConfigData.configFolderPath .. "/" .. ConfigData.configName .. ".txt"
	if isfile(filePath) then
		print("[ CelestialHub ] - Config Already Exists. Updating it...")
	else
		print("[ CelestialHub ] - Saving Config...")
	end
	local fileContent = "return " .. table.concat(
		{ "{\n" .. table.concat(
			(function()
				local t = {}
				for k, v in pairs(toggleStates) do
					if type(v) == "table" then
						local formatted = string.format('["%s"] = {%s}', k, table.concat(v, ", "))
						table.insert(t, formatted)
					else
						table.insert(t, string.format('["%s"] = %s', k, tostring(v)))
					end
				end
				return t
			end)(),
			",\n"
		) .. "\n}" },
		""
	)
	writefile(filePath, fileContent)
	print("[ CelestialHub ] - Config Saved Successfully!")
end

function Celestial:deleteConfig()
	Celestial:ensureFoldersExist()
	local filePath = ConfigData.configFolderPath .. "/" .. ConfigData.configName .. ".txt"
	if isfile(filePath) then
		delfile(filePath)
		print("[ CelestialHub ] - Config Deleted Successfully!")
	else
		Celestial:DebugLog("Celestial Configuration", "Config not found, make sure you have one saved")
	end
end

Celestial:initializeToggleStates()
Celestial:loadConfig()

repeat task.wait() until game:IsLoaded() and game:GetService"Players".LocalPlayer:GetMouse()

local Library, Utilities, Connections = {
	Closed = false,
	Destroyed = false,
	IsMinimizing = false,
	CurrentTab = nil,
}, {}, {}

local Players = game:GetService"Players"
local Client = Players.LocalPlayer
local Mouse = Client:GetMouse()
local TweenService, UserInputService, RunService = game:GetService"TweenService", game:GetService"UserInputService", game:GetService"RunService"

local BannedKeys, ShortNames = {
	Return = true,
	Space = true,
	Tab = true,
	Backquote = true,
	CapsLock = true,
	Escape = true,
	Unknown = true,
}, {
	RightControl = "Right Ctrl",
	LeftControl = "Left Ctrl",
	LeftShift = "Left Shift",
	RightShift = "Right Shift",
	Semicolon = ";",
	Quote = '"',
	LeftBracket = "[",
	RightBracket = "]",
	Equals = "=",
	Minus = "-",
	RightAlt = "Right Alt",
	LeftAlt = "Left Alt"
}

function Library:Init(Name, UIVersion, Load)
	local Parent = RunService:IsStudio() and Client:WaitForChild("PlayerGui") or game.CoreGui
	if Parent:FindFirstChild("Celestial") then
		Parent.Celestial:Destroy()
		if Bools.Multi_InstanceKick then
			game.Players.LocalPlayer:Kick("Multiple instances detected")
			wait(.5)
			game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
		end
	end

	assert(Name, "A name is required")

	local Celestial = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local MainC = Instance.new("UICorner")
	local Strip = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local Exit = Instance.new("ImageButton")
	local Minimize = Instance.new("ImageButton")
	local Side = Instance.new("Frame")
	local SideC = Instance.new("UICorner")
	local TabHolder = Instance.new("ScrollingFrame")
	local TabHolderLL = Instance.new("UIListLayout")
	local TabHolderP = Instance.new("UIPadding")

	Celestial.Name = "Celestial"
	Celestial.Parent = Parent
	Celestial.ResetOnSpawn = false

	Main.Name = "Main"
	Main.Parent = Celestial
	Main.Active = true
	Main.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
	Main.BorderColor3 = Color3.fromRGB(0, 0, 0)	
	Main.BorderSizePixel = 0
	Main.ClipsDescendants = true
	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.Position = UDim2.new(0.5, 0, 0.5, 0)
	Main.Size = UDim2.new(0, 530, 0, 348)

	MainC.CornerRadius = UDim.new(0, 3)
	MainC.Name = "MainC"
	MainC.Parent = Main

	Strip.Name = "Strip"
	Strip.Parent = Main
	Strip.BackgroundColor3 = ThemeColor
	Strip.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Strip.BorderSizePixel = 0
	Strip.Position = UDim2.new(0, 0, 0, 35)
	Strip.Size = UDim2.new(0, 530, 0, 1)

	Title.Name = "Title"
	Title.Parent = Main
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0, 2, 0, 6)
	Title.Size = UDim2.new(0, 80, 0, 21)
	Title.Font = Enum.Font.GothamBold
	Title.Text = string.format("  %s", Name)
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 20.000
	Title.TextXAlignment = Enum.TextXAlignment.Left

	if UIVersion then
		local Version = Instance.new("TextLabel")
		Version.Name = "Version"
		Version.Parent = Main
		Version.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Version.BackgroundTransparency = 1.000
		Version.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Version.BorderSizePixel = 0
		Version.Position = UDim2.new(0, 80, 0, 6)
		Version.Size = UDim2.new(0, 41, 0, 21)
		Version.Font = Enum.Font.GothamBold
		Version.Text = UIVersion
		Version.TextSize = 20.000
		Version.TextXAlignment = Enum.TextXAlignment.Left
		Version.TextColor3 = ThemeColor
	end

	self.MainFrame = Main

	if Load then
		Utilities:Load(Main)
	end

	Exit.Name = "Exit"
	Exit.Parent = Main
	Exit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Exit.BackgroundTransparency = 1.000
	Exit.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Exit.BorderSizePixel = 0
	Exit.Position = UDim2.new(0, 498, 0, 3)
	Exit.Size = UDim2.new(0, 25, 0, 25)
	Exit.Image = "rbxassetid://17484949231"

	Minimize.Name = "Minimize"
	Minimize.Parent = Main
	Minimize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Minimize.BackgroundTransparency = 1.000
	Minimize.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Minimize.BorderSizePixel = 0
	Minimize.Position = UDim2.new(0, 467, 0, 3)
	Minimize.Size = UDim2.new(0, 25, 0, 25)
	Minimize.Image = "rbxassetid://17484965771"

	Side.Name = "Side"
	Side.Parent = Main
	Side.Active = true
	Side.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
	Side.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Side.BorderSizePixel = 0
	Side.Position = UDim2.new(0, 2, 0, 36)
	Side.Size = UDim2.new(0, 129, 0, 312)

	SideC.CornerRadius = UDim.new(0, 6)
	SideC.Name = "SideC"
	SideC.Parent = Side

	TabHolder.Name = "TabHolder"
	TabHolder.Parent = Side
	TabHolder.Active = true
	TabHolder.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
	TabHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TabHolder.BorderSizePixel = 0
	TabHolder.Position = UDim2.new(0, 0, 0, 6)
	TabHolder.Size = UDim2.new(0, 125, 0, 299)
	TabHolder.ScrollBarThickness = 0

	TabHolderLL.Name = "TabHolderLL"
	TabHolderLL.Parent = TabHolder
	TabHolderLL.SortOrder = Enum.SortOrder.LayoutOrder
	TabHolderLL.Padding = UDim.new(0, 5)

	TabHolderP.Name = "TabHolderP"
	TabHolderP.Parent = TabHolder
	TabHolderP.PaddingLeft = UDim.new(0, 4)
	TabHolderP.PaddingTop = UDim.new(0, 7)

	TabHolderLL:GetPropertyChangedSignal"AbsoluteContentSize":Connect(function()
		TabHolder.CanvasSize = UDim2.new(0, 0, 0, TabHolderLL.AbsoluteContentSize.Y + 14)
	end)

	Utilities:Drag(Main)

	Minimize.MouseButton1Click:Connect(function()
		Utilities:Minimize(Main)
	end)

	Exit.MouseButton1Click:Connect(function()
		Utilities:Minimize(Main, true)
	end)

	local Tabs = {}

	function Tabs:Tab(Name, IconID, LeftColor, RightColor)	
		assert(Name, "A name is required")

		local Tab = Instance.new("TextButton")
		local Title = Instance.new("TextLabel")
		local Icon = Instance.new("ImageLabel")
		local TabC = Instance.new("UICorner")
		local TabLine = Instance.new("Frame")
		local Holder = Instance.new("ScrollingFrame")
		local HolderLL = Instance.new("UIListLayout")
		local HolderP = Instance.new("UIPadding")

		Tab.Name = "Tab"
		Tab.Parent = TabHolder
		Tab.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		Tab.BorderSizePixel = 0
		Tab.Size = UDim2.new(0, 119, 0, 29)
		Tab.ZIndex = 3
		Tab.AutoButtonColor = false
		Tab.Font = Enum.Font.Gotham
		Tab.Text = ""

		if LeftColor and RightColor then
			Tab.BackgroundColor3 = Color3.fromRGB(110, 110, 110)
			local TabGradient = Instance.new("UIGradient")
			TabGradient.Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, LeftColor),
				ColorSequenceKeypoint.new(1, RightColor) 
			})
			TabGradient.Parent = Tab
		else
			Tab.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		end

		Title.Name = "Title"
		Title.Parent = Tab
		Title.AnchorPoint = Vector2.new(0, 0.5)
		Title.BackgroundTransparency = 1.000
		Title.Position = UDim2.new(-0.0780716613, 40, 0.483872145, 0)
		Title.Size = UDim2.new(0.103282258, 76, 0.645159662, 0)
		Title.ZIndex = 3
		Title.Font = Enum.Font.GothamMedium
		Title.Text = Name
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextSize = 14.000
		Title.TextXAlignment = Enum.TextXAlignment.Left

		Icon.Name = "Icon"
		Icon.Parent = Tab
		Icon.AnchorPoint = Vector2.new(0, 0.5)
		Icon.BackgroundTransparency = 1.000
		Icon.Position = UDim2.new(-0.050999999, 12, 0.5, 0)
		Icon.Size = UDim2.new(0, 19, 0, 19)
		Icon.ZIndex = 3
		Icon.Image = string.format("rbxassetid://%s", IconID)
		Icon.ScaleType = Enum.ScaleType.Fit

		TabC.CornerRadius = UDim.new(0, 3)
		TabC.Name = "TabC"
		TabC.Parent = Tab

		TabLine.Name = "TabLine"
		TabLine.Parent = Tab
		TabLine.BackgroundColor3 = ThemeColor
		TabLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
		TabLine.BorderSizePixel = 0
		TabLine.Position = UDim2.new(0.00277325278, 0, 0.934999526, 3)
		TabLine.Size = UDim2.new(0, 0, 0, 1)
		TabLine.ZIndex = 4

		local gradient = Instance.new("UIGradient")
		gradient.Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0),        
			NumberSequenceKeypoint.new(0.25, 0.5),    
			NumberSequenceKeypoint.new(0.5, 0.75),    
			NumberSequenceKeypoint.new(0.75, 0.85),   
			NumberSequenceKeypoint.new(1, 1)          
		})
		gradient.Parent = TabLine

		Holder.Name = "Holder"
		Holder.Parent = Main
		Holder.Active = true
		Holder.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
		Holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Holder.BorderSizePixel = 0
		Holder.Position = UDim2.new(0, 140, 0, 41)
		Holder.Size = UDim2.new(0, 383, 0, 299)
		Holder.Visible = false
		Holder.ScrollBarThickness = 3
		Holder.ScrollBarImageColor3 = Color3.fromRGB(47, 47, 47)

		HolderLL.Name = "HolderLL"
		HolderLL.Parent = Holder
		HolderLL.SortOrder = Enum.SortOrder.LayoutOrder
		HolderLL.Padding = UDim.new(0, 6)

		HolderP.Name = "HolderP"
		HolderP.Parent = Holder
		HolderP.PaddingTop = UDim.new(0, 6)

		HolderLL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			Holder.CanvasSize = UDim2.new(0, 0, 0, HolderLL.AbsoluteContentSize.Y + 14)
		end)

		if not Library.CurrentTab then
			Utilities:ChangeTab(Tab, Holder)
		end

		Tab.MouseButton1Click:Connect(function()
			Utilities:ChangeTab(Tab, Holder)
		end)

		local Sections = {}

		function Sections:Section(Name, Locked)
			local Section = Instance.new("Frame")
			local SectionC = Instance.new("UICorner")
			local Title = Instance.new("TextLabel")
			local TitleLine = Instance.new("Frame")
			local SectionP = Instance.new("UIPadding")
			local SectionLL = Instance.new("UIListLayout")

			Section.Name = "Section"
			Section.Parent = Holder
			Section.Active = true
			Section.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
			Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Section.BorderSizePixel = 0
			Section.Position = UDim2.new(0, 0, 0, -153)
			Section.Size = UDim2.new(0, 370, 0, 370)
			Section.ClipsDescendants = true

			SectionC.CornerRadius = UDim.new(0, 5)
			SectionC.Name = "SectionC"
			SectionC.Parent = Section

			Title.Name = "Title"
			Title.Parent = Section
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1.000
			Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Title.BorderSizePixel = 0
			Title.Size = UDim2.new(0, 376, 0, 26)
			Title.Font = Enum.Font.GothamBold
			Title.Text = Name
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.TextSize = 14.000
			Title.TextXAlignment = Enum.TextXAlignment.Left
			Title.TextYAlignment = Enum.TextYAlignment.Top

			TitleLine.Name = "TitleLine"
			TitleLine.Parent = Title
			TitleLine.BackgroundColor3 = ThemeColor
			TitleLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TitleLine.BorderSizePixel = 0
			TitleLine.Position = UDim2.new(0, 0, 0, 17)
			TitleLine.Size = UDim2.new(0, 164, 0, 1)

			local gradient = Instance.new("UIGradient")
			gradient.Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 0),
				NumberSequenceKeypoint.new(0.25, 0.5),
				NumberSequenceKeypoint.new(0.5, 0.75),
				NumberSequenceKeypoint.new(0.75, 0.85),
				NumberSequenceKeypoint.new(1, 1)
			})
			gradient.Parent = TitleLine

			SectionP.Name = "SectionP"
			SectionP.Parent = Section
			SectionP.PaddingLeft = UDim.new(0, 6)
			SectionP.PaddingTop = UDim.new(0, 6)

			SectionLL.Name = "SectionLL"
			SectionLL.Parent = Section
			SectionLL.SortOrder = Enum.SortOrder.LayoutOrder
			SectionLL.Padding = UDim.new(0, 6)

			SectionLL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				Section.Size = UDim2.new(0, 370, 0, SectionLL.AbsoluteContentSize.Y + 14)
			end)

			if Locked then
				local OverlayHolder = Instance.new("Folder")
				OverlayHolder.Name = "OverlayHolder"
				OverlayHolder.Parent = Section

				local LockOverlay = Instance.new("Frame")
				LockOverlay.Name = "LockOverlay"
				LockOverlay.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
				LockOverlay.BackgroundTransparency = 0.5
				LockOverlay.BorderSizePixel = 0
				LockOverlay.Position = UDim2.new(0, -6, 0, -6)
				LockOverlay.Size = UDim2.new(1, 12, 1, 12)
				LockOverlay.ZIndex = 4
				LockOverlay.Parent = OverlayHolder

				local LockCorner = Instance.new("UICorner")
				LockCorner.CornerRadius = UDim.new(0, 5)
				LockCorner.Parent = LockOverlay

				local Blocker = Instance.new("TextButton")
				Blocker.Name = "InputBlocker"
				Blocker.BackgroundTransparency = 1
				Blocker.Position = UDim2.new(0, 0, 0, 0)
				Blocker.Size = UDim2.new(1, 0, 1, 0)
				Blocker.Text = ""
				Blocker.AutoButtonColor = false
				Blocker.ZIndex = 5
				Blocker.Parent = LockOverlay
			end

			local Components = {}

			function Components:Button(Name, CallBack)
				Name, CallBack = Name or "Button", CallBack or function() end
				local Button = Instance.new("TextButton")
				local ButtonC = Instance.new("UICorner")
				Button.Name = "Button"
				Button.Parent = Section
				Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				Button.BorderColor3 = Color3.fromRGB(47, 47, 47)
				Button.BorderSizePixel = 0
				Button.Position = UDim2.new(0, 0, 0, 47)
				Button.Size = UDim2.new(0, 358, 0, 24)
				Button.AutoButtonColor = false
				Button.Font = Enum.Font.Gotham
				Button.Text = string.format("  %s", Name)
				Button.TextColor3 = Color3.fromRGB(255, 255, 255)
				Button.TextSize = 12.000
				Button.TextXAlignment = Enum.TextXAlignment.Left
				ButtonC.CornerRadius = UDim.new(0, 4)
				ButtonC.Name = "ButtonC"
				ButtonC.Parent = Button
				Button.MouseButton1Click:Connect(function()
					task.spawn(CallBack)
					Utilities:ButtonAnimation(Button)
				end)
				return Button
			end

			function Components:Toggle(Name, Default, CallBack)
				Name, Default, CallBack = Name or "Toggle", Default or false, CallBack or function() end
				local Toggle = Instance.new("TextButton")
				local ToggleC = Instance.new("UICorner")
				local Inner = Instance.new("Frame")
				local InnerC = Instance.new("UICorner")
				local Circle = Instance.new("Frame")
				local CircleC = Instance.new("UICorner")
				Toggle.Name = "Toggle"
				Toggle.Parent = Section
				Toggle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				Toggle.BorderColor3 = Color3.fromRGB(47, 47, 47)
				Toggle.BorderSizePixel = 0
				Toggle.Position = UDim2.new(0, 0, 0, 47)
				Toggle.Size = UDim2.new(0, 358, 0, 24)
				Toggle.AutoButtonColor = false
				Toggle.Font = Enum.Font.Gotham
				Toggle.Text = string.format("  %s", Name)
				Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
				Toggle.TextSize = 12.000
				Toggle.TextXAlignment = Enum.TextXAlignment.Left
				ToggleC.CornerRadius = UDim.new(0, 4)
				ToggleC.Name = "ToggleC"
				ToggleC.Parent = Toggle
				Inner.Name = "Inner"
				Inner.Parent = Toggle
				Inner.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
				Inner.BorderSizePixel = 0
				Inner.Position = UDim2.new(0.8436535, 0, 0.179000363, 0)
				Inner.Size = UDim2.new(0, 49, 0, 15)
				Inner.ZIndex = 3
				InnerC.CornerRadius = UDim.new(0, 4)
				InnerC.Name = "InnerC"
				InnerC.Parent = Inner
				Circle.Name = "Circle"
				Circle.Parent = Inner
				Circle.BackgroundColor3 = Color3.fromRGB(255, 89, 89)
				Circle.BorderSizePixel = 0
				Circle.Position = UDim2.new(0, 3, 0.158000007, 0)
				Circle.Size = UDim2.new(0, 21, 0, 11)
				Circle.ZIndex = 3
				CircleC.CornerRadius = UDim.new(0, 3)
				CircleC.Name = "CircleC"
				CircleC.Parent = Circle
				local ToggleColors = {
					[true] = Color3.fromRGB(91, 154, 76),
					[false] = Color3.fromRGB(255, 89, 89)
				}
				local Funcs, CurrentState = {}, false
				function Funcs.SetState(self, State)
					State = State or not CurrentState
					if State == CurrentState then return false, warn"state already set" end
					CurrentState = State
					Utilities:Tween(Circle, .5, {Position = UDim2.new(0, (State and 24) or 3, 0.158, 0), BackgroundColor3 = ToggleColors[State]})
					task.spawn(function() CallBack(State) end)
				end
				if Default then Funcs:SetState(Default) end
				Toggle.MouseButton1Click:Connect(function() Funcs:SetState() end)
				return Funcs
			end

			function Components:Slider(Name, Default, Min, Max, CallBack)
				Name, Default, Min, Max, CallBack = Name or "Slider", Default or 1, Min or 1, Max or 100, CallBack or function() end
				local Slider = Instance.new("TextButton")
				local ButtonC = Instance.new("UICorner")
				local Title = Instance.new("TextLabel")
				local Number = Instance.new("TextBox")
				local Inner = Instance.new("Frame")
				local InnerC = Instance.new("UICorner")
				local Fill = Instance.new("Frame")
				local FillC = Instance.new("UICorner")
				Slider.Name = "Slider"
				Slider.Parent = Section
				Slider.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				Slider.BorderColor3 = Color3.fromRGB(47, 47, 47)
				Slider.BorderSizePixel = 0
				Slider.Position = UDim2.new(0, 0, 0, 158)
				Slider.Size = UDim2.new(0, 358, 0, 24)  
				Slider.AutoButtonColor = false
				Slider.Font = Enum.Font.Gotham
				Slider.Text = ""
				Slider.TextColor3 = Color3.fromRGB(255, 255, 255)
				Slider.TextSize = 12.000
				Slider.TextXAlignment = Enum.TextXAlignment.Left
				ButtonC.CornerRadius = UDim.new(0, 4)
				ButtonC.Name = "ButtonC"
				ButtonC.Parent = Slider
				Title.Name = "Title"
				Title.Parent = Slider
				Title.BackgroundTransparency = 1.000
				Title.Position = UDim2.new(0, 0, 0, 4)  
				Title.Size = UDim2.new(0, 125, 0, 18)
				Title.ZIndex = 3
				Title.Font = Enum.Font.Gotham
				Title.Text = string.format("  %s", Name)
				Title.TextColor3 = Color3.fromRGB(255, 255, 255)
				Title.TextSize = 13.000
				Title.TextTransparency = 0.100
				Title.TextXAlignment = Enum.TextXAlignment.Left
				Number.Name = "Number"
				Number.Parent = Slider
				Number.BackgroundTransparency = 1.000
				Number.BorderSizePixel = 0
				Number.Position = UDim2.new(0, 327, 0, 4) 
				Number.Size = UDim2.new(0, 24, 0, 16)
				Number.ZIndex = 3
				Number.ClearTextOnFocus = true
				Number.Font = Enum.Font.GothamMedium
				Number.Text = "100"
				Number.TextColor3 = Color3.fromRGB(255, 255, 255)
				Number.TextSize = 12.000
				Number.TextXAlignment = Enum.TextXAlignment.Right
				Inner.Name = "Inner"
				Inner.Parent = Slider
				Inner.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
				Inner.BorderSizePixel = 0
				Inner.Position = UDim2.new(0, 131, 0, (Slider.Size.Y.Offset - Inner.Size.Y.Offset) / 2 - 4)  
				Inner.Size = UDim2.new(0, 190, 0, 8)
				Inner.ZIndex = 3
				InnerC.CornerRadius = UDim.new(0, 10)
				InnerC.Name = "InnerC"
				InnerC.Parent = Inner
				Fill.Name = "Fill"
				Fill.Parent = Inner
				Fill.BackgroundColor3 = ThemeColor
				Fill.BorderSizePixel = 0
				Fill.Position = UDim2.new(0.0, 0, 0, 0)  
				Fill.Size = UDim2.new(0.537774205, 0, 1, 4)  
				Fill.ZIndex = 3
				FillC.CornerRadius = UDim.new(0, 10)
				FillC.Name = "FillC"
				FillC.Parent = Fill
				local Funcs = {}
				function Funcs.SetValue(self, Value)
					local Percent = (Mouse.X - Inner.AbsolutePosition.X) / Inner.AbsoluteSize.X
					if Value then Percent = (Value - Min) / (Max - Min) end
					Percent = math.clamp(Percent, 0, 1)
					Value = Value or math.floor(Min + (Max - Min) * Percent)
					Number.Text = tostring(Value)
					Utilities:Tween(Fill, .1, {Size = UDim2.new(Percent, 0, 1, 0)})
					CallBack(tonumber(Value))
				end
				Funcs:SetValue(Default)
				local Dragging, BoxFocused, Allowed = false, false, {[""] = true, ["-"] = true}
				Inner.InputBegan:Connect(function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 then
						Funcs:SetValue()
						Dragging = true
					end
				end)
				UserInputService.InputEnded:Connect(function(Input)
					if Dragging and Input.UserInputType == Enum.UserInputType.MouseButton1 then
						Dragging = false
					end
				end)
				UserInputService.InputChanged:Connect(function(Input)
					if Dragging and Input.UserInputType == Enum.UserInputType.MouseMovement then
						Funcs:SetValue()
					end
				end)
				Number.Focused:Connect(function() BoxFocused = true end)
				Number.FocusLost:Connect(function()
					if not tonumber(Number.Text) then Number.Text = Default end
					if tonumber(Number.Text) < Min then Funcs:SetValue(Min) end
					BoxFocused = false
				end)
				Number:GetPropertyChangedSignal"Text":Connect(function()
					if not BoxFocused then return end
					if Number.Text == "" then return end
					if not tonumber(Number.Text) then Number.Text = "" end
					if tonumber(Number.Text) > Max then Funcs:SetValue(Max) end
					Funcs:SetValue(tonumber(Number.Text))
				end)
			end

			function Components:TextBox(Name, Default, CallBack)
				Name, Default, CallBack = Name or "TextBox", Default or "Text", CallBack or function() end
				local TextBox = Instance.new("TextButton")
				local TextBoxC = Instance.new("UICorner")
				local Input = Instance.new("TextBox")
				local InputC = Instance.new("UICorner")
				TextBox.Name = "TextBox"
				TextBox.Parent = Section
				TextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				TextBox.BorderColor3 = Color3.fromRGB(47, 47, 47)
				TextBox.BorderSizePixel = 0
				TextBox.Position = UDim2.new(0, 0, 0, 47)
				TextBox.Size = UDim2.new(0, 358, 0, 31)
				TextBox.AutoButtonColor = false
				TextBox.Font = Enum.Font.Gotham
				TextBox.Text = string.format("  %s", Name)
				TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextBox.TextSize = 12.000
				TextBox.TextXAlignment = Enum.TextXAlignment.Left
				TextBoxC.CornerRadius = UDim.new(0, 4)
				TextBoxC.Name = "TextBoxC"
				TextBoxC.Parent = TextBox
				Input.Name = "Input"
				Input.Parent = TextBox
				Input.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
				Input.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Input.BorderSizePixel = 0
				Input.Position = UDim2.new(0.796167493, 0, 0.179000363, 0)
				Input.Size = UDim2.new(0, 65, 0, 19)
				Input.Font = Enum.Font.Gotham
				Input.Text = Default
				Input.TextColor3 = Color3.fromRGB(255, 255, 255)
				Input.TextSize = 12.000
				Input.TextWrapped = true
				InputC.CornerRadius = UDim.new(0, 4)
				InputC.Name = "InputC"
				InputC.Parent = Input
				Input.FocusLost:Connect(function()
					if Input.Text == "" then Input.Text = Default end
					CallBack(Input.Text)
				end)
			end

			function Components:KeyBind(Name, Default, CallBack)
				Name, Default, CallBack = Name or "KeyBind", Default or "None", CallBack or function() end
				Default = (typeof(Default) == "string" and Enum.KeyCode[Default] or Default)
				local KeyTxt, BindKey = (Default and (ShortNames[Default.Name] or Default.Name) or "None"), Default
				local KeyBind = Instance.new("TextButton")
				local KeyBindC = Instance.new("UICorner")
				local Input = Instance.new("TextButton")
				local InputC = Instance.new("UICorner")
				KeyBind.Name = "KeyBind"
				KeyBind.Parent = Section
				KeyBind.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				KeyBind.BorderColor3 = Color3.fromRGB(47, 47, 47)
				KeyBind.BorderSizePixel = 0
				KeyBind.Position = UDim2.new(0, 0, 0, 47)
				KeyBind.Size = UDim2.new(0, 358, 0, 31)
				KeyBind.AutoButtonColor = false
				KeyBind.Font = Enum.Font.Gotham
				KeyBind.Text = string.format("  %s", Name)
				KeyBind.TextColor3 = Color3.fromRGB(255, 255, 255)
				KeyBind.TextSize = 12.000
				KeyBind.TextXAlignment = Enum.TextXAlignment.Left
				KeyBindC.CornerRadius = UDim.new(0, 4)
				KeyBindC.Name = "KeyBindC"
				KeyBindC.Parent = KeyBind
				Input.Name = "Input"
				Input.Parent = KeyBind
				Input.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
				Input.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Input.BorderSizePixel = 0
				Input.Position = UDim2.new(0.796167493, 0, 0.179000363, 0)
				Input.Size = UDim2.new(0, 65, 0, 19)
				Input.Font = Enum.Font.Gotham
				Input.Text = KeyTxt
				Input.TextColor3 = Color3.fromRGB(255, 255, 255)
				Input.TextSize = 12.000
				Input.TextWrapped = true
				Input.AutoButtonColor = false
				InputC.CornerRadius = UDim.new(0, 4)
				InputC.Name = "InputC"
				InputC.Parent = Input
				UserInputService.InputBegan:Connect(function(Input, Typing)
					if Typing or Input.KeyCode ~= BindKey then return end
					CallBack(BindKey.Name)
				end)
				Input.MouseButton1Click:Connect(function()
					Input.Text = "..."
					task.wait()
					local Key = UserInputService.InputEnded:Wait()
					if Key.UserInputType ~= Enum.UserInputType.Keyboard then
						Input.Text = KeyTxt
						return
					end
					if BannedKeys[tostring(Key.KeyCode.Name)] then
						Input.Text = KeyTxt
						return
					end
					BindKey = Enum.KeyCode[tostring(Key.KeyCode.Name)]
					Input.Text = ShortNames[tostring(Key.KeyCode.Name)] or tostring(Key.KeyCode.Name)
				end)
			end

			function Components:DropDown(Name, Options, Multi, CallBack)
				Name, Options, Multi, CallBack = Name or "DropDown", Options or {}, Multi or false, CallBack or function() end
				local Container = Instance.new("TextButton")
				local ContainerC = Instance.new("UICorner")
				local Dropdown = Instance.new("TextButton")
				local DropDownC = Instance.new("UICorner")
				local Toggle = Instance.new("TextButton")
				local Search = Instance.new("TextBox")
				local SearchP = Instance.new("UIPadding")
				local ContainerLL = Instance.new("UIListLayout")
				Container.Name = "Container"
				Container.Parent = Section
				Container.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				Container.BackgroundTransparency = 1.000
				Container.BorderColor3 = Color3.fromRGB(47, 47, 47)
				Container.BorderSizePixel = 0
				Container.Position = UDim2.new(0, 0, 0, 32)
				Container.Size = UDim2.new(0, 358, 0, 30)
				Container.AutoButtonColor = false
				Container.Font = Enum.Font.Gotham
				Container.Text = ""
				Container.TextColor3 = Color3.fromRGB(255, 255, 255)
				Container.TextSize = 12.000
				Container.TextXAlignment = Enum.TextXAlignment.Left
				Container.ClipsDescendants = true
				ContainerC.CornerRadius = UDim.new(0, 4)
				ContainerC.Name = "ContainerC"
				ContainerC.Parent = Container
				Dropdown.Name = "Dropdown"
				Dropdown.Parent = Container
				Dropdown.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				Dropdown.BorderColor3 = Color3.fromRGB(47, 47, 47)
				Dropdown.BorderSizePixel = 0
				Dropdown.Position = UDim2.new(-0.0167597774, 0, 0, 0)
				Dropdown.Size = UDim2.new(0, 358, 0, 30)
				Dropdown.AutoButtonColor = false
				Dropdown.Font = Enum.Font.Gotham
				Dropdown.Text = ""
				Dropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
				Dropdown.TextSize = 12.000
				Dropdown.TextXAlignment = Enum.TextXAlignment.Left
				DropDownC.CornerRadius = UDim.new(0, 4)
				DropDownC.Name = "DropDownC"
				DropDownC.Parent = Dropdown
				Toggle.Name = "Toggle"
				Toggle.Parent = Dropdown
				Toggle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				Toggle.BackgroundTransparency = 1.000
				Toggle.BorderColor3 = Color3.fromRGB(47, 47, 47)
				Toggle.BorderSizePixel = 0
				Toggle.Position = UDim2.new(0.918994427, 0, 0, 0)
				Toggle.Size = UDim2.new(0, 29, 0, 30)
				Toggle.AutoButtonColor = false
				Toggle.Font = Enum.Font.GothamBold
				Toggle.Text = "+"
				Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
				Toggle.TextSize = 14.000
				Search.Name = "Search"
				Search.Parent = Dropdown
				Search.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
				Search.BackgroundTransparency = 1.000
				Search.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Search.BorderSizePixel = 0
				Search.Position = UDim2.new(0, 0, 0.0333333351, 0)
				Search.Size = UDim2.new(0, 321, 0, 30)
				Search.Font = Enum.Font.Gotham
				Search.Text = Name
				Search.TextColor3 = Color3.fromRGB(255, 255, 255)
				Search.TextSize = 12.000
				Search.TextXAlignment = Enum.TextXAlignment.Left
				SearchP.Name = "SearchP"
				SearchP.Parent = Search
				SearchP.PaddingLeft = UDim.new(0, 5)
				ContainerLL.Name = "ContainerLL"
				ContainerLL.Parent = Container
				ContainerLL.SortOrder = Enum.SortOrder.LayoutOrder
				ContainerLL.Padding = UDim.new(0, 6)
				local Funcs, MultiOptions, IsSearching = {}, {}, false
				local IsOpen
				local function Open()
					IsOpen = not IsOpen
					Utilities:Tween(Container, .5, {Size = UDim2.new(0, 358,0, (IsOpen and ContainerLL.AbsoluteContentSize.Y + 14) or 30)})
				end
				local function ShowAll()
					for i, v in next, Container:GetChildren() do
						if v.Name == "Option" then v.Visible = true end
					end
				end
				local function SearchOption(text)
					if text == "" then ShowAll() end
					for i,v in next, Container:GetChildren() do
						if v.Name == "Option" then
							v.Visible = v.Text:lower():match(text:lower()) and true or false
						end
					end
				end
				Toggle.MouseButton1Click:Connect(function()
					if Options == "PlayerList" then Funcs:SetOptions(Utilities:GetPlayers()) end
					Open()
					Toggle.Text = (Toggle.Text == "+" and "-" or "+")
				end)
				local function RefreshList()
					local NewList = {}
					for i,v in next, MultiOptions do table.insert(NewList, v) end
					for i,v in next, Options do
						if not table.find(NewList, v) then table.insert(NewList, v) end
					end
					return NewList
				end
				function Funcs.AddOption(self, OptionName)
					assert(Name, "A name is required")
					local Option = Instance.new("TextButton")
					local OptionC = Instance.new("UICorner")
					Option.Name = "Option"
					Option.Parent = Container
					Option.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
					Option.BorderColor3 = Color3.fromRGB(47, 47, 47)
					Option.BorderSizePixel = 0
					Option.Position = UDim2.new(0, 0, 0.282258064, 0)
					Option.Size = UDim2.new(0, 358, 0, 25)
					Option.AutoButtonColor = false
					Option.Font = Enum.Font.Gotham
					Option.Text = tostring(OptionName)
					Option.TextColor3 = table.find(MultiOptions, tostring(OptionName)) and Color3.fromRGB(91, 154, 76) or Multi and Color3.fromRGB(255, 89, 89) or Color3.fromRGB(255, 255, 255)
					Option.TextSize = 12.000
					OptionC.CornerRadius = UDim.new(0, 4)
					OptionC.Name = "OptionC"
					OptionC.Parent = Option
					Option.MouseButton1Click:Connect(function()
						if not Multi then
							Search.Text = Option.Text
							CallBack(Option.Text)
							Open()
						else
							if table.find(MultiOptions, Option.Text) then
								table.remove(MultiOptions, table.find(MultiOptions, Option.Text))
							else
								table.insert(MultiOptions, Option.Text)
							end
							Funcs:SetOptions(RefreshList())
							CallBack(MultiOptions)
							Search.Text = "Selected - "
							for i, v in next, MultiOptions do
								Search.Text = (i == 1 and Search.Text..v) or Search.Text..", "..v
							end
							if not MultiOptions[1] then
								Search.Text = Name
								ShowAll()
								return
							end
						end
					end)
				end
				function Funcs.ClearOptions(self)
					for i, v in next, Container:GetChildren() do
						if v.Name == "Option" then v:Destroy() end
					end
				end
				function Funcs.SetOptions(self, Options)
					Funcs:ClearOptions()
					for i, v in next, Options do Funcs:AddOption(v) end
				end
				Search.Focused:Connect(function() IsSearching = true end)
				Search.FocusLost:Connect(function()
					if Search.Text == "" and Multi and MultiOptions[1] then
						for i, v in next, MultiOptions do
							Search.Text = (i == 1 and Search.Text..v) or Search.Text..", "..v
						end
					end
					if Search.Text == "" then Search.Text = Name end
					if Search.Text:sub(1, 8) == "Selected" then return end
					IsSearching = false
				end)
				Search:GetPropertyChangedSignal("Text"):Connect(function()
					if not (IsOpen or IsSearching) then return end
					if Search.Text == Name or Search.Text == "" or Search.Text:sub(1, 8) == "Selected" then return ShowAll() end
					SearchOption(Search.Text)
				end)
				Funcs:SetOptions((Options == "PlayerList" and Utilities:GetPlayers()) or Options)
				return Funcs
			end

			function Components:Title(Message)
				assert(Message, "A message is required")
				local Title = Instance.new("TextLabel")
				Title.Name = "Title"
				Title.Parent = Section
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Title.BorderSizePixel = 0
				Title.Size = UDim2.new(0, 376, 0, 18)
				Title.Font = Enum.Font.GothamBold
				Title.Text = Message
				Title.TextColor3 = Color3.fromRGB(255, 255, 255)
				Title.TextSize = 14.000
				Title.TextXAlignment = Enum.TextXAlignment.Left
				return Title
			end

			return Components
		end
		return Sections
	end
	return Tabs
end

function Utilities:Tween(Obj, Duration, Props, ...)
	return TweenService:Create(Obj, TweenInfo.new(Duration, ...), Props):Play()
end

function Utilities:Drag(Frame, Hold)
	Hold = Hold or Frame
	local Dragging, DragInput, DragStart, StartPos
	function Utilities:Update(Input)
		local Delta = Input.Position - DragStart
		Frame.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
	end
	Hold.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 then
			Dragging, DragStart, StartPos = true, Input.Position, Frame.Position
			Input.Changed:Connect(function()
				if Input.UserInputState == Enum.UserInputState.End then Dragging = false end
			end)
		end
	end)
	Frame.InputChanged:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseMovement then DragInput = Input end
	end)
	UserInputService.InputChanged:Connect(function(Input)
		if Input == DragInput and Dragging then Utilities:Update(Input) end
	end)
end

function Utilities:Minimize(Frame, Destroy)
	if Library.IsMinimizing then return end
	Library.IsMinimizing = true
	Utilities:Tween(Frame, .5, {Size = UDim2.new(0, 530,0, ((Library.Closed or Destroy) and 35) or 348)})
	Library.Closed = not Library.Closed
	if Destroy then
		task.wait(.9)
		Frame:Destroy()
	end
	Library.IsMinimizing = false
end

function Utilities:ChangeTab(Tab, Holder)
	if Library.IsChangingTab or (Library.CurrentTab and Library.CurrentTab[1] == Tab) then return end
	if Library.CurrentTab then
		Library.CurrentTab[2].Visible = false
		Utilities:Tween(Library.CurrentTab[1].TabLine, .5, {Size = UDim2.new(0, 0, 0, 1)})
	end
	Utilities:Tween(Tab.TabLine, .5, {Size = UDim2.new(0, 119, 0, 1)})
	Holder.Visible = true
	Library.CurrentTab = {Tab, Holder}
end

function Utilities:ButtonAnimation(Btn)
	Utilities:Tween(Btn, .1, {Size = UDim2.new(0, 348,0, 24)})
	task.wait(.1)
	Utilities:Tween(Btn, .1, {Size = UDim2.new(0, 358,0, 24)})
end

local PlayerList = Players:GetPlayers()
local PlayerAdded = Players.PlayerAdded:Connect(function(Player) rawset(PlayerList, #PlayerList + 1, tostring(Player)) end)
local PlayerRemoved = Players.PlayerRemoving:Connect(function(Player) table.remove(PlayerList, table.find(PlayerList, tostring(Player))) end)

function Utilities:GetPlayers()
	return PlayerList
end

function Utilities:Load(UI)
	local Facts = {
		"It takes 8 minutes for light to reach Earth from the Sun.",
		"Light cannot escape a black hole.",
		"Our galaxy spans over 100,000 light-years.",
		"A day on Venus is longer than an earth year.",
		"Jupiter has 79 known moons.",
		"Neutron stars are incredibly dense.",
		"More stars exist than grains of sand on Earth.",
		"The Sun holds 99.86 percent of the solar system's mass.",
		"Mars has the tallest volcano, Olympus Mons.",
		"A spoonful of neutron star weighs a billion tons.",
		"Saturn's rings are mostly ice.",
		"Pluto is a dwarf planet.",
		"The Milky Way will collide with Andromeda in 4.5 billion years.",
		"One million Earths fit inside the Sun.",
		"Venus is the hottest planet.",
		"Comets are icy, dusty snowballs.",
		"Jupiter's day lasts just 10 hours.",
		"There's a massive cloud of alcohol in space.",
		"The Moon's surface is covered in dust.",
		"Earth is the only planet with liquid water.",
	}
	local Fact = Facts[math.random(1, #Facts)]
	local Load = Instance.new("Frame")
	local LoadC = Instance.new("UICorner")
	local OuterL = Instance.new("Frame")
	local OuterC = Instance.new("UICorner")
	local InnerL = Instance.new("Frame")
	local InnerC = Instance.new("UICorner")
	local LoadingText = Instance.new("TextLabel")
	local Console = Instance.new("ScrollingFrame")
	local ConsoleC = Instance.new("UICorner")
	local FunFact = Instance.new("TextLabel")
	local FunFact_2 = Instance.new("TextLabel")
	local ConsoleP = Instance.new("UIPadding")
	local ConsoleLL = Instance.new("UIListLayout")
	Load.Name = "Load"
	Load.Parent = UI
	Load.Active = true
	Load.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
	Load.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Load.BorderSizePixel = 0
	Load.ClipsDescendants = true
	Load.Position = UDim2.new(0.00377358496, 0, 0.103448279, 0)
	Load.Size = UDim2.new(0, 528, 0, 311)
	Load.ZIndex = 5
	LoadC.CornerRadius = UDim.new(0, 6)
	LoadC.Name = "LoadC"
	LoadC.Parent = Load
	OuterL.Name = "OuterL"
	OuterL.Parent = Load
	OuterL.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	OuterL.BorderColor3 = Color3.fromRGB(0, 0, 0)
	OuterL.BorderSizePixel = 0
	OuterL.Position = UDim2.new(0.172217861, 0, 0.148458302, 0)
	OuterL.Size = UDim2.new(0, 344, 0, 19)
	OuterL.ZIndex = 6
	OuterC.CornerRadius = UDim.new(1, 0)
	OuterC.Name = "OuterC"
	OuterC.Parent = OuterL
	InnerL.Name = "InnerL"
	InnerL.Parent = OuterL
	InnerL.BackgroundColor3 = ThemeColor
	InnerL.BorderColor3 = Color3.fromRGB(0, 0, 0)
	InnerL.BorderSizePixel = 0
	InnerL.Position = UDim2.new(-0.000180976334, 0, 0.0436562002, 0)
	InnerL.Size = UDim2.new(0, 0, 0, 18)
	InnerL.ZIndex = 6
	InnerC.CornerRadius = UDim.new(1, 0)
	InnerC.Name = "InnerC"
	InnerC.Parent = InnerL
	LoadingText.Name = "LoadingText"
	LoadingText.Parent = Load
	LoadingText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LoadingText.BackgroundTransparency = 1.000
	LoadingText.BorderColor3 = Color3.fromRGB(0, 0, 0)
	LoadingText.BorderSizePixel = 0
	LoadingText.Position = UDim2.new(0.297312886, 0, 0.0270919558, 0)
	LoadingText.Size = UDim2.new(0, 213, 0, 29)
	LoadingText.ZIndex = 6
	LoadingText.Font = Enum.Font.Gotham
	LoadingText.Text = "Fetching Game Script"
	LoadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
	LoadingText.TextSize = 21.000
	Console.Name = "Console"
	Console.Parent = Load
	Console.Active = true
	Console.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Console.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Console.BorderSizePixel = 0
	Console.Position = UDim2.new(0.0150208911, 0, 0.250755578, 0)
	Console.Size = UDim2.new(0, 509, 0, 163)
	Console.ZIndex = 6
	Console.CanvasPosition = Vector2.new(0, 0)
	Console.ScrollBarThickness = 0
	Console.CanvasSize = UDim2.new(0, 0)
	ConsoleC.CornerRadius = UDim.new(0, 6)
	ConsoleC.Name = "ConsoleC"
	ConsoleC.Parent = Console
	FunFact.Name = "FunFact"
	FunFact.Parent = Load
	FunFact.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	FunFact.BackgroundTransparency = 1.000
	FunFact.BorderColor3 = Color3.fromRGB(0, 0, 0)
	FunFact.BorderSizePixel = 0
	FunFact.Position = UDim2.new(0.00564609887, 0, 0.889949083, 0)
	FunFact.Size = UDim2.new(0, 517, 0, 20)
	FunFact.ZIndex = 6
	FunFact.Font = Enum.Font.Gotham
	FunFact.Text = string.format(Fact)
	FunFact.TextColor3 = Color3.fromRGB(255, 255, 255)
	FunFact.TextSize = 17.000
	FunFact_2.Name = "FunFact"
	FunFact_2.Parent = Load
	FunFact_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	FunFact_2.BackgroundTransparency = 1.000
	FunFact_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	FunFact_2.BorderSizePixel = 0
	FunFact_2.Position = UDim2.new(0.301100761, 0, 0.796701491, 0)
	FunFact_2.Size = UDim2.new(0, 205, 0, 23)
	FunFact_2.ZIndex = 6
	FunFact_2.Font = Enum.Font.Gotham
	FunFact_2.Text = "Space Fact"
	FunFact_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	FunFact_2.TextSize = 27.000
	ConsoleP.Name = "ConsoleP"
	ConsoleP.Parent = Console
	ConsoleP.PaddingLeft = UDim.new(0, 6)
	ConsoleP.PaddingTop = UDim.new(0, 5)
	ConsoleLL.Name = "ConsoleLL"
	ConsoleLL.Parent = Console
	ConsoleLL.SortOrder = Enum.SortOrder.LayoutOrder
	ConsoleLL.VerticalAlignment = Enum.VerticalAlignment.Bottom

	InnerL:GetPropertyChangedSignal("Size"):Connect(function()
		if InnerL.Size.X.Scale >= 1 then
			task.wait(0.5)
			Load:Destroy()
		end
	end)

	local function SendMessage(Msg)
		local Message = Instance.new("TextLabel")
		Message.Name = "Message"
		Message.Parent = Console
		Message.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Message.BackgroundTransparency = 1.000
		Message.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Message.BorderSizePixel = 0
		Message.Size = UDim2.new(0, 494, 0, 19)
		Message.ZIndex = 6
		Message.Font = Enum.Font.Gotham
		Message.Text = Msg
		Message.TextColor3 = Color3.fromRGB(255, 255, 255)
		Message.TextSize = 16.000
		Message.TextXAlignment = Enum.TextXAlignment.Left
	end

	local function UpdateProgress(Scale)
		Utilities:Tween(InnerL, .15, {Size = UDim2.new(Scale, 0, 0, 18)})
	end

	task.wait(0.3)
	UpdateProgress(0.5)
	SendMessage("[LOAD]: Initializing...")
	task.wait(1)
	UpdateProgress(0.7)
	SendMessage("[LOAD]: Checking Version...")
	task.wait(0.2)
	UpdateProgress(1)
	SendMessage("[DONE]: Welcome to Celestial!")
end

local activeNotifications = {}
function Library:Notify(Name, Msg, Duration)
	if Bools.ShutdownActive then return end
	local Noti = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Top = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local Title = Instance.new("TextLabel")
	local TopBar = Instance.new("Frame")
	local Message = Instance.new("TextLabel")
	local ProgressBar = Instance.new("Frame")
	Noti.Name = "Noti"
	Noti.DisplayOrder = 10
	Noti.Parent = game:GetService("CoreGui")
	Main.Name = "Main"
	Main.Parent = Noti
	Main.AnchorPoint = Vector2.new(1, 1)
	Main.BackgroundColor3 = Color3.fromRGB(21, 21, 21)
	Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(1, 170, 1, -20)
	Main.Size = UDim2.new(0, 169.5, 0, 90) 
	UICorner.CornerRadius = UDim.new(0, 3)
	UICorner.Parent = Main
	Top.Name = "Top"
	Top.Parent = Main
	Top.BackgroundColor3 = ThemeColor
	Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Top.BorderSizePixel = 0
	Top.Size = UDim2.new(0, 169, 0, 19.5)
	UICorner_2.CornerRadius = UDim.new(0, 3)
	UICorner_2.Parent = Top
	Title.Name = "Title"
	Title.Parent = Top
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0.0207100585, 0, 0.102564104, 0)
	Title.Size = UDim2.new(0, 162, 0, 15.5)
	Title.ZIndex = 3
	Title.Font = Enum.Font.Gotham
	Title.Text = Name
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 12.5
	TopBar.Name = "TopBar"
	TopBar.Parent = Main
	TopBar.BackgroundColor3 = ThemeColor
	TopBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TopBar.BorderSizePixel = 0
	TopBar.Position = UDim2.new(0, 0, 0.157894731, 0)
	TopBar.Size = UDim2.new(0, 169, 0, 6)
	Message.Name = "Message"
	Message.Parent = Main
	Message.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Message.BackgroundTransparency = 1.000
	Message.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Message.BorderSizePixel = 0
	Message.Position = UDim2.new(0.0177601501, 0, 0.35, 0) 
	Message.Size = UDim2.new(0, 162, 0, 40) 
	Message.ZIndex = 3
	Message.Font = Enum.Font.Gotham
	Message.Text = Msg
	Message.TextColor3 = Color3.fromRGB(255, 255, 255)
	Message.TextSize = 11
	Message.TextWrapped = true
	Message.TextXAlignment = Enum.TextXAlignment.Center 
	Message.TextYAlignment = Enum.TextYAlignment.Center 
	ProgressBar.Name = "ProgressBar"
	ProgressBar.Parent = Main
	ProgressBar.BackgroundColor3 = ThemeColor
	ProgressBar.BorderSizePixel = 0
	ProgressBar.Position = UDim2.new(0, 0, 1, -3) 
	ProgressBar.Size = UDim2.new(0, 0, 0, 3) 
	for i, activeNoti in ipairs(activeNotifications) do
		local newYPos = UDim2.new(1, -20, 1, -20 - (Main.Size.Y.Offset + 10) * i)
		TweenService:Create(activeNoti, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
			Position = newYPos
		}):Play()
	end
	table.insert(activeNotifications, Main)
	local tweenIn = TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
		Position = UDim2.new(1, -20, 1, -20)
	})
	tweenIn:Play()
	tweenIn.Completed:Wait()
	local progressTween = TweenService:Create(ProgressBar, TweenInfo.new(Duration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
		Size = UDim2.new(1, 0, 0, 3)
	})
	progressTween:Play()
	task.wait(Duration)
	local tweenOut = TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
		Position = UDim2.new(1, 170, 1, -20)
	})
	tweenOut:Play()
	tweenOut.Completed:Wait()
	Noti:Destroy()
	for i, activeNoti in ipairs(activeNotifications) do
		if activeNoti == Main then
			table.remove(activeNotifications, i)
			break
		end
	end
	for i, activeNoti in ipairs(activeNotifications) do
		local newYPos = UDim2.new(1, -20, 1, -20 - (Main.Size.Y.Offset + 10) * (i - 1))
		TweenService:Create(activeNoti, TweenInfo.new(0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
			Position = newYPos
		}):Play()
	end
end

local fileName = "Celestial/Config/ToggleLoadingScreen.json"
function Celestial:loadState()
	local success, result = pcall(function() return readfile(fileName) end)
	if success and result then
		local success, decoded = pcall(function() return game:GetService("HttpService"):JSONDecode(result) end)
		if success and decoded and decoded.ToggleLoadingScreen ~= nil then
			return decoded.ToggleLoadingScreen
		end
	end
	return true
end
function Celestial:saveState(state)
	local jsonData = game:GetService("HttpService"):JSONEncode({ ToggleLoadingScreen = state })
	writefile(fileName, jsonData)
end
local ToggleLoadingScreen = Celestial:loadState()

Lib = Library:Init("Celestial", "  Recode", ToggleLoadingScreen)

-- Sound
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://826129174" 
sound.Parent = game.Workspace 
sound:Play()

-- Platform Detection
local platform = UserInputService:GetPlatform()
if platform == Enum.Platform.Windows or platform == Enum.Platform.OSX then
	Bools.desktopdetected = true
elseif platform == Enum.Platform.IOS or platform == Enum.Platform.Android then
	Bools.mobiledetected = true
else
	Celestial:DebugLog("Platform Detection", "Unable to determine user platform")
end

function Celestial:EnsureLogsFolder()
	local logsFolder = "Celestial/Logs"
	if not isfolder("Celestial") then makefolder("Celestial") end
	if not isfolder(logsFolder) then makefolder(logsFolder) end
end
Celestial:EnsureLogsFolder()
function Celestial:LogError(errorMessage)
	self:EnsureLogsFolder()
	local logFilePath = "Celestial/Logs/ErrorLogs.txt"
	local currentLogs = ""
	if isfile(logFilePath) then currentLogs = readfile(logFilePath) end
	local date = os.date("%Y-%m-%d %H:%M:%S")
	local formattedMessage = string.format("Error Logged - [%s]\n%s\n\n", date, errorMessage)
	currentLogs = currentLogs .. formattedMessage
	writefile(logFilePath, currentLogs)
end

function Celestial:Walkspeed()
	local humanoid = game.Players.LocalPlayer.Character.Humanoid
	humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
		humanoid.WalkSpeed = Vars.WalkspeedValue
	end)
	humanoid.WalkSpeed = Vars.WalkspeedValue
end

function Celestial:Flight()
	local player = game.Players.LocalPlayer
	repeat wait() until player and player.Character and player.Character:FindFirstChild("Head") and player.Character:FindFirstChild("Humanoid")
	local mouse = player:GetMouse()
	repeat wait() until mouse
	local torso = player.Character.Head
	local flying = false
	local runServiceConnection
	local function Fly()
		local bg = Instance.new("BodyGyro", torso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = torso.CFrame
		local bv = Instance.new("BodyVelocity", torso)
		bv.velocity = Vector3.new(0, 0.1, 0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
		repeat
			wait()
			player.Character.Humanoid.PlatformStand = true
			if Tables.FlySettings.ctrl.l + Tables.FlySettings.ctrl.r ~= 0 or Tables.FlySettings.ctrl.f + Tables.FlySettings.ctrl.b ~= 0 then
				Tables.FlySettings.speed = Tables.FlySettings.FlightSpeedNum
			elseif Tables.FlySettings.speed ~= 0 then
				Tables.FlySettings.speed = 0
			end
			if (Tables.FlySettings.ctrl.l + Tables.FlySettings.ctrl.r) ~= 0 or (Tables.FlySettings.ctrl.f + Tables.FlySettings.ctrl.b) ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CFrame.lookVector * (Tables.FlySettings.ctrl.f + Tables.FlySettings.ctrl.b)) +
					((game.Workspace.CurrentCamera.CFrame * CFrame.new(Tables.FlySettings.ctrl.l + Tables.FlySettings.ctrl.r, (Tables.FlySettings.ctrl.f + Tables.FlySettings.ctrl.b) * 0.2, 0).p) - 
					game.Workspace.CurrentCamera.CFrame.p)) * Tables.FlySettings.speed
				Tables.FlySettings.lastctrl = { f = Tables.FlySettings.ctrl.f, b = Tables.FlySettings.ctrl.b, l = Tables.FlySettings.ctrl.l, r = Tables.FlySettings.ctrl.r }
			elseif Tables.FlySettings.speed ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CFrame.lookVector * (Tables.FlySettings.lastctrl.f + Tables.FlySettings.lastctrl.b)) +
					((game.Workspace.CurrentCamera.CFrame * CFrame.new(Tables.FlySettings.lastctrl.l + Tables.FlySettings.lastctrl.r, (Tables.FlySettings.lastctrl.f + Tables.FlySettings.lastctrl.b) * 0.2, 0).p) - 
					game.Workspace.CurrentCamera.CFrame.p)) * Tables.FlySettings.speed
			else
				bv.velocity = Vector3.new(0, 0, 0)
			end
			bg.cframe = game.Workspace.CurrentCamera.CFrame * CFrame.Angles(-math.rad((Tables.FlySettings.ctrl.f + Tables.FlySettings.ctrl.b) * Tables.FlySettings.speed / Tables.FlySettings.FlightSpeedNum), 0, 0)
		until not flying
		Tables.FlySettings.ctrl = { f = 0, b = 0, l = 0, r = 0 }
		Tables.FlySettings.lastctrl = { f = 0, b = 0, l = 0, r = 0 }
		Tables.FlySettings.speed = 0
		bg:Destroy()
		bv:Destroy()
		player.Character.Humanoid.PlatformStand = false
	end
	mouse.KeyDown:Connect(function(key)
		local lowerKey = key:lower()
		if lowerKey == Tables.FlySettings.FlightKey and Tables.FlySettings.FlightEnabled then
			if flying then flying = false else flying = true Fly() end
		elseif lowerKey == "w" then Tables.FlySettings.ctrl.f = 1
		elseif lowerKey == "s" then Tables.FlySettings.ctrl.b = -1
		elseif lowerKey == "a" then Tables.FlySettings.ctrl.l = -1
		elseif lowerKey == "d" then Tables.FlySettings.ctrl.r = 1
		end
	end)
	mouse.KeyUp:Connect(function(key)
		local lowerKey = key:lower()
		if lowerKey == "w" then Tables.FlySettings.ctrl.f = 0
		elseif lowerKey == "s" then Tables.FlySettings.ctrl.b = 0
		elseif lowerKey == "a" then Tables.FlySettings.ctrl.l = 0
		elseif lowerKey == "d" then Tables.FlySettings.ctrl.r = 0
		end
	end)
	if not runServiceConnection then
		runServiceConnection = game:GetService("RunService").Heartbeat:Connect(function()
			if Tables.FlySettings.FlightEnabled ~= lastFlightEnabled then
				lastFlightEnabled = Tables.FlySettings.FlightEnabled
				if not Tables.FlySettings.FlightEnabled and flying then flying = false end
			end
		end)
	end
	Fly()
end
game.Players.LocalPlayer.CharacterAdded:Connect(Celestial.Flight)
Celestial:Flight()

function Celestial:InitExtraUI()
	if Services.Players.LocalPlayer.PlayerGui:FindFirstChild("CelestialExtra") then Services.Players.LocalPlayer.PlayerGui:FindFirstChild("CelestialExtra"):Destroy() end
	local CelestialExtra = Instance.new("ScreenGui")
	local TimeContainer = Instance.new("Frame")
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	local TextLabel = Instance.new("TextLabel")
	local UIStroke = Instance.new("UIStroke")
	local VersionContainer = Instance.new("Frame")
	local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
	local UIStroke_2 = Instance.new("UIStroke")
	local TextLabel_2 = Instance.new("TextLabel")
	CelestialExtra.Name = "CelestialExtra"
	CelestialExtra.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	CelestialExtra.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	CelestialExtra.ResetOnSpawn = false
	TimeContainer.Name = "TimeContainer"
	TimeContainer.Parent = CelestialExtra
	TimeContainer.AnchorPoint = Vector2.new(0.5, 0.5)
	TimeContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	TimeContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TimeContainer.BorderSizePixel = 0
	TimeContainer.Position = UDim2.new(0.988657773, 0, 0.99000001, 0)
	TimeContainer.Size = UDim2.new(0.0300000012, 0, 0.0198518503, 0)
	UIAspectRatioConstraint.Parent = TimeContainer
	UIAspectRatioConstraint.AspectRatio = 2.010
	TextLabel.Parent = TimeContainer
	TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	TextLabel.Size = UDim2.new(0.800000012, 0, 0.899999976, 0)
	TextLabel.Font = Enum.Font.SourceSans
	TextLabel.Text = "20:49"
	TextLabel.TextColor3 = Color3.fromRGB(0, 81, 255)
	TextLabel.TextScaled = true
	TextLabel.TextSize = 14.000
	TextLabel.TextWrapped = true
	UIStroke.Parent = TimeContainer
	UIStroke.Color = Color3.fromRGB(30, 30, 30)
	VersionContainer.Name = "VersionContainer"
	VersionContainer.Parent = CelestialExtra
	VersionContainer.AnchorPoint = Vector2.new(0.5, 0.5)
	VersionContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	VersionContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
	VersionContainer.BorderSizePixel = 0
	VersionContainer.Position = UDim2.new(0.988657713, 0, 0.969217598, 0)
	VersionContainer.Size = UDim2.new(0.0299999993, 0, 0.0199999996, 0)
	UIAspectRatioConstraint_2.Parent = VersionContainer
	UIAspectRatioConstraint_2.AspectRatio = 2.010
	UIStroke_2.Parent = VersionContainer
	UIStroke_2.Color = Color3.fromRGB(30, 30, 30)
	TextLabel_2.Parent = VersionContainer
	TextLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
	TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel_2.BackgroundTransparency = 1.000
	TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel_2.BorderSizePixel = 0
	TextLabel_2.Position = UDim2.new(0.5, 0, 0.5, 0)
	TextLabel_2.Size = UDim2.new(0.75, 0, 0.85, 0)
	TextLabel_2.Font = Enum.Font.SourceSans
	TextLabel_2.Text = "v199"
	TextLabel_2.TextColor3 = Color3.fromRGB(0, 81, 255)
	TextLabel_2.TextScaled = true
	TextLabel_2.TextSize = 14.000
	TextLabel_2.TextWrapped = true
end
Celestial:InitExtraUI()

function Celestial:UpdateExtraUIProperties(TimeTxt, VersionTxt)
	local CelestialExtra = Services.Players.LocalPlayer.PlayerGui:FindFirstChild("CelestialExtra")
	if CelestialExtra then
		local timeLabel = CelestialExtra:FindFirstChild("TimeContainer")
		local versionLabel = CelestialExtra:FindFirstChild("VersionContainer")
		if timeLabel and timeLabel:FindFirstChild("TextLabel") then
			timeLabel.TextLabel.Text = TimeTxt
		end
		if versionLabel and versionLabel:FindFirstChild("TextLabel") then
			versionLabel.TextLabel.Text = VersionTxt
		end
	end
end

-- Tabs and features (Chat tab removed)
local Tab = Lib:Tab("Game", "6034227061")
local Section = Tab:Section("Humanoid", false)
Section:Slider("WalkSpeed", 16, 16, 100, function(Value)
	Vars.WalkspeedValue = Value
	Celestial:Walkspeed()
end)
Section:Slider("JumpPower", 50, 50, 250, function(Value)
	Services.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
end)
Section:Slider("Flight Speed", 50, 50, 500, function(Value)
	Tables.FlySettings.FlightSpeedNum = Value
end)
Section:Toggle("Toggle Flight", toggleStates["ToggleFlight"], function(Value)
	toggleStates["ToggleFlight"] = Value
	Tables.FlySettings.FlightEnabled = Value
end)
Section:KeyBind("Flight Key", "Q", function(Key)
	Tables.FlySettings.FlightKey = string.lower(Key)
end)

local Tab = Lib:Tab("Premium", "6031068423", Color3.fromRGB(22,33,71), Color3.fromRGB(90,20,70))
local Section = Tab:Section("CelestialHub Premium")
plrname = Section:Title("")
plrname.TextSize = 26
plrname.Text = "Welcome, " .. Players.LocalPlayer.Name
plrname.TextColor3 = Color3.fromRGB(0, 255, 0) 
premstat = Section:Title("License: Premium")
premstat.TextSize = 30
premstat.TextColor3 = ThemeColor 

local Tab = Lib:Tab("Settings", "6031280882")
local Section = Tab:Section("Script Devs")
Section:Title("@skid")
local Section = Tab:Section("Socials")
Section:Button("Copy Discord", function()
	setclipboard(tostring("discord.gg/FhKCM8qWgW"))
	Library:Notify("Copy", "Discord link copied to your clipboard.", 4)
end)
local Section = Tab:Section("UI Settings")
Section:Toggle("Mobile UI Toggle", false, function(enabled)
	local CelestialMobile = game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("CelestialMobile")
	if enabled then
		if not CelestialMobile then
			CelestialMobile = Instance.new("ScreenGui")
			local Container = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local TextButton = Instance.new("TextButton")
			local UICorner_2 = Instance.new("UICorner")
			CelestialMobile.Name = "CelestialMobile"
			CelestialMobile.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
			CelestialMobile.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			Container.Name = "Container"
			Container.Parent = CelestialMobile
			Container.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			Container.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Container.BorderSizePixel = 0
			Container.Position = UDim2.new(0.9308725, 0, 0.7, 0)
			Container.Size = UDim2.new(0.0104832184, 50, 0.109039031, 0)
			Container.Visible = true
			UICorner.CornerRadius = UDim.new(0, 50)
			UICorner.Parent = Container
			UIAspectRatioConstraint.Parent = Container
			TextButton.Parent = Container
			TextButton.AnchorPoint = Vector2.new(0.5, 0.5)
			TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.BackgroundTransparency = 1.000
			TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			TextButton.BorderSizePixel = 0
			TextButton.Position = UDim2.new(0.5, 0, 0.5, 0)
			TextButton.Size = UDim2.new(1, 0, 1, 0)
			TextButton.Font = Enum.Font.SourceSans
			TextButton.Text = "Toggle"
			TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextButton.TextSize = 14.000
			TextButton.Visible = true
			UICorner_2.CornerRadius = UDim.new(0, 50)
			UICorner_2.Parent = TextButton
			TextButton.MouseButton1Click:Connect(function()
				Library.MainFrame.Visible = not Library.MainFrame.Visible
			end)
		else
			CelestialMobile.Enabled = true
		end
	else
		if CelestialMobile then CelestialMobile.Enabled = false end
	end
end)
Section:Toggle("Toggle Loading Screen", ToggleLoadingScreen, function(Value)
	ToggleLoadingScreen = Value
	Celestial:saveState(ToggleLoadingScreen)
end)
Section:Button("Rejoin Server", function()
	game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
end)
Section:KeyBind("Toggle UI", "J", function(Key)
	if Bools.ShutdownActive then return end
	Library.MainFrame.Visible = not Library.MainFrame.Visible
end)

local Section = Tab:Section("Config:")
Section:Button("Save Config", function()
	Celestial:saveConfig()
	Library:Notify("Config", "Your current config has been saved.", 2)
end)
Section:Button("Delete Config", function()
	Celestial:deleteConfig()
	Library:Notify("Config", "Your current config has been deleted.", 2)
end)

function ChangeThemeColor(rgbColor)
	local CelestialSGUI = game:GetService("CoreGui"):FindFirstChild("Celestial")
	if not CelestialSGUI then return end
	for _, descendant in ipairs(CelestialSGUI:GetDescendants()) do
		if descendant:IsA("Frame") and (descendant.Name == "TabLine" or descendant.Name == "Strip" or descendant.Name == "TitleLine" or descendant.Name == "Fill") then
			descendant.BackgroundColor3 = Color3.fromRGB(rgbColor.R, rgbColor.G, rgbColor.B)
		end
		if descendant:IsA("TextLabel") and descendant.Name == "Version" then
			descendant.TextColor3 = Color3.fromRGB(rgbColor.R, rgbColor.G, rgbColor.B)
		end
	end
end

Section:DropDown("Theme", {
	"Default", "LightGrey", "OceanBlue", "SunsetOrange", "EclipseHubGay", "ForestGreen", "MidnightPurple", "DesertSand",
	"ElectricViolet", "CoralPink", "SteelGray", "MintGreen", "CrimsonRed", "SkyBlue", "Lavender", "DeepSea", "Amber",
	"RubyRed", "Turquoise", "Plum", "Charcoal", "Peach", "Gold", "Silver", "White", "Black", "Red", "Green", "Blue",
	"Yellow", "Cyan", "Magenta", "Brown", "Orange", "Purple", "Pink"
}, false, function(Selected)
	local themeColors = {
		Default = {0, 81, 255}, LightGrey = {175, 175, 175}, OceanBlue = {0, 123, 167}, SunsetOrange = {255, 94, 77},
		EclipseHubGay = {234, 126, 22}, ForestGreen = {34, 139, 34}, MidnightPurple = {48, 25, 52}, DesertSand = {237, 201, 175},
		ElectricViolet = {143, 0, 255}, CoralPink = {255, 127, 80}, SteelGray = {70, 130, 180}, MintGreen = {152, 255, 152},
		CrimsonRed = {220, 20, 60}, SkyBlue = {135, 206, 235}, Lavender = {230, 230, 250}, DeepSea = {0, 102, 204},
		Amber = {255, 191, 0}, RubyRed = {224, 17, 95}, Turquoise = {64, 224, 208}, Plum = {221, 160, 221},
		Charcoal = {54, 69, 79}, Peach = {255, 218, 185}, Gold = {255, 215, 0}, Silver = {192, 192, 192},
		White = {255, 255, 255}, Black = {0, 0, 0}, Red = {255, 0, 0}, Green = {0, 255, 0}, Blue = {0, 0, 255},
		Yellow = {255, 255, 0}, Cyan = {0, 255, 255}, Magenta = {255, 0, 255}, Brown = {165, 42, 42}, Orange = {255, 165, 0},
		Purple = {128, 0, 128}, Pink = {255, 192, 203}
	}
	local color = themeColors[Selected]
	if color then
		local r, g, b = unpack(color)
		ThemeColor = Color3.fromRGB(r, g, b)
		toggleStates["Theme"] = color
		ChangeThemeColor({R = r, G = g, B = b})
		print("Theme changed to:", Selected)
	end
end)

Services.RunService.Stepped:Connect(function()
	Celestial:UpdateExtraUIProperties(os.date("%H:%M"), "v"..game.PlaceVersion)
end)
