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
Tunnel.bindInterface("dismantle",cRP)
vSERVER = Tunnel.getInterface("dismantle")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local inService = false
local timeDismantle = 0
local disX,disY,disZ = 2351.29,3133.02,48.21
local listX,listY,listZ = 2340.92,3128.05,48.21
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADDISMANTLE
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 500
		if inService then
			local ped = PlayerPedId()
			if not IsPedInAnyVehicle(ped) then
				local coords = GetEntityCoords(ped)
				local distance = #(coords - vector3(disX,disY,disZ))
				if distance <= 7 then
					timeDistance = 4
					DrawText3D(2351.29,3133.02,48.21,"~g~E~w~ DESMANCHAR")
					if IsControlJustPressed(1,38) and timeDismantle <= 0 then
						timeDismantle = 3
						local status,vehicle = vSERVER.checkVehlist()
						if status then
							TaskTurnPedToFaceEntity(ped,vehicle,1000)
							Citizen.Wait(2000)
							SetEntityInvincible(ped,true)
							FreezeEntityPosition(ped,true)
							TriggerEvent("cancelando",true)
							FreezeEntityPosition(vehicle,true)
							vRP._playAnim(false,{"anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer"},true)

							for i = 0,5 do
								Citizen.Wait(10000)
								SetVehicleDoorBroken(vehicle,i,false)
							end

							for i = 0,7 do
								Citizen.Wait(10000)
								SetVehicleTyreBurst(vehicle,i,1,1000.01)
							end

							vRP.removeObjects()
							vSERVER.paymentMethod(vehicle)
							SetEntityInvincible(ped,false)
							FreezeEntityPosition(ped,false)
							TriggerEvent("cancelando",false)
						end
					end
				end
			end
		end
		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADTIMER
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		if timeDismantle > 0 then
			timeDismantle = timeDismantle - 1
		end
		Citizen.Wait(1000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADLIST
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 500
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			timeDistance = 4
			vSERVER.acessList()
			inService = true
		end
		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAWTEXT3D
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3D(x,y,z,text)
	local onScreen,_x,_y = GetScreenCoordFromWorldCoord(x,y,z)

	if onScreen then
		BeginTextCommandDisplayText("STRING")
		AddTextComponentSubstringKeyboardDisplay(text)
		SetTextColour(255,255,255,150)
		SetTextScale(0.35,0.35)
		SetTextFont(4)
		SetTextCentre(1)
		EndTextCommandDisplayText(_x,_y)

		local width = string.len(text) / 160 * 0.45
		DrawRect(_x,_y + 0.0125,width,0.03,38,42,56,200)
	end
end