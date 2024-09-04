game 'gta5'
fx_version 'adamant'
lua54 'yes'

description 'Ko_Weapon shops'
author 'Ko-Karveloo'
version '1.00'

server_scripts {
    'ko_likainen_sv/ko_sv.lua'
}

client_scripts {
    'ko_likainen_cl/ko_cl.lua'
}

shared_script {
    '@es_extended/imports.lua',
    '@es_extended/locale.lua',
    'config.lua',
    '@ox_lib/init.lua',
}
