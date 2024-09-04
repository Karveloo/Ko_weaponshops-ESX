ESX = exports["es_extended"]:getSharedObject()
ESX.RegisterServerCallback('Ko_aseenOsto', function(source, cb, weaponName, price)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.hasWeapon(weaponName) then
        cb(false, Config.Ilmotus.Sinullaonjo)
        return
    end

    if xPlayer.getMoney() >= price then
        xPlayer.removeMoney(price)
        xPlayer.addWeapon(weaponName, 250)
        local ase = ESX.GetWeaponLabel(weaponName)
        TriggerEvent('Ko_logi', xPlayer.getName(), weaponName, price)

        cb(true, Config.Ilmotus.Ostit .. ase )
    else
        cb(false, Config.Ilmotus.eitarpeeks)
    end
end)

RegisterNetEvent('Ko_logi')
AddEventHandler('Ko_logi', function(playerName, weaponName, price)
    local message = string.format("**%s** osti aseen **%s** hintaan **$%s**.", playerName, weaponName, price)
    PerformHttpRequest(Config.DiscordWebhook, function(err, text, headers) end, 'POST', json.encode({content = message}), {['Content-Type'] = 'application/json'})
end)