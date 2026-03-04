-- WB NewsPro v6.1 - Server Side
-- By By & Bae

local cooldowns = {}
local articles = {}

RegisterNetEvent('wbnews:requestStartLive')
AddEventHandler('wbnews:requestStartLive', function(coords)
    local src = source
    cooldowns[src] = cooldowns[src] or {}

    if cooldowns[src].live and GetGameTimer() - cooldowns[src].live < Config.LiveCooldown then
        TriggerClientEvent('ox_lib:notify', src, {title = 'Cooldown', description = 'Tunggu ' .. math.ceil((Config.LiveCooldown - (GetGameTimer() - cooldowns[src].live)) / 60000) .. ' menit lagi!', type = 'error'})
        return
    end

    cooldowns[src].live = GetGameTimer()

    TriggerClientEvent('wbnews:showNews', -1, "LIVE NOW!", "Reporter " .. GetPlayerName(src) .. " sedang live!", "IME News")
    TriggerClientEvent('wbnews:showTicker', -1, "LIVE STREAM AKTIF", "Tune in sekarang!")
    TriggerClientEvent('wbnews:startLiveSuccess', src)
end)

RegisterNetEvent('wbnews:endLive')
AddEventHandler('wbnews:endLive', function(coords)
    TriggerClientEvent('wbnews:showNews', -1, "LIVE ENDED", "Liputan selesai.", "IME News")
end)

RegisterNetEvent('wbnews:liveBonus')
AddEventHandler('wbnews:liveBonus', function(bonus, viewers)
    local src = source
    -- Tambah uang: ESX/QB di sini
    -- Contoh: local xPlayer = ESX.GetPlayerFromId(src); xPlayer.addMoney(bonus)
end)

RegisterNetEvent('wbnews:publishArticle')
AddEventHandler('wbnews:publishArticle', function(headline, body)
    local src = source
    cooldowns[src] = cooldowns[src] or {}
    if cooldowns[src].publish and GetGameTimer() - cooldowns[src].publish < Config.PublishCooldown then return end

    table.insert(articles, {headline = headline, body = body, author = GetPlayerName(src), time = os.date("%H:%M %d/%m")})

    TriggerClientEvent('wbnews:showNews', -1, headline, body .. " - Oleh " .. GetPlayerName(src), "IME News")

    cooldowns[src].publish = GetGameTimer()
end)

AddEventHandler('playerDropped', function()
    cooldowns[source] = nil
end)
