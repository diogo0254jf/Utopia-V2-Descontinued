-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("stockade",cRP)
vCLIENT = Tunnel.getInterface("stockade")
vTASKBAR = Tunnel.getInterface("taskbar")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local stockadePlates = {}
local blockStockades = {}
local stockadeItem = "blackcard"
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKPOLICE
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.checkPolice(vehPlate)
	if blockStockades[vehPlate] ~= nil then
		return false
	end

	local source = source
	local police = vRP.numPermission("Police")
	if parseInt(#police) <= 0 then
		TriggerClientEvent("Notify",source,"azul","Sistema indisponível no momento, tente mais tarde.",5000)
		return false
	end
	return true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- WITHDRAWMONEY
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.withdrawMoney(vehPlate,vehNet)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if stockadePlates[vehPlate] == nil then
			if vRP.getInventoryItemAmount(user_id,stockadeItem) >= 1 then
				local taskResult = vTASKBAR.taskThree(source)
				if taskResult then
					if vRP.tryGetInventoryItem(user_id,stockadeItem,1,true) then
						stockadePlates[vehPlate] = 1
						TriggerClientEvent("stockade:Destroy",-1,vehNet)
						TriggerClientEvent("Notify",source,"verde","Sistema violado e as autoridades foram notificadas.",5000)

						local x,y,z = vRPclient.getPositions(source)
						local copAmount = vRP.numPermission("Police")
						for k,v in pairs(copAmount) do
							async(function()
								TriggerClientEvent("NotifyPush",v,{ time = os.date("%H:%M:%S"), code = "QRU", title = "Roubo ao Carro Forte", x = x, y = y, z = z, rgba = {105,52,136} })
							end)
						end
					end
				end
			else
				TriggerClientEvent("Notify",source,"amarelo","Você não possui um <b>"..vRP.itemNameList(stockadeItem).."</b>.",5000)
			end
		else
			if stockadePlates[vehPlate] > 0 then
				vRP.wantedTimer(user_id,1)
				vCLIENT.freezePlayers(source,true)
				TriggerClientEvent("cancelando",source,true)
				stockadePlates[vehPlate] = stockadePlates[vehPlate] - 1
				vRPclient._playAnim(source,false,{ task = "PROP_HUMAN_BUM_BIN" },true)

				Citizen.Wait(20000)

				vRPclient._stopAnim(source,false)
				vCLIENT.freezePlayers(source,false)
				TriggerClientEvent("cancelando",source,false)
				vRP.giveInventoryItem(user_id,"dollars2",math.random(5000,10000),true)
			else
				TriggerClientEvent("Notify",source,"vermelho","Nenhum dinheiro encontrado.",5000)
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- INPUTVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("stockade:inputVehicle")
AddEventHandler("stockade:inputVehicle",function(vehPlate)
	blockStockades[vehPlate] = true
	TriggerClientEvent("stockade:Client",-1,blockStockades)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERSPAWN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerSpawn",function(user_id,source)
	TriggerClientEvent("stockade:Client",source,blockStockades)
end)