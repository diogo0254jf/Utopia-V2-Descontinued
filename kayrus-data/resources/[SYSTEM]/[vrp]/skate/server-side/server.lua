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
sKT = {}
Tunnel.bindInterface("skate",sKT)

function sKT.giveScate()
local source = source
local user_id = vRP.getUserId(source)
	if vRP.getInventoryItemAmount(user_id,"skate") <= 0 then
		vRP.giveInventoryItem(user_id,"skate",1,true)
		return true
	end
	return false
end