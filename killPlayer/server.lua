RegisterCommand('kill', function(source, args)
	-- STORE PLAYER ID
	local player = args[1] or source -- / GET THE PLAYERS PED ID

	-- GET AND STORE PLAYER NAME USING PLAYER ID
	playerName = GetPlayerName(player)

   if playerName == nil then 
		print('Error: Player ID ^1' .. player .. ' ^7does not exist...')
   else
        TriggerClientEvent('thisKillsYou', player, source)
		print('^1' .. playerName .. ' ^7was ^1slayed by ^3' .. GetPlayerName(source))

        TriggerEvent('chat:addMessage', { -- CALL THE THE MESSAGE EVENT TO PRINT TO CHAT BOX
        args = { '^1' .. playerName .. ' ^7was ^1slayed by ^3' .. GetPlayerName(source) } -- PRINT MESSAGE
        })
   end

end, false)
