local id = game.PlaceId
local games = {
	[606849621] = "https://raw.githubusercontent.com/ZukoHD/DorianHub-2.0/main/Scripts/jailbreak.lua"
}

local universal = "https://raw.githubusercontent.com/ZukoHD/DorianHub-2.0/main/Scripts/universal.lua"

if games[id] then
	local website = games[id]
	
	loadstring(game:HttpGet(website))()
else
	loadstring(game:HttpGet(universal))()
end
