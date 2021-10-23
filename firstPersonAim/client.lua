-- VALIDATION VARAIBLES
local camCheck = false
local carCheck = false
local shotCheck = false 
local shotCheckTwo = false 
local shotCount = 0

-- OUT OF CAR 
Citizen.CreateThread(function()
	while true do 
		-- WAIT SO GAME DOESN'T CRASH
		Citizen.Wait(1)
		-- CHECK IF PLAYER IS AIMING
		if IsPlayerFreeAiming(PlayerId()) then
			-- CHECK IF VIEW MODE IS FP
			if GetFollowPedCamViewMode() == 4 and camCheck == false then 
				camCheck = false
			else
				-- IF AIMING AND CAM IS NOT FP SET IT TO FP 
				SetFollowPedCamViewMode(4)
				camCheck = true
			end
		else
			-- IF PLAYER'S VIEW WAS SET TO FIRST PERSON AND THE PLAYER IS NO LONGER FREE SHOOTING
			if camCheck == true then
				-- SET PLAYERS VIEW BACK TO THIRD PERSON
				SetFollowPedCamViewMode(1)
				camCheck = false
			end
		end
	end
end)

-- IN CAR CHECK
Citizen.CreateThread(function()
	while true do 
		-- WAIT SO GAME DOESN'T CRASH
		Citizen.Wait(1)
		-- CHECK IF PLAYER IS IN A CAR & IF THEY'RE AIMING
		if IsPedInAnyVehicle(PlayerPedId(-1), false) == 1 and IsPlayerFreeAiming(PlayerId()) then 
			-- CHECK IF PLAYER IS IN FIRST PERSON
			if GetFollowVehicleCamViewMode() == 4 and carCheck == false then 
				carCheck = false
			else 
				-- SET PLAYER TO FIRST PERSON VIEW 
				SetFollowVehicleCamViewMode(4)
				carCheck = true
			end
		else 
			-- IF PLAYER'S VIEW WAS SET TO FIRST PERSON AND THE PLAYER IS NO LONGER FREE SHOOTING
			if carCheck == true then 
				-- SET PLAYERS VIEW BACK TO THIRD PERSON
				SetFollowVehicleCamViewMode(1)
				carCheck = false 
			end
		end
	end
end)

-- SHOOTING CHECK
Citizen.CreateThread(function()
	while true do 
		-- WAIT SO GAME DOESN'T CRASH
		Citizen.Wait(1)
		-- CHECK IF PLAYER IS SHOOTING AND IF PLAYER CAM IS NOT FIRST PERSON
		if IsPedShooting(PlayerPedId(-1)) and shotCheck == false and GetFollowPedCamViewMode() ~= 4 then 
			-- SET PLAYERS VIEW TO FIRST PERSON
			SetFollowPedCamViewMode(4)
			shotCheck = true 
			shotCheckTwo = true
		end

		-- WHILE PLAYER IS SHOOTING SET THE COUNT TO 0
		if IsPedShooting(PlayerPedId(-1)) and shotCheck == true and GetFollowPedCamViewMode() == 4 then 
			shotCount = 0
		end

		-- WHILE PLAYER IS NOT SHOOTING SET THE COUNT TO ACCUMULATE BY 1
		if not IsPedShooting(PlayerPedId(-1)) and shotCheck == true then 
			shotCount = shotCount + 1
		end

		-- CHECK IF PED IS SHOOTING
		if not IsPedShooting(PlayerPedId(-1)) and shotCheck == true then 
			-- WHILE PED IS NOT SHOOTING AND THE SHOTCOUNT IS ABOVE 75
			if shotCount > 75 then 
				-- IF PLAYERS VIEW WAS SET TO FIRST PERSON AND THE PLAYER IS NO LONGER SHOOTING
				if shotCheckTwo == true then 
					-- SET PLAYER VIEW BACK TO THIRD PERSON
					SetFollowPedCamViewMode(1)
					shotCheck = false 
					shotCheckTwo = false
				end 
			end
		end
	end
end)