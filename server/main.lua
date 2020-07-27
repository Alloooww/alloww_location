ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('alloww_BuyScoot')
AddEventHandler('alloww_BuyScoot', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceScoot
    xPlayer.removeMoney(price)
end)

RegisterNetEvent('alloww_BuyBMX')
AddEventHandler('alloww_BuyBMX', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.PriceBMX
    xPlayer.removeMoney(price)
end)

-- 𝓐𝓵𝓵𝓸𝔀𝔀#0001 | https://discord.gg/kpfEuDz