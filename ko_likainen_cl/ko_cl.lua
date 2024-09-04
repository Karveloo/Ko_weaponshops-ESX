ESX = exports["es_extended"]:getSharedObject()

Citizen.CreateThread(function()
    for _, Ko_kauppa in pairs(Config.Kaupat) do
        RequestModel(GetHashKey(Ko_kauppa.npc))
        while not HasModelLoaded(GetHashKey(Ko_kauppa.npc)) do
            Wait(1)
        end

        local npc = CreatePed(4, GetHashKey(Ko_kauppa.npc), Ko_kauppa.Sijainti.x, Ko_kauppa.Sijainti.y, Ko_kauppa.Sijainti.z -1.0, Ko_kauppa.suunta, false, true)
        FreezeEntityPosition(npc, true)
        SetEntityInvincible(npc, true)
        SetBlockingOfNonTemporaryEvents(npc, true)
    end
end)

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local isNearShop = false

        for index, Ko_kauppa in pairs(Config.Kaupat) do
            local dist = #(playerCoords - Ko_kauppa.Sijainti)
            if dist < 2.0 then
                isNearShop = true
                ESX.ShowHelpNotification(Config.Ilmotus.apu)
                if IsControlJustReleased(0, 38) then 
                    koAvaa(index)
                end
            end
        end
        if isNearShop then
            Citizen.Wait(10)
        else
            Citizen.Wait(1000)
        end
    end
end)

function koAvaa(shopIndex)
    local kaupanAseet = {}

    for _, ase in pairs(Config.Kaupat[shopIndex].aseet) do
        table.insert(kaupanAseet, {
            title = ESX.GetWeaponLabel(ase.nimi),
            icon = Config.icon,
            iconColor = Config.iconColor,
            description = Config.menudesc .. ase.hinta,
            onSelect = function()
                ESX.TriggerServerCallback('Ko_aseenOsto', function(success, vastaus)
                    if success then
                         ilmotus(vastaus)
                    else
                        ilmotus(vastaus)  
                    end
                end, ase.nimi, ase.hinta)
            end
        })
    end

    lib.registerContext({
        id = 'Ko_asekauppa',
        title = Config.Kaupat[shopIndex].nimi,
        options = kaupanAseet
    })

    lib.showContext('Ko_asekauppa')
end
function ilmotus(teksti)
    lib.notify({
        title = teksti,
        position = 'bottom',
        duration = 2000,
        style = {
            backgroundColor = '#2a2727',
            color = '#C1C2C5',
            ['.description'] = {
                color = '#909296'
            }
        },

        icon = 'fa-solid fa-gun',
        iconColor = '#A020F0',
        iconAnimation = 'fade',
    })
end