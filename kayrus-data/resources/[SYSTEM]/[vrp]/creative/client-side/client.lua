-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- TYREBURST
-----------------------------------------------------------------------------------------------------------------------------------------
local oldSpeed = 0
Citizen.CreateThread(function()
	while true do
		local timeDistance = 500
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped) then
			timeDistance = 4

			local veh = GetVehiclePedIsUsing(ped)
			if GetPedInVehicleSeat(veh,-1) == ped then
				SetVehicleDirtLevel(veh,0.0)

				local speed = GetEntitySpeed(veh) * 2.236936
				if speed ~= oldSpeed then
					if (oldSpeed - speed) >= 60 then
						TriggerServerEvent("upgradeStress",10)
						if GetVehicleClass(veh) ~= 8 and (GetEntityModel(veh) ~= 1755270897 or GetEntityModel(veh) ~= -34623805) then
							SetVehicleEngineOn(veh,false,true,true)
							vehicleTyreBurst(veh)
						end
					end

					oldSpeed = speed
				end
			end
		else
			if oldSpeed ~= 0 then
				oldSpeed = 0
			end
		end

		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHICLETYREBURST
-----------------------------------------------------------------------------------------------------------------------------------------
function vehicleTyreBurst(vehicle)
	local tyre = math.random(4)
	if tyre == 1 then
		if not IsVehicleTyreBurst(vehicle,0,false) then
			SetVehicleTyreBurst(vehicle,0,true,1000.0)
		end
	elseif tyre == 2 then
		if not IsVehicleTyreBurst(vehicle,1,false) then
			SetVehicleTyreBurst(vehicle,1,true,1000.0)
		end
	elseif tyre == 3 then
		if not IsVehicleTyreBurst(vehicle,4,false) then
			SetVehicleTyreBurst(vehicle,4,true,1000.0)
		end
	elseif tyre == 4 then
		if not IsVehicleTyreBurst(vehicle,5,false) then
			SetVehicleTyreBurst(vehicle,5,true,1000.0)
		end
	end

	if math.random(100) < 30 then
		Citizen.Wait(500)
		vehicleTyreBurst(vehicle)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- BLIPS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = {
	{ 265.05,-1262.65,29.3,361,4,"Posto de Gasolina",0.4 },
	{ 819.02,-1027.96,26.41,361,4,"Posto de Gasolina",0.4 },
	{ 1208.61,-1402.43,35.23,361,4,"Posto de Gasolina",0.4 },
	{ 1181.48,-330.26,69.32,361,4,"Posto de Gasolina",0.4 },
	{ 621.01,268.68,103.09,361,4,"Posto de Gasolina",0.4 },
	{ 2581.09,361.79,108.47,361,4,"Posto de Gasolina",0.4 },
	{ 175.08,-1562.12,29.27,361,4,"Posto de Gasolina",0.4 },
	{ -319.76,-1471.63,30.55,361,4,"Posto de Gasolina",0.4 },
	{ 1782.33,3328.46,41.26,361,4,"Posto de Gasolina",0.4 },
	{ 49.42,2778.8,58.05,361,4,"Posto de Gasolina",0.4 },
	{ 264.09,2606.56,44.99,361,4,"Posto de Gasolina",0.4 },
	{ 1039.38,2671.28,39.56,361,4,"Posto de Gasolina",0.4 },
	{ 1207.4,2659.93,37.9,361,4,"Posto de Gasolina",0.4 },
	{ 2539.19,2594.47,37.95,361,4,"Posto de Gasolina",0.4 },
	{ 2679.95,3264.18,55.25,361,4,"Posto de Gasolina",0.4 },
	{ 2005.03,3774.43,32.41,361,4,"Posto de Gasolina",0.4 },
	{ 1687.07,4929.53,42.08,361,4,"Posto de Gasolina",0.4 },
	{ 1701.53,6415.99,32.77,361,4,"Posto de Gasolina",0.4 },
	{ 180.1,6602.88,31.87,361,4,"Posto de Gasolina",0.4 },
	{ -94.46,6419.59,31.48,361,4,"Posto de Gasolina",0.4 },
	{ -2555.17,2334.23,33.08,361,4,"Posto de Gasolina",0.4 },
	{ -1800.09,803.54,138.72,361,4,"Posto de Gasolina",0.4 },
	{ -1437.0,-276.8,46.21,361,4,"Posto de Gasolina",0.4 },
	{ -2096.3,-320.17,13.17,361,4,"Posto de Gasolina",0.4 },
	{ -724.56,-935.97,19.22,361,4,"Posto de Gasolina",0.4 },
	{ -525.26,-1211.19,18.19,361,4,"Posto de Gasolina",0.4 },
	{ -70.96,-1762.21,29.54,361,4,"Posto de Gasolina",0.4 },
	{ 298.43,-584.54,43.27,80,35,"Hospital",0.5 },
	{ 55.43,-876.19,30.66,357,14,"Garagem",0.6 },
	{ 317.25,2623.14,44.46,357,14,"Garagem",0.6 },
	{ -773.34,5598.15,33.60,357,14,"Garagem",0.6 },
	{ 275.23,-345.54,45.17,357,14,"Garagem",0.6 },
	{ 596.40,90.65,93.12,357,14,"Garagem",0.6 },
	{ -340.76,265.97,85.67,357,14,"Garagem",0.6 },
	{ -2030.01,-465.97,11.60,357,14,"Garagem",0.6 },
	{ -1184.92,-1510.00,4.64,357,14,"Garagem",0.6 },
	{ -73.44,-2004.99,18.27,357,14,"Garagem",0.6 },
	{ 214.02,-808.44,31.01,357,14,"Garagem",0.6 },
	{ -348.88,-874.02,31.31,357,14,"Garagem",0.6 },
	{ 67.74,12.27,69.21,357,14,"Garagem",0.6 },
	{ 361.90,297.81,103.88,357,14,"Garagem",0.6 },
	{ 1035.89,-763.89,57.99,357,14,"Garagem",0.6 },
	{ -796.63,-2022.77,9.16,357,14,"Garagem",0.6 },
	{ 453.27,-1146.76,29.52,357,14,"Garagem",0.6 },
	{ 528.66,-146.3,58.38,357,14,"Garagem",0.6 },
	{ -1159.48,-739.32,19.89,357,14,"Garagem",0.6 },
	{ 29.29,-1770.35,29.61,357,14,"Garagem",0.6 },
	{ 101.22,-1073.68,29.38,357,14,"Garagem",0.6 },
	{ 67.67,-1568.61,29.59,318,62,"Lixeiro",0.6 },
	{ 428.2,-980.2,30.5,60,4,"Departamento Policial",0.6 },
	{ 1851.45,3686.71,34.26,60,4,"Departamento Policial",0.6 },
	{ -448.18,6011.68,31.71,60,4,"Departamento Policial",0.6 },
	{ 25.68,-1346.6,29.5,52,36,"Loja de Departamento",0.5 },
	{ 2556.47,382.05,108.63,52,36,"Loja de Departamento",0.5 },
	{ 1163.55,-323.02,69.21,52,36,"Loja de Departamento",0.5 },
	{ -707.31,-913.75,19.22,52,36,"Loja de Departamento",0.5 },
	{ -47.72,-1757.23,29.43,52,36,"Loja de Departamento",0.5 },
	{ 373.89,326.86,103.57,52,36,"Loja de Departamento",0.5 },
	{ -3242.95,1001.28,12.84,52,36,"Loja de Departamento",0.5 },
	{ 1729.3,6415.48,35.04,52,36,"Loja de Departamento",0.5 },
	{ 548.0,2670.35,42.16,52,36,"Loja de Departamento",0.5 },
	{ 1960.69,3741.34,32.35,52,36,"Loja de Departamento",0.5 },
	{ 2677.92,3280.85,55.25,52,36,"Loja de Departamento",0.5 },
	{ 1698.5,4924.09,42.07,52,36,"Loja de Departamento",0.5 },
	{ -1820.82,793.21,138.12,52,36,"Loja de Departamento",0.5 },
	{ 1393.21,3605.26,34.99,52,36,"Loja de Departamento",0.5 },
	{ -2967.78,390.92,15.05,52,36,"Loja de Departamento",0.5 },
	{ -3040.14,585.44,7.91,52,36,"Loja de Departamento",0.5 },
	{ 1135.56,-982.24,46.42,52,36,"Loja de Departamento",0.5 },
	{ 1166.0,2709.45,38.16,52,36,"Loja de Departamento",0.5 },
	{ -1487.21,-378.99,40.17,52,36,"Loja de Departamento",0.5 },
	{ -1222.76,-907.21,12.33,52,36,"Loja de Departamento",0.5 },
	{ 1692.62,3759.50,34.70,76,6,"Loja de Armas",0.4 },
	{ 252.89,-49.25,69.94,76,6,"Loja de Armas",0.4 },
	{ 843.28,-1034.02,28.19,76,6,"Loja de Armas",0.4 },
	{ -331.35,6083.45,31.45,76,6,"Loja de Armas",0.4 },
	{ -663.15,-934.92,21.82,76,6,"Loja de Armas",0.4 },
	{ -1305.18,-393.48,36.69,76,6,"Loja de Armas",0.4 },
	{ -1118.80,2698.22,18.55,76,6,"Loja de Armas",0.4 },
	{ 2568.83,293.89,108.73,76,6,"Loja de Armas",0.4 },
	{ -3172.68,1087.10,20.83,76,6,"Loja de Armas",0.4 },
	{ 21.32,-1106.44,29.79,76,6,"Loja de Armas",0.4 },
	{ 811.19,-2157.67,29.61,76,6,"Loja de Armas",0.4 },
	{ -1213.44,-331.02,37.78,207,46,"Banco",0.5 },
	{ -351.59,-49.68,49.04,207,46,"Banco",0.5 },
	{ 313.47,-278.81,54.17,207,46,"Banco",0.5 },
	{ 149.35,-1040.53,29.37,207,46,"Banco",0.5 },
	{ -2962.60,482.17,15.70,207,46,"Banco",0.5 },
	{ -112.81,6469.91,31.62,207,46,"Banco",0.5 },
	{ 1175.74,2706.80,38.09,207,46,"Banco",0.5 },
	{ -815.12,-184.15,37.57,71,4,"Barbearia",0.5 },
	{ 138.13,-1706.46,29.3,71,4,"Barbearia",0.5 },
	{ -1280.92,-1117.07,7.0,71,4,"Barbearia",0.5 },
	{ 1930.54,3732.06,32.85,71,4,"Barbearia",0.5 },
	{ 1214.2,-473.18,66.21,71,4,"Barbearia",0.5 },
	{ -33.61,-154.52,57.08,71,4,"Barbearia",0.5 },
	{ -276.65,6226.76,31.7,71,4,"Barbearia",0.5 },
	{ 75.35,-1392.92,29.38,366,4,"Loja de Roupas",0.5 },
	{ -710.15,-152.36,37.42,366,4,"Loja de Roupas",0.5 },
	{ -163.73,-303.62,39.74,366,4,"Loja de Roupas",0.5 },
	{ -822.38,-1073.52,11.33,366,4,"Loja de Roupas",0.5 },
	{ -1193.13,-767.93,17.32,366,4,"Loja de Roupas",0.5 },
	{ -1449.83,-237.01,49.82,366,4,"Loja de Roupas",0.5 },
	{ 4.83,6512.44,31.88,366,4,"Loja de Roupas",0.5 },
	{ 1693.95,4822.78,42.07,366,4,"Loja de Roupas",0.5 },
	{ 125.82,-223.82,54.56,366,4,"Loja de Roupas",0.5 },
	{ 614.2,2762.83,42.09,366,4,"Loja de Roupas",0.5 },
	{ 1196.72,2710.26,38.23,366,4,"Loja de Roupas",0.5 },
	{ -3170.53,1043.68,20.87,366,4,"Loja de Roupas",0.5 },
	{ -1101.42,2710.63,19.11,366,4,"Loja de Roupas",0.5 },
	{ 425.6,-806.25,29.5,366,4,"Loja de Roupas",0.5 },
	{ -1082.22,-247.54,37.77,439,4,"Life Invader",0.6 },
	{ -1728.06,-1050.69,1.71,266,4,"Embarcações",0.5 },
	{ 1966.36,3975.86,31.51,266,4,"Embarcações",0.5 },
	{ -776.72,-1495.02,2.29,266,4,"Embarcações",0.5 },
	{ -893.97,5687.78,3.29,266,4,"Embarcações",0.5 },
	{ 468.11,-585.95,28.5,513,4,"Motorista",0.5 },
	{ 356.42,274.61,103.14,67,4,"Transportador",0.5 },
	{ -837.97,5406.55,34.59,285,4,"Lenhador",0.5 },
	{ -1563.32,-975.79,13.02,68,4,"Pescador",0.5 },
	{ 132.6,-1305.06,29.2,93,4,"Bar",0.5 },
	{ -565.14,271.56,83.02,93,4,"Bar",0.5 },
	{ 4.58,-705.95,45.98,351,4,"Escritório",0.7 },
	{ 95.06,-228.67,54.67,403,3,"Farmácia",0.7 },
	{ 320.54,-1076.4,29.48,403,3,"Farmácia",0.7 },
	{ 46.66,-1749.79,29.64,78,11,"Mercado Central",0.5 },
	{ -211.9,-1324.18,30.9,490,4,"Bennys",0.5 },
	{ 11.12,-1605.65,29.4,79,4,"Tacos",0.4 },
	{ -428.56,-1728.33,19.79,467,11,"Reciclagem",0.6 },
	{ -741.56,5594.94,41.66,36,4,"Teleférico",0.6 },
	{ 454.46,5571.95,781.19,36,4,"Teleférico",0.6 },
	{ -653.38,-852.87,24.51,459,11,"Eletrônicos",0.6 },
	{ 408.17,-1635.57,29.3,515,4,"Reboque",0.7 },
	{ 1706.07,4791.75,41.98,515,4,"Reboque",0.7 },
	{ -337.93,-136.14,39.01,402,4,"Mecânico",0.7 },
	{ -439.03,-2796.89,7.3,478,4,"Entregador",0.6 },
	{ 1322.93,-1652.29,52.27,75,4,"Loja de Tatuagem",0.5 },
	{ -1154.42,-1425.9,4.95,75,4,"Loja de Tatuagem",0.5 },
	{ 322.84,180.16,103.58,75,4,"Loja de Tatuagem",0.5 },
	{ -3169.62,1075.8,20.83,75,4,"Loja de Tatuagem",0.5 },
	{ 1864.07,3747.9,33.03,75,4,"Loja de Tatuagem",0.5 },
	{ -293.57,6199.85,31.48,75,4,"Loja de Tatuagem",0.5 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADBLIPS
-----------------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	for _,v in pairs(blips) do
		local blip = AddBlipForCoord(v[1],v[2],v[3])
		SetBlipSprite(blip,v[4])
		SetBlipAsShortRange(blip,true)
		SetBlipColour(blip,v[5])
		SetBlipScale(blip,v[7])
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(v[6])
		EndTextCommandSetBlipName(blip)
	end
end)
---------------------------------------------
--NO DROP GUNS
---------------------------------------------

function SetWeaponDrops()
    local handle, ped = FindFirstPed()
    local finished = false

    repeat
        if not IsEntityDead(ped) then
            SetPedDropsWeaponsWhenDead(ped, false)
        end
        finished, ped = FindNextPed(handle)
    until not finished

    EndFindPed(handle)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        SetWeaponDrops()
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADGLOBAL - 1000
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		N_0xf4f2c0d4ee209e20()
		DistantCopCarSirens(false)

		if IsMinimapRendering() then
			SetRadarZoom(1100)
		end
	end
end)
----------------------------------------------------------------------------------------------------------------------------------
-- DISPATCH
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	for i = 1,12 do
		EnableDispatchService(i,false)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADGLOBAL - 0
-----------------------------------------------------------------------------------------------------------------------------------------
local weapon01 = `WEAPON_UNARMED`
local weapon02 = `WEAPON_FLASHLIGHT`
local weapon03 = `WEAPON_NIGHTSTICK`
local weapon04 = `WEAPON_HATCHET`
local weapon05 = `WEAPON_BAT`
local weapon06 = `WEAPON_BATTLEAXE`
local weapon07 = `WEAPON_BOTTLE`
local weapon08 = `WEAPON_CROWBAR`
local weapon09 = `WEAPON_GOLFCLUB`
local weapon10 = `WEAPON_HAMMER`
local weapon11 = `WEAPON_MACHETE`
local weapon12 = `WEAPON_POOLCUE`
local weapon13 = `WEAPON_STONE_HATCHET`
local weapon14 = `WEAPON_WRENCH`
local weapon15 = `WEAPON_KNUCKLE`

local pickweapon01 = `PICKUP_WEAPON_KNIFE`
local pickweapon02 = `PICKUP_WEAPON_PISTOL`
local pickweapon03 = `PICKUP_WEAPON_MINISMG`
local pickweapon04 = `PICKUP_WEAPON_MICROSMG`
local pickweapon05 = `PICKUP_WEAPON_PUMPSHOTGUN`
local pickweapon06 = `PICKUP_WEAPON_CARBINERIFLE`

Citizen.CreateThread(function()
	SetAmbientZoneListStatePersistent("AZL_DLC_Hei4_Island_Disabled_Zones",false,true)
	SetAmbientZoneListStatePersistent("AZL_DLC_Hei4_Island_Zones",true,true)
	AddTextEntry("FE_THDR_GTAO","CREATIVE RP")
	StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
	SetAudioFlag("PlayerOnDLCHeist4Island",true)
	SetAudioFlag("PoliceScannerDisabled",true)
	SetPlayerCanUseCover(PlayerId(),false)
	SetDeepOceanScaler(0.0)

	while true do
		Citizen.Wait(0)

		local pid = PlayerId()
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped) then
			SetPedHelmet(ped,false)
			HideHudComponentThisFrame(6)
			HideHudComponentThisFrame(8)
			DisableControlAction(0,345,true)
			DisablePlayerVehicleRewards(pid)
		else
			if IsPedArmed(ped,6) then
				DisableControlAction(1,140,true)
				DisableControlAction(1,141,true)
				DisableControlAction(1,142,true)
			end

			N_0x4757f00bc6323cfe(weapon01,0.1)
			N_0x4757f00bc6323cfe(weapon02,0.1)
			N_0x4757f00bc6323cfe(weapon03,0.2)
			N_0x4757f00bc6323cfe(weapon04,0.1)
			N_0x4757f00bc6323cfe(weapon05,0.1)
			N_0x4757f00bc6323cfe(weapon06,0.1)
			N_0x4757f00bc6323cfe(weapon07,0.1)
			N_0x4757f00bc6323cfe(weapon08,0.1)
			N_0x4757f00bc6323cfe(weapon09,0.1)
			N_0x4757f00bc6323cfe(weapon10,0.1)
			N_0x4757f00bc6323cfe(weapon11,0.1)
			N_0x4757f00bc6323cfe(weapon12,0.1)
			N_0x4757f00bc6323cfe(weapon13,0.1)
			N_0x4757f00bc6323cfe(weapon14,0.1)
			N_0x4757f00bc6323cfe(weapon15,0.1)

			RemoveAllPickupsOfType(pickweapon01)
			RemoveAllPickupsOfType(pickweapon02)
			RemoveAllPickupsOfType(pickweapon03)
			RemoveAllPickupsOfType(pickweapon04)
			RemoveAllPickupsOfType(pickweapon05)
			RemoveAllPickupsOfType(pickweapon06)
		end

		HideHudComponentThisFrame(1)
		HideHudComponentThisFrame(3)
		HideHudComponentThisFrame(4)
		HideHudComponentThisFrame(5)
		HideHudComponentThisFrame(7)
		HideHudComponentThisFrame(9)
		HideHudComponentThisFrame(10)
		HideHudComponentThisFrame(11)
		HideHudComponentThisFrame(12)
		HideHudComponentThisFrame(13)
		HideHudComponentThisFrame(15)
		HideHudComponentThisFrame(17)
		HideHudComponentThisFrame(18)
		HideHudComponentThisFrame(20)
		HideHudComponentThisFrame(21)
		HideHudComponentThisFrame(22)

		RemoveAllPickupsOfType(GetHashKey("PICKUP_WEAPON_KNIFE"))
        RemoveAllPickupsOfType(GetHashKey("PICKUP_WEAPON_PISTOL"))
        RemoveAllPickupsOfType(GetHashKey("PICKUP_WEAPON_MINISMG"))
        RemoveAllPickupsOfType(GetHashKey("PICKUP_WEAPON_SMG"))
        RemoveAllPickupsOfType(GetHashKey("PICKUP_WEAPON_PUMPSHOTGUN"))
        RemoveAllPickupsOfType(GetHashKey("PICKUP_WEAPON_CARBINERIFLE"))
        RemoveAllPickupsOfType(GetHashKey("PICKUP_WEAPON_COMBATPISTOL"))

        DisablePlayerVehicleRewards(PlayerId())
		ClearPlayerWantedLevel(PlayerId())

		SetPedDensityMultiplierThisFrame(0.50)
		SetVehicleDensityMultiplierThisFrame(0.50)
		SetParkedVehicleDensityMultiplierThisFrame(0.50)
		SetRandomVehicleDensityMultiplierThisFrame(0.50)
		SetScenarioPedDensityMultiplierThisFrame(0.50,0.50)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- IPLOADER
-----------------------------------------------------------------------------------------------------------------------------------------
local ipList = {
	{
		props = {
			"swap_clean_apt",
			"layer_debra_pic",
			"layer_whiskey",
			"swap_sofa_A"
		},
		coords = { -1150.7,-1520.7,10.6 }
	},{
		props = {
			"csr_beforeMission",
			"csr_inMission"
		},
		coords = { -47.1,-1115.3,26.5 }
	},{
		props = {
			"V_Michael_bed_tidy",
			"V_Michael_M_items",
			"V_Michael_D_items",
			"V_Michael_S_items",
			"V_Michael_L_Items"
		},
		coords = { -802.3,175.0,72.8 }
	},{
		coords = { 311.25,-592.42,42.32 }
	},{
		props = {
			"v_gabz_mrpd_rm1",
			"v_gabz_mrpd_rm2",
			"v_gabz_mrpd_rm3",
			"v_gabz_mrpd_rm4",
			"v_gabz_mrpd_rm5",
			"v_gabz_mrpd_rm6",
			"v_gabz_mrpd_rm7",
			"v_gabz_mrpd_rm8",
			"v_gabz_mrpd_rm9",
			"v_gabz_mrpd_rm10",
			"v_gabz_mrpd_rm11",
			"v_gabz_mrpd_rm12",
			"v_gabz_mrpd_rm13",
			"v_gabz_mrpd_rm14",
			"v_gabz_mrpd_rm15",
			"v_gabz_mrpd_rm16",
			"v_gabz_mrpd_rm17",
			"v_gabz_mrpd_rm18",
			"v_gabz_mrpd_rm19",
			"v_gabz_mrpd_rm20",
			"v_gabz_mrpd_rm21",
			"v_gabz_mrpd_rm22",
			"v_gabz_mrpd_rm23",
			"v_gabz_mrpd_rm24",
			"v_gabz_mrpd_rm25",
			"v_gabz_mrpd_rm26",
			"v_gabz_mrpd_rm27",
			"v_gabz_mrpd_rm28",
			"v_gabz_mrpd_rm29",
			"v_gabz_mrpd_rm30",
			"v_gabz_mrpd_rm31"
		},
		coords = { 451.01,-993.37,29.17 }
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADIPLOADER
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	for _k,_v in pairs(ipList) do
		local interiorCoords = GetInteriorAtCoords(_v["coords"][1],_v["coords"][2],_v["coords"][3])
		LoadInterior(interiorCoords)

		if _v["props"] ~= nil then
			for k,v in pairs(_v["props"]) do
				EnableInteriorProp(interiorCoords,v)
				Citizen.Wait(1)
			end
		end

		RefreshInterior(interiorCoords)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TELEPORT
-----------------------------------------------------------------------------------------------------------------------------------------
local teleport = {
	{ 338.65,-583.87,74.17,333.04,-568.97,43.29,"DESCER" },
	{ 333.04,-568.97,43.29,338.65,-583.87,74.17,"SUBIR" },

	{ 332.26,-595.6,43.29,344.36,-586.2,28.8,"DESCER" },
	{ 344.36,-586.2,28.8,332.26,-595.6,43.29,"SUBIR" },

	{ 4.58,-705.95,45.98,-142.07,-617.7,168.83,"ENTRAR" },
	{ -142.07,-617.7,168.83,4.58,-705.95,45.98,"SAIR" },

	{ -117.29,-604.52,36.29,-74.48,-820.8,243.39,"ENTRAR" },
	{ -74.48,-820.8,243.39,-117.29,-604.52,36.29,"SAIR" },

	{ -826.9,-699.89,28.06,-1575.14,-569.15,108.53,"ENTRAR" },
	{ -1575.14,-569.15,108.53,-826.9,-699.89,28.06,"SAIR" },

	{ -935.68,-378.77,38.97,-1386.84,-478.56,72.05,"ENTRAR" },
	{ -1386.84,-478.56,72.05,-935.68,-378.77,38.97,"SAIR" },

	{ -741.07,5593.13,41.66,446.19,5568.79,781.19,"SUBIR" },
	{ 446.19,5568.79,781.19,-741.07,5593.13,41.66,"DESCER" },

	{ -740.78,5597.04,41.66,446.37,5575.02,781.19,"SUBIR" },
	{ 446.37,5575.02,781.19,-740.78,5597.04,41.66,"DESCER" },

	{ 40.69,3715.73,39.68,28.1,3711.62,13.6,"ENTRAR" },
	{ 28.1,3711.62,13.6,40.69,3715.73,39.68,"SAIR" },

	{ 241.14,-1378.93,33.75,275.8,-1361.48,24.54,"ENTRAR" },
	{ 275.8,-1361.48,24.54,241.14,-1378.93,33.75,"SAIR" },

	{ 232.89,-411.39,48.12,224.63,-360.7,-98.78,"ENTRAR" },
	{ 224.63,-360.7,-98.78,232.89,-411.39,48.12,"SAIR" },

	{ 234.33,-387.57,-98.78,244.34,-429.14,-98.78,"ENTRAR" },
	{ 244.34,-429.14,-98.78,234.33,-387.57,-98.78,"SAIR" },

	{ -1075.66,-252.24,45.65,-1072.81,-246.58,54.01,"ENTRAR" },
	{ -1072.81,-246.58,54.01,-1075.66,-252.24,45.65,"SAIR" },

	{ 936.0,47.23,81.1,1089.69,205.77,-48.99,"ENTRAR" },
	{ 1089.69,205.77,-48.99,936.0,47.23,81.1,"SAIR" }
}

Citizen.CreateThread(function()
	while true do
		local timeDistance = 500
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			local coords = GetEntityCoords(ped)
			for _,v in pairs(teleport) do
				local distance = #(coords - vector3(v[1],v[2],v[3]))
				if distance <= 2 then
					timeDistance = 4
					if IsControlJustPressed(1,38) then
						DoScreenFadeOut(1000)
						Citizen.Wait(2000)
						SetEntityCoords(ped,v[4],v[5],v[6])
						Citizen.Wait(1000)
						DoScreenFadeIn(1000)
					end
				end
			end
		end
		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- OPENOBJECTS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 500
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			local coords = GetEntityCoords(ped)

			local distance = #(coords - vector3(254.01,225.21,101.87))
			if distance <= 1.5 then
				timeDistance = 4

				if IsControlJustPressed(1,38) then
					local handle,object = FindFirstObject()
					local finished = false

					repeat
						local heading = GetEntityHeading(object)
						local coordsObj = GetEntityCoords(object)
						local distanceObjs = #(coordsObj - coords)

						if distanceObjs < 3.0 and GetEntityModel(object) == 961976194 then
							if heading > 150.0 then
								SetEntityHeading(object,0.0)
							else
								SetEntityHeading(object,160.0)
							end

							FreezeEntityPosition(object,true)
							finished = true
						end

						finished,object = FindNextObject(handle)
					until not finished

					EndFindObject(handle)
				end
			end
		end

		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VEHCAMERA
-----------------------------------------------------------------------------------------------------------------------------------------
local fov_max = 80.0
local fov_min = 10.0
local speed_lr = 3.0
local speed_ud = 3.0
local zoomspeed = 2.0
local vehCamera = false
local fov = (fov_max + fov_min) * 0.5
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADCAMERA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 1000
		local ped = PlayerPedId()
		if IsPedInAnyHeli(ped) then
			timeDistance = 4

			local veh = GetVehiclePedIsUsing(ped)
			SetVehicleRadioEnabled(veh,false)

			if IsControlJustPressed(1,51) then
				TriggerEvent("hudActived",false)
				vehCamera = true
			end

			if IsControlJustPressed(1,154) then
				if GetPedInVehicleSeat(veh,1) == ped or GetPedInVehicleSeat(veh,2) == ped then
					TaskRappelFromHeli(ped,1)
				end
			end

			if vehCamera then
				SetTimecycleModifierStrength(0.3)
				SetTimecycleModifier("heliGunCam")

				local scaleform = RequestScaleformMovie("HELI_CAM")
				while not HasScaleformMovieLoaded(scaleform) do
					Citizen.Wait(1)
				end

				local cam = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA",true)
				AttachCamToEntity(cam,veh,0.0,0.0,-1.5,true)
				SetCamRot(cam,0.0,0.0,GetEntityHeading(veh))
				SetCamFov(cam,fov)
				RenderScriptCams(true,false,0,1,0)
				PushScaleformMovieFunction(scaleform,"SET_CAM_LOGO")
				PushScaleformMovieFunctionParameterInt(0)
				PopScaleformMovieFunctionVoid()

				while vehCamera do
					if IsControlJustPressed(1,51) then
						TriggerEvent("hudActived",true)
						vehCamera = false
					end

					local zoomvalue = (1.0 / (fov_max - fov_min)) * (fov - fov_min)
					CheckInputRotation(cam,zoomvalue)
					HandleZoom(cam)
					HideHudAndRadarThisFrame()
					HideHudComponentThisFrame(19)
					PushScaleformMovieFunction(scaleform,"SET_ALT_FOV_HEADING")
					PushScaleformMovieFunctionParameterFloat(GetEntityCoords(veh).z)
					PushScaleformMovieFunctionParameterFloat(zoomvalue)
					PushScaleformMovieFunctionParameterFloat(GetCamRot(cam,2).z)
					PopScaleformMovieFunctionVoid()
					DrawScaleformMovieFullscreen(scaleform,255,255,255,255)

					Citizen.Wait(1)
				end

				ClearTimecycleModifier()
				fov = (fov_max + fov_min) * 0.5
				RenderScriptCams(false,false,0,1,0)
				SetScaleformMovieAsNoLongerNeeded(scaleform)
				DestroyCam(cam,false)
				SetNightvision(false)
				SetSeethrough(false)
			end
		end

		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKINPUTROTATION
-----------------------------------------------------------------------------------------------------------------------------------------
function CheckInputRotation(cam,zoomvalue)
	local rightAxisX = GetDisabledControlNormal(0,220)
	local rightAxisY = GetDisabledControlNormal(0,221)
	local rotation = GetCamRot(cam,2)
	if rightAxisX ~= 0.0 or rightAxisY ~= 0.0 then
		new_z = rotation.z + rightAxisX * -1.0 * (speed_ud) * (zoomvalue + 0.1)
		new_x = math.max(math.min(20.0,rotation.x + rightAxisY * -1.0 * (3.0) * (zoomvalue + 0.1)),-89.5)
		SetCamRot(cam,new_x,0.0,new_z,2)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- HANDLEZOOM
-----------------------------------------------------------------------------------------------------------------------------------------
function HandleZoom(cam)
	if IsControlJustPressed(1,241) then
		fov = math.max(fov - zoomspeed,fov_min)
	end

	if IsControlJustPressed(1,242) then
		fov = math.min(fov + zoomspeed,fov_max)
	end

	local current_fov = GetCamFov(cam)
	if math.abs(fov - current_fov) < 0.1 then
		fov = current_fov
	end

	SetCamFov(cam,current_fov + (fov - current_fov) * 0.05)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- RECOIL
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local ped = PlayerPedId()

		if IsPedArmed(ped,6) then
			DisableControlAction(1,140,true)
			DisableControlAction(1,141,true)
			DisableControlAction(1,142,true)
			Citizen.Wait(1)
		else
			Citizen.Wait(1000)
		end

		if IsPedShooting(ped) then
			local cam = GetFollowPedCamViewMode()
			local veh = IsPedInAnyVehicle(ped)
			
			local speed = math.ceil(GetEntitySpeed(ped))
			if speed > 70 then
				speed = 70
			end

			local _,wep = GetCurrentPedWeapon(ped)
			local class = GetWeapontypeGroup(wep)
			local p = GetGameplayCamRelativePitch()
			local camDist = #(GetGameplayCamCoord() - GetEntityCoords(ped))

			local recoil = math.random(110,120+(math.ceil(speed*0.5)))/100
			local rifle = false

			if class == 970310034 or class == 1159398588 then
				rifle = true
			end

			if camDist < 5.3 then
				camDist = 1.5
			else
				if camDist < 8.0 then
					camDist = 4.0
				else
					camDist =  7.0
				end
			end

			if veh then
				recoil = recoil + (recoil * camDist)
			else
				recoil = recoil * 0.1
			end

			if cam == 4 then
				recoil = recoil * 0.6
				if rifle then
					recoil = recoil * 0.1
				end
			end

			if rifle then
				recoil = recoil * 0.6
			end

			local spread = math.random(4)
			local h = GetGameplayCamRelativeHeading()
			local hf = math.random(10,40+speed) / 100

			if veh then
				hf = hf * 2.0
			end

			if spread == 1 then
				SetGameplayCamRelativeHeading(h+hf)
			elseif spread == 2 then
				SetGameplayCamRelativeHeading(h-hf)
			end

			local set = p + recoil
			SetGameplayCamRelativePitch(set,0.8)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BUNNYHOP
-----------------------------------------------------------------------------------------------------------------------------------------
local bunnyHope = 0
Citizen.CreateThread(function()
	while true do
		if bunnyHope > 0 then
			bunnyHope = bunnyHope - 1
		end

		Citizen.Wait(1000)
	end
end)

Citizen.CreateThread(function()
	while true do
		local timeDistance = 500
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			if bunnyHope > 0 then
				timeDistance = 4
				DisableControlAction(1,22,true)
			else
				if IsPedJumping(ped) then
					bunnyHope = 5
				end
			end
		end

		Citizen.Wait(timeDistance)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADAGACHAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local ped = PlayerPedId()
        DisableControlAction(0,36,true)
        if not IsPedInAnyVehicle(ped) then
            RequestAnimSet("move_ped_crouched")
            RequestAnimSet("move_ped_crouched_strafing")
            if IsDisabledControlJustPressed(0,36) then
                if agachar then
                    ResetPedStrafeClipset(ped)
                    ResetPedMovementClipset(ped,0.25)
                    agachar = false
                else
                    SetPedStrafeClipset(ped,"move_ped_crouched_strafing")
                    SetPedMovementClipset(ped,"move_ped_crouched",0.25)
                    agachar = true
                end
            end
        end
    end
end)