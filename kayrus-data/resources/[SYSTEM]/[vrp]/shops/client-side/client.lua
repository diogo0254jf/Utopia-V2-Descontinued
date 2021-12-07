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
Tunnel.bindInterface("shops",cRP)
vSERVER = Tunnel.getInterface("shops")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("close",function(data)
	SetNuiFocus(false,false)
	TransitionFromBlurred(1000)
	SendNUIMessage({ action = "hideNUI" })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("requestShop",function(data,cb)
	local inventoryShop,inventoryUser,weight,maxweight,infos = vSERVER.requestShop(data.shop)
	if inventoryShop then
		cb({ inventoryShop = inventoryShop, inventoryUser = inventoryUser, weight = weight, maxweight = maxweight, infos = infos })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTBUY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("functionShops",function(data,cb)
	vSERVER.functionShops(data.shop,data.item,data.amount,data.slot)
	TriggerEvent("sounds:source","cash",0.5)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("populateSlot",function(data,cb)
	TriggerServerEvent("shops:populateSlot",data.item,data.slot,data.target,data.amount)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("updateSlot",function(data,cb)
	TriggerServerEvent("shops:updateSlot",data.item,data.slot,data.target,data.amount)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("shops:Update")
AddEventHandler("shops:Update",function(action)
	SendNUIMessage({ action = action })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPLIST
-----------------------------------------------------------------------------------------------------------------------------------------
-- local shopList = {
	-- { 25.68,-1346.6,29.5,"departamentStore" },
	-- { 2556.47,382.05,108.63,"departamentStore" },
	-- { 1163.55,-323.02,69.21,"departamentStore" },
	-- { -707.31,-913.75,19.22,"departamentStore" },
	-- { -47.72,-1757.23,29.43,"departamentStore" },
	-- { 373.89,326.86,103.57,"departamentStore" },
	-- { -3242.95,1001.28,12.84,"departamentStore" },
	-- { 1729.3,6415.48,35.04,"departamentStore" },
	-- { 548.0,2670.35,42.16,"departamentStore" },
	-- { 1960.69,3741.34,32.35,"departamentStore" },
	-- { 2677.92,3280.85,55.25,"departamentStore" },
	-- { 1698.5,4924.09,42.07,"departamentStore" },
	-- { -1820.82,793.21,138.12,"departamentStore" },
	-- { 1393.21,3605.26,34.99,"departamentStore" },
	-- { -2967.78,390.92,15.05,"departamentStore" },
	-- { -3040.14,585.44,7.91,"departamentStore" },
	-- { 1135.56,-982.24,46.42,"departamentStore" },
	-- { 1166.0,2709.45,38.16,"departamentStore" },
	-- { -1487.21,-378.99,40.17,"departamentStore" },
	-- { -1222.76,-907.21,12.33,"departamentStore" },
	-- { 1692.62,3759.50,34.70,"ammunationStore" },
	-- { 252.89,-49.25,69.94,"ammunationStore" },
	-- { 843.28,-1034.02,28.19,"ammunationStore" },
	-- { -331.35,6083.45,31.45,"ammunationStore" },
	-- { -663.15,-934.92,21.82,"ammunationStore" },
	-- { -1305.18,-393.48,36.69,"ammunationStore" },
	-- { -1118.80,2698.22,18.55,"ammunationStore" },
	-- { 2568.83,293.89,108.73,"ammunationStore" },
	-- { -3172.68,1087.10,20.83,"ammunationStore" },
	-- { 21.32,-1106.44,29.79,"ammunationStore" },
	-- { 811.19,-2157.67,29.61,"ammunationStore" },
	-- { -1565.03,-979.15,13.02,"fishingStore" },
	-- { -1558.44,-968.96,17.42,"fishingSell" },
	-- { 306.74,-601.9,43.29,"pharmacyStore" },
	-- { 93.33,-230.09,54.67,"pharmacyPublic" },
	-- { 317.18,-1077.04,29.48,"pharmacyPublic" },
	-- { 229.39,-369.77,-98.78,"registryStore" },
	-- { 46.66,-1749.79,29.64,"megaMallStore" },
	-- { -428.56,-1728.33,19.79,"recyclingSell" },
	-- { -656.84,-857.51,24.5,"digitalDen" },
	-- { 392.7,-831.61,29.3,"digitalDen" },
	-- { -41.37,-1036.79,28.49,"digitalDen" },
	-- { -509.38,278.8,83.33,"digitalDen" },
	-- { 1137.52,-470.69,66.67,"digitalDen" },
	-- { 11.27,-1599.34,29.38,"foodGrill" },
	-- { 988.12,-94.62,74.85,"comedyBar" },
	-- { 482.67,-995.25,30.69,"policeStore" },
	-- { 911.13,3644.9,32.68,"drugsSelling" },
-- }
local shopList = {
	{ 1272.33,-1711.61,54.78,"robberysSelling" }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:DEPARTAMENTSTORE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:departamentStore",function()
	if GetClockHours() >= 15 and GetClockHours() <= 20 then
		SendNUIMessage({ action = "showNUI", name = tostring("departamentStore"), type = vSERVER.getShopType("departamentStore") })
		SetNuiFocus(true,true)
		TriggerEvent("sounds:source","shop",0.5)
	else
		TriggerEvent("Notify","amarelo","Loja fechada, a mesma só funciona das <b>15</b> ás <b>20</b> horas.",3000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:AMMUNATIONSTORE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:ammunationStore",function()
	SendNUIMessage({ action = "showNUI", name = tostring("ammunationStore"), type = vSERVER.getShopType("ammunationStore") })
	TriggerEvent("sounds:source","shop",0.5)
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:NORMALPHARMACYSTORE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:normalpharmacyStore",function()
	SendNUIMessage({ action = "showNUI", name = tostring("normalpharmacyStore"), type = vSERVER.getShopType("normalpharmacyStore") })
	TriggerEvent("sounds:source","shop",0.5)
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:HOSPITALPHARMACYSTORE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:hospitalpharmacyStore",function()
	if vSERVER.requestPerm("hospitalpharmacyStore") then
		SendNUIMessage({ action = "showNUI", name = tostring("hospitalpharmacyStore"), type = vSERVER.getShopType("hospitalpharmacyStore") })
		SetNuiFocus(true,true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:MEGAMALL
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:megaMallStore",function()
	SendNUIMessage({ action = "showNUI", name = tostring("megaMallStore"), type = vSERVER.getShopType("megaMallStore") })
	TriggerEvent("sounds:source","shop",0.5)
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:RECYCLINGSELL
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:recyclingSell",function()
		SendNUIMessage({ action = "showNUI", name = tostring("recyclingSell"), type = vSERVER.getShopType("recyclingSell") })
		SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:BARSSTORE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:barsStore",function()
		SendNUIMessage({ action = "showNUI", name = tostring("barsStore"), type = vSERVER.getShopType("barsStore") })
		SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:JEWELRYSTORE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:jewelryStore",function()
		SendNUIMessage({ action = "showNUI", name = tostring("jewelryStore"), type = vSERVER.getShopType("jewelryStore") })
		SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:HUNTINGSTORE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:huntingStore",function()
		SendNUIMessage({ action = "showNUI", name = tostring("huntingStore"), type = vSERVER.getShopType("huntingStore") })
		SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:COFFEEMACHINE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:coffeeMachine",function()
	SendNUIMessage({ action = "showNUI", name = tostring("coffeeMachine"), type = vSERVER.getShopType("coffeeMachine") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:COLAMACHINE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:colaMachine",function()
	SendNUIMessage({ action = "showNUI", name = tostring("colaMachine"), type = vSERVER.getShopType("colaMachine") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:SODAMACHINE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:sodaMachine",function()
	SendNUIMessage({ action = "showNUI", name = tostring("sodaMachine"), type = vSERVER.getShopType("sodaMachine") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:DONUTMACHINE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:donutMachine",function()
	SendNUIMessage({ action = "showNUI", name = tostring("donutMachine"), type = vSERVER.getShopType("donutMachine") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:BURGERMACHINE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:burgerMachine",function()
	SendNUIMessage({ action = "showNUI", name = tostring("burgerMachine"), type = vSERVER.getShopType("burgerMachine") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:HOTDOGMACHINE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:hotdogMachine",function()
	SendNUIMessage({ action = "showNUI", name = tostring("hotdogMachine"), type = vSERVER.getShopType("hotdogMachine") })
	SetNuiFocus(true,true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:WATERMACHINE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:waterMachine",function()
	SendNUIMessage({ action = "showNUI", name = tostring("waterMachine"), type = vSERVER.getShopType("waterMachine") })
	SetNuiFocus(true,true)
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADHOVERFY
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	local innerTable = {}
	for k,v in pairs(shopList) do
		table.insert(innerTable,{ v[1],v[2],v[3],1,"E","Venda de Produtos","Pressione para abrir" })
	end

	TriggerEvent("hoverfy:insertTable",innerTable)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADOPEN
-----------------------------------------------------------------------------------------------------------------------------------------
-- Citizen.CreateThread(function()
	-- SetNuiFocus(false,false)

	-- while true do
		-- local timeDistance = 500
		-- local ped = PlayerPedId()
		-- if not IsPedInAnyVehicle(ped) then
			-- local coords = GetEntityCoords(ped)
			-- for k,v in pairs(shopList) do
				-- local distance = #(coords - vector3(v[1],v[2],v[3]))
				-- if distance <= 1.5 then
					-- timeDistance = 4
					-- DrawText3D(v[1],v[2],v[3],"~g~E~w~   ABRIR")
					-- if IsControlJustPressed(1,38) and vSERVER.requestPerm(v[4]) then
						-- SetNuiFocus(true,true)
						-- TransitionToBlurred(1000)
						-- SendNUIMessage({ action = "showNUI", name = tostring(v[4]), type = vSERVER.getShopType(v[4]) })
						-- TriggerEvent("sounds:source","shop",0.5)
					-- end
				-- end
			-- end
		-- end
		-- Citizen.Wait(timeDistance)
	-- end
-- end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADOPEN
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)

	while true do
		local timeDistance = 500
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			local coords = GetEntityCoords(ped)
			for k,v in pairs(shopList) do
				local distance = #(coords - vector3(v[1],v[2],v[3]))
				if distance <= 1 then
					timeDistance = 4

					if IsControlJustPressed(1,38) then
						if v[6] then
								SetNuiFocus(true,true)
								SendNUIMessage({ action = "showNUI", name = tostring(v[4]), type = vSERVER.getShopType(v[4]) })
								TriggerEvent("sounds:source","shop",0.5)
						else
							if vSERVER.requestPerm(v[4]) then
								SetNuiFocus(true,true)
								SendNUIMessage({ action = "showNUI", name = tostring(v[4]), type = vSERVER.getShopType(v[4]) })
								TriggerEvent("sounds:source","shop",0.5)
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
-- 	local factor = (string.len(text)) / 450
-- 	DrawRect(_x,_y+0.0125,0.01+factor,0.03,0,0,0,100)
-- end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROPSHOPS
-----------------------------------------------------------------------------------------------------------------------------------------
local propShops = {
	{ "prop_vend_coffe_01","coffeeMachine" },
	{ "prop_vend_soda_02","sodaMachine" },
	{ "prop_vend_soda_01","colaMachine" },
	{ "v_ret_247_donuts","donutMachine" },
	{ "prop_burgerstand_01","burgerMachine" },
	{ "prop_hotdogstand_01","hotdogMachine" },
	{ "prop_vend_water_01","waterMachine" }
}

RegisterCommand("comprar",function(source,args)
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)

	for k,v in pairs(propShops) do
		if DoesObjectOfTypeExistAtCoords(coords,0.7,GetHashKey(v[1]),true) then
			SetNuiFocus(true,true)
			SendNUIMessage({ action = "showNUI", name = tostring(v[2]), type = vSERVER.getShopType(v[2]) })
		end
	end
end)

