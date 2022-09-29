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

--// Movement
local LocalPlayer = Movement:NewSection("LocalPlayer")
local Humanoid = Movement:NewSection("Other")

LocalPlayer:NewSlider("WalkSpeed", "Changes your WalkSpeed!", 500, 16, function(s)
	Character.Humanoid.WalkSpeed = s
end)

LocalPlayer:NewSlider("JumpPower", "Changes your JumpPower!", 500, 50, function(s)
	Character.Humanoid.JumpPower = s
end)

Humanoid:NewSlider("Body Height", "Changes Your Body Height", 50, 0, function(s)
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

Humanoid:NewButton("Sit Down", "Pretty Explanatory", function()
	Character.Humanoid.Sit = true
end)

--// Visuals
local UserInfo = Visuals:NewSection("User Info")

UserInfo:NewTextBox("Username", "Changes your Username", function(txt)
	Player.Name = txt
end)

UserInfo:NewTextBox("User ID", "Changes your UserID", function(txt)
	if tonumber(txt) ~= nil then
		pcall(function()
			Player.UserId = tonumber(txt)
		end)
	end 
end)

local teams = {}

for _,v in game:GetService("Teams"):GetTeams() do
	table.insert(teams, v.Name)
end

UserInfo:NewDropdown("Team Selector", "Changes Your Team", teams, function(val)
	pcall(function()
		Player.Team = game:GetService("Teams"):WaitForChild(val)
	end)
end)

UserInfo:NewTextBox("Display Name", "Changes your Display Name", function(txt)
	Player.DisplayName = txt
end)

--// Trolling
local TOBE = Trolling:NewSection("Come Back Later") -- Idk what message to choose but just know i wont be doing scripts for this section until later

--// Credits
function credit(message)
	Credits:NewSection(message)
end

credit("Made By dori#4040")
credit("Using Kavo UI Library")
