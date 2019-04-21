--All the logic is in server.lua
--Registring the command and triggering it
RegisterCommand('rsthandling',function ()
	TriggerServerEvent("restartHandling")
end)