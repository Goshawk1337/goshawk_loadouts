fx_version 'cerulean'
lua54 'yes'
game 'gta5'

author 'Goshawk133'
description 'Goshawk Loadout'
version '1.0.0'


shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'config/config.lua'
}
client_scripts {
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'config/s_config.lua',
    'server/*.lua'
}

-- UI files
ui_page 'ui/index.html'

files {
    'ui/index.html',
    'ui/script.js'
}