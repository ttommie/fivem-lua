RegisterNetEvent('thisGivesWeapon') -- REGISTER A NET EVENT TO INTERACT WITH SERVER SCRIPT
AddEventHandler('thisGivesWeapon', function(weaponName, plyID) -- ADD AN EVENT HANDLER CALLED 'thisGivesWeapon'
	GiveWeaponToPed(PlayerPedId(plyID), weaponName, 250, false, true)
end)