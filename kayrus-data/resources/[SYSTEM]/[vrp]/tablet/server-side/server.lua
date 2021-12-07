-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("tablet",cRP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------

local motos = {}
local carros = {}
local bichoSelect = "1"
local registerGames = {}

Citizen.CreateThread(function()
	local vehicles = vRP.vehicleGlobal()
	for k,v in pairs(vehicles) do
		if v[4] == "cars" then
			table.insert(carros,{ k = k, name = v[1], price = v[3], chest = parseInt(v[2]) })
		elseif v[4] == "bikes" then
			table.insert(motos,{ k = k, name = v[1], price = v[3], chest = parseInt(v[2]) })
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookdealership = ""
function creativelogs(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CARROS
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.Carros()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		return carros
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- MOTOS
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.Motos()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		return motos
	end
end

function cRP.Possuidos()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local vehList = {}
		local vehicles = vRP.query("vRP/get_vehicle",{ user_id = parseInt(user_id) })
		for k,v in pairs(vehicles) do
			table.insert(vehList,{ k = v.vehicle, work = v.work, name = vRP.vehicleName(v.vehicle), price = parseInt(vRP.vehiclePrice(v.vehicle)*0.7), chest = parseInt(vRP.vehicleChest(v.vehicle)) })
		end
		return vehList
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUYDEALER
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.buyDealer(name)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		local vehName = tostring(name)
		local maxVehs = vRP.query("vRP/con_maxvehs",{ user_id = parseInt(user_id) })
		local myGarages = vRP.getInformation(user_id)
		if vRP.getPremium(user_id) then
			if parseInt(maxVehs[1].qtd) >= parseInt(myGarages[1].garage) then
				TriggerClientEvent("Notify",source,"vermelho","Você atingiu o máximo de veículos em sua garagem.",3000)
				return
			end
		else
			if parseInt(maxVehs[1].qtd) >= parseInt(myGarages[1].garage) then
				TriggerClientEvent("Notify",source,"vermelho","Você atingiu o máximo de veículos em sua garagem.",3000)
				return
			end
		end

		local vehicle = vRP.query("vRP/get_vehicles",{ user_id = parseInt(user_id), vehicle = vehName })
		if vehicle[1] then
			TriggerClientEvent("Notify",source,"vermelho","Você já possui um <b>"..vRP.vehicleName(vehName).."</b>.",3000)
			return
		else
			if vRP.paymentBank(user_id,parseInt(vRP.vehiclePrice(vehName))) then
				vRP.execute("vRP/add_vehicle",{ user_id = parseInt(user_id), vehicle = vehName, plate = vRP.generatePlateNumber(), phone = vRP.getPhone(user_id), work = tostring(false) })
				TriggerClientEvent("Notify",source,"verde","A compra foi concluída com sucesso.",5000)
				creativelogs(webhookdealership,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[COMPROU]: "..vRP.vehicleName(name).." [POR]: R$ "..vRP.format(parseInt(vRP.vehiclePrice(name)*0.75)).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			else
				TriggerClientEvent("Notify",source,"vermelho","Dinheiro insuficiente na sua conta bancária.",5000)
			end
		end
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- SELLDEALER
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.sellDealer(name)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)	
	if user_id then
		if vRP.vehicleType(name) ~= nil or vRP.vehicleType(name) == "donate" then
			local vehName = tostring(name)

			vRP.execute("vRP/rem_srv_data",{ dkey = "custom:"..parseInt(user_id)..":"..vehName })
			vRP.execute("vRP/rem_srv_data",{ dkey = "chest:"..parseInt(user_id)..":"..vehName })
			vRP.execute("vRP/rem_vehicle",{ user_id = parseInt(user_id), vehicle = vehName })
			vRP.addBank(user_id,parseInt(vRP.vehiclePrice(name)*0.75))
			TriggerClientEvent("Notify",source,"verde","Venda concluida com sucesso.",7000)
			creativelogs(webhookdealership,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[VENDEU]: "..vRP.vehicleName(name).." [POR]: R$ "..vRP.format(parseInt(vRP.vehiclePrice(name)*0.75)).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		else
			TriggerClientEvent("Notify",source,"vermelho","Voce nao pode vender este veiculo.",7000)
		end
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- IDENTIFY PLAYER
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.playerIdentify()
	local source = source
	local user_id = vRP.getUserId(source)
	local steam = vRP.getSteam(source)
	if user_id then
		local myGarages = vRP.getInformation(user_id)
		local identity = vRP.getUserIdentity(user_id)
		local maxWeight = vRP.computeInvWeight(user_id)
		local backpack = vRP.getBackpack(user_id)
		local gems = vRP.getUserGems(user_id)
		local fullName = identity.name..' '..identity.name2
		local premium = vRP.getPremium2(steam)
		local garageMax = 2

		return 
		{
			user_id, -- 0
			fullName, -- 1
			identity.phone, -- 2
			identity.registration, -- 3
			identity.bank, -- 4
			gems, -- 5
			premium, -- 6
			myGarages[1].garage -- 7
		}
	end	
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BICHOS
-----------------------------------------------------------------------------------------------------------------------------------------
local bichoGames = {
	[1] = "Camelo",
	[2] = "Pavão",
	[3] = "Elefante",
	[4] = "Coelho",
	[5] = "Burro",
	[6] = "Gato",
	[7] = "Galo",
	[8] = "Trigre",
	[9] = "Rato"
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
local drawTimers = {
	["10:00:00"] = true,
	["12:00:00"] = true,
	["14:00:00"] = true,
	["16:00:00"] = true,
	["18:00:00"] = true,
	["20:00:00"] = true,
	["22:00:00"] = true,
	["00:00:00"] = true,
	["02:00:00"] = true,
	["04:00:00"] = true,
	["06:00:00"] = true,
	["08:00:00"] = true
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION LISTAR OU COMPRAR BICHO VALOR
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.beastGame(animal,value)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if bichoGames[parseInt(animal)] and parseInt(value) > 0 then
			if registerGames[animal] == nil then
				registerGames[animal] = {}
			end
			if registerGames[animal][parseInt(user_id)] == nil then
				if vRP.paymentBank(user_id,parseInt(value)) then
					registerGames[animal][tostring(user_id)] = parseInt(value)
					TriggerClientEvent("Notify",source,"verde","Aposta de $<b>"..vRP.format(value).."</b> no <b>"..bichoGames[parseInt(animal)].."</b>.",4000)
				end
			else
				TriggerClientEvent("Notify",source,"vermelho","Ja existe uma aposta no <b>"..bichoGames[parseInt(animal)].."</b>.",7000)
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread( function()
	while true do
		if drawTimers[os.date("%H:%M:%S")] then
			local winners = 0
			bichoSelect = tostring(math.random(#bichoGames))

			if registerGames[bichoSelect] then
				for k,v in pairs(registerGames[bichoSelect]) do
					winners = winners + 1

					if vRP.getPremium(parseInt(k)) then
						vRP.addBank(parseInt(k), parseInt(v * 2.5))
						TriggerClientEvent("Notify",k,"verde","Recebou $<b>"..vRP.format(parseInt(v * 2.5)).."</b> do jogo do <b>Bicho</b>.",7000)
					else
						vRP.addBank(parseInt(k), parseInt(v * 2))
						TriggerClientEvent("Notify",k,"verde","Recebou $<b>"..vRP.format(parseInt(v * 2)).."</b> do jogo do <b>Bicho</b>.",7000)
					end
				end
			end
			
			if winners >= 2 then
				TriggerClientEvent("Notify",-1,"verde","O resultado do <b>Jogo do Bicho</b> foi <b>"..bichoGames[parseInt(bichoSelect)].."</b>, Os pagamentos foram efetuados aos <b>"..winners.."</b> ganhadores do jogo do <b>bicho</b>.",11000)
			end

			if winners == 0 then
				TriggerClientEvent("Notify",-1,"verde","O resultado do <b>Jogo do Bicho</b> foi <b>"..bichoGames[parseInt(bichoSelect)].."</b>, Os pagamentos foram efetuados aos <b>"..winners.."</b> ganhadores do jogo do <b>bicho</b>.",11000)
			end

			for i = 1, parseInt(#bichoGames) do
				registerGames[tostring(i)] = {}
			end
		end
		Citizen.Wait(1000)
	end
end)

