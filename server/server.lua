RegisterNetEvent("gs_loadout:createLoadout", function(items, weapon, price)
    if GetInvokingResource() then return end
    if not items then return end
    if not weapon then return end
    if not price then return end
    if not source then return end
    local xPlayer = ESX.GetPlayerFromId(source)
end)

RegisterNetEvent("gs_loadout:buyLoad", function(items, price)
    if GetInvokingResource() then return end
    if not items then return end
    if not price then return end
    if not source then return end
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then
        return
    end

    local itemCount = 0
   

    local c = 0
    local hasCash = exports.ox_inventory:GetItemCount(source, "money") >= price

    if not hasCash then
        TriggerClientEvent('codem-notification:Create', source,
            'Nincs elég készpénzed a kithez, a rendszer megpróbálja a banki egyenleged.', nil, 'error', 7000)
        local hasBank = xPlayer.getAccount("bank").money >= price
        if not hasBank then
            TriggerClientEvent('codem-notification:Create', source, 'Nincs elég pénzed a kithez a bankban sem!', nil,
                'error', 5000)
            return
        else
            TriggerClientEvent('codem-notification:Create', source,
            'Sikeresen megvetted a kitet, a bankodból levontuk az összeget!', nil, "success", 7000)
            xPlayer.removeAccountMoney("bank", price)
        end
    end


    for k, v in pairs(items) do
        itemCount += 1
        local canCarry = exports.ox_inventory:CanCarryItem(source, k, v.count)
        if not canCarry then
            TriggerClientEvent('codem-notification:Create', source, 'Nincs elég helyed a kithez!', nil, 'error', 5000)
            return
        end
        c = c + 1
    end

     if c == itemCount then
        TriggerClientEvent('codem-notification:Create', source, 'Sikeresen megvetted a kitet!', nil, 'success', 5000)
        for k, v in pairs(items) do
            exports.ox_inventory:AddItem(source, k, v.count)
        end
        exports.ox_inventory:RemoveItem(source, "money", price)
    end
end)


ESX.RegisterServerCallback('isCodeTaken', function(source, cb, code)
	MySQL.scalar('SELECT import_code FROM created_loadouts WHERE import_code = ?', {code},
	function(result)
		cb(result ~= nil)
	end)
end)

