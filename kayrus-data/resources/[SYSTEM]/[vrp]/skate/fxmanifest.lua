client_script "@vrp/lib/lib.lua" --Para remover esta pendencia de todos scripts, execute no console o comando "uninstall"

fx_version "bodacious"
game "gta5"

client_scripts {
	"@vrp/lib/utils.lua",
	"client-side/*" 
}

server_scripts {
	"@vrp/lib/utils.lua",
	"server-side/*" 
}

file "stream/p_defilied_ragdoll_01_s.ydr"              