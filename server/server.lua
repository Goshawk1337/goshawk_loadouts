RegisterNetEvent("gs_loadout:createLoadout", function(name, wep, items, price, code)
    if GetInvokingResource() then return end
    if not source then return end
    if not name then return end
    if not wep then return end
    if not items then return end
    if not price then return end
    if not code then return end
    if not string.len(code) == 6 then return end
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end
    print(xPlayer.identifier, wep, json.encode(items), name, price, code)
    local id = MySQL.insert.await(
        'INSERT INTO `created_loadouts` (identifier, weapon, items, name, price,  import_code) VALUES (?, ?, ?, ?, ?, ?)',
        {
            xPlayer.identifier, wep, json.encode(items), name, price, code
        })

    if not id then return end

    TriggerClientEvent('codem-notification:Create', source, 'Sikeresen létrehoztad a loadoutot!', nil, 'success', 5000)
end)

local function canImport(identifier, code)
    local av_slots = MySQL.scalar.await('SELECT `available_slots` FROM `users` WHERE `identifier` = ? LIMIT 1', {
        identifier
    })

    if av_slots ~= nil then
        local response = MySQL.query.await('SELECT * FROM `saved_loadouts` WHERE `identifier` = ?', {
            identifier
        })
        if response then
            local count = #response + 1
            if count > av_slots and response.import_code == code then
                return false
            else
                return true
            end
        else
            return false
        end
    end
end

RegisterNetEvent("importLoadout", function(code)
    if GetInvokingResource() then return end
    if not source then return end
    if not code then return end
    if not string.len(code) == 6 then return end
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then
        return
    end
    local exist = MySQL.single.await('SELECT * FROM `created_loadouts` WHERE `import_code` = ? LIMIT 1', {
        code
    })

    if not exist then
        TriggerClientEvent('codem-notification:Create', xPlayer.source, 'Nincs ilyen kóddal létező kit!', nil, 'error',
            7000)
        return
    end

    if exist.import_code == code then
        local canImp = canImport(xPlayer.identifier, exist.code)
        if canImp and xPlayer.identifier ~= exist.identifier then
            local affectedRows = MySQL.update.await(
                'UPDATE `created_loadouts` SET imported = imported + 1 WHERE import_code = ?', {
                    exist.import_code
                })
            local id = MySQL.insert.await(
                'INSERT INTO `saved_loadouts` (identifier, import_code) VALUES (?, ?)', {
                    xPlayer.identifier, exist.import_code
                })
            TriggerClientEvent('codem-notification:Create', xPlayer.source,
                'Sikeresen importáltad a loadoutot, nyisd meg újra a menüt hogy lásd!', nil, 'success', 7000)
        else
            TriggerClientEvent('codem-notification:Create', xPlayer.source, 'Nem tudsz már kitet importálni!', nil,
                'error', 7000)
            return
        end
    else
        TriggerClientEvent('codem-notification:Create', xPlayer.source, 'Nincs ilyen kit ezzel a  kóddal!', nil, 'error',
            7000)
        return
    end
end)

lib.callback.register('getSavedloadouts', function(source)
    if not source then return end
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end
    local loadouts = {}
    local response = MySQL.query.await('SELECT `import_code` FROM `saved_loadouts` WHERE `identifier` = ?', {
        xPlayer.identifier
    })

    if response then
        for i = 1, #response do
            local row = response[i]
             local rows = MySQL.single.await('SELECT * FROM `created_loadouts` WHERE `import_code` = ? LIMIT 1', {
                row.import_code
            })
             if rows then
                print(rows.weapon)
                loadouts[#loadouts + 1] = {
                    wep = rows.weapon,
                    items = json.decode(rows.items),
                    name = rows.name,
                    price = rows.price,
                    code = rows.import_code
                }
            end
        end
    end
    Wait(100)
     return loadouts
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
    MySQL.scalar('SELECT import_code FROM created_loadouts WHERE import_code = ?', { code },
        function(result)
            cb(result ~= nil)
        end)
end)
