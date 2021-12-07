-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("atm")
-----------------------------------------------------------------------------------------------------------------------------------------
-- ATMOBJECTS
-----------------------------------------------------------------------------------------------------------------------------------------
local atmObjects = {
	"prop_atm_01",
	"prop_atm_02",
	"prop_atm_03",
	"prop_fleeca_atm"
}
local localidades = {
	{ 147.64,-1035.69,29.35 },
	{ 119.15,-883.6,31.13 },
	{ 315.21,-593.61,43.29 },
	{ 296.41,-894.36,29.23 },
	{ 295.7,-896.24,29.22 },
	{ 472.41,-1001.6,30.7 },
	{ 468.29,-990.41,26.28 },
	{ 4.96,-919.91,29.56 },
	{ 111.19,-775.31,31.44 },
	{ 114.37,-776.58,31.42 },
	{ 24.44,-946.15,29.36 },
	{ 33.23,-1348.18,29.5 },
	{ 2558.48,389.38,108.63 },
	{ 1153.74,-326.72,69.21 },
	{ 1153.74,-326.72,69.21 },
	{ -717.55,-915.87,19.22 },
	{ -56.9,-1752.16,29.43 },
	{ 380.75,323.42,103.57 },
	{ -3241.13,997.53,12.56 },
	{ -3240.61,1008.59,12.84 },
	{ 1735.32,6410.59,35.04 },
	{ 540.35,2671.07,42.16 },
	{ 1968.1,3743.56,32.35 },
	{ 2683.09,3286.73,55.25 },
	{ 1702.81,4933.62,42.07 },
	{ -1827.19,784.91,138.31 },
	{ -2975.1,380.15,15.0 },
	{ -3040.83,593.15,7.91 },
	{ 1172.49,2702.51,38.18 },
	{ 1171.49,2702.59,38.18 },
	{ -256.22,-716.03,33.53 },
	{ -258.76,-723.4,33.47 },
	{ -254.36,-692.41,33.61 },
	{ -2072.49,-317.37,13.32 },
	{ 237.84,216.82,106.29 },
	{ 238.29,215.91,106.29 },
	{ 237.41,217.74,106.29 }, 
	{ 236.76,218.86,106.29 },
	{ 236.76,218.86,106.29 },
	{ 951.32,-986.57,39.67 },
	{ -200.39,-1309.53,31.3 },
	{ 1138.28,-468.98,66.73 },
	{ 1166.96,-456.13,66.81 },
	{ 285.45,143.44,104.18 },
	{ 835.09,-1039.29,27.15 },
	{ 187.44,-899.89,30.72 },
	{ 33.17,-1348.24,29.5 },
	{ 2558.49,389.46,108.63 },
	{ 1153.7,-326.81,69.21 },
	{ -717.68,-915.65,19.22 },
	{ -56.9,-1752.09,29.43 },
	{ 380.83,323.45,103.57 },
	{ -3241.14,997.61,12.56 },
	{ -3240.6,1008.59,12.84 },
	{ -3044.0,594.57,7.74 },
	{ -3040.75,593.17,7.91 },
	{ 1735.24,6410.55,35.04 },
	{ 540.35,2671.09,42.16 },
	{ 1968.1,3743.57,32.35 },
	{ 2683.11,3286.58,55.25 },
	{ 1703.04,4933.58,42.07 },
	{ -1827.19,784.91,138.31 },
	{ 1171.55,2702.57,38.18 },
	{ 1172.51,2702.57,38.18 },
	{ 264.45,210.03,106.29 },
	{ 264.78,211.04,106.29 },
	{ 265.12,211.99,106.29 },
	{ 265.44,212.97,106.29 },
	{ 265.77,213.9,106.29 },
	{ 288.76,-1282.33,29.65 },
	{ 289.02,-1256.83,29.45 },
	{ 146.02,-1035.18,29.35 },
	{ 242.36,-889.67,30.5 },
	{ 239.53,-892.15,30.5 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ATM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("atm",function()
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)

	for k,v in pairs(atmObjects) do
		if DoesObjectOfTypeExistAtCoords(coords,0.6,GetHashKey(v),true) then
			local saldo = vSERVER.getSaldo()
			SetNuiFocus(true,true)
			SendNUIMessage({ action = "show", saldo = tostring(saldo) })
			vRP._playAnim(false,{"amb@prop_human_atm@male@base","base"},true)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- OPENSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
			SetNuiFocus(false,false)
	while true do
		local sleep = 500
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			local coords = GetEntityCoords(ped)
			for k,v in pairs(localidades) do
				local distance = #(coords - vector3(v[1],v[2],v[3]))
				if distance <= 1 then
					sleep = 4
					--DrawText3D(v[1],v[2],v[3],"~g~E~w~   ABRIR")
					if IsControlJustPressed(1,38) --[[ and vSERVER.requestWanted()]] then
					vRP._playAnim(false,{"amb@prop_human_atm@male@base","base"},true)				
						SetNuiFocus(true,true)
		local saldo = vSERVER.getSaldo()			    
				SendNUIMessage({ action = "show", saldo = tostring(saldo) })
					end
				end
			end
		end
		Citizen.Wait(sleep)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSEAPP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("CloseApp", function(data,cb)
	SetNuiFocus(false)
	cb("ok")
	vRP._playAnim(false,{"amb@prop_human_atm@male@exit","exit"},false)
	Citizen.Wait(4000)
	vRP._stopAnim()
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HANDLESAQUE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("HandleSaque", function(data,cb)
	local valor = parseInt(data.valor)
	local newSaldo = vSERVER.sacarValor(valor)
	cb({ saldo = tostring(newSaldo) })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HANDLETRANSFER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("HandleTransfer", function(data,cb)
	local valor,target = parseInt(data.valor),parseInt(data.target)
	local newSaldo = vSERVER.transferirValor(valor,target)
	cb({ saldo = tostring(newSaldo) })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAWTEXT3D
-----------------------------------------------------------------------------------------------------------------------------------------
-- function DrawText3D(x,y,z,text)
-- 	local onScreen,_x,_y = World3dToScreen2d(x,y,z)
-- 	SetTextFont(4)
-- 	SetTextScale(0.35,0.35)
-- 	SetTextColour(255,255,255,100)
-- 	SetTextEntry("STRING")
-- 	SetTextCentre(1)
-- 	AddTextComponentString(text)
-- 	DrawText(_x,_y)
-- 	local factor = (string.len(text)) / 400
-- 	DrawRect(_x,_y+0.0125,0.01+factor,0.03,0,0,0,100)
-- end