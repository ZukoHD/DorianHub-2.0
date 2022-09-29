local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character

local vre = "2.0"
local theme = {
	SchemeColor = Color3.fromRGB(100, 0, 255),
	Background = Color3.fromRGB(0, 0, 0),
	Header = Color3.fromRGB(0, 0, 0),
	TextColor = Color3.fromRGB(255,255,255),
	ElementColor = Color3.fromRGB(20, 20, 20)
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Universal "..vre.." - Dorian Hub", theme)

local Movement = Window:NewTab("Movement")
local Visuals = Window:NewTab("Visuals")
local Trolling = Window:NewTab("Trolling")
local Credits = Window:NewTab("Credits")

--// Movement Tabs
local LocalPlayer = Movement:NewSection("LocalPlayer")
local Humanoid = Movement:NewSection("Other")

LocalPlayer:NewSlider("WalkSpeed", "Changes your WalkSpeed!", 500, 16, function(s)
	Character.Humanoid.WalkSpeed = s
end)

LocalPlayer:NewSlider("JumpPower", "Changes your JumpPower!", 500, 50, function(s)
	Character.Humanoid.JumpPower = s
end)

Humanoid:NewSlider("HipHeight", "Changes Your HipHeight", 50, 0, function(s)
	Character.Humanoid.HipHeight = s
end)

local freezed = false
Humanoid:NewKeybind("Freeze Player", "Freezes Your Character", Enum.KeyCode.F, function()
	local part = Character.HumanoidRootPart
	
	if freezed == false then
		freezed = true
		part.Anchored = true
	else
		freezed = false
		part.Anchored = false
	end
end)
