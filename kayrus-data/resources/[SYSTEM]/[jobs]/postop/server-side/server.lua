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
Tunnel.bindInterface("postop",cRP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local maxPackage = 25
local boxVehicles = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOPOP:ADDPACKAGE
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.addPackage(vehPlate)
	if boxVehicles[vehPlate] == nil then
		boxVehicles[vehPlate] = 1
	else
		if boxVehicles[vehPlate] < maxPackage then
			boxVehicles[vehPlate] = boxVehicles[vehPlate] + 1
		else
			return false
		end
	end

	TriggerClientEvent("postop:updatePackage",-1,boxVehicles)
	return true
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTMETHOD
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.paymentMethod()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local value = math.random(100,150)
		local myBonus = vRP.bonusPostOp(user_id)
		vRP.giveInventoryItem(user_id,"dollars",parseInt(value+(value*myBonus/100)),true)
		TriggerClientEvent("sounds:source",source,"coin",0.5)
		local random = math.random(100)
		if random <= 5 then
			if parseInt(myBonus) >= 100 then
				return
			end
			vRP.setBonusPostOp(user_id,math.random(0,2))
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOPOP:REMPACKAGE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("postop:remPackage")
AddEventHandler("postop:remPackage",function(vehPlate)
	if boxVehicles[vehPlate] then
		boxVehicles[vehPlate] = boxVehicles[vehPlate] - 1

		if boxVehicles[vehPlate] <= 0 then
			boxVehicles[vehPlate] = nil
		end

		TriggerClientEvent("postop:updatePackage",-1,boxVehicles)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERSPAWN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerSpawn",function(user_id,source)
	TriggerClientEvent("postop:updatePackage",source,boxVehicles)
end)