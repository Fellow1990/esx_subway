TriggerEvent('esx_society:registerSociety', 'subway', 'Subway', 'society_subway', 'society_subway', 'society_subway', {type = 'private'})

ESX.RegisterServerCallback('esx_subway:getEmployee', function(source, cb, jobname)
	local data = {}
    local players = ESX.GetExtendedPlayers('job', jobname)
	for i = 1, #players do
		data[#data+1] = {
			playerId = players[i].playerId,
			name = players[i].getName(),
			gradeLabel = players[i].job.grade_label
		}
	end
    cb(data)
end)

RegisterServerEvent('esx_subway:setJob')
AddEventHandler('esx_subway:setJob', function(target, status)
  local xPlayer = ESX.GetPlayerFromId(source)
  local xTarget = ESX.GetPlayerFromId(target)
	if status == 'fire' then
		xTarget.setJob('unemployed', 0)
		xPlayer.showNotification(_U('you_have_fired')..xTarget.getName())
		xTarget.showNotification(_U('you_have_been_fired'))
	elseif status == 'promote' then
		xTarget.setJob(xPlayer.job.name, xTarget.job.grade+1)
		xPlayer.showNotification(_U('you_have_promoted')..xTarget.getName())
		xTarget.showNotification(_U('you_have_been_promoted'))
	elseif status == 'demote' then
		xTarget.setJob(xPlayer.job.name, xTarget.job.grade-1)
		xPlayer.showNotification(_U('you_have_demoted')..xTarget.getName())
		xTarget.showNotification(_U('you_have_been_demoted'))
	elseif status == 'recruit' then
		xTarget.setJob(xPlayer.job.name, 0)
		xPlayer.showNotification(_U('you_have_recruit')..xTarget.getName())
		xTarget.showNotification(_U('you_have_been_recruit'))
	end
end)
