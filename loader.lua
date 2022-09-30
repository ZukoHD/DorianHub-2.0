local games = { --// Add Games Here With Format: [GAME_ID] = "GITHUB SCRIPT LINK"
	[155615604] = "https://raw.githubusercontent.com/ZukoHD/DorianHub-2.0/main/Scripts/prison_life.lua", --// Prison Life
	[0] = "", --//
}
local exploit = "Unknown" if syn then exploit = 'Synapse X' elseif PROTOSMASHER_LOADED then exploit = 'Protosmasher' elseif issentinelclosure then exploit = 'Sentinel' elseif Krnl then exploit = 'Krnl' else game:GetService("Players").LocalPlayer:Kick("Unsupported Exploit!") end game:GetService("StarterGui"):SetCore("SendNotification", { Title = "Dorian Hub - Loaded",Text = "Dorian Hub has been loaded!",Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"})Duration = 3 if games[game.PlaceId] then	loadstring(game:HttpGet(games[game.PlaceId]))() else loadstring(game:HttpGet("https://raw.githubusercontent.com/ZukoHD/DorianHub-2.0/main/Scripts/universal.lua"))() end
