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
Tunnel.bindInterface("crafting",cRP)
vCLIENT = Tunnel.getInterface("crafting")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local craftList = {
	["ammoCrafting"] = {
		["perm"] = "Mafia",
		["list"] = {
			["WEAPON_RIFLE_AMMO"] = {
				["amount"] = 30,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 75,
					["copper"] = 65
				}
			},
			["WEAPON_PISTOL_AMMO"] = {
				["amount"] = 12,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 45,
					["copper"] = 35
				}
			},
			["WEAPON_SMG_AMMO"] = {
				["amount"] = 25,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 55,
					["copper"] = 45
				}
			},
			["WEAPON_SHOTGUN_AMMO"] = {
				["amount"] = 6,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 70,
					["copper"] = 65
				}
			},
		},
	},
	["gunsCrafting"] = {
		["perm"] = "TheLost",
		["list"] = {
			["WEAPON_ASSAULTRIFLE_MK2"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 550,
					["copper"] = 250
				}
			},
			["WEAPON_ASSAULTRIFLE"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 600,
					["copper"] = 350
				}
			},
			["WEAPON_PISTOL_MK2"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 350,
					["copper"] = 170
				}
			},
			["WEAPON_MINISMG"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 400,
					["copper"] = 170
				}
			},
			["WEAPON_HEAVYPISTOL"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 450,
					["copper"] = 300
				}
			},
			["WEAPON_PUMPSHOTGUN"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 500,
					["copper"] = 300
				}
			},
		},
	},
	["ammoSimple"] = {
		["perm"] = nil,
		["list"] = {
			["WEAPON_RIFLE_AMMO"] = {
				["amount"] = 30,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 75,
					["copper"] = 65,
					["rubber"] = 35
				}
			},
			["WEAPON_PISTOL_AMMO"] = {
				["amount"] = 12,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 45,
					["copper"] = 35,
					["rubber"] = 23
				}
			},
			["WEAPON_SMG_AMMO"] = {
				["amount"] = 25,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 55,
					["copper"] = 45,
					["rubber"] = 27
				}
			},
			["WEAPON_SHOTGUN_AMMO"] = {
				["amount"] = 6,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 70,
					["copper"] = 65,
					["rubber"] = 35
				}
			},
		},
	},
	["gunsSimple"] = {
		["perm"] = nil,
		["list"] = {
			["WEAPON_ASSAULTRIFLE_MK2"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 600,
					["copper"] = 450,
					["rubber"] = 300
				}
			},
			["WEAPON_ASSAULTRIFLE"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 600,
					["copper"] = 450,
					["rubber"] = 250
				}
			},
			["WEAPON_PISTOL_MK2"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 400,
					["copper"] = 350,
					["rubber"] = 200
				}
			},
			["WEAPON_MINISMG"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 500,
					["copper"] = 450,
					["rubber"] = 175
				}
			},
			["WEAPON_HEAVYPISTOL"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 500,
					["copper"] = 300,
					["rubber"] = 175
				}
			},
			["WEAPON_PUMPSHOTGUN"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 600,
					["copper"] = 500,
					["rubber"] = 200
				}
			},
		},
	},
	["costureCrafting"] = {
		["perm"] = nil,
		["list"] = {
			["vest"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["fabric"] = 40,
					["aluminum"] = 200,
				}
			},
			["backpackp"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["fabric"] = 50,
					["elastic"] = 40,
				}
			},
			["backpackm"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["fabric"] = 100,
					["elastic"] = 80,
				}
			},
			["backpackg"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["fabric"] = 150,
					["elastic"] = 120,
				}
			},
			["backpackx"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["fabric"] = 200,
					["elastic"] = 160,
				}
			},
		},
	},
	["garbageCrafting"] = {
		["perm"] = nil,
		["list"] = {
			["aluminum"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["metalcan"] = 1,
				}
			},
			["glass"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["glassbottle"] = 1,
				}
			},
			["copper"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["battery"] = 1,
				}
			},
			["rubber"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["elastic"] = 1,
				}
			},
			["plastic"] = {
				["amount"] = 1,
				["destroy"] = true,
				["require"] = {
					["emptybottle"] = 1,
				}
			},
		}
	},
	["mechanicCrafting"] = {
		["perm"] = "Mechanic",
		["list"] = {
			["tires"] = {
				["amount"] = 3,
				["destroy"] = true,
				["require"] = {
					["elastic"] = 20,
					["rubber"] = 25,
				}
			},
			["toolbox"] = {
				["amount"] = 3,
				["destroy"] = true,
				["require"] = {
					["aluminum"] = 35,
					["metalcan"] = 24,
				}
			}
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTPERM
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.requestPerm(craftType)
	local source = source
	local user_id = vRP.getUserId(source)

	if user_id then
		if vRP.wantedReturn(user_id) then
			return false
		end

		if craftList[craftType]["perm"] ~= nil then
			if not vRP.hasPermission(user_id,craftList[craftType]["perm"]) then
				return false
			end
		end

		return true
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTCRAFTING
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.requestCrafting(craftType)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		local inventoryShop = {}
		for k,v in pairs(craftList[craftType]["list"]) do
			local craftList = {}
			for k,v in pairs(v.require) do
				table.insert(craftList,{ name = vRP.itemNameList(k), amount = v })
			end

			table.insert(inventoryShop,{ name = vRP.itemNameList(k), index = vRP.itemIndexList(k), key = k, weight = vRP.itemWeightList(k), list = craftList, amount = v.amount })
		end

		local inventoryUser = {}
		local inv = vRP.getInventory(user_id)
		if inv then
			for k,v in pairs(inv) do
				if string.sub(v.item,1,9) == "toolboxes" then
					local advFile = LoadResourceFile("logsystem","toolboxes.json")
					local advDecode = json.decode(advFile)

					v.durability = advDecode[v.item]
				end

				v.amount = parseInt(v.amount)
				v.name = vRP.itemNameList(v.item)
				v.peso = vRP.itemWeightList(v.item)
				v.index = vRP.itemIndexList(v.item)
				v.key = v.item
				v.slot = k

				inventoryUser[k] = v
			end
		end

		return inventoryShop,inventoryUser,vRP.computeInvWeight(user_id),vRP.getBackpack(user_id),{ identity.name.." "..identity.name2,parseInt(user_id),parseInt(identity.bank),parseInt(vRP.getGmsId(user_id)),identity.phone,identity.registration }
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONCRAFTING
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.functionCrafting(shopItem,shopType,shopAmount,slot)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if shopAmount == nil then shopAmount = 1 end
		if shopAmount <= 0 then shopAmount = 1 end

		if craftList[shopType]["list"][shopItem] then
			for k,v in pairs(craftList[shopType]["list"][shopItem]["require"]) do
				if vRP.getInventoryItemAmount(user_id,k) < parseInt(v*shopAmount) then
					return
				end
				Citizen.Wait(1)
			end

			for k,v in pairs(craftList[shopType]["list"][shopItem]["require"]) do
				vRP.removeInventoryItem(user_id,k,parseInt(v*shopAmount))
				Citizen.Wait(1)
			end

			if string.sub(shopItem,1,9) == "toolboxes" then
				local advAmount = 0

				repeat
					Citizen.Wait(1)
					advAmount = advAmount + 1
					local advFile = LoadResourceFile("logsystem","toolboxes.json")
					local advDecode = json.decode(advFile)
					local number = 0

					repeat
						Citizen.Wait(1)
						number = number + 1
					until advDecode[tostring("toolboxes"..number)] == nil

					advDecode[tostring("toolboxes"..number)] = 10
					vRP.giveInventoryItem(user_id,tostring("toolboxes"..number),1,false)
					SaveResourceFile("logsystem","toolboxes.json",json.encode(advDecode),-1)
				until advAmount == shopAmount
			else
				vRP.giveInventoryItem(user_id,shopItem,craftList[shopType]["list"][shopItem]["amount"]*shopAmount,false,slot)
			end
		end

		vCLIENT.updateCrafting(source,"requestCrafting")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONDESTROY
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.functionDestroy(shopItem,shopType,shopAmount,slot)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if shopAmount == nil then shopAmount = 1 end
		if shopAmount <= 0 then shopAmount = 1 end

		if craftList[shopType]["list"][shopItem] then
			if craftList[shopType]["list"][shopItem]["destroy"] then
				if vRP.tryGetInventoryItem(user_id,shopItem,craftList[shopType]["list"][shopItem]["amount"]) then
					for k,v in pairs(craftList[shopType]["list"][shopItem]["require"]) do
						if parseInt(v) <= 1 then
							vRP.giveInventoryItem(user_id,k,1)
						else
							vRP.giveInventoryItem(user_id,k,v/2)
						end
						Citizen.Wait(1)
					end
				end
			end
		end

		vCLIENT.updateCrafting(source,"requestCrafting")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("crafting:populateSlot")
AddEventHandler("crafting:populateSlot",function(itemName,slot,target,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if amount == nil then amount = 1 end
		if amount <= 0 then amount = 1 end

		if vRP.tryGetInventoryItem(user_id,itemName,amount,false,slot) then
			vRP.giveInventoryItem(user_id,itemName,amount,false,target)
			vCLIENT.updateCrafting(source,"requestCrafting")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("crafting:updateSlot")
AddEventHandler("crafting:updateSlot",function(itemName,slot,target,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if amount == nil then amount = 1 end
		if amount <= 0 then amount = 1 end

		local inv = vRP.getInventory(user_id)
		if inv then
			if inv[tostring(slot)] and inv[tostring(target)] and inv[tostring(slot)].item == inv[tostring(target)].item then
				if vRP.tryGetInventoryItem(user_id,itemName,amount,false,slot) then
					vRP.giveInventoryItem(user_id,itemName,amount,false,target)
				end
			else
				vRP.swapSlot(user_id,slot,target)
			end
		end

		vCLIENT.updateCrafting(source,"requestCrafting")
	end
end)