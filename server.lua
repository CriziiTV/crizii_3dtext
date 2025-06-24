local logEnabled = true
local playerCooldowns = {}
local cooldownTime = 8000 -- 8 Sekunden in ms

RegisterServerEvent('3dme:shareDisplay')
AddEventHandler('3dme:shareDisplay', function(text)
	local src = source
	local now = os.time() * 1000
	if playerCooldowns[src] and now < playerCooldowns[src] then
		TriggerClientEvent('chat:addMessage', src, {
			color = {255, 0, 0},
			multiline = true,
			args = {'System', 'Bitte warte 8 Sekunden zwischen /me-Nachrichten!'}
		})
		return
	end
	-- Eingabe validieren (max. 80 Zeichen, keine Steuerzeichen)
	if type(text) ~= 'string' or #text > 80 or text:find('[%c]') then
		TriggerClientEvent('chat:addMessage', src, {
			color = {255, 0, 0},
			multiline = true,
			args = {'System', 'Deine /me-Nachricht darf maximal 80 Zeichen lang sein!'}
		})
		return
	end
	playerCooldowns[src] = now + cooldownTime
	TriggerClientEvent('3dme:triggerDisplay', -1, text, src)
	if logEnabled then
		setLog(text, src)
	end
end)

function setLog(text, source)
	local time = os.date("%d/%m/%Y %X")
	local name = GetPlayerName(source) or "Unbekannt"
	local identifier = GetPlayerIdentifiers(source)[1] or "Unbekannt"
	local data = time .. ' : ' .. name .. ' - ' .. identifier .. ' : ' .. text

	local content = LoadResourceFile(GetCurrentResourceName(), "log.txt") or ""
	local newContent = content .. '\r\n' .. data
	SaveResourceFile(GetCurrentResourceName(), "log.txt", newContent, -1)
end