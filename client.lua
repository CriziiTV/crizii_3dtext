local time = 7000

RegisterCommand('me', function(source, args)
    local text = table.concat(args, " ") .. " "
    TriggerServerEvent('3dme:shareDisplay', text)
end)

RegisterNetEvent('3dme:triggerDisplay')
AddEventHandler('3dme:triggerDisplay', function(text, source)
    Display(GetPlayerFromServerId(source), text)
end)

-- Thread-Pool für 3D-Textanzeigen
local displayPool = {}
local maxDisplays = 10 -- Maximale gleichzeitige Anzeigen (kann in Config geändert werden)

function Display(mePlayer, text)
    local displayTime = Config and Config.DisplayTime or 7000
    -- Pool aufräumen
    for i = #displayPool, 1, -1 do
        if GetGameTimer() > displayPool[i].endTime then
            table.remove(displayPool, i)
        end
    end
    -- Wenn zu viele Anzeigen, entferne die älteste
    if #displayPool >= (Config and Config.MaxDisplays or maxDisplays) then
        table.remove(displayPool, 1)
    end
    -- Koordinaten einmalig beim Start holen
    local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
    -- Neue Anzeige hinzufügen
    table.insert(displayPool, {
        mePlayer = mePlayer,
        text = text,
        coords = coordsMe,
        endTime = GetGameTimer() + displayTime
    })
end

function getDynamicDisplayDistance()
    local playerCount = #GetActivePlayers()
    if playerCount <= 10 then
        return 2500
    elseif playerCount <= 30 then
        return 1800
    else
        return 1200
    end
end

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = GetScreenCoordFromWorldCoord(x, y, z)
    if not onScreen then return end
    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())

    -- Farben für Version 1.1.1, Hintergrund komplett schwarz
    local sandR, sandG, sandB = 237, 201, 175 -- Sandfarbe
    local bgR, bgG, bgB, bgA = 0, 0, 0, 220   -- Komplett schwarz, weniger transparent
    local borderR, borderG, borderB, borderA = 255, 220, 180, 120 -- Heller Rahmen
    local scale = Config and Config.TextScale or 0.38
    local alpha = 255

    SetTextScale(scale, scale)
    SetTextFontForCurrentCommand(1)
    SetTextColor(sandR, sandG, sandB, alpha)
    SetTextCentre(1)

    -- Box-Breite großzügiger berechnen
    local factor = (string.len(text)) / 150  -- vorher 225, jetzt großzügiger
    local width = 0.045 + factor             -- vorher 0.025, jetzt mehr Padding
    local height = 0.042

    -- Rahmen (optional, etwas größer als Box)
    DrawRect(_x, _y + 0.0125, width + 0.012, height + 0.008, borderR, borderG, borderB, borderA)
    -- Einfache, komplett schwarze Box als Hintergrund
    DrawRect(_x, _y + 0.0125, width, height, bgR, bgG, bgB, bgA)

    DisplayText(str, _x, _y)
end

-- Pool-Thread anpassen, damit die Sichtweite dynamisch ist
Citizen.CreateThread(function()
    while true do
        Wait(0)
        local now = GetGameTimer()
        local displayDistance = getDynamicDisplayDistance()
        for i = 1, #displayPool do
            local entry = displayPool[i]
            if now < entry.endTime then
                local coords = GetEntityCoords(PlayerPedId(), false)
                local dist = Vdist2(entry.coords, coords)
                if dist < displayDistance then
                    DrawText3D(entry.coords.x, entry.coords.y, entry.coords.z, entry.text)
                end
            end
        end
    end
end)