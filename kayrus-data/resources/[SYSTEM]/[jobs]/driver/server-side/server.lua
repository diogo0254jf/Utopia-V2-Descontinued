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
Tunnel.bindInterface("driver",cRP)
vCLIENT = Tunnel.getInterface("driver")
-----------------------------------------------------------------------------------------------------------------------------------------
-- MOTORISTA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("motorista",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		vCLIENT.toggleService(source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTMETHOD
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.paymentMethod(status)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local value = math.random(50,100)

		if not status then
			vRP.giveInventoryItem(user_id,"dollars",parseInt(value))
		else
			vRP.giveInventoryItem(user_id,"dollars",parseInt(value))
		end
		TriggerClientEvent("sounds:source",source,"coin",0.5)
	end
end