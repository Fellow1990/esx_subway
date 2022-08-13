fx_version 'adamant'

game 'gta5'
lua54 'yes'

author 'Fellow#3858'
contributors 'SUP2Ak#3755'

description 'ESX Subway'

version '1.7.5'

shared_scripts {
	'@ox_lib/init.lua',
	'@es_extended/imports.lua',
    'shared/*.lua'
}

server_scripts {
    '@es_extended/locale.lua',
    'locales/*.lua',
    'server/*.lua'
}

client_scripts {
    '@es_extended/locale.lua',
    'locales/*.lua',
    'client/*.lua'
}