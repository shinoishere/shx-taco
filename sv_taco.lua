ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('sh1no-serveretkontrol')
AddEventHandler('sh1no-serveretkontrol', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getInventoryItem("shx_stone").count >= 10 then
        TriggerClientEvent('notification', source, 'Daha fazla dalış tüpü taşıyamazsın!', 2, 6500)
    else
        if xPlayer.getInventoryItem('shx_stone').count > 0 then
        TriggerClientEvent("sh1no-tacoetkontrol", source)
        xPlayer.removeInventoryItem("stone", 1)
	else
		TriggerClientEvent('notification', xPlayer.source, "Et pişirmek için etin yok!", 2)
        end
    end
end)

RegisterServerEvent('sh1no-etlitaco')
AddEventHandler('sh1no-etlitaco', function()
    local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer ~= nil then
        if xPlayer.getInventoryItem("shx_taco").count >= 10 then
            TriggerClientEvent('notification', source, 'Daha fazla taco taşıyamazsın!', 2, 6500)
        else 
            
        if xPlayer.getInventoryItem('shx_pmarul').count > 0 and xPlayer.getInventoryItem('shx_salca').count > 0 and xPlayer.getInventoryItem('shx_mercan').count > 0 and xPlayer.getInventoryItem('shx_yosun').count > 0 then
            xPlayer.removeInventoryItem("shx_pmarul", 1)
            xPlayer.removeInventoryItem("shx_salca", 1)
            xPlayer.removeInventoryItem("shx_mercan", 1)
            xPlayer.removeInventoryItem("shx_yosun", 1)
            xPlayer.addInventoryItem("shx_taco", 1)
        else
            TriggerClientEvent('notification', source, 'Taco yapmak için yeterli malzemen yok!', 2, 6500)
        end
    end
  end
end)

RegisterServerEvent('sh1no-fishtacoyaptim')
AddEventHandler('sh1no-fishtacoyaptim', function()
    local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer ~= nil then
        if xPlayer.getInventoryItem("shx_fishtaco").count >= 10 then
            TriggerClientEvent('notification', source, 'Daha fazla balıklı taco taşıyamazsın!', 2, 6500)
        else 
            
        if xPlayer.getInventoryItem('shx_pmarul').count > 0 and xPlayer.getInventoryItem('shx_salca').count > 0 and xPlayer.getInventoryItem('shx_mercan').count > 0 then
            xPlayer.removeInventoryItem("shx_pmarul", 1)
            xPlayer.removeInventoryItem("shx_salca", 1)
            xPlayer.removeInventoryItem("shx_mercan", 1)
            xPlayer.addInventoryItem("shx_fishtaco", 1)
        else
            TriggerClientEvent('notification', source, 'Balıklı taco yapmak için yeterli malzemen yok!', 2, 6500)
        end
    end
  end
end)

RegisterServerEvent('sh1no-tacopaketledim')
AddEventHandler('sh1no-tacopaketledim', function()
    local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer ~= nil then
        if xPlayer.getInventoryItem("shx_paketlenmistaco").count >= 10 then
            TriggerClientEvent('notification', source, 'Daha fazla paketlenmiş taco taşıyamazsın!', 2, 6500)
        else 
            
        if xPlayer.getInventoryItem('shx_fishtaco').count > 0 then
            xPlayer.removeInventoryItem("shx_fishtaco", 1)
            xPlayer.addInventoryItem("shx_paketlenmistaco", 1)
        else
            if xPlayer.getInventoryItem('shx_taco').count > 0 then
                xPlayer.removeInventoryItem("shx_taco", 1)
                xPlayer.addInventoryItem("shx_paketlenmistaco", 1)
        else
            TriggerClientEvent('notification', source, 'Paketlemek için tacon yok!', 2, 6500)
            end
        end
    end
  end
end)

RegisterNetEvent('sh1no-parakontrol')
AddEventHandler('sh1no-parakontrol', function(money)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if(xPlayer.getMoney() >= 50) then
		xPlayer.removeMoney(50)

		TriggerClientEvent('sh1no-kontrolgecti', source) -- true
	else
		TriggerClientEvent('notification', _source, 'Yeterli paran yok!', 2, 6500)
	end	
end)

RegisterServerEvent('sh1no-tacouyusturucukontrol')
AddEventHandler('sh1no-tacouyusturucukontrol', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getInventoryItem('shx_paketlenmistaco').count > 0 and xPlayer.getInventoryItem('1gr_roka').count > 0 then
        xPlayer.removeInventoryItem("1gr_roka", 1)
        xPlayer.removeInventoryItem("shx_paketlenmistaco", 1)
        xPlayer.addMoney(500)
        TriggerClientEvent('notification', xPlayer.source, "Teslimat başarılıydı, dükkana dönüp yeni iş al!", 1, 6000)
    else
        if xPlayer.getInventoryItem('shx_paketlenmistaco').count > 0 then
            xPlayer.removeInventoryItem("shx_paketlenmistaco", 1)
            xPlayer.addMoney(100)
            TriggerClientEvent('notification', xPlayer.source, "Güzel yaptın, dükkana dönüp yeni iş al!", 1, 6000)
	else
		TriggerClientEvent('notification', xPlayer.source, "Paketlenmiş tacon yok!", 2)
        end
    end
end)