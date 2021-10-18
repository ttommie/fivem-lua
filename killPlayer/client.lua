RegisterNetEvent('thisKillsYou') -- REGISTER A NET EVENT TO INTERACT WITH SERVER SCRIPT
AddEventHandler('thisKillsYou', function(plyID) -- ADD AN EVENT HANDLER CALLED 'thisKillsYou'
	SetEntityHealth(PlayerPedId(plyID), 0) -- CALL ON THE 'SetEntityHealth' TO SET PLAYERS HP TO 0
end)