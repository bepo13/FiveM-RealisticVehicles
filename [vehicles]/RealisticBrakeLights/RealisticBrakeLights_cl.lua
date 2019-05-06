-- PARAMETERS
local brakeLightSpeedThresh = 0.25

-- Main thread
Citizen.CreateThread(function()
	while true do
        -- Loop forever and update every frame
        Citizen.Wait(0)
        
        -- Get player and vehicle player is in
        local player = GetPlayerPed(-1)
        local vehicle = GetVehiclePedIsIn(player, false)

        -- If player is in a vehicle and it's not moving
        if (vehicle ~= nil) and (GetEntitySpeed(vehicle) <= brakeLightSpeedThresh) then
            -- Set brake lights
            SetVehicleBrakeLights(vehicle, true)
        end
	end
end)
