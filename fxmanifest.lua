fx_version "cerulean"
game "gta5"

author "Nylander"
description "A standalone whitelist-system based on SQL."
version "1.0.0"

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "server.lua"
}

shared_script "config.lua"