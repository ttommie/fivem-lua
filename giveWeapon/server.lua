-- TODO: CHECK IF PLAYER ENTERED A VALID WEAPON NAME ( HasPedGotWeapon Native )

RegisterCommand('giveWeapon', function(source, args)
	-- LOCAL VARIABLE
	local plyID = args[1] or source
	local weaponName = args[2] or 'weapon_combatpistol'

	-- GET PLAYERNAME
	local playerName = GetPlayerName(plyID)
	
	if playerName == nil then 
		print('Error: Player ID ^1' .. plyID .. ' ^7does not exist...')
	else
		-- GIVE GUN TO PLAYER
		TriggerClientEvent('thisGivesWeapon', plyID, weaponName, source)
		print('^1' .. playerName .. ' ^7was given a ^3' .. weaponName)
		
		TriggerEvent('chat:addMessage', { -- CALL THE THE MESSAGE EVENT TO PRINT TO CHAT BOX
        args = { '^1' .. playerName .. ' ^7was given a ^3' .. weaponName } -- PRINT MESSAGE
        })
	end
end, false)