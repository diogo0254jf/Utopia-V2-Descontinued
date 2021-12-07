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
Tunnel.bindInterface("garbageman",cRP)
vSERVER = Tunnel.getInterface("garbageman")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = {}
local timeSeconds = 0
local garbageList = {}
local inService = false
local vehModel = 1917016601
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADGARBAGE
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 500
		if inService then
			local ped = PlayerPedId()
			if not IsPedInAnyVehicle(ped) then
				local coords = GetEntityCoords(ped)

				for k,v in pairs(garbageList) do
					local distance = #(coords - vector3(v[1],v[2],v[3]))
					if distance <= 8 then
						timeDistance = 4
						DrawText3D(v[1],v[2],v[3],"~g~E~w~   VASCULHAR")
						if distance <= 0.6 and IsControlJustPressed(1,38) and timeSeconds <= 0 and GetEntityModel(GetPlayersLastVehicle()) == vehModel then
							timeSeconds = 2
							vSERVER.paymentMethod(parseInt(k))
							vRP._playAnim(false,{"anim@amb@business@coc@coc_packing_hi@","full_cycle_v1_pressoperator"},true)
							Citizen.Wait(5000)
							vRP.stopAnim()
						end
					end
				end
			end
		end
		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTGARBAGEMAN
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.getGarbageStatus()
	return inService
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTGARBAGEMAN
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.startGarbageman()
	inService = true
	local ped = PlayerPedId()
	ClearAllPedProps(ped)
	if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
			
		SetPedComponentVariation(ped,1,-1,5)
		SetPedComponentVariation(ped,3,16,0,2)
		SetPedComponentVariation(ped,4,36,0,2)
		SetPedComponentVariation(ped,5,-1,0,2)
		SetPedComponentVariation(ped,6,51,0,2)
		SetPedComponentVariation(ped,7,-1,0,2)
		SetPedComponentVariation(ped,8,59,0,2)
		SetPedComponentVariation(ped,9,-1,0,2)
		SetPedComponentVariation(ped,10,-1,0,2)
		SetPedComponentVariation(ped,11,57,0,2)
	elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then

		SetPedComponentVariation(ped,1,-1,0,2)
		SetPedComponentVariation(ped,3,17,0,0)
		SetPedComponentVariation(ped,4,35,0,2)
		SetPedComponentVariation(ped,5,-1,0,2)
		SetPedComponentVariation(ped,6,26,0,2)
		SetPedComponentVariation(ped,7,-1,0,2)
		SetPedComponentVariation(ped,8,36,0,2)
		SetPedComponentVariation(ped,9,-1,0,2)
		SetPedComponentVariation(ped,10,-1,0,2)
		SetPedComponentVariation(ped,11,50,0,2)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STOPGARBAGEMAN
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.stopGarbageman()
	inService = false
	for k,v in pairs(blips) do
		if DoesBlipExist(blips[k]) then
			RemoveBlip(blips[k])
			blips[k] = nil
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATEGARBAGELIST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("garbageman:updateGarbageList")
AddEventHandler("garbageman:updateGarbageList",function(status)
	garbageList = status
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATEGARBAGELIST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("garbageman:removeGarbageBlips")
AddEventHandler("garbageman:removeGarbageBlips",function(number)
	if DoesBlipExist(blips[number]) then
		RemoveBlip(blips[number])
		blips[number] = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- INSERTBLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("garbageman:insertBlips")
AddEventHandler("garbageman:insertBlips",function(statusList)
	if inService then
		for k,v in pairs(blips) do
			if DoesBlipExist(blips[k]) then
				RemoveBlip(blips[k])
				blips[k] = nil
			end
		end

		Citizen.Wait(1000)

		for k,v in pairs(statusList) do
			blips[k] = AddBlipForRadius(v[1],v[2],v[3],10.0)
			SetBlipAlpha(blips[k],255)
			SetBlipColour(blips[k],57)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMESECONDS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		if timeSeconds > 0 then
			timeSeconds = timeSeconds - 1
		end
		Citizen.Wait(1000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DWTEXT
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