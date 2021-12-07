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
Tunnel.bindInterface("tattoo",cRP)
vCLIENT = Tunnel.getInterface("tattoo")
-----------------------------------------------------------------------------------------------------------------------------------------
-- APPLYCUSTOM
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.applyTattow(tattoos)
    local source = source
    local user_id = vRP.getUserId(source)
    vRP.setUData(user_id,"Tattoos", json.encode(tattoos))
    TriggerClientEvent("tattoo:setTattoos", source, tattoos)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERSPAWN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerSpawn",function(user_id,source)
    local tattoos = json.decode(vRP.getUData(user_id, "Tattoos"))
    if tattoos then
        TriggerClientEvent("tattoo:setTattoos", source, tattoos)
    end
end)