local QBCore = exports['qb-core']:GetCoreObject()
local Player = QBCore.Functions.GetPlayerData() 
local open = false
local loaded = false
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    loaded = true
end)

Citizen.CreateThread(function()
    while true do
        Wait(1)
        SetPauseMenuActive(false)
	if loaded then
	        if (IsControlJustPressed(0, 200)) and not open and not IsPauseMenuActive() then
	            TransitionToBlurred(1000)
	            SetNuiFocus(true, true)
	            open = true
	
	            -- Call the callback to get playersOnline data
	            QBCore.Functions.TriggerCallback('astro:getplayers', function(playersOnline, policeCount, players)
	                print("heLLO")
	                local characterData = {
	                    characterName = Player.charinfo.firstname..' '..Player.charinfo.lastname,
	                    job = Player.job.name,
	                    cashAmount = Player.money['cash'],
	                    bankAmount = Player.money['bank'],
	                    playersOnline = playersOnline,
	                    policeAvailable = true 
	                }
	                SendNUIMessage({
	                    type = "characterData",
	                    data = characterData
	                })
	                SendNUIMessage({
	                    action = "show"
	                })
	            end)
	        end
	end
    end
end)

function closemenu()
	TransitionFromBlurred(1000)
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = "hide"
    })
    open = false
end
RegisterNUICallback('Settings', function(data)
	closemenu()
    ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_LANDING_MENU'),0,-1) 
end)
RegisterNUICallback('Map', function(data)
	closemenu()
    ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_MP_PAUSE'),0,-1) 
end)
RegisterNUICallback('DropPlayer', function(data)
    TriggerServerEvent('astro:droppayer')
end)
-- Send the data to the client-side script
RegisterCommand("send", function()
    
end)
