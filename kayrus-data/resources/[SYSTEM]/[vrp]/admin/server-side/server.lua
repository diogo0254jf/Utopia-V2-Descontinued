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
Tunnel.bindInterface("admin",cRP)
vCLIENT = Tunnel.getInterface("admin")
vHOMES = Tunnel.getInterface("homes")

local screenshotOptions = {
	encoding = 'png',
	quality = 1
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- WEBHOOK
-----------------------------------------------------------------------------------------------------------------------------------------
local webhookkick = ""
local webhookgive = ""
local webhookbanunban = ""
local webhookadminwl = ""
local webhookunwl = ""
local webhookadmingod = ""
local webhookaddremcar = ""
local webhookaddremgroup = ""
local webhooknc = ""
local webhookgems = ""
local webhookfix = ""
local webhookannounce = ""
local webhookadminservice = ""
local webhookteleport = ""

function creativelogs(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTPLAYERS
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerSpawn",function(user_id,source)
	local identity = vRP.getUserIdentity(user_id)
	if identity then
		vCLIENT.setDiscord(source,"#"..user_id.." "..identity.name.." "..identity.name2)
		TriggerClientEvent(source,'active:checkcam',true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("item",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			if args[1] and args[2] and vRP.itemNameList(args[1]) ~= nil then
				local motivo = vRP.prompt(source,"Qual Motivo?","")
				if motivo then
					vRP.giveInventoryItem(user_id,args[1],parseInt(args[2]),true)
					creativelogs(webhookgive,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[PEGOU]: "..args[1].." \n[QUANTIDADE]: "..parseInt(args[2]).." \n[Motivo]: "..motivo.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
				end	
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEBUG
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("debug",function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			TriggerClientEvent("ToggleDebug",source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("plate",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") and args[1] and args[2] and args[3] then
			vRP.execute("vRP/update_plate_vehicle",{ user_id = parseInt(args[1]), vehicle = args[2], plate = args[3] })
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDCAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("addcar",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") and args[1] and args[2] then
			creativelogs(webhookaddremcar,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[ADICIONOU]: "..args[2].." \n[PARA O ID]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```") 
			vRP.execute("vRP/add_vehicle",{ user_id = parseInt(args[1]), vehicle = args[2], plate = vRP.generatePlateNumber(), phone = vRP.getPhone(args[1]), work = tostring(false) })
			TriggerClientEvent("Notify",args[1],"azul","Voce recebeu <b>"..args[2].."</b> em sua garagem.",5000)
			TriggerClientEvent("Notify",source,"azul","Adicionou o veiculo: <b>"..args[2].."</b> no ID:<b>"..args[1].."</b.")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMCAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("remcar",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") and args[1] and args[2] then
			creativelogs(webhookaddremcar,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[REMOVEU]: "..args[2].." \n[DO ID]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```") 
			vRP.execute("vRP/rem_vehicle",{ user_id = parseInt(args[1]), vehicle = args[2], plate = vRP.generatePlateNumber(), phone = vRP.getPhone(args[1]), work = tostring(false) })
			TriggerClientEvent("Notify",args[1],"azul","Foi Removido<b>"..args[2].."</b>Da Sua Garagem.",5000)
			TriggerClientEvent("Notify",source,"azul","Você Removeu: <b>"..args[2].."</b> do ID:<b>"..args[1].."</b.")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMCAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("capuzz",function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") and args[1] then
			TriggerClientEvent("hud:toggleHood",source,args[1])
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- NC
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.enablaNoclip()
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Mod") then
			vRPclient.noClip(source)
			creativelogs(webhooknc,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[UTILIZOU O NOCLIP] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- KICK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("kick",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Mod") and parseInt(args[1]) > 0 then
			local motivo = vRP.prompt(source,"Qual Motivo?","")
			if motivo then
			vRP.kick(parseInt(args[1]),"Você foi expulso da cidade.")
			creativelogs(webhookkick,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[KICKOU]: "..args[1].." \n[Motivo]: "..motivo.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			end	
		end
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------
-- KICKALL
-------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('kickall',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Mod") then
		local motivo = vRP.prompt(source,"Qual Motivo?","")
        local users = vRP.getUsers()
        for k,v in pairs(users) do
            local id = vRP.getUserSource(parseInt(k))
            if id ~= nil then
                async(function()
					vRP.kick(parseInt(k),"Você foi vitima de um terremoto.")
					creativelogs(webhookkick,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[KIKOU ALL] \n[Motivo]: "..motivo.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
                end)
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BAN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("ban",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Mod") and parseInt(args[1]) > 0 then
			local identity = vRP.getUserIdentity(parseInt(args[1]))
			local motivo = vRP.prompt(source,"Qual Motivo?","")
			if identity then
				if motivo then
				vRP.execute("vRP/set_banned",{ steam = tostring(identity.steam), banned = 1 })
				vRP.kick(parseInt(args[1]),"Você foi Banido da Cidade!")
				creativelogs(webhookbanunban,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[BANIU]: "..args[1].." \n[Motivo]: "..motivo.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
				end	
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UNBAN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("unban",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Mod") and parseInt(args[1]) > 0 then
			local identity = vRP.getUserIdentity(parseInt(args[1]))
			local motivo = vRP.prompt(source,"Qual Motivo?","")
			if identity then
				if motivo then
				vRP.execute("vRP/set_banned",{ steam = tostring(identity.steam), banned = 0 })
				creativelogs(webhookbanunban,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[DESBANIU]: "..args[1].." \n[Motivo]: "..motivo.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- WL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("wl",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Mod") or vRP.hasPermission(user_id,"Sup") or vRP.hasPermission(user_id,"Whitelist") then
			vRP.execute("vRP/set_whitelist",{ steam = tostring(args[1]), whitelist = 1 })
			creativelogs(webhookadminwl,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[APROVOU WL]: "..args[1].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UNWL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("unwl",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Mod") or vRP.hasPermission(user_id,"Sup") or vRP.hasPermission(user_id,"Whitelist") and parseInt(args[1]) > 0 then
			local identity = vRP.getUserIdentity(parseInt(args[1]))
			local motivo = vRP.prompt(source,"Qual Motivo?","")
			if identity then
				if motivo then
				vRP.execute("vRP/set_whitelist",{ steam = tostring(identity.steam), whitelist = 0 })
				creativelogs(webhookunwl,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[RETIROU WL]: "..args[1].."  \n[Motivo]: "..motivo.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GEMS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("gems",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") and parseInt(args[1]) > 0 and parseInt(args[2]) > 0 then
			local nuser_id = args[1]
			local identity = vRP.getUserIdentity(parseInt(args[1]))
			local identity = vRP.getUserIdentity(user_id)
			local identity2 = vRP.getUserIdentity(nuser_id)
			local motivo = vRP.prompt(source,"Qual Motivo?","")
			if identity then
				if motivo then
				vRP.execute("vRP/update_gems",{ steam = tostring(identity.steam), gems = parseInt(args[2]) })
				TriggerClientEvent("Notify",source,"azul","Gemas entregues com sucesso.",5000)
				creativelogs(webhookgems,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[ADICIONOU]: "..args[2].." Gems \n[PARA]: "..identity2.name.." "..identity2.name2.." \n[ID]: "..nuser_id.." \n[MOTIVO]: " ..motivo.. " "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPCDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tpcds",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			local fcoords = vRP.prompt(source,"Coordinates:","")
			if fcoords == "" then
				return
			end

			local coords = {}
			for coord in string.gmatch(fcoords or "0,0,0","[^,]+") do
				table.insert(coords,parseInt(coord))
			end
			vRPclient.teleport(source,coords[1] or 0,coords[2] or 0,coords[3] or 0)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("cds",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			local x,y,z,h = vRPclient.getPositions(source)
			vRP.prompt(source,"Coordinates:",x..","..y..","..z..","..h)
		end
	end
end)

RegisterCommand("cds2",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			local x,y,z,h = vRPclient.getPositions(source)
			vRP.prompt(source,"Coordinates:","['x'] = "..x..", ['y'] = "..y..", ['z'] = "..z.."")
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- GROUP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("group",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			if not vRP.hasPermission(parseInt(args[1]),tostring(args[2])) then
				creativelogs(webhookaddremgroup,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[ADICIONOU]: "..args[1].." \n[GRUPO]: "..args[2].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
				vRP.execute("vRP/add_group",{ user_id = parseInt(args[1]), permiss = tostring(args[2]) })
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UNGROUP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("ungroup",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			if vRP.hasPermission(parseInt(args[1]),tostring(args[2])) then
				vRP.removePermission(parseInt(args[1]),tostring(args[2]))
				creativelogs(webhookaddremgroup,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[REMOVEU]: "..args[1].." \n[GRUPO]: "..args[2].." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
				vRP.execute("vRP/del_group",{ user_id = parseInt(args[1]), permiss = tostring(args[2]) })
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPTOME
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tptome",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Mod") and parseInt(args[1]) > 0 then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			local nuser_id = args[1]
			local identity = vRP.getUserIdentity(parseInt(args[1]))
			local identity = vRP.getUserIdentity(user_id)
			local identity2 = vRP.getUserIdentity(nuser_id)
			if nplayer then
				creativelogs(webhookteleport,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[TPTOME]: "..identity2.name.." "..identity2.name2.." \n[ID]: "..nuser_id.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
				vRPclient.teleport(nplayer,vRPclient.getPositions(source))
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPTO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tpto",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Mod") and parseInt(args[1]) > 0 then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			local nuser_id = args[1]
			local identity = vRP.getUserIdentity(parseInt(args[1]))
			local identity = vRP.getUserIdentity(user_id)
			local identity2 = vRP.getUserIdentity(nuser_id)
			if nplayer then
				creativelogs(webhookteleport,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[TPTO]: "..identity2.name.." "..identity2.name2.." \n[ID]: "..nuser_id.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
				vRPclient.teleport(source,vRPclient.getPositions(nplayer))
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPWAY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tpway",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Mod") then
			creativelogs(webhookteleport,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[UTILIZOU O FIX] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			vCLIENT.teleportWay(source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIMBO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("limbo",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRPclient.getHealth(source) <= 101 then
			vCLIENT.teleportLimbo(source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HASH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("hash",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			local vehicle = vRPclient.getNearVehicle(source,7)
			if vehicle then
				vCLIENT.vehicleHash(source,vehicle)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELNPCS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("delnpcs",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Mod") then
			vCLIENT.deleteNpcs(source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TUNING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("tuning",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			TriggerClientEvent("admin:vehicleTuning",source)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FIX
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("fix",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Mod") then
			local vehicle,vehNet = vRPclient.vehList(source,11)
			if vehicle then
				TriggerClientEvent("inventory:repairVehicle",-1,vehNet,true)
				creativelogs(webhookfix,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[UTILIZOU O FIX] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIMPAREA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("limpaarea",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Mod") then
			local x,y,z = vRPclient.getPositions(source)
			TriggerClientEvent("syncarea",-1,x,y,z,100)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("players",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Mod") then
			local quantidade = 0
			local users = vRP.getUsers()
			for k,v in pairs(users) do
				quantidade = parseInt(quantidade) + 1
			end
			TriggerClientEvent("Notify",source,"azul","<b>Players Conectados:</b> "..quantidade,5000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PON
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('pon',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Mod") then
		local users = vRP.getUsers()
		local players = ""
		local quantidade = 0
		for k,v in pairs(users) do
			if k ~= #users then
				players = players..", "
			end
			players = players..k
			quantidade = quantidade + 1
		end
		TriggerClientEvent('chatMessage',source,"TOTAL ONLINE",{1, 136, 0},quantidade)
		TriggerClientEvent('chatMessage',source,"ID's ONLINE",{1, 136, 0},players)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CDS
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.buttonTxt()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			local x,y,z,h = vRPclient.getPositions(source)
			vRP.updateTxt(user_id..".txt",x..","..y..","..z..","..h)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANNOUNCE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("anuncio",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") or vRP.hasPermission(user_id,"Mod") then
			local message = vRP.prompt(source,"Message:","")
			if message == "" then
				return
			end

			TriggerClientEvent("Notify",-1,"roxo",message.."<br><b>Mensagem enviada por:</b> Governador",15000)
			creativelogs(webhookannounce,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[MENSAGEM]: "..message.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ITEMALL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("itemall",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			local users = vRP.getUsers()
			for k,v in pairs(users) do
				vRP.giveInventoryItem(parseInt(k),tostring(args[1]),parseInt(args[2]),true)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STAFF SERVICE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("staff",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		if vRP.hasPermission(user_id,"Admin") then
			vRP.removePermission(source,"Admin")
			TriggerClientEvent("Notify",source,"azul","Você saiu do modo Abuser.",5000)
			vRP.execute("vRP/upd_group",{ user_id = user_id, permiss = "Admin", newpermiss = "waitAdmin" })
			creativelogs(webhookadminservice,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[SAIU DO MODO ABUSER] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		elseif vRP.hasPermission(user_id,"waitAdmin")  then
			vRP.insertPermission(source,"Admin")
			TriggerClientEvent("Notify",source,"azul","Você iniciou o modo Abuser.",5000)
			vRP.execute("vRP/upd_group",{ user_id = user_id, permiss = "waitAdmin", newpermiss = "Admin" })
			creativelogs(webhookadminservice,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[INICIOU O MODO ABUSER] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
		if vRP.hasPermission(user_id,"Wall") then
			vRP.removePermission(source,"Wall")
			vRP.execute("vRP/upd_group",{ user_id = user_id, permiss = "Wall", newpermiss = "waitAdmin2" })
		elseif vRP.hasPermission(user_id,"waitAdmin2")  then
			vRP.insertPermission(source,"Wall")
			vRP.execute("vRP/upd_group",{ user_id = user_id, permiss = "waitAdmin2", newpermiss = "Wall" })
		end
		if vRP.hasPermission(user_id,"Mod") then
			vRP.removePermission(source,"Mod")
			TriggerClientEvent("Notify",source,"azul","Você saiu do modo Abuser.",5000)
			vRP.execute("vRP/upd_group",{ user_id = user_id, permiss = "Mod", newpermiss = "waitMod" })
			creativelogs(webhookadminservice,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[SAIU DO MODO ABUSER] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		elseif vRP.hasPermission(user_id,"waitMod") then
			vRP.insertPermission(source,"Mod")
			TriggerClientEvent("Notify",source,"azul","Você iniciou o modo Abuser.",5000)
			vRP.execute("vRP/upd_group",{ user_id = user_id, permiss = "waitMod", newpermiss = "Mod" })
			creativelogs(webhookadminservice,"```[NOME]: "..identity.name.." "..identity.name2.." \n[ID]: "..user_id.." \n[INICIOU O MODO ABUSER] "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end)