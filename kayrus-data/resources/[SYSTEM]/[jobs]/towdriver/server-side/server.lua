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
Tunnel.bindInterface("towdriver",cRP)
vCLIENT = Tunnel.getInterface("towdriver")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local userList = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTMETHOD
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.paymentMethod()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		userList[user_id] = nil
		vRP.upgradeStress(user_id,1)
		local value = math.random(750,1000)

		vRP.giveInventoryItem(user_id,"dollars",parseInt(value),true)
		TriggerClientEvent("sounds:source",source,"coin",0.5)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TOW
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tow",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vCLIENT.checkService(source) or vRP.hasPermission(user_id,'Mechanic') then
			if vRPclient.getHealth(source) > 101 then
				vCLIENT.towPlayer(source)
				userList[user_id] = source
			end
		else
			TriggerClientEvent("Notify",source,"azul","Somente trabalhadores do <b>Reboque e Mêcanicos</b> podem utilizar deste serviço.",5000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYTOW
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.tryTow(vehid01,vehid02,mod)
	TriggerClientEvent("towdriver:syncTow",-1,vehid01,vehid02,tostring(mod))
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TOWDRIVER:ALERTPLAYERS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("towdriver:alertPlayers")
AddEventHandler("towdriver:alertPlayers",function(x,y,z,message)
	for k,v in pairs(userList) do
		async(function()
			TriggerClientEvent("NotifyPush",v,{ time = os.date("%H:%M:%S"), code = "GUINCHO", title = "Registro de Veículo", x = x, y = y, z = z, vehicle = message, rgba = {160,108,15} })
		end)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERLEAVE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerLeave",function(user_id,source)
	if userList[user_id] then
		userList[user_id] = nil
	end
end)