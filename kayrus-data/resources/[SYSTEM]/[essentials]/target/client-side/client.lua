-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Zones = {}
local Models = {}
local success = false
local innerEntity = {}
local dismantleList = {}
local setDistance = 10.0
local playerActive = true
local targetActive = true
local adminService = false
local policeService = false
local paramedicService = false
local vehicle = vRP.vehList(11)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POLICE:UPDATESERVICE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("police:updateService")
AddEventHandler("police:updateService",function(status)
	policeService = status
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARAMEDIC:UPDATESERVICE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("paramedic:updateService")
AddEventHandler("paramedic:updateService",function(status)
	paramedicService = status
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP:PLAYERACTIVE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp:playerActive")
AddEventHandler("vrp:playerActive",function()
	playerActive = true
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:TOGGLEADMIN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:toggleAdmin")
AddEventHandler("target:toggleAdmin",function()
	if adminService then
		setDistance = 10.0
		adminService = false
		TriggerEvent("Notify","amarelo","Sistema desativado.",5000)
	else
		setDistance = 99.0
		adminService = true
		TriggerEvent("Notify","verde","Sistema ativado.",5000)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	RegisterCommand("+entityTarget",playerTargetEnable)
	RegisterCommand("-entityTarget",playerTargetDisable)
	RegisterKeyMapping("+entityTarget","Target","keyboard","LMENU")

	AddCircleZone("polService01",vector3(-918.84,-2027.85,9.4),0.75,{
		name = "polService01",
		heading = 133.23
	},{
		distance = 1.0,
		options = {
			{
				event = "player:servicePolice",
				label = "Trabalhar",
				tunnel = "server"
			}
		}
	})

	AddCircleZone("polService02",vector3(1853.33,3689.93,34.26),0.75,{
		name = "polService02",
		heading = 303.31
	},{
		distance = 1.0,
		options = {
			{
				event = "player:servicePolice",
				label = "Trabalhar",
				tunnel = "server"
			}
		}
	})

	AddCircleZone("polService03",vector3(-449.32,6012.61,31.71),0.75,{
		name = "polService03",
		heading = 42.52
	},{
		distance = 1.0,
		options = {
			{
				event = "player:servicePolice",
				label = "Trabalhar",
				tunnel = "server"
			}
		}
	})

	AddCircleZone("mecService04",vector3(820.95,-932.92,26.47),0.75,{
		name = "mecService04",
		heading = 181.42
	},{
		distance = 1.0,
		options = {
			{
				event = "player:serviceMechanic",
				label = "Trabalhar",
				tunnel = "server"
			}
		}
	})

	AddCircleZone("paraService01",vector3(1137.29,-1546.47,35.38),0.75,{
		name = "paraService01",
		heading = 161.58
	},{
		distance = 1.0,
		options = {
			{
				event = "player:serviceParamedic",
				label = "Trabalhar",
				tunnel = "server"
			}
		}
	})

	AddCircleZone("paraService02",vector3(-255.44,6330.36,32.42),0.75,{
		name = "paraService02",
		heading = 317.49
	},{
		distance = 1.0,
		options = {
			{
				event = "player:serviceParamedic",
				label = "Trabalhar",
				tunnel = "server"
			}
		}
	})

	AddCircleZone("paraService03",vector3(1830.57,3676.32,34.27),0.75,{
		name = "paraService03",
		heading = 212.6
	},{
		distance = 1.0,
		options = {
			{
				event = "player:serviceParamedic",
				label = "Trabalhar",
				tunnel = "server"
			}
		}
	})

	AddCircleZone("treatment01",vector3(-253.92,6331.07,32.42),0.75,{
		name = "treatment01",
		heading = 136.07
	},{
		distance = 1.0,
		options = {
			{
				event = "checkin:initCheck",
				label = "Tratamento",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("treatment02",vector3(1139.77,-1536.87,35.38),0.75,{
		name = "treatment02",
		heading = 138.9
	},{
		distance = 1.0,
		options = {
			{
				event = "checkin:initCheck",
				label = "Tratamento",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("treatment03",vector3(1768.67,2570.59,45.73),0.75,{
		name = "treatment03",
		heading = 314.65
	},{
		distance = 1.0,
		options = {
			{
				event = "checkin:initCheck",
				label = "Tratamento",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("treatment04",vector3(1832.67,3677.03,34.27),0.75,{
		name = "treatment04",
		heading = 65.2
	},{
		distance = 1.0,
		options = {
			{
				event = "checkin:initCheck",
				label = "Tratamento",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("policestore1",vector3(1848.87,3687.96,34.27),0.75,{
		name = "policestore1",
		heading = 121.33
	},{
		distance = 1.0,
		options = {
			{
				event = "shops:policeStore",
				label = "Arsenal",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("policestore2",vector3(-947.93,-2040.39,9.41),0.75,{
		name = "policestore2",
		heading = 319.36
	},{
		distance = 1.0,
		options = {
			{
				event = "shops:policeStore",
				label = "Arsenal",
				tunnel = "client"
			}
		}
	})


	AddTargetModel({ 1631638868,2117668672,-1498379115,-1519439119,-289946279 },{
		options = {
			{
				event = "target:animDeitar",
				label = "Deitar",
				tunnel = "client"
			}
		},
		distance = 1.00
	})

	AddTargetModel({ -171943901,-109356459,1805980844,-99500382,1262298127,1737474779,2040839490,1037469683,867556671,-1521264200,-741944541,-591349326,-293380809,-628719744,-1317098115,1630899471,38932324,-523951410,725259233,764848282,2064599526,536071214,589738836,146905321,47332588,-1118419705,538002882,-377849416,96868307 },{
		options = {
			{
				event = "target:animSentar",
				label = "Sentar",
				tunnel = "client"
			}
		},
		distance = 1.00
	})

	AddTargetModel({ 690372739 },{
		options = {
			{
				event = "shops:coffeeMachine",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 0.75
	})

	AddTargetModel({ -654402915,1421582485 },{
		options = {
			{
				event = "shops:donutMachine",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 0.75
	})

	AddTargetModel({ 992069095,1114264700 },{
		options = {
			{
				event = "shops:sodaMachine",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 0.75
	})

	AddTargetModel({ 1129053052 },{
		options = {
			{
				event = "shops:burgerMachine",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 0.75
	})

	AddTargetModel({ -1581502570 },{
		options = {
			{
				event = "shops:hotdogMachine",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 0.75
	})

	AddTargetModel({ 1099892058 },{
		options = {
			{
				event = "shops:waterMachine",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 0.75
	})

	AddTargetModel({ 0x18CE57D0 },{ -- Departament store
		options = {
			{
				event = "shops:departamentStore",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 1.50
	})

	AddTargetModel({ 0x467415E9 },{ -- Ammunation store
		options = {
			{
				event = "shops:ammunationStore",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 1.50
	})

	AddTargetModel({ 0xB7C61032 },{ -- Animal store
		options = {
			{
				event = "shops:animalStore",
				label = "Comprar",
				tunnel = "client"
			}
		},
		distance = 1.50
	})

	AddTargetModel({ 0x2F8845A3 },{ -- Premium Store
	options = {
		{
			event = "shops:premiumStore",
			label = "Comprar",
			tunnel = "client"
		}
	},
	distance = 2.50
})

	AddTargetModel({ 0x3273A285 },{ -- Mega Mall 2
	options = {
		{
			event = "shops:megaMallStore",
			label = "Comprar",
			tunnel = "client"
		}
	},
	distance = 1.50
})

	AddTargetModel({ 0x46521A32 },{ -- Hunting Store
	options = {
		{
			event = "shops:normalhuntingStore",
			label = "Vender",
			tunnel = "client"
		}
	},
	distance = 4.00
})

	AddTargetModel({ 0x5244247D },{ -- Pharmacy Store
	options = {
		{
			event = "shops:normalpharmacyStore",
			label = "Comprar",
			tunnel = "client"
		}
	},
	distance = 1.50
})

	AddTargetModel({ 0x1536D95A },{ -- Hunting and Harvest Sell
	options = {
		{
			event = "shops:harverstandhuntingSell",
			label = "Vender",
			tunnel = "client"
		}
	},
	distance = 1.50
})
	AddTargetModel({ 0x0703F106 },{ -- Jewelry Sell
	options = {
		{
			event = "shops:jewelrySell",
			label = "Vender",
			tunnel = "client"
		}
	},
	distance = 1.50
})
	AddTargetModel({ 0x62018559 },{ -- Recycling Sell
	options = {
		{
			event = "shops:recyclingSell",
			label = "Vender",
			tunnel = "client"
		}
	},
	distance = 1.50
})
AddTargetModel({ 0x51C03FA4 },{ -- Fishing Sell
options = {
	{
		event = "shops:fishingSell",
		label = "Vender",
		tunnel = "client"
	}
},
distance = 1.50
})

AddTargetModel({ 0x158C439C },{ -- Ilegal Sell Cosmetics
options = {
	{
		event = "shops:ilegalCosmetics",
		label = "Vender",
		tunnel = "client"
	}
},
distance = 1.50
})

AddTargetModel({ 0x23B88069 },{ -- Ilegal Toys
options = {
	{
		event = "shops:ilegalToys",
		label = "Vender",
		tunnel = "client"
	}
},
distance = 1.50
})

AddTargetModel({ 0x231AF63F },{ -- Ilegal House
options = {
	{
		event = "shops:ilegalHouse",
		label = "Vender",
		tunnel = "client"
	}
},
distance = 1.50
})

AddTargetModel({ 0x33A464E5 },{ -- Ilegal Criminal
options = {
	{
		event = "shops:ilegalCriminala",
		label = "Vender",
		tunnel = "client"
	}
},
distance = 1.50
})

 
	AddTargetModel({ 0x106D9A99 },{ -- Ilegal Ticker
	options = {
		{
			event = "shops:ilegalCredential",
			label = "Comprar",
			tunnel = "client"
		}
	},
	distance = 1.50
})



	AddTargetModel({ -783406593 },{ --entrar no porta malas
		options = {
			{
				event = "player:EnterTrunk",
				label = "Entrar no porta malas",
				tunnel = "player"
			}
		},
		distance = 1.00
	})

		AddTargetModel({ 506770882,-870868698,-1364697528,-1126237515 },{ -- abrir atm
		options = {
			{
				event = "atm:openATM",
				label = "Abrir",
				tunnel = "client"
			}
		},
		distance = 1.50
	})

	AddCircleZone("chestpolice1",vector3(-944.94,-2040.81,9.4),0.75,{
		name = "chestpolice1",
		heading = 65.2
	},{
		distance = 1.0,
		options = {
			{
				event = "chest:openChest",
				label = "Abrir",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("chestpolice2",vector3(1850.06,3686.12,34.27),0.75,{
		name = "chestpolice2",
		heading = 120.22
	},{
		distance = 1.0,
		options = {
			{
				event = "chest:openChest",
				label = "Abrir",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("craftingpolice2",vector3(1850.06,3686.12,34.27),0.75,{
		name = "chestpolice2",
		heading = 120.22
	},{
		distance = 1.0,
		options = {
			{
				event = "chest:openChest",
				label = "Abrir",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("chestpolice3",vector3(-444.73,6010.4,31.72),0.75,{
		name = "chestpolice3",
		heading = 225.84
	},{
		distance = 1.0,
		options = {
			{
				event = "chest:openChest",
				label = "Abrir",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("chestpenal",vector3(1844.3,2574.15,46.02),0.75,{
		name = "chestpenal",
		heading = 179.28
	},{
		distance = 1.0,
		options = {
			{
				event = "chest:openChest",
				label = "Abrir",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("chestparamedic1",vector3(1135.3,-1540.49,35.38),0.75,{
		name = "chestparamedic1",
		heading = 179.28
	},{
		distance = 1.0,
		options = {
			{
				event = "chest:openChest",
				label = "Abrir",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("chestparamedic2",vector3(-258.01,6332.26,32.42),0.75,{
		name = "chestparamedic2",
		heading = 179.28
	},{
		distance = 1.0,
		options = {
			{
				event = "chest:openChest",
				label = "Abrir",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("chestparamedic3",vector3(1831.1,3678.57,34.27),0.75,{
		name = "chestparamedic3",
		heading = 179.28
	},{
		distance = 1.0,
		options = {
			{
				event = "chest:openChest",
				label = "Abrir",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("chestballas",vector3(105.3,-1996.61,14.88),0.75,{
		name = "chestballas",
		heading = 179.28
	},{
		distance = 1.0,
		options = {
			{
				event = "chest:openChest",
				label = "Abrir",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("chestvagos",vector3(428.38,-2050.14,18.74),0.75,{
		name = "chestvagos",
		heading = 179.28
	},{
		distance = 1.0,
		options = {
			{
				event = "chest:openChest",
				label = "Abrir",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("chestfamilies",vector3(-198.8,-1702.21,29.39),0.75,{
		name = "chestfamilies",
		heading = 179.28
	},{
		distance = 1.0,
		options = {
			{
				event = "chest:openChest",
				label = "Abrir",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("chestaztecas",vector3(471.31,-1743.58,25.54),0.75,{
		name = "chestaztecas",
		heading = 179.28
	},{
		distance = 1.0,
		options = {
			{
				event = "chest:openChest",
				label = "Abrir",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("chestmarabunta",vector3(1407.88,-1542.14,54.71),0.75,{
		name = "chestmarabunta",
		heading = 179.28
	},{
		distance = 1.0,
		options = {
			{
				event = "chest:openChest",
				label = "Abrir",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("chestbloods",vector3(226.45,-1753.92,25.24),0.75,{
		name = "chestbloods",
		heading = 179.28
	},{
		distance = 1.0,
		options = {
			{
				event = "chest:openChest",
				label = "Abrir",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("chestcrips",vector3(-1118.2,-1553.74,0.98),0.75,{
		name = "chestcrips",
		heading = 179.28
	},{
		distance = 1.0,
		options = {
			{
				event = "chest:openChest",
				label = "Abrir",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("chestlost",vector3(1987.47,3046.49,50.5),0.75,{
		name = "chestlost",
		heading = 179.28
	},{
		distance = 1.0,
		options = {
			{
				event = "chest:openChest",
				label = "Abrir",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("chestmafia",vector3(1554.55,3789.72,30.46),0.75,{
		name = "chestmafia",
		heading = 179.28
	},{
		distance = 1.0,
		options = {
			{
				event = "chest:openChest",
				label = "Abrir",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("chestfavela01",vector3(1393.3,-187.88,161.56),0.75,{
		name = "chestfavela01",
		heading = 179.28
	},{
		distance = 1.0,
		options = {
			{
				event = "chest:openChest",
				label = "Abrir",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("chestfavela02",vector3(1713.08,446.54,232.83),0.75,{
		name = "chestfavela02",
		heading = 179.28
	},{
		distance = 1.0,
		options = {
			{
				event = "chest:openChest",
				label = "Abrir",
				tunnel = "client"
			}
		}
	})
	
	AddCircleZone("chestfavela03",vector3(2248.73,48.94,251.42),0.75,{
		name = "chestfavela03",
		heading = 179.28
	},{
		distance = 1.0,
		options = {
			{
				event = "chest:openChest",
				label = "Abrir",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("chestmechanicnorte",vector3(1760.13,3329.94,41.43),0.75,{
		name = "chestmechanicnorte",
		heading = 179.28
	},{
		distance = 1.0,
		options = {
			{
				event = "chest:openChest",
				label = "Abrir",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("chestmechanicsul",vector3(823.35,-928.73,26.47),0.75,{
		name = "chestmechanicsul",
		heading = 179.28
	},{
		distance = 1.0,
		options = {
			{
				event = "chest:openChest",
				label = "Abrir",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("chestlasttraincity",vector3(-384.31,266.97,86.46),0.75,{
		name = "chestlasttraincity",
		heading = 179.28
	},{
		distance = 1.0,
		options = {
			{
				event = "chest:openChest",
				label = "Abrir",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("chestlasttraineast",vector3(1996.47,3725.8,34.94),0.75,{
		name = "chestlasttraineast",
		heading = 4.32
	},{
		distance = 1.0,
		options = {
			{
				event = "chest:openChest",
				label = "Abrir",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("shopsfoodStorecity",vector3(-380.44,266.05,86.46),0.75,{
		name = "shopsfoodStorecity",
		heading = 125.2
	},{
		distance = 1.0,
		options = {
			{
				event = "shops:foodStore",
				label = "Comprar",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("shopsfoodStoreeast",vector3(1995.19,3722.06,34.94),0.75,{
		name = "shopsfoodStoreeast",
		heading = 28.7
	},{
		distance = 1.0,
		options = {
			{
				event = "shops:foodStore",
				label = "Comprar",
				tunnel = "client"
			}
		}
	})
	
	AddCircleZone("shopsnormalmechanicStore",vector3(839.86,-964.09,26.49),0.75,{
		name = "shopsnormalmechanicStore",
		heading = 267.29
	},{
		distance = 1.0,
		options = {
			{
				event = "shops:normalmechanicStore",
				label = "Comprar",
				tunnel = "client"
			}
		}
	})

	AddCircleZone("craftingmakeFoodscity",vector3(-383.85,265.71,86.46),0.75,{
		name = "craftingmakeFoodscity",
		heading = 267.29
	},{
		distance = 1.0,
		options = {
			{
				event = "crafting:makeFoods",
				label = "Fabricar",
				tunnel = "client"
			}
		}
	})
	AddCircleZone("craftingmakeFoodseast",vector3(1995.22,3725.44,34.9),0.75,{
		name = "craftingmakeFoodseast",
		heading = 267.29
	},{
		distance = 1.0,
		options = {
			{
				event = "crafting:makeFoods",
				label = "Fabricar",
				tunnel = "client"
			}
		}
	})
	AddCircleZone("craftingmakeFoodseast",vector3(1995.22,3725.44,34.9),0.75,{
		name = "craftingmakeFoodseast",
		heading = 267.29
	},{
		distance = 1.0,
		options = {
			{
				event = "crafting:makeFoods",
				label = "Fabricar",
				tunnel = "client"
			}
		}
	})
	AddCircleZone("craftingmakeHambCity",vector3(-383.98,262.53,86.46),0.75,{
		name = "craftingmakeHambCity",
		heading = 267.29
	},{
		distance = 1.0,
		options = {
			{
				event = "crafting:makeHamburger",
				label = "Fabricar",
				tunnel = "client"
			}
		}
	})
	AddCircleZone("craftingmakeHambEast",vector3(1992.0,3725.79,34.94),0.75,{
		name = "craftingmakeHambEast",
		heading = 267.29
	},{
		distance = 1.0,
		options = {
			{
				event = "crafting:makeHamburger",
				label = "Fabricar",
				tunnel = "client"
			}
		}
	})
	AddCircleZone("craftingmakeJuiceCity",vector3(-382.84,269.68,86.46),0.75,{
		name = "craftingmakeJuiceCity",
		heading = 267.29
	},{
		distance = 1.0,
		options = {
			{
				event = "crafting:makeJuices",
				label = "Fabricar",
				tunnel = "client"
			}
		}
	})
	AddCircleZone("craftingmakeJuiceEast",vector3(1999.26,3723.82,34.94),0.75,{
		name = "craftingmakeJuiceEast",
		heading = 267.29
	},{
		distance = 1.0,
		options = {
			{
				event = "crafting:makeJuices",
				label = "Fabricar",
				tunnel = "client"
			}
		}
	})
	AddCircleZone("craftingdressMaker",vector3(713.95,-961.54,30.4),0.75,{
		name = "craftingdressMaker",
		heading = 267.29
	},{
		distance = 1.0,
		options = {
			{
				event = "crafting:dressMaker",
				label = "Fabricar",
				tunnel = "client"
			}
		}
	})
	AddCircleZone("craftinglixeiro1",vector3(82.45,-1553.26,29.59),0.75,{
		name = "craftinglixeiro1",
		heading = 267.29
	},{
		distance = 1.0,
		options = {
			{
				event = "crafting:lixeiroShop",
				label = "Fabricar",
				tunnel = "client"
			}
		}
	})
	AddCircleZone("craftinglixeiro2",vector3(287.36,2843.6,44.7),0.75,{
		name = "craftinglixeiro2",
		heading = 267.29
	},{
		distance = 1.0,
		options = {
			{
				event = "crafting:lixeiroShop",
				label = "Fabricar",
				tunnel = "client"
			}
		}
	})
	AddCircleZone("craftinglixeiro2",vector3(-413.68,6171.99,31.48),0.75,{
		name = "craftinglixeiro2",
		heading = 267.29
	},{
		distance = 1.0,
		options = {
			{
				event = "crafting:lixeiroShop",
				label = "Fabricar",
				tunnel = "client"
			}
		}
	})
	AddCircleZone("craftingfavela01",vector3(1393.9,-185.61,161.56),0.75,{
		name = "craftingfavela01",
		heading = 267.29
	},{
		distance = 1.0,
		options = {
			{
				event = "crafting:Favela01",
				label = "Fabricar",
				tunnel = "client"
			}
		}
	})
	AddCircleZone("craftingfavela02",vector3(1712.81,447.72,232.83),0.75,{
		name = "craftingfavela02",
		heading = 267.29
	},{
		distance = 1.0,
		options = {
			{
				event = "crafting:Favela02",
				label = "Fabricar",
				tunnel = "client"
			}
		}
	})
	AddCircleZone("craftingfavela03",vector3(2232.36,94.2,244.44),0.75,{
		name = "craftingfavela03",
		heading = 267.29
	},{
		distance = 1.0,
		options = {
			{
				event = "crafting:Favela03",
				label = "Fabricar",
				tunnel = "client"
			}
		}
	})
	AddCircleZone("craftingballas",vector3(103.75,-1995.16,14.89),0.75,{
		name = "craftingballas",
		heading = 75.17
	},{
		distance = 1.0,
		options = {
			{
				event = "crafting:Ballas",
				label = "Fabricar",
				tunnel = "client"
			}
		}
	})
	AddCircleZone("craftingballas",vector3(103.75,-1995.16,14.89),0.75,{
		name = "craftingballas",
		heading = 75.17
	},{
		distance = 1.0,
		options = {
			{
				event = "crafting:Ballas",
				label = "Fabricar",
				tunnel = "client"
			}
		}
	})
	AddCircleZone("craftingvagos",vector3(429.51,-2051.96,18.74),0.75,{
		name = "craftingvagos",
		heading = 229.09
	},{
		distance = 1.0,
		options = {
			{
				event = "crafting:Vagos",
				label = "Fabricar",
				tunnel = "client"
			}
		}
	})
	AddCircleZone("craftingfamilies",vector3(-199.45,-1700.21,29.39),0.75,{
		name = "craftingfamilies",
		heading = 43.96
	},{
		distance = 1.0,
		options = {
			{
				event = "crafting:Families",
				label = "Fabricar",
				tunnel = "client"
			}
		}
	})
	AddCircleZone("craftingmarabunta",vector3(1406.15,-1543.39,54.71),0.75,{
		name = "craftingmarabunta",
		heading = 144.16
	},{
		distance = 1.0,
		options = {
			{
				event = "crafting:Marabunta",
				label = "Fabricar",
				tunnel = "client"
			}
		}
	})
	AddCircleZone("craftingaztecas",vector3(469.97,-1745.14,25.55),0.75,{
		name = "craftingaztecas",
		heading = 152.14
	},{
		distance = 1.0,
		options = {
			{
				event = "crafting:Aztecas",
				label = "Fabricar",
				tunnel = "client"
			}
		}
	})
	end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARAMEDICMENU AND VEH
-----------------------------------------------------------------------------------------------------------------------------------------
local paramedicMenu = {
	{
		event = "paramedic:Revive",
		label = "Reanimar",
		tunnel = "paramedic"
	},
	{
		event = "hospital:Diagnostic", --ok
		label = "Diagnóstico",
		tunnel = "paramedic"
	},
	{
		event = "hospital:Treatment", --ok
		label = "Tratamento",
		tunnel = "paramedic"
	},
	{
		event = "hospital:Bleeding", --ok
		label = "Sangramento",
		tunnel = "paramedic"
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- POLICEMENU AND VEH
-----------------------------------------------------------------------------------------------------------------------------------------
local policeVeh = {
	{
		event = "player:placa", --ok
		label = "Verificar Placa",
		tunnel = "police"
	},
	{
		event = "player:detido", --ok
		label = "Detenção do Veículo",
		tunnel = "police"
	},
	{
		event = "player:applyPlate", --ok
		label = "Trocar Placa",
		tunnel = "police"
	},
    {
        event = "player:EnterTrunk", --ok
        label = "Entrar no Porta-Malas",
        tunnel = "client"
    }
}

local policePed = {
	{
		event = "police:runInspect",
		label = "Revistar",
		tunnel = "police"
	},
	{
		event = "police:prisonClothes",
		label = "Uniforme do Presídio",
		tunnel = "police"
	}
}

---------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERVEH AND MENU
-----------------------------------------------------------------------------------------------------------------------------------------
local playerVeh = {
	{
		event = "player:applyPlate", --ok
		label = "Trocar Placa",
		tunnel = "police"
	},
	{
		event = "player:breakTrunk", --ok
		label = "Arrombar Porta Malas",
		tunnel = "police"
	},
	{
		event = "player:EnterTrunk", --ok
		label = "Entrar no Porta-Malas",
		tunnel = "client"
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERTARGETENABLE
-----------------------------------------------------------------------------------------------------------------------------------------
function playerTargetEnable()
--	print(playerActive)
	if playerActive then
		if success or IsPedArmed(PlayerPedId(),6) or IsPedInAnyVehicle(PlayerPedId()) then
			return
		end

		innerEntity = {}
		targetActive = true

		SendNUIMessage({ response = "openTarget" })

		while targetActive do
			local ped = PlayerPedId()
			local coords = GetEntityCoords(ped)
			local hit,entCoords,entity = RayCastGamePlayCamera(setDistance)

			if hit == 1 then
				if GetEntityType(entity) ~= 0 then
					if adminService then
						if DoesEntityExist(entity) then
							if #(coords - entCoords) <= setDistance then
								success = true

								NetworkRegisterEntityAsNetworked(entity)
								while not NetworkGetEntityIsNetworked(entity) do
									NetworkRegisterEntityAsNetworked(entity)
									Citizen.Wait(1)
								end

								local netObjects = NetworkGetNetworkIdFromEntity(entity)
								SetNetworkIdCanMigrate(netObjects,true)
								NetworkSetNetworkIdDynamic(netObjects,false)
								SetNetworkIdExistsOnAllMachines(netObjects,true)

								if IsEntityAVehicle(entity) then
									innerEntity = { netObjects,GetVehicleNumberPlateText(entity) }
								else
									innerEntity = { netObjects }
								end

								SendNUIMessage({ response = "validTarget", data = adminMenu })

								while success and targetActive do
									local ped = PlayerPedId()
									local coords = GetEntityCoords(ped)
									local hit,entCoords,entity = RayCastGamePlayCamera(setDistance)

									DisablePlayerFiring(ped,true)

									if (IsControlJustReleased(1,24) or IsDisabledControlJustReleased(1,24)) then
										SetCursorLocation(0.5,0.5)
										SetNuiFocus(true,true)
									end

									if GetEntityType(entity) == 0 or #(coords - entCoords) > setDistance then
										success = false
									end

									Citizen.Wait(1)
								end

								SendNUIMessage({ response = "leftTarget" })
							end
						end
					elseif IsEntityAVehicle(entity) and policeService then
						if #(coords - entCoords) <= 1.0 then
							success = true

							innerEntity = { GetVehicleNumberPlateText(entity),vRP.vehicleModel(GetEntityModel(entity)) }
							SendNUIMessage({ response = "validTarget", data = policeVeh })

							while success and targetActive do
								local ped = PlayerPedId()
								local coords = GetEntityCoords(ped)
								local hit,entCoords,entity = RayCastGamePlayCamera(setDistance)

								DisablePlayerFiring(ped,true)

								if (IsControlJustReleased(1,24) or IsDisabledControlJustReleased(1,24)) then
									SetCursorLocation(0.5,0.5)
									SetNuiFocus(true,true)
								end

								if GetEntityType(entity) == 0 or #(coords - entCoords) > 1.0 then
									success = false
								end

								Citizen.Wait(1)
							end

							SendNUIMessage({ response = "leftTarget" })
						end
					elseif IsPedAPlayer(entity) and policeService then
						if #(coords - entCoords) <= 1.0 then
							local index = NetworkGetPlayerIndexFromPed(entity)
							local source = GetPlayerServerId(index)

							success = true
							innerEntity = { source }
							SendNUIMessage({ response = "validTarget", data = policePed })

							while success and targetActive do
								local ped = PlayerPedId()
								local coords = GetEntityCoords(ped)
								local hit,entCoords,entity = RayCastGamePlayCamera(setDistance)

								DisablePlayerFiring(ped,true)

								if (IsControlJustReleased(1,24) or IsDisabledControlJustReleased(1,24)) then
									SetCursorLocation(0.5,0.5)
									SetNuiFocus(true,true)
								end

								if GetEntityType(entity) == 0 or #(coords - entCoords) > 1.0 then
									success = false
								end

								Citizen.Wait(1)
							end

							SendNUIMessage({ response = "leftTarget" })
						end
						elseif IsEntityAVehicle(entity) then
						if #(coords - entCoords) <= 1.0 then
							success = true

							innerEntity = { GetVehicleNumberPlateText(entity),vRP.vehicleModel(GetEntityModel(entity)),entity,VehToNet(entity) }

							if policeService then
								SendNUIMessage({ response = "validTarget", data = policeVeh })
							else
								local distance01 = #(coords - vector3(1564.24,-2166.25,77.51))
								local distance02 = #(coords - vector3(2340.12,3050.52,48.16))
								if distance01 > 20 and distance02 > 20 then
									local varMenu = playerVeh

									if GetEntityModel(entity) == 1747439474 then
										varMenu = stockadeVeh
									end

									SendNUIMessage({ response = "validTarget", data = varMenu })
								else
									SendNUIMessage({ response = "validTarget", data = dismantleVeh })
								end
							end

							while success and targetActive do
								local ped = PlayerPedId()
								local coords = GetEntityCoords(ped)
								local hit,entCoords,entity = RayCastGamePlayCamera(setDistance)

								DisablePlayerFiring(ped,true)

								if (IsControlJustReleased(1,24) or IsDisabledControlJustReleased(1,24)) then
									SetCursorLocation(0.5,0.5)
									SetNuiFocus(true,true)
								end

								if GetEntityType(entity) == 0 or #(coords - entCoords) > 1.0 then
									success = false
								end

								Citizen.Wait(1)
							end

							SendNUIMessage({ response = "leftTarget" })
						end
					elseif IsPedAPlayer(entity) and paramedicService then
						if #(coords - entCoords) <= 1.0 then
							local index = NetworkGetPlayerIndexFromPed(entity)
							local source = GetPlayerServerId(index)

							success = true
							innerEntity = { source,entity }
							SendNUIMessage({ response = "validTarget", data = paramedicMenu })

							while success and targetActive do
								local ped = PlayerPedId()
								local coords = GetEntityCoords(ped)
								local hit,entCoords,entity = RayCastGamePlayCamera(setDistance)

								DisablePlayerFiring(ped,true)

								if (IsControlJustReleased(1,24) or IsDisabledControlJustReleased(1,24)) then
									SetCursorLocation(0.5,0.5)
									SetNuiFocus(true,true)
								end

								if GetEntityType(entity) == 0 or #(coords - entCoords) > 1.0 then
									success = false
								end

								Citizen.Wait(1)
							end

							SendNUIMessage({ response = "leftTarget" })
						end
					else
						for k,v in pairs(Models) do
							if k == GetEntityModel(entity) then
								if #(coords - entCoords) <= Models[k]["distance"] then

									if Models[k]["desmanche"] then
										local distance = #(coords - vector3(2413.07,3139.35,48.19))
										if distance > 10 then
											goto scapeModel
										end
									end

									success = true

									NetworkRegisterEntityAsNetworked(entity)
									while not NetworkGetEntityIsNetworked(entity) do
										NetworkRegisterEntityAsNetworked(entity)
										Citizen.Wait(1)
									end

									local netObjects = NetworkGetNetworkIdFromEntity(entity)
									SetNetworkIdCanMigrate(netObjects,true)
									NetworkSetNetworkIdDynamic(netObjects,false)
									SetNetworkIdExistsOnAllMachines(netObjects,true)

									innerEntity = { entity,k,netObjects,GetEntityCoords(entity),GetEntityHeading(entity) }
									SendNUIMessage({ response = "validTarget", data = Models[k]["options"] })

									while success and targetActive do
										local ped = PlayerPedId()
										local coords = GetEntityCoords(ped)
										local hit,entCoords,entity = RayCastGamePlayCamera(setDistance)

										DisablePlayerFiring(ped,true)

										if (IsControlJustReleased(1,24) or IsDisabledControlJustReleased(1,24)) then
											SetCursorLocation(0.5,0.5)
											SetNuiFocus(true,true)
										end

										if GetEntityType(entity) == 0 or #(coords - entCoords) > Models[k]["distance"] then
											success = false
										end

										Citizen.Wait(1)
									end

									SendNUIMessage({ response = "leftTarget" })
								end
							end
						end

						::scapeModel::
					end
				end

				for k,v in pairs(Zones) do
					if Zones[k]:isPointInside(entCoords) then
						if #(coords - Zones[k]["center"]) <= v["targetoptions"]["distance"] then
							success = true

							SendNUIMessage({ response = "validTarget", data = Zones[k]["targetoptions"]["options"] })

							while success and targetActive do
								local ped = PlayerPedId()
								local coords = GetEntityCoords(ped)
								local hit,entCoords,entity = RayCastGamePlayCamera(setDistance)

								DisablePlayerFiring(ped,true)

								if (IsControlJustReleased(1,24) or IsDisabledControlJustReleased(1,24)) then
									SetCursorLocation(0.5,0.5)
									SetNuiFocus(true,true)
								end

								if not Zones[k]:isPointInside(entCoords) or #(coords - Zones[k]["center"]) > v["targetoptions"]["distance"] then
									success = false
								end

								Citizen.Wait(1)
							end

							SendNUIMessage({ response = "leftTarget" })
						end
					end
				end
			end

			Citizen.Wait(250)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:ANIMDEITAR
-----------------------------------------------------------------------------------------------------------------------------------------
local beds = {
	[1631638868] = { 0.0,0.0 },
	[2117668672] = { 0.0,0.0 },
	[-1498379115] = { 1.0,90.0 },
	[-1519439119] = { 1.0,0.0 },
	[-289946279] = { 1.0,0.0 }
}

RegisterNetEvent("target:animDeitar")
AddEventHandler("target:animDeitar",function()
	if not exports["player"]:blockCommands() and not exports["player"]:handCuff() then
		local ped = PlayerPedId()
		if GetEntityHealth(ped) > 101 then
			local objCoords = GetEntityCoords(innerEntity[1])

			SetEntityCoords(ped,objCoords["x"],objCoords["y"],objCoords["z"] + beds[innerEntity[2]][1],1,0,0,0)
			SetEntityHeading(ped,GetEntityHeading(innerEntity[1]) + beds[innerEntity[2]][2] - 180.0)

			vRP.playAnim(false,{"anim@gangops@morgue@table@","body_search"},true)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:PACIENTEDEITAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:pacienteDeitar")
AddEventHandler("target:pacienteDeitar",function()
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)

	for k,v in pairs(beds) do
		local object = GetClosestObjectOfType(coords["x"],coords["y"],coords["z"],0.9,k,0,0,0)
		if DoesEntityExist(object) then
			local objCoords = GetEntityCoords(object)

			SetEntityCoords(ped,objCoords["x"],objCoords["y"],objCoords["z"] + v[1],1,0,0,0)
			SetEntityHeading(ped,GetEntityHeading(object) + v[2] - 180.0)

			vRP.playAnim(false,{"anim@gangops@morgue@table@","body_search"},true)
			break
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:DISMANTLELIST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:dismantleList")
AddEventHandler("target:dismantleList",function(tableList)
	RemoveTargetModel(dismantleList)

	AddTargetModel(tableList,{
		options = {
			{
				event = "dismantle:checkVehicle",
				label = "Desmanchar",
				tunnel = "client"
			}
		},
		distance = 0.75,
		desmanche = true
	})

	dismantleList = tableList
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:DISMANTLELIST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("target:dismantleClear")
AddEventHandler("target:dismantleClear",function(model)
	if Models[model] then
		Models[model] = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVETARGETMODEL
-----------------------------------------------------------------------------------------------------------------------------------------
function RemoveTargetModel(models)
	for k,v in pairs(models) do
		if Models[v] then
			Models[v] = nil
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TARGET:SENTAR
-----------------------------------------------------------------------------------------------------------------------------------------
local chairs = {
	[-171943901] = 0.0,
	[-109356459] = 0.5,
	[1805980844] = 0.5,
	[-99500382] = 0.3,
	[1262298127] = 0.0,
	[1737474779] = 0.5,
	[2040839490] = 0.0,
	[1037469683] = 0.4,
	[867556671] = 0.4,
	[-1521264200] = 0.0,
	[-741944541] = 0.4,
	[-591349326] = 0.5,
	[-293380809] = 0.5,
	[-628719744] = 0.5,
	[-1317098115] = 0.5,
	[1630899471] = 0.5,
	[38932324] = 0.5,
	[-523951410] = 0.5,
	[725259233] = 0.5,
	[764848282] = 0.5,
	[2064599526] = 0.5,
	[536071214] = 0.5,
	[589738836] = 0.5,
	[146905321] = 0.5,
	[47332588] = 0.5,
	[-1118419705] = 0.5,
	[538002882] = -0.1,
	[-377849416] = 0.5,
	[96868307] = 0.5
}

RegisterNetEvent("target:animSentar")
AddEventHandler("target:animSentar",function()
	if not exports["player"]:blockCommands() and not exports["player"]:handCuff() then
		local ped = PlayerPedId()
		if GetEntityHealth(ped) > 101 then
			local objCoords = GetEntityCoords(innerEntity[1])

			FreezeEntityPosition(innerEntity[1],true)
			SetEntityCoords(ped,objCoords["x"],objCoords["y"],objCoords["z"] + chairs[innerEntity[2]],1,0,0,0)
			SetEntityHeading(ped,GetEntityHeading(innerEntity[1]) - 180.0)

			vRP.playAnim(false,{ task = "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER" },false)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERTARGETDISABLE
-----------------------------------------------------------------------------------------------------------------------------------------
function playerTargetDisable()
	if success or not targetActive then
		return
	end

	if targetActive then
		targetActive = false
		SendNUIMessage({ response = "closeTarget" })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SELECTTARGET
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("selectTarget",function(data,cb)
	success = false
	targetActive = false
	SetNuiFocus(false,false)
	local ped = PlayerPedId()
	SendNUIMessage({ response = "closeTarget" })

	if data["tunnel"] == "client" then
		TriggerEvent(data["event"],innerEntity)
	elseif data["tunnel"] == "paramedic" then
		TriggerServerEvent(data["event"],innerEntity[1])
	elseif data["tunnel"] == "police" then
		TriggerServerEvent(data["event"],innerEntity,data["service"])

		if data["service"] then
			SetEntityHeading(ped,innerEntity[5])
		end
	elseif data["tunnel"] == "objects" then
		TriggerServerEvent(data["event"],innerEntity[3])
	elseif data["tunnel"] == "admin" then
		TriggerServerEvent(data["event"],innerEntity[1],innerEntity[2])
	else
		TriggerServerEvent(data["event"])
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSETARGET
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("closeTarget",function(data,cb)
	success = false
	targetActive = false
	SetNuiFocus(false,false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROTATIONTODIRECTION
-----------------------------------------------------------------------------------------------------------------------------------------
function RotationToDirection(rotation)
	local adjustedRotation = {
		x = (math.pi / 180) * rotation["x"],
		y = (math.pi / 180) * rotation["y"],
		z = (math.pi / 180) * rotation["z"]
	}

	local direction = {
		x = -math.sin(adjustedRotation["z"]) * math.abs(math.cos(adjustedRotation["x"])),
		y = math.cos(adjustedRotation["z"]) * math.abs(math.cos(adjustedRotation["x"])),
		z = math.sin(adjustedRotation["x"])
	}

	return direction
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- RAYCASTGAMEPLAYCAMERA
-----------------------------------------------------------------------------------------------------------------------------------------
function RayCastGamePlayCamera(distance)
	local cameraCoord = GetGameplayCamCoord()
	local cameraRotation = GetGameplayCamRot()
	local direction = RotationToDirection(cameraRotation)

	local destination = {
		x = cameraCoord["x"] + direction["x"] * distance,
		y = cameraCoord["y"] + direction["y"] * distance,
		z = cameraCoord["z"] + direction["z"] * distance
	}

	local a,b,c,d,e = GetShapeTestResult(StartShapeTestRay(cameraCoord["x"],cameraCoord["y"],cameraCoord["z"],destination["x"],destination["y"],destination["z"],-1,PlayerPedId(),0))

	return b,c,e
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDCIRCLEZONE
-----------------------------------------------------------------------------------------------------------------------------------------
function AddCircleZone(name,center,radius,options,targetoptions)
	Zones[name] = CircleZone:Create(center,radius,options)
	Zones[name]["targetoptions"] = targetoptions
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDBOXZONE
-----------------------------------------------------------------------------------------------------------------------------------------
function AddBoxZone(name,center,length,width,options,targetoptions)
	Zones[name] = BoxZone:Create(center,length,width,options)
	Zones[name]["targetoptions"] = targetoptions
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDPOLYZONE
-----------------------------------------------------------------------------------------------------------------------------------------
function AddPolyzone(name,points,options,targetoptions)
	Zones[name] = PolyZone:Create(points,options)
	Zones[name]["targetoptions"] = targetoptions
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDTARGETMODEL
-----------------------------------------------------------------------------------------------------------------------------------------
function AddTargetModel(models,parameteres)
	for k,v in pairs(models) do
		Models[v] = parameteres
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- EXPORTS
-----------------------------------------------------------------------------------------------------------------------------------------
exports("AddBoxZone",AddBoxZone)
exports("AddPolyzone",AddPolyzone)
exports("AddCircleZone",AddCircleZone)
exports("AddTargetModel",AddTargetModel)