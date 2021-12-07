-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("dynamic",cRP)
vPLAYER = Tunnel.getInterface("player")
vTASKBAR = Tunnel.getInterface("taskbar")
vSKINSHOP = Tunnel.getInterface("skinshop")
vHOMES = Tunnel.getInterface("homes")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local animal = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANIMAREGISTER
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.animalRegister(netId)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        animal[user_id] = netId
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANIMACLEANER
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.animalCleaner()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        TriggerClientEvent("player:deleteObject",-1,animal[user_id])
        animal[user_id] = nil
    end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERLEAVE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerLeave",function(user_id,source)
    if animal[user_id] then
        TriggerClientEvent("player:deleteObject",-1,animal[user_id])
        animal[user_id] = nil
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GIVEANIMAL
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.giveAnimal(animal)
	local source = source
    local user_id = vRP.getUserId(source)
	if user_id then
		vRP.giveInventoryItem(user_id,animal:lower(),1,true)
	end
end


-----------------------------------------------------------------------------------------------------------------------------------------
-- PRESET
-----------------------------------------------------------------------------------------------------------------------------------------
local preset = {
	["Police"] = {
		["1"] = {
			["homem"] = {
				["hat"] = { item = 12, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 138, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 25, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 187, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 382, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 152, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 20, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			},
			["mulher"] = {
				["hat"] = { item = 12, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 145, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 25, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 227, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 400, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 121, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 20, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			}
		},
		["2"] = {
			["homem"] = {
				["hat"] = { item = 12, texture = 1, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 138, texture = 2, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 25, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 187, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 382, texture = 6, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 152, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 20, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			},
			["mulher"] = {
				["hat"] = { item = 12, texture = 1, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 145, texture = 2, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 25, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 227, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 400, texture = 6, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 121, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 20, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			}
		},
		["3"] = {
			["homem"] = {
				["hat"] = { item = 12, texture = 2, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 138, texture = 3, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 25, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 187, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 382, texture = 9, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 152, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 20, texture = 1, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			},
			["mulher"] = {
				["hat"] = { item = 12, texture = 2, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 145, texture = 3, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 25, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 227, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 400, texture = 9, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 121, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 20, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			}
		},
		["4"] = {
			["homem"] = {
				["hat"] = { item = 10, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 138, texture = 1, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 25, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 187, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 382, texture = 3, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 152, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 20, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			},
			["mulher"] = {
				["hat"] = { item = 10, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 145, texture = 1, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 25, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 227, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 400, texture = 3, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 121, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 20, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			}
		},
		["5"] = {
			["homem"] = {
				["hat"] = { item = 10, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 138, texture = 1, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 56, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 25, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = -1, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 383, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 152, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 20, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			},
			["mulher"] = {
				["hat"] = { item = 10, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 145, texture = 1, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 56, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 25, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = -1, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 401, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 121, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 20, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			}
		}
	},
	["Paramedic"] = {
		["1"] = {
			["homem"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 20, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 1, texture = 1, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 96, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 32, texture = 7, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 126, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 79, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			},
			["mulher"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 23, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 7, texture = 3, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 101, texture = 1, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 58, texture = 7, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 96, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 91, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			}
		},
		["2"] = {
			["homem"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 138, texture = 1, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 57, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 25, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 94, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 249, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 127, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 86, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			},
			["mulher"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 133, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 25, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 101, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 257, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 97, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 101, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			}
		},
		["3"] = {
			["homem"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 20, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 1, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 15, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 146, texture = 8, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 127, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 85, texture = 1, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			},
			["mulher"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 23, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 1, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = -1, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 141, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 97, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 109, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			}
		},
		["4"] = {
			["homem"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 138, texture = 1, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 25, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 129, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 385, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 126, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 83, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			},
			["mulher"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 145, texture = 1, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 25, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 226, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 402, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 88, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			}
		},
		["5"] = {
			["homem"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 94, texture = 2, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 67, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = 15, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 243, texture = 2, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 86, texture = 1, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			},
			["mulher"] = {
				["hat"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["pants"] = { item = 97, texture = 2, defaultItem = 0, defaultTexture = 0 },
				["vest"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["bracelet"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["decals"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["mask"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["shoes"] = { item = 70, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["t-shirt"] = { item = -1, texture = 0, defaultItem = 1, defaultTexture = 0 },
				["bag"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["torso2"] = { item = 251, texture = 2, defaultItem = 0, defaultTexture = 0 },
				["accessory"] = { item = -1, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["watch"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 },
				["arms"] = { item = 88, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["glass"] = { item = 0, texture = 0, defaultItem = 0, defaultTexture = 0 },
				["ear"] = { item = -1, texture = 0, defaultItem = -1, defaultTexture = 0 }
			}
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- PRESET
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("emergency:presetFunctions")
AddEventHandler("emergency:presetFunctions",function(number)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if not vRP.wantedReturn(user_id) and not vRP.reposeReturn(user_id) then
				if vRPclient.getHealth(source) > 101 and not vPLAYER.getHandcuff(source) then
					local model = vRPclient.getModelPlayer(source)
				if vRP.hasPermission(user_id,"Paramedic") and preset["Paramedic"][number] then
					if model == "mp_m_freemode_01" then
						TriggerClientEvent("updateRoupas",source,preset["Paramedic"][number]["homem"])
					elseif model == "mp_f_freemode_01" then
						TriggerClientEvent("updateRoupas",source,preset["Paramedic"][number]["mulher"])
					end
				elseif vRP.hasPermission(user_id,"Police") and preset["Police"][number] then
					if model == "mp_m_freemode_01" then
						TriggerClientEvent("updateRoupas",source,preset["Police"][number]["homem"])
					elseif model == "mp_f_freemode_01" then
						TriggerClientEvent("updateRoupas",source,preset["Police"][number]["mulher"])
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CARREGAR PELOS OMBROS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("emergency:carrya")
AddEventHandler("emergency:carrya",function()
    local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Police") or vRP.hasPermission(user_id,"Paramedic") then
			if vRPclient.getHealth(source) > 101 and not vPLAYER.getHandcuff(source) then
				local nplayer = vRPclient.nearestPlayer(source,2)
				if nplayer then
					TriggerClientEvent("rope:toggleRope",source,nplayer)
				end
			end
		end
	end
end)