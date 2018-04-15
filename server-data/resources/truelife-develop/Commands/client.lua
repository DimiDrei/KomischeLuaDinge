---
-- On Player Spawned
---
local isFirstTimeSpawn = true

AddEventHandler('playerSpawned', function(spawn)
    
    -- TEMPORARY SPAWN
    -- SetEntityCoords(GetPlayerPed(-1), 186.097, -1016.015, 28.292, 1, 0, 0, 1) -- Stadtpark
    SetEntityCoords(GetPlayerPed(-1), 2686.24, 1560.64, 23.54, 1, 0, 0, 1) -- Oel
    
    
    if(isFirstTimeSpawn) then
        -- Spawn Message
        TriggerEvent("LSLife:Notify", "First Time Session Spawn.")
        
        -- Sync Server Time
        TriggerServerEvent("Heartbeat:InitializePlayer")
      
        -- Sync Server Time
        TriggerServerEvent("Heartbeat:InitServerTime")
        
        isFirstTimeSpawn = false
    else
        TriggerEvent("LSLife:Notify", "Session Spawn.")
    end
    
    
    -- Initialize Inventory
    while not PlayerHandler.GetPlayerInventoryId() do
      Citizen.Wait(0)
    end
    
    PlayerHandler.UpdatePlayerInventory()
end)


---
-- Client Event "Heartbeat:GetServerTime"
--
-- Dieses Event bekommt die Serverzeit vom Server
-- und initialisiert damit die Uhrzeit.
--
-- No Return
---
local waitTime = 1000 -- 1 second

RegisterNetEvent("Heartbeat:GetServerTime")
AddEventHandler("GetServerTime:GetServerTime", function(time)
		Citizen.CreateThread(function()
		while true do
			Citizen.Wait(waitTime)
      
			newTime = time

			newTime.s = newTime.s + 1
			if newTime.s > 59 then
				newTime.s = 0

				newTime.m = newTime.m + 1
				if newTime.m > 59 then
					newTime.m = 0

					newTime.h = time.h + 1
					if newTime.h > 23 then
						newTime.h = 0
					end
				end
			end

			NetworkOverrideClockTime(newTime.h, newTime.m, newTime.s)
		end
	end)
end)


---
-- Heartbeat Thread: Disable Radio
---
Citizen.CreateThread(function()    
    while true do
        Citizen.Wait(0)
        
        if IsPedInVehicle(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), true), false) then
              SetVehRadioStation(GetVehiclePedIsIn(GetPlayerPed(-1), true), 255)
        end
    end
end)


---
-- Heartbeat Thread: Disable AI
---
Citizen.CreateThread(function()
        
    -- Disable Special Vehicles
		SetGarbageTrucks(0)
		SetRandomBoats(0)
    
    while true do
        -- Set Multiplier Off
        SetVehicleDensityMultiplierThisFrame(0.0)
        SetPedDensityMultiplierThisFrame(0.0)
        SetRandomVehicleDensityMultiplierThisFrame(0.0)
        SetParkedVehicleDensityMultiplierThisFrame(0.0)
        SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
        
        local pos = GetEntityCoords(GetPlayerPed(-1)) 
        RemoveVehiclesFromGeneratorsInArea(pos['x'] - 500.0, pos['y'] - 500.0, pos['z'] - 500.0, pos['x'] + 500.0, pos['y'] + 500.0, pos['z'] + 500.0);
        
        Citizen.Wait(1)
    end
end)