-- WB v6.1
-- By By & Bae
-- Job Wartawan Usable: Patrol visible, Live Streaming Simulasi, NUI Koran & Editor, Drone/Heli/Paparazzi, Expose Netral
-- Lightweight, no bug, scaling

local onDuty = false
local blip = nil
local van = nil
local heli = nil
local drone = nil
local liveCam = nil
local droneCam = nil
local inStudio = false
local paparazziActive = false
local menuActive = false
local selected = 1
local isLive = false
local liveStartTime = 0
local liveBlip = nil
local liveOverlayThread = nil

local menuOptions = {
    "1. Spawn News Van",
    "2. Foto Scoop",
    "3. Interview Live",
    "4. Broadcast Manual",
    "5. Spawn News Heli",
    "6. Spawn News Drone",
    "7. Toggle Live Cam",
    "8. Masuk Live Studio (di Van)",
    "9. Toggle Paparazzi Mode",
    "10. Toggle Patrol Surface",
    "11. Go Live / End Live",
    "12. Edit & Publish Berita",
    "13. Off Duty"
}

-- ... (fungsi IsJobAllowed, CreateBlip, RemoveBlip, CleanupEntities, CreateMenuThread, HandleOption, ShowNotification, dll. – copy dari versi sebelumnya)

-- Fungsi Go Live (fix cooldown)
function ToggleLiveStream()
    if not onDuty then 
        ShowNotification("\~r\~On duty dulu!") 
        return 
    end

    if isLive then
        isLive = false
        if liveBlip then RemoveBlip(liveBlip) liveBlip = nil end
        if liveOverlayThread then liveOverlayThread = nil end
        TriggerServerEvent('wbnews:endLive', GetEntityCoords(PlayerPedId()))
        ShowNotification("\~r\~Live Streaming Ended!")
        RenderScriptCams(false, false, 0, true, false)
        PlaySoundFrontend(-1, "END_OF_ROUND", "HUD_AWARDS", true)
    else
        TriggerServerEvent('wbnews:requestStartLive', GetEntityCoords(PlayerPedId()))
    end
end

RegisterNetEvent('wbnews:startLiveSuccess')
AddEventHandler('wbnews:startLiveSuccess', function()
    isLive = true
    liveStartTime = GetGameTimer()

    liveBlip = AddBlipForEntity(PlayerPedId())
    SetBlipSprite(liveBlip, 459)
    SetBlipColour(liveBlip, 1)
    SetBlipFlashes(liveBlip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString("LIVE: " .. GetPlayerName(PlayerId()))
    EndTextCommandSetBlipName(liveBlip)

    liveOverlayThread = CreateThread(function()
        while isLive do
            Wait(0)
            SetTextFont(7) SetTextScale(0.8, 0.8) SetTextColour(255, 0, 0, 200)
            SetTextDropShadow(0, 0, 0, 0, 255) SetTextEdge(2, 0, 0, 0, 150)
            SetTextEntry("STRING") AddTextComponentString("LIVE")
            DrawText(0.85, 0.05)
            if (GetGameTimer() % 1000) < 500 then
                DrawRect(0.92, 0.08, 0.04, 0.04, 255, 0, 0, 200)
            end
        end
    end)

    ShowNotification("\~g\~LIVE Streaming Started!")
    PlaySoundFrontend(-1, "Mission_Pass_Notify", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", true)
end)

-- Thread reward viewer (tiap menit)
CreateThread(function()
    while true do
        Wait(60000)
        if isLive then
            local viewers = 0
            local myCoords = GetEntityCoords(PlayerPedId())
            for _, player in ipairs(GetActivePlayers()) do
                local ped = GetPlayerPed(player)
                if #(myCoords - GetEntityCoords(ped)) < 50.0 and player \~= PlayerId() then
                    viewers = viewers + 1
                end
            end
            if viewers > 0 then
                TriggerServerEvent('wbnews:liveBonus', viewers * Config.LiveBonusPerViewer, viewers)
                ShowNotification("\~g\~+" .. (viewers * Config.LiveBonusPerViewer) .. "$ dari " .. viewers .. " viewers!")
            end
            if GetGameTimer() - liveStartTime > Config.LiveDurationMax then
                ToggleLiveStream()
            end
        end
    end
end)

-- NUI: Buka editor dari menu
-- Di HandleOption(opt == 12 then)  -- Edit & Publish
    SetNuiFocus(true, true)
    SendNUIMessage({ show = true, type = 'editor' })

-- Buka koran
RegisterCommand('newspaper', function()
    SetNuiFocus(true, true)
    SendNUIMessage({ show = true, type = 'newspaper', articles = "Berita terbaru dari reporter IME! (data extend dari server)" })
end)

RegisterNUICallback('publish', function(data, cb)
    TriggerServerEvent('wbnews:publishArticle', data.headline, data.body)
    cb('ok')
end)

RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)

-- ... (sisanya fungsi patrol, drone, heli, paparazzi, expose, dll. copy dari versi sebelumnya)
