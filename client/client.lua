function setNuiState(state)
    SetNuiFocus(state, state)

    SendNUIMessage({
        type = "show",
        enable = state,
    })
end

RegisterNUICallback('exit', function(data, cb)
    setNuiState(false)
    cb('ok')
end)

RegisterCommand('open', function(source, args, raw)
    setNuiState(true)
end, false)

local function openLoadout()
    setNuiState(true)
    SendNUIMessage({
        type = "initThings",
        premadeLoads = Config.premadeLoads,
    })
end
RegisterNUICallback('blackList', function(cb)
    ESX.ShowNotification('Fekete listás szavakat tartalmaz a loadoutod neved!', 5000, "error")
    cb('ok')
end)
RegisterNUICallback('createCustom', function(data, cb)
    if not source then return end
    if not data then return end
    if not data.weps then return end
    if not data.items then return end

    local wep = data.weps
    local items = data.items
    local price = data.price
end)
RegisterNUICallback('buyLoad', function(data, cb)
    if not source then return end
    if not Config.premadeLoads[data.loadID] then
        return
    end

    loadout = Config.premadeLoads[data.loadID]
    TriggerServerEvent('gs_loadout:buyLoad', loadout.items, loadout.price)
    cb('ok')
end)








LoadModel = function(modelname)
    local model = GetHashKey(modelname)

    RequestModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
end

local NearPeds = {}

InitPeds = function()
    LoadModel("a_m_m_og_boss_01")

    for i, v in ipairs(Config.loadOutShops) do
        local Ped = CreatePed(4, "a_m_m_og_boss_01", v.coords, false, false)
        FreezeEntityPosition(Ped, true)
        SetBlockingOfNonTemporaryEvents(Ped, true)
        SetEntityInvincible(Ped, true)
    end

    CreateThread(DrawNPCText)
    while true do
        local myped = PlayerPedId()
        local mycoords = GetEntityCoords(myped)
        NearPeds = {}

        for i, v in ipairs(Config.loadOutShops) do
            local dist = #(vector3(v.coords.x, v.coords.y, v.coords.z) - mycoords)

            if dist < 10.0 then
                table.insert(NearPeds, { coords = v.coords, dist = dist })
            end
        end

        Wait(500)
    end
end

DrawNPCText = function()
    while true do
        sleep = 500

        for i, v in ipairs(NearPeds) do
            sleep = 0
            local text = "~g~LOADOUT~s~ Vásárlása"

            if v.dist < 10.0 then
                text = "~g~LOADOUT~s~ Vásárlása"

                if v.dist < 2.0 then
                    text = "~g~LOADOUT~s~ Vásárlása\nNyomj [~g~E~s~] gombot"

                    if IsControlJustPressed(0, 38) then
                        openLoadout()
                    end
                end

                DrawText3D(v.coords.x, v.coords.y, v.coords.z + 2.1, text)
            end
        end
        Wait(sleep)
    end
end

DrawText3D = function(x, y, z, text)
    local onScreen = World3dToScreen2d(x, y, z)

    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 55)
        SetTextDropShadow()
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(true)
        AddTextComponentString(text)
        SetDrawOrigin(x, y, z, 0)
        DrawText(0.0, 0.0)
        ClearDrawOrigin()
    end
end

CreateThread(InitPeds)

local NumberCharset = {}
local Charset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end

for i = 65,  90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

function GenerateCode()
	math.randomseed(GetGameTimer())

	local generatedCode = string.upper(GetRandomLetter(Config.CodeLetters) .. (Config.CodeUseSpace and ' ' or '') .. GetRandomNumber(Config.CodeNumbers))

	local isTaken = IsCodeTaken(generatedCode)
	if isTaken then 
		return GenerateCode()
	end

	return generatedCode
end

-- mixing async with sync tasks
function IsCodeTaken(code)
	local p = promise.new()
	
	ESX.TriggerServerCallback('isCodeTaken', function(isCodeTaken)
		p:resolve(isCodeTaken)
	end, code)

	return Citizen.Await(p)
end

function GetRandomNumber(length)
	Wait(0)
	return length > 0 and GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)] or ''
end

function GetRandomLetter(length)
	Wait(0)
	return length > 0 and GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)] or ''
end