-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local vehMenu = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADFOCUS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHCONTROL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("vehControl",function(source,args)
	-- if not exports["player"]:blockCommands() and not exports["player"]:handCuff() and not vehMenu then
		local ped = PlayerPedId()
		if not IsEntityInWater(ped) and GetEntityHealth(ped) > 101 then
			local vehicle = vRP.vehList(7)
			if vehicle then
				SendNUIMessage({ show = true })
				SetCursorLocation(0.5,0.8)
				SetNuiFocus(true,true)
				vehMenu = true
			end
		-- end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHCONTROL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterKeyMapping("vehControl","Abrir o menu rapido.","keyboard","f4")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSESYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("closeSystem",function(data)
	SendNUIMessage({ show = false })
	SetCursorLocation(0.5,0.5)
	SetNuiFocus(false,false)
	vehMenu = false
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- MENUACTIVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("menuActive",function(data)
	if data["active"] == "lock" then
		TriggerServerEvent("garages:vehicleServerLock")
	elseif data["active"] == "chest" then
		SendNUIMessage({ show = false })
		SetCursorLocation(0.5,0.5)
		SetNuiFocus(false,false)
		vehMenu = false
		ExecuteCommand('bau')
	elseif data["active"] == "door1" then
		ExecuteCommand('doors 1')
	elseif data["active"] == "door2" then
		ExecuteCommand('doors 2')
	elseif data["active"] == "door3" then
		ExecuteCommand('doors 3')
	elseif data["active"] == "door4" then
		ExecuteCommand('doors 4')
	elseif data["active"] == "trunk" then
		ExecuteCommand('doors 5')
	elseif data["active"] == "hood" then
		ExecuteCommand('hood')
	elseif data["active"] == "trunkin" then
		SendNUIMessage({ show = false })
		SetCursorLocation(0.5,0.5)
		SetNuiFocus(false,false)
		vehMenu = false
		ExecuteCommand('trunkin')
	elseif data["active"] == "vtuning" then
		SendNUIMessage({ show = false })
		SetCursorLocation(0.5,0.5)
		SetNuiFocus(false,false)
		vehMenu = false
		ExecuteCommand('vtuning')
	end
end)