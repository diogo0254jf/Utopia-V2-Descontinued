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
Tunnel.bindInterface("spawn",cRP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETUPCHARS
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.setupChars()
	local source = source
	local steam = vRP.getSteam(source)

	Citizen.Wait(1000)

	return getPlayerCharacters(steam)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELETECHAR
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.deleteChar(id)
	local source = source
	local steam = vRP.getSteam(source)

	vRP.execute("vRP/remove_characters",{ id = parseInt(id) })
  
	Citizen.Wait(1000)

	return getPlayerCharacters(steam)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHARCHOSEN
-----------------------------------------------------------------------------------------------------------------------------------------
local spawnLogin = {}
RegisterServerEvent("spawn:charChosen")
AddEventHandler("spawn:charChosen",function(id)
	local source = source
	TriggerClientEvent("hudActived",source,true)
	TriggerEvent("baseModule:idLoaded",source,id,nil)

	if spawnLogin[id] then
		TriggerClientEvent("spawn:spawnChar",source,false)
	else
		spawnLogin[id] = true
		TriggerClientEvent("spawn:spawnChar",source,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CREATECHAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("spawn:createChar")
AddEventHandler("spawn:createChar",function(name,name2,sex)
	local source = source
	local steam = vRP.getSteam(source)
	local persons = getPlayerCharacters(steam)

	if (parseInt(#persons) >= vRP.getMaxChar(steam)) then
		TriggerClientEvent("Notify",source,"vermelho","Você atingiu o limite de personagens.",5000)
		TriggerClientEvent("spawn:maxChars",source)
		return
	end

	vRP.execute("vRP/create_characters",{ steam = steam, name = name, name2 = name2 })

	local newId = 0
	local chars = getPlayerCharacters(steam)
	for k,v in pairs(chars) do
		if v.id > newId then
			newId = tonumber(v.id)
		end
	end

	local model = ""
	if sex == "M" then
		model = "mp_m_freemode_01"
	elseif sex == "F" then
		model = "mp_f_freemode_01"
	end

	Citizen.Wait(1000)

	spawnLogin[parseInt(newId)] = true
	TriggerClientEvent("hudActived",source,true)
	TriggerClientEvent("spawn:spawnChar",source,true)
	TriggerEvent("baseModule:idLoaded",source,newId,model)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETPLAYERCHARACTERS
-----------------------------------------------------------------------------------------------------------------------------------------
function getPlayerCharacters(steam)
	return vRP.query("vRP/get_characters",{ steam = steam })
end