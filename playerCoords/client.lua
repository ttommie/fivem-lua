RegisterCommand('coords', function(source, args)
    -- GET THE PLAYERS POSITION
    local playerPed = PlayerPedId() -- / GET THE PLAYERS PED ID

    local playerPosition = GetEntityCoords(playerPed) -- / USE THE PLAYERS PED ID TO STORE THE ENTITY COORDS INTO  A LOCAL VARIABLE

    print('^3PLAYER COORDS: ^7' .. playerPosition) -- / PRINT MESSAGE TO CONSOLE

    TriggerEvent('chat:addMessage', { -- CALL THE THE MESSAGE EVENT TO PRINT TO CHAT BOX
		args = { '^3PLAYER COORDS: ^7' .. playerPosition } -- PRINT MESSAGE
	})
end, false)
