local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

tvRP = Tunnel.getInterface("vrp")
vRPserver = Tunnel.getInterface("vrp")
vSERVER = Tunnel.getInterface("survival")
vCLIENT = Tunnel.getInterface("survival")

--=====================================================
local nocauteado = false
local deathtimer = 1200

Citizen.CreateThread(function()
    while true do
            local sleep = 1000
            if GetEntityHealth(PlayerPedId()) <= 101 then
                if not nocauteado then
                    sleep = 5
                    deathtimer = 1200
                    nocauteado = true
                end
                if deathtimer > 0 then
                    SetPedToRagdoll(ped,1000,1000,0,0,0,0)
                    BlockWeaponWheelThisFrame()
                    SetEntityHealth(ped,101)
                    SetNuiFocus(true,true)
                    TransitionToBlurred(1000)
                    SendNUIMessage({
                        setDisplay = true,
                        setDisplayDead = false,
                        deathtimer = deathtimer
                    })
                else
                    SetNuiFocus(true,true)
                    TransitionToBlurred(1000)
                    SendNUIMessage({
                        setDisplay = false,
                        setDisplayDead = true,
                        deathtimer = deathtimer
                    })
                end

            end
        if GetEntityHealth(PlayerPedId()) > 101 then
            deathtimer = 1200
	        nocauteado = false
	        TriggerScreenblurFadeOut(500)
            SetNuiFocus(false,false)
		SendNUIMessage({
			setDisplay = false,
			setDisplayDead = false,
		})
    end
    Citizen.Wait(sleep)
    end
end)

--============================================================================================
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if nocauteado and deathtimer > 0 then
			deathtimer = deathtimer - 1
		end
	end
end)
--============================================================================================
local hospital = vector3(311.76+0.0001,-569.94+0.0001,28.9+0.0001) -- 311.76,-569.94,28.9
local heading = 82.58

RegisterNUICallback('ButtonRevive',function()
	deathtimer = 1200
	if deathtimer <= 50 then
		nocauteado = false
		vSERVER.ResetPedToHospital()
		SendNUIMessage({
			setDisplay = false,
			setDisplayDead = false,
			deathtimer = deathtimer
		})
	else
		TriggerEvent("Notify","verde","voce so pode desistir aos 50 segundos",5000)
	end	
end)