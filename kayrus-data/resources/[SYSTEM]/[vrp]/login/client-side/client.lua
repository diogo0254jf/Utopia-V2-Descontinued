-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local cam = nil
local new = false
local weight = 270.0
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONFIG
-----------------------------------------------------------------------------------------------------------------------------------------
local config = {
	["integrity"] = { 449.54,-661.2,28.49,"Integrity Way" },
	["hawick"] = { 311.73,-232.2,53.99,"Hawick Avenue" },
	["senora"] = { 331.26,2611.4,44.48,"Senora Road" },
	["procopio"] = { -759.3,5584.07,36.7,"Procopio Promenade" },
	["andreas"] = { 217.11,-810.94,30.68,"San Andreas Avenue" }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("login:Spawn")
AddEventHandler("login:Spawn",function(status)
	Citizen.Wait(1000)

	local ped = PlayerPedId()
	if status then
		local coords = GetEntityCoords(ped)
		cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA",coords["x"],coords["y"],coords["z"] + 200.0,270.00,0.0,0.0,80.0,0,0)
		SetCamActive(cam,true)

		RenderScriptCams(true,false,1,true,true)
		SendNUIMessage({ display = true, result = config })
		SetNuiFocus(true,true)
	else
		RenderScriptCams(false,false,0,true,true)
		SetEntityVisible(ped,true,false)
		FreezeEntityPosition(ped,false)
		SetCamActive(cam,false)
		DestroyCam(cam,true)
		cam = nil
	end

	Citizen.Wait(1000)
	DoScreenFadeIn(1000)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATEHOMES
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("login:updateHomes")
AddEventHandler("login:updateHomes",function(status)
	for k,v in pairs(status) do
		config[k] = v
		config[k][4] = GetStreetNameFromHashKey(GetStreetNameAtCoord(config[k][1],config[k][2],config[k][3]))
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPAWN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("spawn",function(data,cb)
	local ped = PlayerPedId()
	if data["choice"] == "spawn" then
		SendNUIMessage({ display = false })
		SetNuiFocus(false,false)

		DoScreenFadeOut(0)
		RenderScriptCams(false,false,0,true,true)
		SetEntityVisible(ped,true,false)
		FreezeEntityPosition(ped,false)
		SetCamActive(cam,false)
		DestroyCam(cam,true)
		cam = nil

		Citizen.Wait(1000)
		DoScreenFadeIn(1000)
	else
    	new = false
		local speed = 0.7

		DoScreenFadeOut(0)
		Citizen.Wait(500)

		SetCamRot(cam,270.0)
		SetCamActive(cam,true)
		new = true
		weight = 270.0

		DoScreenFadeIn(1000)

		SetEntityCoords(ped,config[data["choice"]][1],config[data["choice"]][2],config[data["choice"]][3])
		local coords = GetEntityCoords(ped)

		SetCamCoord(cam,coords["x"],coords["y"],coords["z"] + 200.0)
		local i = coords["z"] + 200.0

		while i > config[data["choice"]][3] + 1.5 do
			Citizen.Wait(5)
			i = i - speed
			SetCamCoord(cam,coords["x"],coords["y"],i)

			if i <= config[data["choice"]][3] + 35.0 and weight < 360.0 then
				if speed - 0.0078 >= 0.05 then
					speed = speed - 0.0078
				end

				weight = weight + 0.75
				SetCamRot(cam,weight)
			end

			if not new then
				break
			end
		end
	end
end)