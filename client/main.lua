ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
end

function spawnCar(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(50)
    end

    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), false))
    local vehicle = CreateVehicle(car, -505.45, -259.49, 35.52, 114.07, GetEntityHeading(PlayerPedId()), true, false)

    
    SetEntityAsNoLongerNeeded(vehicle)
    SetModelAsNoLongerNeeded(vehicleName)
    
end


local blips = { -- Blips sur la map
     {title="Location De Vehicule", colour=4, id=435, x = -509.28, y = -254.77, z = 35.61},
}

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 1.0)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)



RMenu.Add('location', 'main', RageUI.CreateMenu("Location", "Location"))
RMenu.Add('location', 'moto', RageUI.CreateSubMenu(RMenu:Get('location', 'main'), "Moto", "Achète Ta moto"))
RMenu.Add('location', 'velo', RageUI.CreateSubMenu(RMenu:Get('location', 'main'), "Velo", "Achète Ton velo"))

Citizen.CreateThread(function()
    while true do
        RageUI.IsVisible(RMenu:Get('location', 'main'), true, true, true, function()

            RageUI.Button("Scooter", "Loue Un Scooter", {RightLabel = "→→"},true, function()
            end, RMenu:Get('location', 'moto'))

            RageUI.Button("Velo", "Loue Un Velo", {RightLabel = "→→"},true, function()
            end, RMenu:Get('location', 'velo'))

        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('location', 'moto'), true, true, true, function()

                RageUI.Button("Vespa", "Loue Une Vespa", {RightLabel = "~g~1250$"}, true, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('alloww_BuyScoot')
                    notify("Vous avez payez ~g~1250$")
                    Citizen.Wait(0)
                    spawnCar("faggio3")
                    ESX.ShowAdvancedNotification("Location", "Location Five Family", "Voici votre ~b~vehicule~w~ Bonne Route !", "CHAR_CARSITE2", 1)
                end
            end)
        end, function()
    end)

            RageUI.IsVisible(RMenu:Get('location', 'velo'), true, true, true, function()

                RageUI.Button("Scorcher", "Loue Un Scorcher", {RightLabel = "~g~250$"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('alloww_BuyBMX')
                        notify("Vous avez payez ~g~250$")
                        Citizen.Wait(0)
                    spawnCar("scorcher")
ESX.ShowAdvancedNotification("Location", "Location Five Family", "Voici votre ~b~vehicule~w~ Bonne Route !", "CHAR_CARSITE2", 1)
                    end
                end)
                    
            end, function()
                
    

            end, 1)

    
            Citizen.Wait(0)
        end
    
    end)




    local position = {
        {x = -508.36 , y = -254.41, z = 35.61, },
    }    
    
    
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
    
            for k in pairs(position) do
    
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
    
                if dist <= 1.0 then

                   RageUI.Text({
                       message = "Appuyez sur [~b~E~w~] pour ~b~louez un vehicule",
                        time_display = 1
                    })
                    if IsControlJustPressed(1,51) then
                        RageUI.Visible(RMenu:Get('location', 'main'), not RageUI.Visible(RMenu:Get('location', 'main')))
                    end
                end
            end
        end
    end)


Citizen.CreateThread(function()
        local hash = GetHashKey("cs_siemonyetarian")
        while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
        end
        ped = CreatePed("PED_TYPE_CIVMALE", "cs_siemonyetarian", -507.67, -253.88, 34.62, 111.46, true, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
end)

---- 𝓐𝓵𝓵𝓸𝔀𝔀#0001 | https://discord.gg/kpfEuDz