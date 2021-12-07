-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local itemlist = {
	["bonusDelivery"] = {
		index = "bonusDelivery",
		name = "+ Tacos",
		economy = 28,
		type = "use",
		weight = 0.5
	},
	["bonusPostOp"] = {
		index = "bonusPostOp",
		name = "+ Entregador",
		economy = 2,
		type = "use",
		weight = 0.5
	},
	["radio"] = {
		index = "radio",
		name = "Rádio",
		economy = 4.000,
		type = "use",
		weight = 1.0
	},
	["vest"] = {
		index = "vest",
		name = "Colete",
		economy = 850,
		type = "use",
		weight = 5.0
	},
	["bandage"] = {
		index = "bandage",
		name = "Bandagem",
		economy = 650,
		type = "use",
		weight = 0.5
	},
	["warfarin"] = {
		index = "warfarin",
		name = "Kit Médico",
		economy = 850,
		type = "use",
		weight = 0.5
	},
	["adrenaline"] = {
		index = "adrenaline",
		name = "Adrenalina",
		economy = 2.650,
		type = "use",
		weight = 0.6
	},
	["raceticket"] = {
		index = "raceticket",
		name = "Ticket de Corrida",
		economy = 800,
		type = "use",
		weight = 0.2
	},
	["pouch"] = {
		index = "pouch",
		name = "Malote",
		economy = 85,
		type = "use",
		weight = 0.5
	},
	["fabric"] = {
		index = "fabric",
		name = "Tecido",
		economy = 50,
		type = "use",
		weight = 0.2
	},
	["elastic"] = {
		index = "elastic",
		name = "Elástico",
		economy = 12,
		type = "use",
		weight = 0.2
	},
	["woodlog"] = {
		index = "woodlog",
		name = "Tora de Madeira",
		economy = 25,
		type = "use",
		weight = 0.5
	},
	["fishingrod"] = {
		index = "fishingrod",
		name = "Vara de Pescar",
		economy = 5.000,
		type = "use",
		weight = 3.0
	},
	["octopus"] = {
		index = "octopus",
		name = "Polvo",
		economy = 45,
		type = "use",
		weight = 0.6
	},
	["shrimp"] = {
		index = "shrimp",
		name = "Camarão",
		economy = 40,
		type = "use",
		weight = 0.4
	},
	["carp"] = {
		index = "carp",
		name = "Carpa",
		economy = 50,
		type = "use",
		weight = 0.5
	},
	["bait"] = {
		index = "bait",
		name = "Isca",
		economy = 10,
		type = "use",
		weight = 0.3
	},
	["bucket"] = {
		index = "bucket",
		name = "Balde",
		economy = 200,
		type = "use",
		weight = 1.0
	},
	["compost"] = {
		index = "compost",
		name = "Adubo",
		economy = 10,
		type = "use",
		weight = 0.3
	},
	["cannabisseed"] = {
		index = "cannabisseed",
		name = "Sementes de maconha",
		economy = 10,
		type = "use",
		weight = 0.3
	},
	["weed"] = {
		index = "weed",
		name = "Maconha",
		economy = 100,
		type = "use",
		weight = 0.3
	},
	["joint"] = {
		index = "joint",
		name = "Baseado",
		economy = 250,
		type = "use",
		weight = 0.3
	},
	["lean"] = {
		index = "lean",
		name = "Lean",
		economy = 300,
		type = "use",
		weight = 0.2
	},
	["ecstasy"] = {
		index = "ecstasy",
		name = "Ecstasy",
		economy = 250,
		type = "use",
		weight = 0.2
	},
	["cocaine"] = {
		index = "cocaine",
		name = "Cocaina",
		economy = 280,
		type = "use",
		weight = 0.2
	},
	["meth"] = {
		index = "meth",
		name = "Metanfetamina",
		economy = 380,
		type = "use",
		weight = 0.4
	},
	["methliquid"] = {
		index = "methliquid",
		name = "Meta Líquida",
		economy = 20,
		type = "use",
		weight = 0.4
	},
	["silk"] = {
		index = "silk",
		name = "Seda",
		economy = 3,
		type = "use",
		weight = 0.3
	},
	["backpackp"] = {
		index = "backpackp",
		name = "Mochila P",
		economy = 1.840,
		type = "use",
		weight = 1.0
	},
	["backpackm"] = {
		index = "backpackm",
		name = "Mochila M",
		economy = 3.680,
		type = "use",
		weight = 2.0
	},
	["backpackg"] = {
		index = "backpackg",
		name = "Mochila G",
		economy = 8.280,
		type = "use",
		weight = 3.0
	},
	["backpackx"] = {
		index = "backpackx",
		name = "Mochila X",
		economy = 16.560,
		type = "use",
		weight = 4.0
	},
	["premiumplate"] = {
		index = "premiumplate",
		name = "Placa Premium",
		economy = 25,
		type = "use",
		weight = 5.0
	},
	["energetic"] = {
		index = "energetic",
		name = "Energético",
		economy = 30,
		type = "use",
		weight = 0.5
	},
	["coffee"] = {
		index = "coffee",
		name = "Café",
		economy = 18,
		type = "use",
		weight = 0.5
	},
	["delivery"] = {
		index = "delivery",
		name = "Pacote",
		economy = 0,
		type = "use",
		weight = 2.5
	},
	["paperbag"] = {
		index = "paperbag",
		name = "Saco de Papel",
		economy = 20,
		type = "use",
		weight = 3.0
	},
	["water"] = {
		index = "water",
		name = "Água",
		economy = 70,
		limit = 4,
		type = "use",
		weight = 0.4
	},
	["dirtywater"] = {
		index = "dirtywater",
		name = "Água Suja",
		economy = 50,
		type = "use",
		weight = 0.3
	},
	["emptybottle"] = {
		index = "emptybottle",
		name = "Garrafa Vazia",
		economy = 12,
		type = "use",
		weight = 0.2
	},
	["cola"] = {
		index = "cola",
		name = "Cola",
		economy = 15,
		type = "use",
		weight = 0.3
	},
	["tacos"] = {
		index = "tacos",
		name = "Tacos",
		economy = 28,
		type = "use",
		weight = 0.5
	},
	["fries"] = {
		index = "fries",
		name = "Fritas",
		economy = 10,
		type = "use",
		weight = 0.3
	},
	["soda"] = {
		index = "soda",
		name = "Soda",
		economy = 15,
		type = "use",
		weight = 0.3
	},
	["hamburger"] = {
		index = "hamburger",
		name = "Hamburger",
		economy = 30,
		type = "use",
		weight = 0.5
	},
	["hotdog"] = {
		index = "hotdog",
		name = "Cachorro-Quente",
		economy = 14,
		type = "use",
		weight = 0.3
	},
	["donut"] = {
		index = "donut",
		name = "Rosquinha",
		economy = 10,
		type = "use",
		weight = 0.2
	},
	["plate"] = {
		index = "plate",
		name = "Placa",
		economy = 5.000,
		type = "use",
		weight = 5.0
	},
	["lockpick"] = {
		index = "lockpick",
		name = "Lockpick",
		economy = 600,
		type = "use",
		weight = 5.0
	},
	["toolbox"] = {
		index = "toolbox",
		name = "Caixa de Ferramentas",
		economy = 700,
		type = "use",
		weight = 5.0
	},
	["postit"] = {
		index = "postit",
		name = "Bloco de Notas",
		economy = 20,
		type = "use",
		weight = 0.1
	},
	["tires"] = {
		index = "tires",
		name = "Pneus",
		economy = 300,
		type = "use",
		weight = 2.0
	},
	["cellphone"] = {
		index = "cellphone",
		name = "Telefone",
		economy = 200,
		type = "use",
		weight = 1.0
	},
	["divingsuit"] = {
		index = "divingsuit",
		name = "Roupa de Mergulho",
		economy = 5.000,
		type = "use",
		weight = 5.0
	},
	["handcuff"] = {
		index = "handcuff",
		name = "Algemas",
		economy = 5.000,
		type = "use",
		weight = 0.75
	},
	["rope"] = {
		index = "rope",
		name = "Cordas",
		economy = 3.000,
		type = "use",
		weight = 1.5
	},
	["skate"] = {
		index = "skate",
		name = "Skate",
		type = "use",
		economy = 100000,
		weight = 1.25
	},
	["rolamento"] = {
		index = "rolamento",
		name = "Rolamento de Skate",
		type = "use",
		economy = 100000,
		weight = 1.25
	},
	["shape"] = {
		index = "shape",
		name = "Shape de Skate",
		type = "use",
		economy = 100000,
		weight = 1.25
	},
	["truck"] = {
		index = "truck",
		name = "truck e rodas de Skate",
		type = "use",
		economy = 100000,
		weight = 1.25
	},
	["hood"] = {
		index = "hood",
		name = "Capuz",
		economy = 3.000,
		type = "use",
		weight = 1.5
	},
	["plastic"] = {
		index = "plastic",
		name = "Plástico",
		economy = 25,
		type = "use",
		weight = 0.05
	},
	["glassbottle"] = {
		index = "glassbottle",
		name = "Garrafa de Vidro",
		economy = 12,
		type = "use",
		weight = 0.05
	},
	["metalcan"] = {
		index = "metalcan",
		name = "Lata de Metal",
		economy = 15,
		type = "use",
		weight = 0.05
	},
	["battery"] = {
		index = "battery",
		name = "Pilhas",
		economy = 15,
		type = "use",
		weight = 0.05
	},
	["glass"] = {
		index = "glass",
		name = "Vidro",
		economy = 25,
		type = "use",
		weight = 0.1
	},
	["rubber"] = {
		index = "rubber",
		name = "Borracha",
		economy = 25,
		type = "use",
		weight = 0.05
	},
	["aluminum"] = {
		index = "aluminum",
		name = "Alúminio",
		economy = 30,
		type = "use",
		weight = 0.05
	},
	["copper"] = {
		index = "copper",
		name = "Cobre",
		economy = 30,
		type = "use",
		weight = 0.05
	},
	["eletronics"] = {
		index = "eletronics",
		name = "Eletrônico",
		economy = 30,
		type = "use",
		weight = 0.01
	},
	["notebook"] = {
		index = "notebook",
		name = "Notebook",
		economy = 2.500,
		type = "use",
		weight = 2.0
	},
	["keyboard"] = {
		index = "keyboard",
		name = "Teclado",
		economy = 255,
		type = "use",
		weight = 0.4
	},
	["mouse"] = {
		index = "mouse",
		name = "Mouse",
		economy = 300,
		type = "use",
		weight = 0.2
	},
	["ring"] = {
		index = "ring",
		name = "Anel",
		economy = 650,
		type = "use",
		weight = 0.1
	},
	["watch"] = {
		index = "watch",
		name = "Relógio",
		economy = 425,
		type = "use",
		weight = 0.3
	},
	["c4"] = {
		index = "c4",
		name = "C4",
		economy = 500,
		type = "use",
		weight = 3.0
	},
	["ritmoneury"] = {
		index = "ritmoneury",
		name = "Ritmoneury",
		economy = 1.750,
		type = "use",
		weight = 0.3
	},
	["sinkalmy"] = {
		index = "sinkalmy",
		name = "Sinkalmy",
		economy = 1.000,
		type = "use",
		weight = 0.3
	},
	["cigarette"] = {
		index = "cigarette",
		name = "Cigarro",
		economy = 10,
		type = "use",
		weight = 0.1
	},
	["lighter"] = {
		index = "lighter",
		name = "Isqueiro",
		economy = 175,
		type = "use",
		weight = 0.3
	},
	["vape"] = {
		index = "vape",
		name = "Vape",
		economy = 5.000,
		type = "use",
		weight = 0.8
	},
	["dollars"] = {
		index = "dollars",
		name = "Dólares",
		economy = 1,
		type = "use",
		weight = 0.0002
	},
	["dollars2"] = {
		index = "dollars2",
		name = "Rolo de Dólares",
		economy = 1,
		type = "use",
		weight = 0.0002
	},
	["blackcard"] = {
		index = "blackcard",
		name = "Cartão Preto",
		economy = 100,
		type = "use",
		weight = 0.1
	},
	["bluecard"] = {
		index = "bluecard",
		name = "Cartão Azul",
		economy = 50,
		type = "use",
		weight = 0.1
	},
	["chocolate"] = {
		index = "chocolate",
		name = "Chocolate",
		economy = 10,
		type = "use",
		weight = 0.2
	},
	["sandwich"] = {
		index = "sandwich",
		name = "Sanduiche",
		economy = 15,
		type = "use",
		weight = 0.2
	},
	["rose"] = {
		index = "rose",
		name = "Rosa",
		economy = 50,
		type = "use",
		weight = 0.1
	},
	["teddy"] = {
		index = "teddy",
		name = "Teddy",
		economy = 250,
		type = "use",
		weight = 0.8
	},
	["absolut"] = {
		index = "absolut",
		name = "Absolut",
		economy = 15,
		type = "use",
		weight = 0.2
	},
	["chandon"] = {
		index = "chandon",
		name = "Chandon",
		economy = 15,
		type = "use",
		weight = 0.2
	},
	["dewars"] = {
		index = "dewars",
		name = "Dewars",
		economy = 15,
		type = "use",
		weight = 0.2
	},
	["hennessy"] = {
		index = "hennessy",
		name = "Hennessy",
		economy = 16,
		type = "use",
		weight = 0.2
	},
	["identity"] = {
		index = "identity",
		name = "Identidade",
		economy = 350,
		type = "use",
		weight = 0.2
	},
	["goldbar"] = {
		index = "goldbar",
		name = "Barra de Ouro",
		economy = 650,
		type = "use",
		weight = 1.0
	},
	["binoculars"] = {
		index = "binoculars",
		name = "Binóculos",
		economy = 600,
		type = "use",
		weight = 1.0
	},
	["camera"] = {
		index = "camera",
		name = "Câmera",
		economy = 2.000,
		type = "use",
		weight = 2.5
	},
	["playstation"] = {
		index = "playstation",
		name = "Playstation",
		economy = 500,
		type = "use",
		weight = 2.0
	},
	["xbox"] = {
		index = "xbox",
		name = "Xbox",
		economy = 500,
		type = "use",
		weight = 2.0
	},
	["legos"] = {
		index = "legos",
		name = "Legos",
		economy = 250,
		type = "use",
		weight = 0.1
	},
	["ominitrix"] = {
		index = "ominitrix",
		name = "Ominitrix",
		economy = 425,
		type = "use",
		weight = 0.5
	},
	["bracelet"] = {
		index = "bracelet",
		name = "Bracelete",
		economy = 600,
		type = "use",
		weight = 0.2
	},
	["dildo"] = {
		index = "dildo",
		name = "Vibrador",
		economy = 450,
		type = "use",
		weight = 0.3
	},
	["WEAPON_KNIFE"] = {
		index = "knife",
		name = "Faca",
		economy = 660,
		type = "equip",
		weight = 0.50
	},
	["WEAPON_HATCHET"] = {
		index = "hatchet",
		name = "Machado",
		economy = 975,
		type = "equip",
		weight = 0.75
	},
	["WEAPON_BAT"] = {
		index = "bat",
		name = "Bastão de Beisebol",
		economy = 975,
		type = "equip",
		weight = 0.75
	},
	["WEAPON_BATTLEAXE"] = {
		index = "battleaxe",
		name = "Machado de Batalha",
		economy = 975,
		type = "equip",
		weight = 0.75
	},
	["WEAPON_BOTTLE"] = {
		index = "bottle",
		name = "Garrafa",
		economy = 600,
		type = "equip",
		weight = 0.75
	},
	["WEAPON_CROWBAR"] = {
		index = "crowbar",
		name = "Pé de Cabra",
		economy = 780,
		type = "equip",
		weight = 0.75
	},
	["WEAPON_DAGGER"] = {
		index = "dagger",
		name = "Adaga",
		economy = 880,
		type = "equip",
		weight = 0.50
	},
	["WEAPON_GOLFCLUB"] = {
		index = "golfclub",
		name = "Taco de Golf",
		economy = 975,
		type = "equip",
		weight = 0.75
	},
	["WEAPON_HAMMER"] = {
		index = "hammer",
		name = "Martelo",
		economy = 725,
		type = "equip",
		weight = 0.75
	},
	["WEAPON_MACHETE"] = {
		index = "machete",
		name = "Facão",
		economy = 975,
		type = "equip",
		weight = 0.75
	},
	["WEAPON_POOLCUE"] = {
		index = "poolcue",
		name = "Taco de Sinuca",
		economy = 975,
		type = "equip",
		weight = 0.75
	},
	["WEAPON_STONE_HATCHET"] = {
		index = "stonehatchet",
		name = "Machado de Pedra",
		economy = 975,
		type = "equip",
		weight = 0.75
	},
	["WEAPON_SWITCHBLADE"] = {
		index = "switchblade",
		name = "Canivete",
		economy = 1.000,
		type = "equip",
		weight = 0.50
	},
	["WEAPON_WRENCH"] = {
		index = "wrench",
		name = "Chave Inglesa",
		economy = 970,
		type = "equip",
		weight = 0.75
	},
	["WEAPON_KNUCKLE"] = {
		index = "knuckle",
		name = "Soco Inglês",
		economy = 975,
		type = "equip",
		weight = 0.50
	},
	["WEAPON_FLASHLIGHT"] = {
		index = "flashlight",
		name = "Lanterna",
		economy = 675,
		type = "equip",
		weight = 0.50
	},
	["WEAPON_NIGHTSTICK"] = {
		index = "nightstick",
		name = "Cassetete",
		economy = 975,
		type = "equip",
		weight = 0.75
	},
	["WEAPON_PISTOL"] = {
		index = "m1911",
		name = "M1911",
		economy = 33.250,
		type = "equip",
		ammo = "WEAPON_PISTOL_AMMO",
		weight = 1.25
	},
	["WEAPON_PISTOL_MK2"] = {
		index = "fiveseven",
		name = "FN Five Seven",
		economy = 50.000,
		type = "equip",
		ammo = "WEAPON_PISTOL_AMMO",
		weight = 1.50
	},
	["WEAPON_COMPACTRIFLE"] = {
		index = "akcompact",
		name = "AK Compact",
		economy = 80.000,
		type = "equip",
		ammo = "WEAPON_SMG_AMMO",
		weight = 2.25
	},
	["WEAPON_APPISTOL"] = {
		index = "kochvp9",
		name = "Koch Vp9",
		economy = 85.000,
		type = "equip",
		ammo = "WEAPON_PISTOL_AMMO",
		weight = 1.25
	},
	["WEAPON_HEAVYPISTOL"] = {
		index = "atifx45",
		name = "Ati FX45",
		economy = 80.000,
		type = "equip",
		ammo = "WEAPON_PISTOL_AMMO",
		weight = 1.50
	},
	["WEAPON_MACHINEPISTOL"] = {
		index = "tec9",
		name = "Tec-9",
		economy = 90.000,
		type = "equip",
		ammo = "WEAPON_SMG_AMMO",
		weight = 1.75
	},
	["WEAPON_MICROSMG"] = {
		index = "uzi",
		name = "Uzi",
		economy = 95.000,
		type = "equip",
		ammo = "WEAPON_SMG_AMMO",
		weight = 1.25
	},
	["WEAPON_MINISMG"] = {
		index = "skorpionv61",
		name = "Skorpion V61",
		economy = 93.500,
		type = "equip",
		ammo = "WEAPON_SMG_AMMO",
		weight = 1.75
	},
	["WEAPON_SNSPISTOL"] = {
		index = "amt380",
		name = "AMT 380",
		economy = 53.000,
		type = "equip",
		ammo = "WEAPON_PISTOL_AMMO",
		weight = 1.0
	},
	["WEAPON_SNSPISTOL_MK2"] = {
		index = "hkp7m10",
		name = "HK P7M10",
		economy = 56.000,
		type = "equip",
		ammo = "WEAPON_PISTOL_AMMO",
		weight = 1.0
	},
	["WEAPON_VINTAGEPISTOL"] = {
		index = "m1922",
		name = "M1922",
		economy = 50.000,
		type = "equip",
		ammo = "WEAPON_PISTOL_AMMO",
		weight = 1.0
	},
	["WEAPON_PISTOL50"] = {
		index = "desert",
		name = "Desert Eagle",
		economy = 83.250,
		type = "equip",
		ammo = "WEAPON_PISTOL_AMMO",
		weight = 1.50
	},
	["WEAPON_REVOLVER"] = {
		index = "magnum",
		name = "Magnum 44",
		economy = 90.100,
		type = "equip",
		ammo = "WEAPON_PISTOL_AMMO",
		weight = 1.50
	},
	["WEAPON_COMBATPISTOL"] = {
		index = "glock",
		name = "Glock",
		economy = 80.550,
		type = "equip",
		ammo = "WEAPON_PISTOL_AMMO",
		weight = 1.0
	},
	["WEAPON_CARBINERIFLE"] = {
		index = "m4a1",
		name = "M4A1",
		economy = 110.900,
		type = "equip",
		ammo = "WEAPON_RIFLE_AMMO",
		weight = 8.0
	},
	["WEAPON_PUMPSHOTGUN"] = {
		index = "remington",
		name = "Remington",
		economy = 100.000,
		type = "equip",
		ammo = "WEAPON_SHOTGUN_AMMO",
		weight = 6.0
	},
	["WEAPON_SAWNOFFSHOTGUN"] = {
		index = "mossberg590",
		name = "Mossberg 590",
		economy = 105.000,
		type = "equip",
		ammo = "WEAPON_SHOTGUN_AMMO",
		weight = 6.0
	},
	["WEAPON_SMG"] = {
		index = "mp5",
		name = "MP5",
		economy = 98.550,
		type = "equip",
		ammo = "WEAPON_SMG_AMMO",
		weight = 4.0
	},
	["WEAPON_ASSAULTRIFLE"] = {
		index = "ak103",
		name = "AK-103",
		economy = 115.000,
		type = "equip",
		ammo = "WEAPON_RIFLE_AMMO",
		weight = 8.0
	},
	["WEAPON_ASSAULTRIFLE_MK2"] = {
		index = "ak74",
		name = "AK-74",
		economy = 120.000,
		type = "equip",
		ammo = "WEAPON_RIFLE_AMMO",
		weight = 8.0
	},
	["WEAPON_SPECIALCARBINE"] = {
		index = "g36c",
		name = "G-36C",
		economy = 125.350,
		type = "equip",
		ammo = "WEAPON_RIFLE_AMMO",
		weight = 8.0
	},
	["WEAPON_ASSAULTSMG"] = {
		index = "mtar21",
		name = "MTAR-21",
		economy = 99.350,
		type = "equip",
		ammo = "WEAPON_SMG_AMMO",
		weight = 5.0
	},
	["WEAPON_GUSENBERG"] = {
		index = "thompson",
		name = "Thompson",
		economy = 92.000,
		type = "equip",
		ammo = "WEAPON_SMG_AMMO",
		weight = 6.0
	},
	["WEAPON_PETROLCAN"] = {
		index = "gallon",
		name = "Galão",
		economy = 250,
		type = "equip",
		ammo = "WEAPON_PETROLCAN_AMMO",
		weight = 1.25
	},
	["GADGET_PARACHUTE"] = {
		index = "parachute",
		name = "Paraquedas",
		economy = 980,
		type = "use",
		weight = 2.25
	},
	["WEAPON_STUNGUN"] = {
		index = "stungun",
		name = "Tazer",
		economy = 200,
		type = "equip",
		weight = 0.75
	},
	["WEAPON_FIREEXTINGUISHER"] = {
		index = "extinguisher",
		name = "Extintor",
		economy = 680,
		type = "equip",
		weight = 2.25
	},
	["WEAPON_PISTOL_AMMO"] = {
		index = "pistolammo",
		name = "M. Pistola",
		economy = 33,
		type = "recharge",
		weight = 0.02
	},
	["WEAPON_SMG_AMMO"] = {
		index = "smgammo",
		name = "M. Sub Metralhadora",
		economy = 45,
		type = "recharge",
		weight = 0.03
	},
	["WEAPON_RIFLE_AMMO"] = {
		index = "rifleammo",
		name = "M. Rifle",
		economy = 55,
		type = "recharge",
		weight = 0.04
	},
	["WEAPON_SHOTGUN_AMMO"] = {
		index = "shotgunammo",
		name = "M. Escopeta",
		economy = 42,
		type = "recharge",
		weight = 0.05
	},
	["WEAPON_PETROLCAN_AMMO"] = {
		index = "fuel",
		name = "Combustível",
		economy = 22,
		type = "recharge",
		weight = 0.001
	},
	["pager"] = {
		index = "pager",
		name = "Pager",
		economy = 3.000,
		type = "use",
		weight = 1.0
	},
	["firecracker"] = {
		index = "firecracker",
		name = "Fogos de Artificio",
		economy = 60,
		type = "use",
		weight = 2.0
	},
	["analgesic"] = {
		index = "analgesic",
		name = "Analgésico",
		economy = 50,
		type = "use",
		weight = 0.20
	},
	["gauze"] = {
		index = "gauze",
		name = "Gaze",
		economy = 500,
		type = "use",
		weight = 0.20
	},
	["gsrkit"] = {
		index = "gsrkit",
		name = "Kit Residual",
		economy = 200,
		type = "use",
		weight = 0.75
	},
	["gdtkit"] = {
		index = "gdtkit",
		name = "Kit Químico",
		economy = 200,
		type = "use",
		weight = 0.75
	},
	["fueltech"] = {
		index = "fueltech",
		name = "Fueltech",
		economy = 600,
		type = "use",
		weight = 3.00
	},
	["cpuchip"] = {
		index = "cpuchip",
		name = "Processador",
		economy = 90,
		type = "use",
		weight = 0.75
	},
	["premium01"] = {
		index = "premium01",
		name = "Premium 30D",
		type = "use",
		weight = 0.0
	},
	["casino_token"] = {
		index = "casino_token",
		name = "Ficha",
		type = "use",
		weight = 0.0
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- GENERATE:ADVTOOLBOX
-----------------------------------------------------------------------------------------------------------------------------------------
for i = 1,99 do
	itemlist["toolboxes"..i] = {
		index = "toolbox",
		name = "+ Caixa de Ferramentas",
		economy = 700,
		type = "use",
		weight = 5.0
	}
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMBODYLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemBodyList(item)
	if itemlist[item] then
		return itemlist[item]
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMINDEXLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemIndexList(item)
	if itemlist[item] then
		return itemlist[item].index
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMNAMELIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemNameList(item)
	if itemlist[item] then
		return itemlist[item].name
	end
	return "Deleted"
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMTYPELIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemTypeList(item)
	if itemlist[item] then
		return itemlist[item].type
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMAMMOLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemAmmoList(item)
	if itemlist[item] then
		return itemlist[item].ammo
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMWEIGHTLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemWeightList(item)
	if itemlist[item] then
		return itemlist[item].weight
	end
	return 0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMECONOMYLIST
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemEconomyList(item)
	if itemlist[item] then
		return itemlist[item].economy
	end
	return 0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMLIMIT
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.itemLimit(item)
	if itemlist[item] then
		if itemlist[item].limit ~= nil then
			return itemlist[item].limit
		end
		return 999999999
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- COMPUTEINVWEIGHT
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.computeInvWeight(user_id)
	local weight = 0
	local inventory = vRP.getInventory(user_id)
	if inventory then
		for k,v in pairs(inventory) do
			if vRP.itemBodyList(v.item) then
				weight = weight + vRP.itemWeightList(v.item) * parseInt(v.amount)
			end
		end
		return weight
	end
	return 0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- COMPUTECHESTWEIGHT
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.computeChestWeight(items)
	local weight = 0
	for k,v in pairs(items) do
		if vRP.itemBodyList(k) then
			weight = weight + vRP.itemWeightList(k) * parseInt(v.amount)
		end
	end
	return weight
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETINVENTORYITEMAMOUNT
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.getInventoryItemAmount(user_id,idname)
	local data = vRP.getInventory(user_id)
	if data then
		for k,v in pairs(data) do
			if v.item == idname then
				return parseInt(v.amount)
			end
		end
	end
	return 0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SWAPSLOT
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.swapSlot(user_id,slot,target)
	local data = vRP.getInventory(user_id)
	if data then
		local temp = data[tostring(slot)]
		data[tostring(slot)] = data[tostring(target)]
		data[tostring(target)] = temp
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GIVEINVENTORYITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.giveInventoryItem(user_id,idname,amount,notify,slot)
	local source = vRP.getUserSource(user_id)
	local data = vRP.getInventory(user_id)
	local identity = vRP.getUserIdentity(user_id)
	if data and parseInt(amount) > 0 then
		local amountItem = vRP.getInventoryItemAmount(user_id,idname)
		local itemLimit = vRP.itemLimit(idname) 
		if not slot then
			--print(itemLimit)
			if amount < itemLimit then
				local initial = 0
				repeat
					initial = initial + 1
				until data[tostring(initial)] == nil or (data[tostring(initial)] and data[tostring(initial)].item == idname)
				initial = tostring(initial)
				
				if data[initial] == nil then
					data[initial] = { item = idname, amount = parseInt(amount) }
				elseif data[initial] and data[initial].item == idname then
					data[initial].amount = parseInt(data[initial].amount) + parseInt(amount)
				end
				if notify and vRP.itemBodyList(idname) then
					TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),{ "RECEBEU",vRP.itemIndexList(idname),vRP.format(parseInt(amount)),vRP.itemNameList(idname) })
				end
				return true
			else
				TriggerClientEvent("Notify",source,"amarelo","Quantidade maxima atingida!!!",2500)
				return falsed
			end
		else
			if amountItem < itemLimit then
				slot = tostring(slot)
				if data[slot] then
					if data[slot].item == idname then
						local oldAmount = parseInt(data[slot].amount)
						data[slot] = { item = idname, amount = parseInt(oldAmount) + parseInt(amount) }
					end
				else
					data[slot] = { item = idname, amount = parseInt(amount) }
				end
				if notify and vRP.itemBodyList(idname) then
					TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),{ "RECEBEU",vRP.itemIndexList(idname),vRP.format(parseInt(amount)),vRP.itemNameList(idname) })
				end
				return true
			else 
				TriggerClientEvent("Notify",source,"amarelo","Quantidade maxima atingida!!!",2500)
				return false
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYGETINVENTORYITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.tryGetInventoryItem(user_id,idname,amount,notify,slot)
	local data = vRP.getInventory(user_id)
	local identity = vRP.getUserIdentity(user_id)
	if data then
		if not slot then
			for k,v in pairs(data) do
				if v.item == idname and parseInt(v.amount) >= parseInt(amount) then
					v.amount = parseInt(v.amount) - parseInt(amount)

					if parseInt(v.amount) <= 0 then
						data[k] = nil
					end

					if notify and vRP.itemBodyList(idname) then
						TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),{ "REMOVEU",vRP.itemIndexList(idname),vRP.format(parseInt(amount)),vRP.itemNameList(idname) })
					end
					return true
				end
			end
		else
			local slot  = tostring(slot)

			if data[slot] and data[slot].item == idname and parseInt(data[slot].amount) >= parseInt(amount) then
				data[slot].amount = parseInt(data[slot].amount) - parseInt(amount)

				if parseInt(data[slot].amount) <= 0 then
					data[slot] = nil
				end

				if notify and vRP.itemBodyList(idname) then
					TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),{ "REMOVEU",vRP.itemIndexList(idname),vRP.format(parseInt(amount)),vRP.itemNameList(idname) })
				end
				return true
			end
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVEINVENTORYITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.removeInventoryItem(user_id,idname,amount,notify)
	local data = vRP.getInventory(user_id)
	if data then
		for k,v in pairs(data) do
			if v.item == idname and parseInt(v.amount) >= parseInt(amount) then
				v.amount = parseInt(v.amount) - parseInt(amount)

				if parseInt(v.amount) <= 0 then
					data[k] = nil
				end

				if notify and vRP.itemBodyList(idname) then
					TriggerClientEvent("itensNotify",vRP.getUserSource(user_id),{ "REMOVEU",vRP.itemIndexList(idname),vRP.format(parseInt(amount)),vRP.itemNameList(idname) })
				end

				break
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ACTIVED
-----------------------------------------------------------------------------------------------------------------------------------------
local actived = {}
local activedAmount = {}
Citizen.CreateThread(function()
	while true do
		for k,v in pairs(actived) do
			if actived[k] > 0 then
				actived[k] = v - 1
				if actived[k] <= 0 then
					actived[k] = nil
				end
			end
		end
		Citizen.Wait(100)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARLOGS
-----------------------------------------------------------------------------------------------------------------------------------------
local policeLogs = ""
local familiesLogs = ""
local nangLogs = ""
local ballasLogs = ""
local vagosLogs = ""
local triadLogs = ""
local aztecasLogs = ""
local bloodsLogs = ""
local mechanicLogs = ""
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYCHESTITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.tryChestItem(user_id,chestData,itemName,amount,slot)
	if actived[user_id] == nil then
		actived[user_id] = 1
		local data = vRP.getSData(chestData)
		local items = json.decode(data) or {}
		local identity = vRP.getUserIdentity(user_id)
		if data and items ~= nil then
			if items[itemName] ~= nil and parseInt(items[itemName].amount) >= parseInt(amount) then
			
				if parseInt(amount) > 0 then
					activedAmount[user_id] = parseInt(amount)
				else
					activedAmount[user_id] = parseInt(items[itemName].amount)
				end
				local new_weight = vRP.computeInvWeight(user_id) + vRP.itemWeightList(itemName) * parseInt(activedAmount[user_id])
				if new_weight <= vRP.getBackpack(user_id) then
					local amountItem = vRP.getInventoryItemAmount(user_id,itemName)
					local itemLimit = vRP.itemLimit(itemName) 
					if amountItem < itemLimit then
						vRP.giveInventoryItem(user_id,itemName,parseInt(activedAmount[user_id]),true,slot)
						items[itemName].amount = parseInt(items[itemName].amount) - parseInt(activedAmount[user_id])
						if chestData == "chest:Police" then
							creativelogs(policeLogs,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[RETIROU]: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
						end
						if chestData == "chest:Families" then
							creativelogs(familiesLogs,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[RETIROU]: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
						end
						if chestData == "chest:Nang" then
							creativelogs(nangLogs,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[RETIROU]: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
						end
						if chestData == "chest:Ballas" then
							creativelogs(ballasLogs,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[RETIROU]: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
						end
						if chestData == "chest:Vagos" then
							creativelogs(vagosLogs,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[RETIROU]: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
						end
						if chestData == "chest:Triad" then
							creativelogs(triadLogs,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[RETIROU]: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
						end
						if chestData == "chest:Aztecas" then
							creativelogs(aztecasLogs,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[RETIROU]: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
						end
						if chestData == "chest:Bloods" then
							creativelogs(bloodsLogs,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[RETIROU]: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
						end
						if chestData == "chest:Mechanic" then
							creativelogs(mechanicLogs,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[RETIROU]: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
						end
						if parseInt(items[itemName].amount) <= 0 then
							items[itemName] = nil
						end
						vRP.setSData(chestData,json.encode(items))
						return true
					end
					return false 
				end
				return false 
			end
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- STORECHESTITEM
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.storeChestItem(user_id,chestData,itemName,amount,chestWeight,slot)
	if actived[user_id] == nil then
		actived[user_id] = 1
		local slot = tostring(slot)
		local data = vRP.getSData(chestData)
		local items = json.decode(data) or {}
		local identity = vRP.getUserIdentity(user_id)
		if data and items ~= nil then

			if parseInt(amount) > 0 then
				activedAmount[user_id] = parseInt(amount)
			else
				local inv = vRP.getInventory(user_id)
				if inv[slot] then
					activedAmount[user_id] = parseInt(inv[slot].amount)
				end
			end

			local new_weight = vRP.computeChestWeight(items) + vRP.itemWeightList(itemName) * parseInt(activedAmount[user_id])
			if new_weight <= chestWeight then
				if vRP.tryGetInventoryItem(user_id,itemName,parseInt(activedAmount[user_id]),true,slot) then
					if items[itemName] ~= nil then
						items[itemName].amount = parseInt(items[itemName].amount) + parseInt(activedAmount[user_id])
					else
						items[itemName] = { amount = parseInt(activedAmount[user_id]) }
					end

					if chestData == "chest:Police" then
						creativelogs(policeLogs,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[GUARDOU]: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
					end

					if chestData == "chest:Families" then
						creativelogs(familiesLogs,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[GUARDOU]: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
					end

					if chestData == "chest:Nang" then
						creativelogs(nangLogs,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[GUARDOU]: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
					end

					if chestData == "chest:Ballas" then
						creativelogs(ballasLogs,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[GUARDOU]: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
					end

					if chestData == "chest:Vagos" then
						creativelogs(vagosLogs,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[GUARDOU]: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
					end

					if chestData == "chest:Triad" then
						creativelogs(triadLogs,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[GUARDOU]: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
					end

					if chestData == "chest:Aztecas" then
						creativelogs(aztecasLogs,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[GUARDOU]: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
					end

					if chestData == "chest:Bloods" then
						creativelogs(bloodsLogs,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[GUARDOU]: "..vRP.format(parseInt(activedAmount[user_id])).."x "..vRP.itemNameList(itemName).." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
					end

					vRP.setSData(chestData,json.encode(items))
					return true
				end
			end
		end
	end
	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- creativeLOGS
-----------------------------------------------------------------------------------------------------------------------------------------
function creativelogs(webhook,message)
	if webhook ~= "" then
		PerformHttpRequest(webhook,function(err,text,headers) end,"POST",json.encode({ content = message }),{ ['Content-Type'] = "application/json" })
	end
end