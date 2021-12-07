local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
emP = {}
Tunnel.bindInterface("miner",emP)
----------------------------------------------------------------------
local ammount = {}
local percentage = 0
local itemName = ""
----------------------------------------------------------------------
function emP.ammount()
	local source = source
	if ammount[source] == nil then
		ammount[source] = parseInt(math.random(config.quantidade[1],config.quantidade[2]))
	end
end
----------------------------------------------------------------------
function emP.checkWeight()
	emP.ammount()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		percentage = math.random(100)
		if percentage <= 58 then
			itemName = config.prata
		elseif percentage >= 59 and percentage <= 79 then
			itemName = config.ouro
		elseif percentage >= 80 and percentage <= 90 then
			itemName = config.diamante
		elseif percentage >= 91 then
			itemName = config.esmeralda
		end
		return vRP.computeInvWeight(user_id) + vRP.itemWeightList(itemName)*ammount[source] <= vRP.getBackpack(user_id) 
	end
end
----------------------------------------------------------------------
function emP.checkPayment()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		vRP.giveInventoryItem(user_id,itemName,ammount[source],true)
		ammount[source] = nil
	end
end
---------------------------------------------------------------------
