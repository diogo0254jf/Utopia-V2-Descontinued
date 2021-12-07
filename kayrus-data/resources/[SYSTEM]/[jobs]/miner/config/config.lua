config = {}
-- PARA FAZER O USO DO RPROGRESS https://github.com/Mobius1/rprogress
config.UseRprogress = true

-- QUANTIDADE DE MINERIOS QUE IRA VIM ALEATORIO ENTRE 1 E 3
config.quantidade = { 1 , 3 }

-- MINERIOS QUE IRAM VIM NA MINERAÇÃO
config.prata = "ambar"
config.ouro = "turquesa"
config.diamante = "diamante"
config.esmeralda = "esmeralda"

-- LOCALIZAÇÃO PARA INICIAR SERVIÇO & PED
config.start = {
	{ ['id'] = 1, ['x'] = -600.08, ['y'] = 2092.50, ['z'] = 131.34, ['h'] = 1.72, ['hash'] = 0x9855C974, ['hash2'] = "mp_m_counterfeit_01" }, 
} 

-- LOCALIZAÇÃO DO BLIP NO MAPA 
config.blip = {
    { nome = "Central | Minerador", cor = 37, id = 617, x = -604.93,y = 2104.96,z = 127.82 }, 
}

-- LOCALIZAÇÃO DOS PONTOS DE MINERAÇÃO
config.rota = {
	[1] = { ['x'] = -592.36, ['y'] = 2080.69, ['z'] = 131.35 },
	[2] = { ['x'] = -591.35, ['y'] = 2076.52, ['z'] = 131.37 },
	[3] = { ['x'] = -590.29, ['y'] = 2072.79, ['z'] = 131.3 },
	[4] = { ['x'] = -589.57, ['y'] = 2068.95, ['z'] = 131.21 },
	[5] = { ['x'] = -588.44, ['y'] = 2064.89, ['z'] = 131.01 },
	[6] = { ['x'] = -587.9, ['y'] = 2061.1, ['z'] = 130.79 },
	[7] = { ['x'] = -587.39, ['y'] = 2057.38, ['z'] = 130.53 },
	[8] = { ['x'] = -587.03, ['y'] = 2053.44, ['z'] = 130.21 },
	[9] = { ['x'] = -586.2, ['y'] = 2049.87, ['z'] = 129.9 },
	[10] = { ['x'] = -585.04, ['y'] = 2046.26, ['z'] = 129.59 },
	[11] = { ['x'] = -583.7, ['y'] = 2043.01, ['z'] = 129.31 },
}
