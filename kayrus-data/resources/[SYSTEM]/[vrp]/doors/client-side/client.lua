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
Tunnel.bindInterface("doors",cRP)
vSERVER = Tunnel.getInterface("doors")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local doors = nil
-----------------------------------------------------------------------------------------------------------------------------------------
-- DOORSUPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("doors:doorsUpdate")
AddEventHandler("doors:doorsUpdate",function(status)
	doors = status
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADBUTTON
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 500
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
		if doors ~= nil then
			for k,v in pairs(doors) do
				local distance = #(coords - vector3(v.x,v.y,v.z))
				if distance <= v.distance then
					local door = GetClosestObjectOfType(v.x,v.y,v.z,1.0,v.hash,false,false,false)
					if doors ~= 0 then
						if v.lock then
							local _,h = GetStateOfClosestDoorOfType(v.hash,v.x,v.y,v.z,_,h)
							if h > -0.02 and h < 0.02 then
								FreezeEntityPosition(door,true)
							end
						else
							FreezeEntityPosition(door,false)
						end

						if distance <= v.press then
							timeDistance = 4
							if v.text then
								if v.lock then
									DrawText3D(v.x,v.y,v.z,"~g~E~w~   DESTRANCAR")
								else
									DrawText3D(v.x,v.y,v.z,"~g~E~w~   TRANCAR")
								end
							end

							if IsControlJustPressed(1,38) and vSERVER.doorsPermission(k) then
								v.lock = not v.lock
								vSERVER.doorsStatistics(k,v.lock)
								vRP._playAnim(true,{"anim@heists@keycard@","exit"},false)
								Citizen.Wait(350)
								vRP.stopAnim()
							end
						end
					end
				end
			end
		end
		Citizen.Wait(timeDistance)
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