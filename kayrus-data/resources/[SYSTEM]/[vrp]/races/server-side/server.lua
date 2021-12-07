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
Tunnel.bindInterface("races",cRP)
vCLIENT = Tunnel.getInterface("races")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local race = 1
local totalRaces = 18
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTRACE
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.checkTicket()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.wantedReturn(user_id) then
			return false
		end

		if vRP.tryGetInventoryItem(user_id,"raceticket",1) then
			TriggerEvent("blipsystem:serviceEnter",source,"Corredor",75)
			vRP.upgradeStress(user_id,5)
			return true
		end
		
		return false
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTRACE
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.startRace()
	local copAmount = vRP.numPermission("Police")
	for k,v in pairs(copAmount) do
		async(function()
			TriggerClientEvent("NotifyPush",v,{ code = 20, title = "Corredor Ilegal", x = x, y = y, z = z, rgba = {41,76,119} })
		end)
	end

	return parseInt(race)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- RANDOMPOINT
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		race = math.random(totalRaces)
		Citizen.Wait(5*60000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTMETHOD
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.paymentMethod(vehPlate)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		vRP.wantedTimer(user_id,100)

		TriggerEvent("blipsystem:serviceExit",source)

		vRP.giveInventoryItem(user_id,"dollars",parseInt(math.random(4000,5000)),true)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEFUSAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("defusar",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Police") then
			local nplayer = vRPclient.getNearestPlayer(source,10)
			if nplayer then
				vCLIENT.defuseRace(nplayer)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- RACES:EXPLOSIVEPLAYERS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("races:explosivePlayers")
AddEventHandler("races:explosivePlayers",function()
	local source = source
	TriggerEvent("races:serviceExit",source)
end)