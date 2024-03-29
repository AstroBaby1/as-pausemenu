local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('astro:getplayers', function(_, cb)
    local totalPlayers = 0
    local policeCount = 0
    local players = {}

    for _, v in pairs(QBCore.Functions.GetQBPlayers()) do
        if v then
            totalPlayers += 1

            if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then
                policeCount += 1
            end

            players[v.PlayerData.source] = {}
            players[v.PlayerData.source].optin = QBCore.Functions.IsOptin(v.PlayerData.source)
        end
    end
    cb(totalPlayers, policeCount, players)
end)

RegisterNetEvent("astro:droppayer", function()
    DropPlayer(source, "You disconnected from the server")
end)