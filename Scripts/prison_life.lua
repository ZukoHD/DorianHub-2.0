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
local Window = Library.CreateLib("Prison Life "..vre.." - Dorian Hub", theme)

local Main = Window:NewTab("Main")
local Misc = Window:NewTab("Misc")
local Movement = Window:NewTab("Movement")
local Credits = Window:NewTab("Credits")

--// Main
local Weapons = Main:NewSection("Weapons")
local Teleports = Main:NewSection("Locations")
local Teams = Main:NewSection("Teams")

Weapons:NewButton("Equip All Weapons", "Self Explanatory", function()
	for i,v in pairs(game:GetService("Players"):GetDescendants()) do 
		if v:IsA("Tool") then 
			v.Parent = Player.Backpack
		end 
	end
end)

function tp(area)
	Player.Character.HumanoidRootPart.CFrame = area
end

Teleports:NewButton("Prison Yard", "Self Explanatory", function()
	tp(CFrame.new(821.614014, 99.9899826, 2371.04224, -0.940787196, 2.47944936e-08, -0.338997662, 1.59264548e-08, 1, 2.89414626e-08, 0.338997662, 2.18287255e-08, -0.940787196))
end)

Teleports:NewButton("Criminal Base", "Self Explanatory", function()
	tp(CFrame.new(-926.505371, 94.1287613, 2063.08813, -0.07413771, 2.07180619e-08, -0.997247994, -2.16543032e-08, 1, 2.23850645e-08, 0.997247994, 2.32542892e-08, -0.07413771))
end)

Teleports:NewButton("Police Spawn", "Self Explanatory", function()
	tp(CFrame.new(834.413269, 99.944397, 2314.85767, -0.936787724, 0.0011957275, -0.349896163, 0.00113284297, 0.999999285, 0.000384380721, 0.349896371, -3.62942628e-05, -0.93678838))
end)

Teleports:NewButton("Prison Cafeteria", "Self Explanatory", function()
	tp(CFrame.new(882.837585, 99.9899368, 2293.7229, 0.986632645, -4.40124737e-09, 0.162960216, 3.24909832e-09, 1, 7.33664374e-09, -0.162960216, -6.70909861e-09, 0.986632645))
end)

function changeteam(name)
	if name == "Police" then
		local loadchar = workspace.Remote.loadchar
		local teamevent = workspace.Remote.TeamEvent

		teamevent:FireServer("Bright blue")
		loadchar:InvokeServer(Player.Name)
		Player.PlayerGui.Home.intro.Visible = false
	elseif name == "Criminal" then
		local loadchar = workspace.Remote.loadchar
		local teamevent = workspace.Remote.TeamEvent

		teamevent:FireServer("Bright orange")
		loadchar:InvokeServer(Player.Name)
		Player.PlayerGui.Home.intro.Visible = false
	end
end

Teams:NewButton("Police Team", "Changes Your Team", function()
	changeteam("Police")
end)

Teams:NewButton("Criminal Team", "Changes Your Team", function()
	changeteam("Criminal")
end)

--// Misc
local GunMods = Misc:NewSection("Gun Mods")
local Other = Misc:NewSection("Other")

GunMods:NewButton("Infinite Ammo", "Gives you Unlimited Ammo", function()
	for _,v in pairs(Player.Backpack:GetChildren()) do
		if v:FindFirstChild("GunStates") then
			local i = require(v:WaitForChild("GunStates"))

			i.MaxAmmo = 99999999999
			i.CurrentAmmo = 99999999999
		end
	end
end)

GunMods:NewButton("Auto Fire", "Makes Your Gun Automatic", function()
	for _,v in pairs(Player.Backpack:GetChildren()) do
		if v:FindFirstChild("GunStates") then
			local i = require(v:WaitForChild("GunStates"))

			i.AutoFire = true
		end
	end
end)

GunMods:NewButton("No Spread", "Self Explanatory", function()
	for _,v in pairs(Player.Backpack:GetChildren()) do
		if v:FindFirstChild("GunStates") then
			local i = require(v:WaitForChild("GunStates"))

			i.Spread = 0
		end
	end
end)

GunMods:NewButton("Infinite Bullets", "Self Explanatory", function()
	for _,v in pairs(Player.Backpack:GetChildren()) do
		if v:FindFirstChild("GunStates") then
			local i = require(v:WaitForChild("GunStates"))

			i.Bullets = 50
		end
	end
end)

function removedoors()
	for _,v in pairs(workspace:GetChildren()) do
		if v.Name:match("door") or v.Name:match("Door") or v.Name:match("DOOR") then
			v:Destroy()
		end
	end
end

Other:NewButton("Remove All Doors", "Self Explanatory", function()
	removedoors()
end)

Other:NewButton("Get KeyCard", "Self Explanatory", function()
	for _,v in pairs(game:GetService("Players"):GetPlayers()) do
		for _,item in pairs(v.Backpack:GetChildren()) do
			if item.Name == "Key card" then
				item.Parent = Player.Backpack
			end
		end
	end
end)

--// Movement
local CharacterTT = Movement:NewSection("Character")
local Trolling = Movement:NewSection("Trolling")

CharacterTT:NewSlider("WalkSpeed", "Changes Your WalkSpeed", 500, 16, function(s)
	Character.Humanoid.WalkSpeed = s
end)

CharacterTT:NewSlider("JumpPower", "Changes Your JumpPower", 500, 50, function(s)
	Character.Humanoid.JumpPower = s
end)

Trolling:NewKeybind("Fly (Glitchy)", "Self Explanatroy", Enum.KeyCode.F, function()
	pcall(function()
		local flying = false
		local Character = Player.Character
		local Torso = Character.Torso

		local body = Instance.new("BodyGyro", Torso) 
		body.P = 9999
		body.maxTorque = Vector3.new(9999, 9999, 9999) 

		local bodyv = Instance.new("BodyVelocity", Torso) 
		bodyv.velocity = Vector3.new(0,1,0) 
		bodyv.maxForce = Vector3.new(9999, 9999, 9999) 

		if flying == true then 
			flying = false
			body:Destroy()
			bodyv:Destroy()
		else 
			flying = true 
			local body = Instance.new("BodyGyro", Torso) 
			body.P = 9999
			body.maxTorque = Vector3.new(9999, 9999, 9999) 

			local bodyv = Instance.new("BodyVelocity", Torso) 
			bodyv.velocity = Vector3.new(0,1,0) 
			bodyv.maxForce = Vector3.new(9999, 9999, 9999) 
		end
	end)
end)

Trolling:NewButton("Kill All", "Self Explanatory", function()

end)

--// Credits
function credit(message)
	Credits:NewSection(message)
end

credit("Made By dori#4040")
credit("Using Kavo UI Library")
