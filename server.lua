--Created by Giorgio Bella contact email bgiorgio0506@gmail.com
--Roles
local Admin ={"steam:[hex steam id here]","steam:[hex steam id here]","steam:[hex steam id here]","steam:[hex steam id here]", "ip:",}
local Mod = {"steam:[hex steam id here]","steam:[hex steam id here]", "steam:[hex steam id here]", "steam:[hex steam id here]","ip:",}
local Sup = {"steam:1[hex steam id here]","ip:",}

--players counters
playerCount = 0
print('\n*****Version 1.0 of restart resource service*****\n')

--Function to restart handling
local  function OnPlayerConnecting()
	playerCount = playerCount + 1
	-- Display players count
	print('Counter player for restart '.. playerCount ..'/30')
	--realistichandling restart after 30 player
	---NEED TO BE SET HIGHER THAN 30 IF NOT WILL CASUE TICKET INFO ERROR---
	if playerCount == 30 then
		StopResource('[RESOUCE NAME HERE]')
		StartResource('[RESOUCE NAME HERE]')
		playerCount = 0
	end
end

--Function to check if a user have permission
function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

local function restartCommand()
	--get player info
	local player = GetPlayerIdentifiers(source)[1]
	--check permissions
	if has_value(Admin,player) or has_value(Mod, player) or has_value(Sup,player) then
		print('**Resource restarted! Resetting automatic counter '.. playerCount.. '/30**\n')
		playerCount = 0
		StopResource('[RESOUCE NAME HERE]')
		StartResource('[RESOUCE NAME HERE]')
		TriggerClientEvent("pNotify:SendNotification", -1, {text= "Restarted", type = "success", timeout = math.random(1000, 10000)})
	else
		print('\n-A user tried to perform a handling restart but no permission garanted\n')
		TriggerClientEvent("pNotify:SendNotification", -1, {text= "You don't have the permission to use thi command", type = "error", timeout = math.random(1000, 10000)})
	end
end
--AddEventHandler
 AddEventHandler("playerConnecting", OnPlayerConnecting)

--Registring the server event and Handle it--
--[[
	Keep in mind if you change the NetEvent name you ha to renameit also in the client.lua when the event is triggered
]]--
RegisterNetEvent('restartHandling')
AddEventHandler('restartHandling',restartCommand)
