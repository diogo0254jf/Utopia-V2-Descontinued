RegisterServerEvent("stores:addInventoryItem")
AddEventHandler("stores:addInventoryItem",function(xPlayer,item,amount)
    vRP.giveInventoryItem(xPlayer,item,amount)
end)