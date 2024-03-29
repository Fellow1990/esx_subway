RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

local Options, moneySubway = {}, 0
for i = 1, #Config.cars do
    if i == 1 then
        Options[i] = { title = Config.cars[i].nom, args = Config.cars[i].modele, event = 'esx_subway:delCar'}
    else
        Options[i] = { title = Config.cars[i].nom, args = Config.cars[i].modele, event = 'esx_subway:spawnCar'}
    end
end
    lib.registerContext({
        id = 'openGarage',
        title = _U('title_garage'),
        options = Options,
    })

function openBoss()
	refreshSubwayMoney()
	Wait(250)
	lib.registerContext({
		id = 'boss',
		title = _U('title'),
		options = {
			[_U('money_society')..moneySubway] = {},
			[_U('deposit')] = {
				event = 'esx_subway:deposit'
			},
			[_U('withdraw')] = {
				event = 'esx_subway:withdraw'
			},
			[_U('recruit')] = {
				event = 'esx_subway:setjob',
				args = {value1 = data, value2 = 'recruit'}
			},
			{
				title = _U('management'),
				arrow = true,
				event = 'esx_subway:management'
			}
		}
	})
	lib.showContext('boss')
end

local listEmployee
function getEmployee(jobname)
	listEmployee = {}
  ESX.TriggerServerCallback('esx_subway:getEmployee', function(data)
    listEmployee = data
 end, jobname)
end

RegisterNetEvent('esx_subway:management', function(data)
	getEmployee(ESX.PlayerData.job.name)
	Wait(250)
	local options = {}
	for i = 1, #listEmployee do
		options[i] = { title = listEmployee[i].name, args = listEmployee[i].playerId, event = 'esx_subway:playersOptions', description = listEmployee[i].gradeLabel}
	end
    lib.registerContext({
        id = 'playersOptions',
        title = _U('management'),
        menu = 'boss',
        options = options
    })
    lib.showContext('playersOptions')
end)

RegisterNetEvent('esx_subway:playersOptions', function(data)
    lib.registerContext({
        id = 'playersOptions',
        title = _U('management'),
        menu = 'boss',
        options = {
			[_U('promote')] = {
				arrow = true,
				event = 'esx_subway:setjob',
				args = {value1 = data, value2 = 'promote'}
			},
			[_U('demote')] = {
				arrow = true,
				event = 'esx_subway:setjob',
				args = {value1 = data, value2 = 'demote'}
			},
			[_U('fire')] = {
				arrow = true,
				event = 'esx_subway:setjob',
				args = {value1 = data, value2 = 'fire'}
			}
		}
    })
    lib.showContext('playersOptions')
end)


		for k,v in pairs (Config.Zones) do
					exports.ox_target:addSphereZone({
						coords = v.Pos,
						radius = 1,
						options = {
							{
								name = 'sphere',
								event = v.event,
								icon = v.icon,
								label = v.message,
								groups = {subway=v.grade}
							}
						}
					})
				end
			end
		end

RegisterNetEvent('esx_subway:openGarage')
AddEventHandler('esx_subway:openGarage',function()
    lib.showContext('openGarage')
end)

function createCar(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Wait(0)
    end

    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), false))
    local vehicle = CreateVehicle(car, Config.Subway.SpawnVeh, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
    local plaque = Config.Plate..math.random(1,9)
    SetVehicleNumberPlateText(vehicle, plaque) 
    SetPedIntoVehicle(PlayerPedId(),vehicle,-1)
    SetVehicleCustomPrimaryColour(vehicle, Config.ColorCar.Red, Config.ColorCar.Green, Config.ColorCar.Blue)
    SetVehicleCustomSecondaryColour(vehicle, Config.ColorCar.Red, Config.ColorCar.Green, Config.ColorCar.Blue)
end

RegisterNetEvent('esx_subway:spawnCar', function(data)
    createCar(data)
end)

RegisterNetEvent('esx_subway:delCar')
AddEventHandler('esx_subway:delCar',function()
    local veh = ESX.Game.GetClosestVehicle()
    DeleteEntity(veh)
end)

function refreshSubwayMoney()
    if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' then
        ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
            updateSubwayMoney(money)
        end, ESX.PlayerData.job.name)
    end
end

function updateSubwayMoney(money)
    moneySubway = ESX.Math.GroupDigits(money)
end

RegisterNetEvent('esx_subway:openBoss')
AddEventHandler('esx_subway:openBoss',function()
	refreshSubwayMoney()
	openBoss()
end)

RegisterNetEvent('esx_subway:deposit')
AddEventHandler('esx_subway:deposit', function()
	local input = lib.inputDialog(_U('title'), {_U('amount')})
	local amount = tonumber(input[1])
	TriggerServerEvent('esx_society:depositMoney', ESX.PlayerData.job.name, amount)
end)

RegisterNetEvent('esx_subway:withdraw')
AddEventHandler('esx_subway:withdraw', function()
	local input = lib.inputDialog(_U('title'), {_U('amount')})
	local amount = tonumber(input[1])
	TriggerServerEvent('esx_society:withdrawMoney', ESX.PlayerData.job.name, amount)
end)

RegisterNetEvent('esx_subway:setjob', function(data)
	local closestPlayer = ESX.Game.GetClosestPlayer()
	if data.value2 == 'recruit' then
		TriggerServerEvent('esx_subway:setJob',  GetPlayerServerId(closestPlayer), data.value2)
	else
		TriggerServerEvent('esx_subway:setJob', data.value1, data.value2)
	end
end)

CreateThread(function()
	local blip = AddBlipForCoord(Config.SubwayBlip.Coords)

	SetBlipSprite (blip, Config.SubwayBlip.Sprite)
	SetBlipDisplay(blip, Config.SubwayBlip.Display)
	SetBlipScale  (blip, Config.SubwayBlip.Scale)
	SetBlipColour (blip, Config.SubwayBlip.Colour)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName(_U('subway'))
	EndTextCommandSetBlipName(blip)
end)
