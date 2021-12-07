Config = {}

Config.webhook = "https://discord.com/api/webhooks/872194214144934008/rdQPLg_HbTgs80rbghZFVXWu7M74CfIgjxUyKZAUAd96HKHZNJsXtEY5svlG2ol0Ddom"						-- Webhook para enviar logs para discordar
Config.lang = "br"								-- Defina o idioma do arquivo [en/br]
Config.ESXSHAREDOBJECT = "esx:getSharedObject" 	-- Altere seu evento de objeto getshared aqui, caso você esteja usando anti-cheat

Config.format = {
	['currency'] = 'BRL',						-- Este é o formato da moeda, para que o símbolo da sua moeda apareça corretamente [Exemplos: BRL, USD]
	['location'] = 'pt-BR'						-- Esta é a localização do seu país, para formatar as casas decimais de acordo com seu padrão [Exemplos: pt-BR, en-US]
}

-- Aqui estão os locais onde a pessoa pode abrir o menu do mercado
-- Você pode adicionar quantos locais quiser, basta usar o local já criado como exemplo
Config.market_locations = {
	["market_1"] = {															-- ID
		['buy_price'] = 1,													-- Preço para comprar este mercado
		['sell_price'] = 60000,													-- Preço para vender este mercado
		['coord'] = {-709.45,-906.78,19.22},									-- Coordenadas para abrir o menu
		['garage_coord'] = {-707.13,-924.98,19.02,179.01},						-- Coordenadas de garagem, onde os caminhões irão spawnar (coordenadas compostas por x, y, z, h)
		['sell_blip_coords'] = {												-- As coordenadas onde os clientes irão comprar coisas nesta loja (coordenadas compostas por x, y, z)
			{-707.61,-913.63,19.22},
			{-712.34,-913.04,19.22}
		},
		['deliveryman_coord'] = {-714.55,-917.8,19.22},							-- Coordenadas onde o entregador levará os trabalhos que você criou
		['type'] = '247store', 													-- Insira aqui o ID do tipo de mercado
	},
	["market_2"] = {															-- ID
		['buy_price'] = 650000,													-- Preço para comprar este mercado
		['sell_price'] = 420000,												-- Preço para vender este mercado
		['coord'] = {-44.44,-1749.82,29.43},									-- Coordenadas para abrir o menu
		['garage_coord'] = {-50.78,-1762.75,29.1,46.93},						-- Coordenadas de garagem, onde os caminhões irão spawnar (coordenadas compostas por x, y, z, h)
		['sell_blip_coords'] = {												-- As coordenadas onde os clientes irão comprar coisas nesta loja (coordenadas compostas por x, y, z)
			{-47.91,-1756.99,29.43},
			{-50.93,-1753.18,29.43}
		},
		['deliveryman_coord'] = {-55.74,-1756.03,29.44},						-- Coordenadas onde o entregador levará os trabalhos que você criou
		['type'] = '247store', 													-- Insira aqui o ID do tipo de mercado
	},
	["market_3"] = {															-- ID
		['buy_price'] = 650000,													-- Preço para comprar este mercado
		['sell_price'] = 420000,												-- Preço para vender este mercado
		['coord'] = {30.3,-1339.43,29.5},										-- Coordenadas para abrir o menu
		['garage_coord'] = {15.73,-1342.19,29.29,178.1},						-- Coordenadas de garagem, onde os caminhões irão spawnar (coordenadas compostas por x, y, z, h)
		['sell_blip_coords'] = {												-- As coordenadas onde os clientes irão comprar coisas nesta loja (coordenadas compostas por x, y, z)
			{25.75,-1346.83,29.5},
			{30.23,-1345.14,29.5}
		},
		['deliveryman_coord'] = {31.67,-1349.98,29.34},							-- Coordenadas onde o entregador levará os trabalhos que você criou
		['type'] = '247store', 													-- Insira aqui o ID do tipo de mercado
	},
	["market_4"] = {															-- ID
		['buy_price'] = 750000,													-- Preço para comprar este mercado
		['sell_price'] = 420000,												-- Preço para vender este mercado
		['coord'] = {1159.97,-316.03,69.21},									-- Coordenadas para abrir o menu
		['garage_coord'] = {1153.92,-331.43,68.89,188.05},						-- Coordenadas de garagem, onde os caminhões irão spawnar (coordenadas compostas por x, y, z, h)
		['sell_blip_coords'] = {												-- As coordenadas onde os clientes irão comprar coisas nesta loja (coordenadas compostas por x, y, z)
			{1163.36,-323.18,69.21},
			{1158.21,-323.1,69.21}
		},
		['deliveryman_coord'] = {1155.77,-328.34,69.21},						-- Coordenadas onde o entregador levará os trabalhos que você criou
		['type'] = '247store', 													-- Insira aqui o ID do tipo de mercado
	},
	["market_5"] = {															-- ID
		['buy_price'] = 800000,													-- Preço para comprar este mercado
		['sell_price'] = 420000,												-- Preço para vender este mercado
		['coord'] = {380.21,332.69,103.57},										-- Coordenadas para abrir o menu
		['garage_coord'] = {366.03,329.85,103.57,163.95},						-- Coordenadas de garagem, onde os caminhões irão spawnar (coordenadas compostas por x, y, z, h)
		['sell_blip_coords'] = {												-- As coordenadas onde os clientes irão comprar coisas nesta loja (coordenadas compostas por x, y, z)
			{373.91,326.53,103.57},
			{378.61,326.94,103.57}
		},
		['deliveryman_coord'] = {378.81,322.14,103.39},							-- Coordenadas onde o entregador levará os trabalhos que você criou
		['type'] = '247store', 													-- Insira aqui o ID do tipo de mercado
	},
	["market_6"] = {															-- ID
		['buy_price'] = 550000,													-- Preço para comprar este mercado
		['sell_price'] = 220000,												-- Preço para vender este mercado
		['coord'] = {1126.11,-982.74,45.42},									-- Coordenadas para abrir o menu
		['garage_coord'] = {1136.63,-973.86,46.61,273.98},						-- Coordenadas de garagem, onde os caminhões irão spawnar (coordenadas compostas por x, y, z, h)
		['sell_blip_coords'] = {												-- As coordenadas onde os clientes irão comprar coisas nesta loja (coordenadas compostas por x, y, z)
			{1135.65,-982.28,46.42},
			{1138.36,-978.57,46.42}
		},
		['deliveryman_coord'] = {1141.98,-978.88,46.3},							-- Coordenadas onde o entregador levará os trabalhos que você criou
		['type'] = '247store', 													-- Insira aqui o ID do tipo de mercado
	},
	["market_7"] = {															-- ID
		['buy_price'] = 550000,													-- Preço para comprar este mercado
		['sell_price'] = 220000,												-- Preço para vender este mercado
		['coord'] = {-1218.27,-915.16,11.33},									-- Coordenadas para abrir o menu
		['garage_coord'] = {-1233.43,-898.28,12.04,306.36},						-- Coordenadas de garagem, onde os caminhões irão spawnar (coordenadas compostas por x, y, z, h)
		['sell_blip_coords'] = {												-- As coordenadas onde os clientes irão comprar coisas nesta loja (coordenadas compostas por x, y, z)
			{-1222.72,-907.06,12.33},
			{-1222.42,-903.43,12.33}
		},
		['deliveryman_coord'] = {-1223.62,-899.67,12.42},						-- Coordenadas onde o entregador levará os trabalhos que você criou
		['type'] = '247store', 													-- Insira aqui o ID do tipo de mercado
	},
	["market_8"] = {															-- ID
		['buy_price'] = 550000,													-- Preço para comprar este mercado
		['sell_price'] = 220000,												-- Preço para vender este mercado
		['coord'] = {-1480.0,-372.86,39.17},									-- Coordenadas para abrir o menu
		['garage_coord'] = {-1505.79,-384.6,40.67,47.99},						-- Coordenadas de garagem, onde os caminhões irão spawnar (coordenadas compostas por x, y, z, h)
		['sell_blip_coords'] = {												-- As coordenadas onde os clientes irão comprar coisas nesta loja (coordenadas compostas por x, y, z)
			{-1487.32,-378.99,40.17},
			{-1490.89,-379.78,40.17}
		},
		['deliveryman_coord'] = {-1495.42,-381.25,40.35},						-- Coordenadas onde o entregador levará os trabalhos que você criou
		['type'] = '247store', 													-- Insira aqui o ID do tipo de mercado
	},
	["market_9"] = {															-- ID
		['buy_price'] = 420000,													-- Preço para comprar este mercado
		['sell_price'] = 200000,												-- Preço para vender este mercado
		['coord'] = {-2958.53,389.65,14.05},									-- Coordenadas para abrir o menu
		['garage_coord'] = {-2967.61,401.0,15.1,79.23},						    -- Coordenadas de garagem, onde os caminhões irão spawnar (coordenadas compostas por x, y, z, h)
		['sell_blip_coords'] = {												-- As coordenadas onde os clientes irão comprar coisas nesta loja (coordenadas compostas por x, y, z)
			{-2967.85,391.03,15.05},
			{-2970.66,393.29,15.05}
		},
		['deliveryman_coord'] = {-2974.32,392.95,15.04},						-- Coordenadas onde o entregador levará os trabalhos que você criou
		['type'] = '247store', 													-- Insira aqui o ID do tipo de mercado
	},
	["market_10"] = {															-- ID
		['buy_price'] = 420000,													-- Preço para comprar este mercado
		['sell_price'] = 200000,												-- Preço para vender este mercado
		['coord'] = {-3048.16,587.93,7.91},									    -- Coordenadas para abrir o menu
		['garage_coord'] = {-3040.2,601.9,7.57,286.33},						    -- Coordenadas de garagem, onde os caminhões irão spawnar (coordenadas compostas por x, y, z, h)
		['sell_blip_coords'] = {												-- As coordenadas onde os clientes irão comprar coisas nesta loja (coordenadas compostas por x, y, z)
			{-3039.99,585.61,7.91},
			{-3042.64,588.86,7.91}
		},
		['deliveryman_coord'] = {-3038.45,592.96,7.82},						    -- Coordenadas onde o entregador levará os trabalhos que você criou
		['type'] = '247store', 													-- Insira aqui o ID do tipo de mercado
	},
	["market_11"] = {															-- ID
		['buy_price'] = 420000,													-- Preço para comprar este mercado
		['sell_price'] = 200000,												-- Preço para vender este mercado
		['coord'] = {-3249.48,1006.61,12.84},									-- Coordenadas para abrir o menu
		['garage_coord'] = {-3240.07,993.79,12.42,268.03},						-- Coordenadas de garagem, onde os caminhões irão spawnar (coordenadas compostas por x, y, z, h)
		['sell_blip_coords'] = {												-- As coordenadas onde os clientes irão comprar coisas nesta loja (coordenadas compostas por x, y, z)
			{-3242.83,1001.32,12.84},
			{-3244.04,1005.37,12.84}
		},
		['deliveryman_coord'] = {-3239.67,1011.97,12.35},						-- Coordenadas onde o entregador levará os trabalhos que você criou
		['type'] = '247store', 													-- Insira aqui o ID do tipo de mercado
	},
	["market_12"] = {															-- ID
		['buy_price'] = 350000,													-- Preço para comprar este mercado
		['sell_price'] = 200000,												-- Preço para vender este mercado
		['coord'] = {544.19,2662.86,42.16},									    -- Coordenadas para abrir o menu
		['garage_coord'] = {552.12,2679.04,42.13,277.03},						    -- Coordenadas de garagem, onde os caminhões irão spawnar (coordenadas compostas por x, y, z, h)
		['sell_blip_coords'] = {												-- As coordenadas onde os clientes irão comprar coisas nesta loja (coordenadas compostas por x, y, z)
			{547.69,2670.55,42.16},
			{544.2,2668.58,42.16}
		},
		['deliveryman_coord'] = {547.76,2674.09,42.19},						    -- Coordenadas onde o entregador levará os trabalhos que você criou
		['type'] = '247store', 													-- Insira aqui o ID do tipo de mercado
	},
	["market_13"] = {															-- ID
		['buy_price'] = 350000,													-- Preço para comprar este mercado
		['sell_price'] = 200000,												-- Preço para vender este mercado
		['coord'] = {1166.78,2718.8,37.16},									    -- Coordenadas para abrir o menu
		['garage_coord'] = {1164.54,2696.2,37.82,178.74},						    -- Coordenadas de garagem, onde os caminhões irão spawnar (coordenadas compostas por x, y, z, h)
		['sell_blip_coords'] = {												-- As coordenadas onde os clientes irão comprar coisas nesta loja (coordenadas compostas por x, y, z)
			{1165.84,2709.34,38.16},
			{1164.0,2706.55,38.16}
		},
		['deliveryman_coord'] = {1168.17,2702.51,38.18},						    -- Coordenadas onde o entregador levará os trabalhos que você criou
		['type'] = '247store', 													-- Insira aqui o ID do tipo de mercado
	},
	["market_14"] = {															-- ID
		['buy_price'] = 320000,													-- Preço para comprar este mercado
		['sell_price'] = 200000,												-- Preço para vender este mercado
		['coord'] = {2549.8,386.86,108.63},									    -- Coordenadas para abrir o menu
		['garage_coord'] = {2565.88,384.14,108.47,356.55},						    -- Coordenadas de garagem, onde os caminhões irão spawnar (coordenadas compostas por x, y, z, h)
		['sell_blip_coords'] = {												-- As coordenadas onde os clientes irão comprar coisas nesta loja (coordenadas compostas por x, y, z)
			{2556.54,382.12,108.63},
			{2555.28,386.24,108.63}
		},
		['deliveryman_coord'] = {2560.25,382.86,108.63},						    -- Coordenadas onde o entregador levará os trabalhos que você criou
		['type'] = '247store', 													-- Insira aqui o ID do tipo de mercado
	},
	["market_15"] = {															-- ID
		['buy_price'] = 320000,													-- Preço para comprar este mercado
		['sell_price'] = 200000,												-- Preço para vender este mercado
		['coord'] = {2674.06,3288.35,55.25},									-- Coordenadas para abrir o menu
		['garage_coord'] = {2688.33,3284.88,55.25,327.64},						-- Coordenadas de garagem, onde os caminhões irão spawnar (coordenadas compostas por x, y, z, h)
		['sell_blip_coords'] = {												-- As coordenadas onde os clientes irão comprar coisas nesta loja (coordenadas compostas por x, y, z)
			{2678.26,3280.75,55.25},
			{2678.82,3285.23,55.25}
		},
		['deliveryman_coord'] = {2680.17,3277.22,55.41},						    -- Coordenadas onde o entregador levará os trabalhos que você criou
		['type'] = '247store', 													-- Insira aqui o ID do tipo de mercado
	},
	["market_16"] = {															-- ID
		['buy_price'] = 320000,													-- Preço para comprar este mercado
		['sell_price'] = 200000,												-- Preço para vender este mercado
		['coord'] = {1961.2,3749.51,32.35},									    -- Coordenadas para abrir o menu
		['garage_coord'] = {1955.44,3738.01,32.2,211.39},						-- Coordenadas de garagem, onde os caminhões irão spawnar (coordenadas compostas por x, y, z, h)
		['sell_blip_coords'] = {												-- As coordenadas onde os clientes irão comprar coisas nesta loja (coordenadas compostas por x, y, z)
			{1960.98,3741.14,32.35},
			{1963.37,3744.38,32.35}
		},
		['deliveryman_coord'] = {1963.05,3737.36,32.37},						 -- Coordenadas onde o entregador levará os trabalhos que você criou
		['type'] = '247store', 													 -- Insira aqui o ID do tipo de mercado
	},
	["market_17"] = {															-- ID
		['buy_price'] = 320000,													-- Preço para comprar este mercado
		['sell_price'] = 200000,												-- Preço para vender este mercado
		['coord'] = {1705.55,4921.76,42.07},									-- Coordenadas para abrir o menu
		['garage_coord'] = {1696.69,4939.48,42.09,33.35},						-- Coordenadas de garagem, onde os caminhões irão spawnar (coordenadas compostas por x, y, z, h)
		['sell_blip_coords'] = {												-- As coordenadas onde os clientes irão comprar coisas nesta loja (coordenadas compostas por x, y, z)
			{1698.7,4924.04,42.07},
			{1702.41,4927.73,42.07}
		},
		['deliveryman_coord'] = {1700.38,4932.97,42.08},						 -- Coordenadas onde o entregador levará os trabalhos que você criou
		['type'] = '247store', 													 -- Insira aqui o ID do tipo de mercado
	},
	["market_18"] = {															-- ID
		['buy_price'] = 320000,													-- Preço para comprar este mercado
		['sell_price'] = 200000,												-- Preço para vender este mercado
		['coord'] = {1736.55,6419.5,35.04},									    -- Coordenadas para abrir o menu
		['garage_coord'] = {1727.88,6407.05,34.34,147.05},						-- Coordenadas de garagem, onde os caminhões irão spawnar (coordenadas compostas por x, y, z, h)
		['sell_blip_coords'] = {												-- As coordenadas onde os clientes irão comprar coisas nesta loja (coordenadas compostas por x, y, z)
			{1729.17,6414.99,35.04},
			{1733.31,6414.9,35.04}
		},
		['deliveryman_coord'] = {1733.3,6409.48,35.01},						     -- Coordenadas onde o entregador levará os trabalhos que você criou
		['type'] = '247store', 													 -- Insira aqui o ID do tipo de mercado
	},
	["ammunation_1"] = {
		['buy_price'] = 600000,
		['sell_price'] = 300000,
		['coord'] = {14.04,-1105.94,29.8},
		['garage_coord'] = {27.88,-1110.77,29.32,265.87},
		['sell_blip_coords'] = {
			{21.93,-1107.09,29.8}
		},
		['deliveryman_coord'] = {6.77,-1100.28,29.8},
		['type'] = 'ammunation',
	},
	["ammunation_2"] = {
		['buy_price'] = 400000,
		['sell_price'] = 300000,
		['coord'] = {-666.59,-933.58,21.83},
		['garage_coord'] = {-662.86,-952.32,21.31,87.96},
		['sell_blip_coords'] = {
			{-662.39,-935.07,21.83}
		},
		['deliveryman_coord'] = {-661.14,-944.72,21.79},
		['type'] = 'ammunation',
	},
	["ammunation_3"] = {
		['buy_price'] = 600000,
		['sell_price'] = 300000,
		['coord'] = {818.1,-2155.46,29.62},
		['garage_coord'] = {815.94,-2140.46,29.3,356.86},
		['sell_blip_coords'] = {
			{810.23,-2157.53,29.62}
		},
		['deliveryman_coord'] = {815.47,-2147.44,29.43},
		['type'] = 'ammunation',
	},
	["ammunation_4"] = {
		['buy_price'] = 400000,
		['sell_price'] = 300000,
		['coord'] = {846.47,-1035.18,28.31},
		['garage_coord'] = {843.61,-1018.11,27.55,356.99},
		['sell_blip_coords'] = {
			{842.29,-1033.94,28.2}
		},
		['deliveryman_coord'] = {840.85,-1022.02,27.54},
		['type'] = 'ammunation',
	},
	["ammunation_5"] = {
		['buy_price'] = 400000,
		['sell_price'] = 300000,
		['coord'] = {-1303.14,-390.4,36.7},
		['garage_coord'] = {-1322.38,-393.96,36.44,26.03},
		['sell_blip_coords'] = {
			{-1305.41,-394.17,36.7}
		},
		['deliveryman_coord'] = {-1315.67,-392.9,36.59},
		['type'] = 'ammunation',
	},
	["ammunation_6"] = {
		['buy_price'] = 400000,
		['sell_price'] = 300000,
		['coord'] = {255.15,-46.42,69.95},
		['garage_coord'] = {238.65,-33.96,69.73,161.45},
		['sell_blip_coords'] = {
			{252.55,-50.08,69.95}
		},
		['deliveryman_coord'] = {244.38,-43.17,69.9},
		['type'] = 'ammunation',
	},
	["ammunation_7"] = {
		['buy_price'] = 320000,
		['sell_price'] = 200000,
		['coord'] = {2572.26,292.7,108.74},
		['garage_coord'] = {2567.21,312.89,108.47,1.11},
		['sell_blip_coords'] = {
			{2568.06,293.96,108.74}
		},
		['deliveryman_coord'] = {2566.73,303.76,108.61},
		['type'] = 'ammunation',
	},
	["ammunation_8"] = {
		['buy_price'] = 320000,
		['sell_price'] = 200000,
		['coord'] = {-3175.13,1084.39,20.84},
		['garage_coord'] = {-3158.78,1080.94,20.7,277.67},
		['sell_blip_coords'] = {
			{-3172.3,1087.83,20.84}
		},
		['deliveryman_coord'] = {-3162.59,1085.29,20.85},
		['type'] = 'ammunation',
	},
	["ammunation_9"] = {
		['buy_price'] = 220000,
		['sell_price'] = 100000,
		['coord'] = {-1122.09,2696.79,18.56},
		['garage_coord'] = {-1113.18,2686.38,18.64,219.39},
		['sell_blip_coords'] = {
			{-1118.19,2698.64,18.56}
		},
		['deliveryman_coord'] = {-1114.59,2688.71,18.61},
		['type'] = 'ammunation',
	},
	["ammunation_10"] = {
		['buy_price'] = 220000,
		['sell_price'] = 100000,
		['coord'] = {1689.42,3757.69,34.71},
		['garage_coord'] = {1704.46,3750.05,34.06,226.43},
		['sell_blip_coords'] = {
			{1693.19,3759.97,34.71}
		},
		['deliveryman_coord'] = {1701.42,3754.37,34.35},
		['type'] = 'ammunation',
	},
	["ammunation_11"] = {
		['buy_price'] = 220000,
		['sell_price'] = 100000,
		['coord'] = {-334.53,6081.87,31.46},
		['garage_coord'] = {-332.24,6066.54,31.21,225.97},
		['sell_blip_coords'] = {
			{-330.66,6084.01,31.46}
		},
		['deliveryman_coord'] = {-322.51,6077.36,31.25},
		['type'] = 'ammunation',
	},
	["pharmacy_1"] = {															-- ID
		['buy_price'] = 350000,													-- Preço para comprar este mercado
		['sell_price'] = 150000,												-- Preço para vender este mercado
		['coord'] = {67.21,-1572.08,29.6},										-- Coordenadas para abrir o menu
		['garage_coord'] = {66.87,-1561.8,29.47,49.23},							-- Coordenadas de garagem, onde os caminhões irão spawnar (coordenadas compostas por x, y, z, h)
		['sell_blip_coords'] = {												-- As coordenadas onde os clientes irão comprar coisas nesta loja (coordenadas compostas por x, y, z)
			{69.08,-1569.84,29.6}
		},
		['deliveryman_coord'] = {71.04,-1566.96,29.6},							-- Coordenadas onde o entregador levará os trabalhos que você criou
		['type'] = 'pharmacystore', 											-- Insira aqui o ID do tipo de mercado
	},
	["pharmacy_2"] = {															-- ID
		['buy_price'] = 65000,													-- Preço para comprar este mercado
		['sell_price'] = 315000,												-- Preço para vender este mercado
		['coord'] = {-179.95,6386.12,31.5},										-- Coordenadas para abrir o menu
		['garage_coord'] = {-167.5,6377.59,31.33,130.81},						-- Coordenadas de garagem, onde os caminhões irão spawnar (coordenadas compostas por x, y, z, h)
		['sell_blip_coords'] = {												-- As coordenadas onde os clientes irão comprar coisas nesta loja (coordenadas compostas por x, y, z)
			{-176.33,6383.72,31.5},
			{-170.43,6386.97,31.5}
		},
		['deliveryman_coord'] = {-174.51,6379.39,31.48},						-- Coordenadas onde o entregador levará os trabalhos que você criou
		['type'] = 'pharmacystore', 											-- Insira aqui o ID do tipo de mercado
	},
	["digitalden_1"] = {														-- ID
		['buy_price'] = 650000,												-- Preço para comprar este mercado
		['sell_price'] = 320000,												-- Preço para vender este mercado
		['coord'] = {-659.34,-861.7,24.5},									-- Coordenadas para abrir o menu
		['garage_coord'] = {-647.85,-861.33,24.48,180.41},						-- Coordenadas de garagem, onde os caminhões irão spawnar (coordenadas compostas por x, y, z, h)
		['sell_blip_coords'] = {												-- As coordenadas onde os clientes irão comprar coisas nesta loja (coordenadas compostas por x, y, z)
			{-656.7,-857.46,24.5}
		},
		['deliveryman_coord'] = {-654.64,-859.17,24.51},						-- Coordenadas onde o entregador levará os trabalhos que você criou
		['type'] = 'digitalden', 												-- Insira aqui o ID do tipo de mercado
	},
	["megamall_1"] = {																-- ID
		['buy_price'] = 730000,													-- Preço para comprar este mercado
		['sell_price'] = 350000,												-- Preço para vender este mercado
		['coord'] = {46.49,-1749.44,29.64},										-- Coordenadas para abrir o menu
		['garage_coord'] = {49.49,-1741.45,29.31,51.52},						-- Coordenadas de garagem, onde os caminhões irão spawnar (coordenadas compostas por x, y, z, h)
		['sell_blip_coords'] = {												-- As coordenadas onde os clientes irão comprar coisas nesta loja (coordenadas compostas por x, y, z)
			{55.26,-1739.32,29.6},
			{63.93,-1729.07,29.65}
		},
		['deliveryman_coord'] = {48.26,-1747.0,29.31},						-- Coordenadas onde o entregador levará os trabalhos que você criou
		['type'] = 'megamall', 												-- Insira aqui o ID do tipo de mercado
	},
	["megamall_2"] = {																-- ID
		['buy_price'] = 430000,													-- Preço para comprar este mercado
		['sell_price'] = 210000,												-- Preço para vender este mercado
		['coord'] = {2748.79,3476.39,55.68},										-- Coordenadas para abrir o menu
		['garage_coord'] = {2761.1,3454.79,55.83,60.89},						-- Coordenadas de garagem, onde os caminhões irão spawnar (coordenadas compostas por x, y, z, h)
		['sell_blip_coords'] = {												-- As coordenadas onde os clientes irão comprar coisas nesta loja (coordenadas compostas por x, y, z)
			{2746.05,3469.6,55.68},
			{2747.37,3473.06,55.68}
		},
		['deliveryman_coord'] = {2747.37,3465.68,55.7},						-- Coordenadas onde o entregador levará os trabalhos que você criou
		['type'] = 'megamall', 												-- Insira aqui o ID do tipo de mercado
	}
}

-- Aqui você configura cada tipo de mercado disponível para compra
Config.market_types = {
	['247store'] = {							-- ID do tipo de mercado
		['stock_capacity'] = 600,				-- Capacidade máxima de estoque
		['upgrades'] = {						-- Definição de cada upgrade
			['stock'] = {						-- Capacidade de estoque
				['price'] = 11000,				-- Preço
				['level_reward'] = {			-- Recompensa de cada nível (nível máximo: 5)
					[0] = 0,
					[1] = 30,
					[2] = 60,
					[3] = 120,
					[4] = 240,
					[5] = 480,
				}
			},
			['truck'] = {						-- Capacidade do caminhão
				['price'] = 8000,
				['level_reward'] = {
					[0] = 0,
					[1] = 5,
					[2] = 10,
					[3] = 15,
					[4] = 20,
					[5] = 25,
				}
			},
			['relationship'] = {				-- Relação
				['price'] = 10000,
				['level_reward'] = {
					[0] = 0,
					[1] = 5,
					[2] = 10,
					[3] = 15,
					[4] = 20,
					[5] = 25,
				}
			},
		},
		['market_items'] = {						-- Aqui você configura as definições dos itens
			['energetic'] = {						-- O ID do item
				['name'] = "Energetico",			-- O nome de exibição do item
				['price_to_customer'] = 50,			-- Preço que o cliente pagará ao comprar o produto na loja
				['price_to_owner'] = 17,			-- Preço que o dono da loja deve pagar ao importar mercadorias para sua loja
				['amount_to_owner'] = 15,			-- Quantidade de mercadorias que o proprietário receberá ao importar para a loja (este valor pode ser aumentado se ele aumentar a capacidade do caminhão)
				['amount_to_delivery'] = 15,		-- Quantidade máxima de mercadorias que o proprietário pode definir ao criar um trabalho para o entregador
				['page'] = 0						-- Defina em qual página este item aparecerá
			},
			['absolut'] = {
				['name'] = "Absolut",
				['price_to_customer'] = 40,
				['price_to_owner'] = 16,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 0
			},
			['chandon'] = {
				['name'] = "Chandon",
				['price_to_customer'] = 45,
				['price_to_owner'] = 15,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 0
			},
			['water'] = {
				['name'] = "Agua",
				['price_to_customer'] = 60,
				['price_to_owner'] = 25,
				['amount_to_owner'] = 27,
				['amount_to_delivery'] = 27,
				['page'] = 0
			},
			['cola'] = {
				['name'] = "Refrigerante de Cola",
				['price_to_customer'] = 15,
				['price_to_owner'] = 7,
				['amount_to_owner'] = 27,
				['amount_to_delivery'] = 27,
				['page'] = 0
			},
			['dewars'] = {
				['name'] = "Dewars",
				['price_to_customer'] = 25,
				['price_to_owner'] = 12,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 0
			},
			['hennessy'] = {
				['name'] = "Hennessy",
				['price_to_customer'] = 30,
				['price_to_owner'] = 14,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 0
			},
			['chocolate'] = {
				['name'] = "Chocolate",
				['price_to_customer'] = 10,
				['price_to_owner'] = 3,
				['amount_to_owner'] = 60,
				['amount_to_delivery'] = 60,
				['page'] = 0
			},
			['sandwich'] = {
				['name'] = "Sandwich",
				['price_to_customer'] = 18,
				['price_to_owner'] = 7,
				['amount_to_owner'] = 40,
				['amount_to_delivery'] = 40,
				['page'] = 0
			},
			['backpackp'] = {
				['name'] = "Mochila P",
				['price_to_customer'] = 5000,
				['price_to_owner'] = 2100,
				['amount_to_owner'] = 5,
				['amount_to_delivery'] = 5,
				['page'] = 1
			},
			['backpackm'] = {
				['name'] = "Mochila M",
				['price_to_customer'] = 10000,
				['price_to_owner'] = 4300,
				['amount_to_owner'] = 5,
				['amount_to_delivery'] = 5,
				['page'] = 1
			},
			['backpackg'] = {
				['name'] = "Mochila G",
				['price_to_customer'] = 15000,
				['price_to_owner'] = 7000,
				['amount_to_owner'] = 5,
				['amount_to_delivery'] = 5,
				['page'] = 1
			},
			['backpackx'] = {
				['name'] = "Mochila X",
				['price_to_customer'] = 20000,
				['price_to_owner'] = 8500,
				['amount_to_owner'] = 5,
				['amount_to_delivery'] = 5,
				['page'] = 1
			},
			['emptybottle '] = {
				['name'] = "Garrafa vazia",
				['price_to_customer'] = 75,
				['price_to_owner'] = 34,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 2
			},
			['lighter'] = {
				['name'] = "Isqueiro",
				['price_to_customer'] = 500,
				['price_to_owner'] = 200,
				['amount_to_owner'] = 5,
				['amount_to_delivery'] = 5,
				['page'] = 2
			},
			['pao'] = {
				['name'] = "pao",
				['price_to_customer'] = 3,
				['price_to_owner'] = 1,
				['amount_to_owner'] = 5,
				['amount_to_delivery'] = 5,
				['page'] = 3
			},
			['mussarela'] = {
				['name'] = "Mussarela",
				['price_to_customer'] = 3,
				['price_to_owner'] = 1,
				['amount_to_owner'] = 5,
				['amount_to_delivery'] = 5,
				['page'] = 3
			},
			['carne'] = {
				['name'] = "Carne",
				['price_to_customer'] = 3,
				['price_to_owner'] = 1,
				['amount_to_owner'] = 5,
				['amount_to_delivery'] = 5,
				['page'] = 3
			},
			['alface'] = {
				['name'] = "Alface",
				['price_to_customer'] = 3,
				['price_to_owner'] = 1,
				['amount_to_owner'] = 5,
				['amount_to_delivery'] = 5,
				['page'] = 3
			},
			['tomate'] = {
				['name'] = "Tomate",
				['price_to_customer'] = 3,
				['price_to_owner'] = 1,
				['amount_to_owner'] = 5,
				['amount_to_delivery'] = 5,
				['page'] = 3
			},
			['salsicha'] = {
				['name'] = "Salsicha",
				['price_to_customer'] = 3,
				['price_to_owner'] = 1,
				['amount_to_owner'] = 5,
				['amount_to_delivery'] = 5,
				['page'] = 3
			},
			['provolone'] = {
				['name'] = "Provolone",
				['price_to_customer'] = 3,
				['price_to_owner'] = 1,
				['amount_to_owner'] = 5,
				['amount_to_delivery'] = 5,
				['page'] = 3
			},
			['cebolinha'] = {
				['name'] = "Cebolinha",
				['price_to_customer'] = 3,
				['price_to_owner'] = 1,
				['amount_to_owner'] = 5,
				['amount_to_delivery'] = 5,
				['page'] = 3
			},
			['salsinha'] = {
				['name'] = "Salsinha",
				['price_to_customer'] = 3,
				['price_to_owner'] = 1,
				['amount_to_owner'] = 5,
				['amount_to_delivery'] = 5,
				['page'] = 3
			},
			['cebola'] = {
				['name'] = "Cebola",
				['price_to_customer'] = 3,
				['price_to_owner'] = 1,
				['amount_to_owner'] = 5,
				['amount_to_delivery'] = 5,
				['page'] = 3
			},
			['soja'] = {
				['name'] = "Soja",
				['price_to_customer'] = 3,
				['price_to_owner'] = 1,
				['amount_to_owner'] = 5,
				['amount_to_delivery'] = 5,
				['page'] = 3
			},
			['cacau'] = {
				['name'] = "Cacau",
				['price_to_customer'] = 3,
				['price_to_owner'] = 1,
				['amount_to_owner'] = 5,
				['amount_to_delivery'] = 5,
				['page'] = 3
			},
			['oleo'] = {
				['name'] = "Oleo de Soja",
				['price_to_customer'] = 3,
				['price_to_owner'] = 1,
				['amount_to_owner'] = 5,
				['amount_to_delivery'] = 5,
				['page'] = 3
			},
			['batata'] = {
				['name'] = "Batata",
				['price_to_customer'] = 3,
				['price_to_owner'] = 1,
				['amount_to_owner'] = 5,
				['amount_to_delivery'] = 5,
				['page'] = 3
			}
		},
		['pagination'] = {						-- Crie páginas para seus itens de mercado (no máximo 5 páginas)
			[0] = "Comida",
			[1] = "Mochilas",
			[2] = "Utilidades",
			[3] = "Ingredientes"
		},
		['blips'] = {							-- Crie os blips no mapa
			['id'] = 52,						-- ID do Blip [Defina este valor como 0 para não ter blip]
			['name'] = "Mercado",				-- Nome do Blip
			['color'] = 2,						-- Cor do Blip
			['scale'] = 0.5,					-- Escala do Blip
		}
	},

	['pharmacystore'] = {						-- ID do tipo de mercado
		['stock_capacity'] = 650,				-- Capacidade máxima de estoque
		['upgrades'] = {						-- Definição de cada upgrade
			['stock'] = {						-- Capacidade de estoque
				['price'] = 11000,				-- Preço
				['level_reward'] = {			-- Recompensa de cada nível (nível máximo: 5)
					[0] = 0,
					[1] = 25,
					[2] = 50,
					[3] = 100,
					[4] = 200,
					[5] = 300,
				}
			},
			['truck'] = {						-- Capacidade do caminhão
				['price'] = 3000,
				['level_reward'] = {
					[0] = 0,
					[1] = 5,
					[2] = 10,
					[3] = 15,
					[4] = 20,
					[5] = 25,
				}
			},
			['relationship'] = {				-- Relação
				['price'] = 4000,
				['level_reward'] = {
					[0] = 0,
					[1] = 5,
					[2] = 10,
					[3] = 15,
					[4] = 20,
					[5] = 25,
				}
			},
		},
		['market_items'] = {					-- Aqui você configura as definições dos itens
			['gauze'] = {						-- O ID do item
				['name'] = "Gaze",				-- O nome de exibição do item
				['price_to_customer'] = 600,	-- Preço que o cliente pagará ao comprar o produto na loja
				['price_to_owner'] = 260,		-- Preço que o dono da loja deve pagar ao importar mercadorias para sua loja
				['amount_to_owner'] = 15,		-- Quantidade de mercadorias que o proprietário receberá ao importar para a loja (este valor pode ser aumentado se ele aumentar a capacidade do caminhão)
				['amount_to_delivery'] = 15,	-- Quantidade máxima de mercadorias que o proprietário pode definir ao criar um trabalho para o entregador
				['page'] = 0					-- Defina em qual página este item aparecerá
			},
			['bandage'] = {
				['name'] = "Bandagem",
				['price_to_customer'] = 450,
				['price_to_owner'] = 180,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 0
			},
			['analgesic'] = {
				['name'] = "Analgesico",
				['price_to_customer'] = 60,
				['price_to_owner'] = 26,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 0
			},
			['warfarin'] = {
				['name'] = "Kit Medico",
				['price_to_customer'] = 1600,
				['price_to_owner'] = 700,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 0
			},
			['sinkalmy'] = {
				['name'] = "Sinkalmy",
				['price_to_customer'] = 900,
				['price_to_owner'] = 370,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 0
			},
			['ritmoneury'] = {
				['name'] = "Ritmoneury",
				['price_to_customer'] = 800,
				['price_to_owner'] = 350,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 0
			},
			['adrenaline'] = {
				['name'] = "Adrenalina",
				['price_to_customer'] = 3700,
				['price_to_owner'] = 1250,
				['amount_to_owner'] = 10,
				['amount_to_delivery'] = 10,
				['page'] = 0
			}
		},
		
		['pagination'] = {						-- Crie páginas para seus itens de mercado (no máximo 5 páginas)
			[0] = "Medicamentos"
		},
		['blips'] = {							-- Crie os blips no mapa
			['id'] = 403,3,							-- ID do Blip [Defina este valor como 0 para não ter blip]
			['name'] = "Faramacia",				-- Nome do Blip
			['color'] = 2,						-- Cor do Blip
			['scale'] = 0.7,					-- Escala do Blip
		}
	},

	['megamall'] = {							-- ID do tipo de mercado
		['stock_capacity'] = 10000,				-- Capacidade máxima de estoque
		['upgrades'] = {						-- Definição de cada upgrade
			['stock'] = {						-- Capacidade de estoque
				['price'] = 11000,				-- Preço
				['level_reward'] = {			-- Recompensa de cada nível (nível máximo: 5)
					[0] = 0,
					[1] = 25,
					[2] = 50,
					[3] = 100,
					[4] = 200,
					[5] = 300,
				}
			},
			['truck'] = {						-- Capacidade do caminhão
				['price'] = 3000,
				['level_reward'] = {
					[0] = 0,
					[1] = 5,
					[2] = 10,
					[3] = 15,
					[4] = 20,
					[5] = 25,
				}
			},
			['relationship'] = {				-- Relação
				['price'] = 4000,
				['level_reward'] = {
					[0] = 0,
					[1] = 5,
					[2] = 10,
					[3] = 15,
					[4] = 20,
					[5] = 25,
				}
			},
		},
		['market_items'] = {					-- Aqui você configura as definições dos itens
		['silk'] = {
			['name'] = "Seda",
			['price_to_customer'] = 3,
			['price_to_owner'] = 1,
			['amount_to_owner'] = 5,
			['amount_to_delivery'] = 5,
			['page'] = 0
		},
		['plastic'] = {
			['name'] = "Plastico",
			['price_to_customer'] = 80,
			['price_to_owner'] = 36,
			['amount_to_owner'] = 5,
			['amount_to_delivery'] = 5,
			['page'] = 0
		},
		['glass'] = {
			['name'] = "Vidro",
			['price_to_customer'] = 80,
			['price_to_owner'] = 35,
			['amount_to_owner'] = 5,
			['amount_to_delivery'] = 5,
			['page'] = 0
		},
		['rubber'] = {
			['name'] = "Borracha",
			['price_to_customer'] = 80,
			['price_to_owner'] = 35,
			['amount_to_owner'] = 5,
			['amount_to_delivery'] = 5,
			['page'] = 0
		},
		['aluminum'] = {
			['name'] = "Aluminio",
			['price_to_customer'] = 120,
			['price_to_owner'] = 50,
			['amount_to_owner'] = 5,
			['amount_to_delivery'] = 5,
			['page'] = 0
		},
		['copper'] = {
			['name'] = "Cobre",
			['price_to_customer'] = 120,
			['price_to_owner'] = 50,
			['amount_to_owner'] = 5,
			['amount_to_delivery'] = 5,
			['page'] = 0
		},
		['paperbag'] = {
			['name'] = "Saco de Papel",
			['price_to_customer'] = 50,
			['price_to_owner'] = 20,
			['amount_to_owner'] = 5,
			['amount_to_delivery'] = 5,
			['page'] = 0
		},
		['folhadepapel'] = {
			['name'] = "Folha de Papel",
			['price_to_customer'] = 30,
			['price_to_owner'] = 13,
			['amount_to_owner'] = 5,
			['amount_to_delivery'] = 5,
			['page'] = 0
		},
		['glue'] = {
			['name'] = "Cola",
			['price_to_customer'] = 30,
			['price_to_owner'] = 13,
			['amount_to_owner'] = 5,
			['amount_to_delivery'] = 5,
			['page'] = 0
		},
		['rope'] = {
			['name'] = "Corda",
			['price_to_customer'] = 500,
			['price_to_owner'] = 200,
			['amount_to_owner'] = 5,
			['amount_to_delivery'] = 5,
			['page'] = 3
		},
		['firecracker'] = {
			['name'] = "Fogos de Artificio",
			['price_to_customer'] = 200,
			['price_to_owner'] = 70,
			['amount_to_owner'] = 5,
			['amount_to_delivery'] = 5,
			['page'] = 3
		}

	},	
		['pagination'] = {						-- Crie páginas para seus itens de mercado (no máximo 5 páginas)
			[0] = "Diversos"
		},
		['blips'] = {							-- Crie os blips no mapa
			['id'] = 78,						-- ID do Blip [Defina este valor como 0 para não ter blip]
			['name'] = "MegaMall",				-- Nome do Blip
			['color'] = 51,						-- Cor do Blip
			['scale'] = 0.5,					-- Escala do Blip
		}
	},

	['burguershot'] = {							-- ID do tipo de mercado
		['stock_capacity'] = 800,				-- Capacidade máxima de estoque
		['upgrades'] = {						-- Definição de cada upgrade
			['stock'] = {						-- Capacidade de estoque
				['price'] = 11000,				-- Preço
				['level_reward'] = {			-- Recompensa de cada nível (nível máximo: 5)
					[0] = 0,
					[1] = 25,
					[2] = 50,
					[3] = 100,
					[4] = 200,
					[5] = 300,
				}
			},
			['truck'] = {						-- Capacidade do caminhão
				['price'] = 3000,
				['level_reward'] = {
					[0] = 0,
					[1] = 5,
					[2] = 10,
					[3] = 15,
					[4] = 20,
					[5] = 25,
				}
			},
			['relationship'] = {				-- Relação
				['price'] = 4000,
				['level_reward'] = {
					[0] = 0,
					[1] = 5,
					[2] = 10,
					[3] = 15,
					[4] = 20,
					[5] = 25,
				}
			},
		},
		['market_items'] = {					-- Aqui você configura as definições dos itens
			['xmoneyshot'] = {					-- O ID do item
				['name'] = "Money Shot",		-- O nome de exibição do item
				['price_to_customer'] = 320,	-- Preço que o cliente pagará ao comprar o produto na loja
				['price_to_owner'] = 100,		-- Preço que o dono da loja deve pagar ao importar mercadorias para sua loja
				['amount_to_owner'] = 15,		-- Quantidade de mercadorias que o proprietário receberá ao importar para a loja (este valor pode ser aumentado se ele aumentar a capacidade do caminhão)
				['amount_to_delivery'] = 15,	-- Quantidade máxima de mercadorias que o proprietário pode definir ao criar um trabalho para o entregador
				['page'] = 0					-- Defina em qual página este item aparecerá
			},
			['xtorpedo'] = {
				['name'] = "Torpedo",
				['price_to_customer'] = 400,
				['price_to_owner'] = 180,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 0
			},
			['xsalada'] = {
				['name'] = "X salada",
				['price_to_customer'] = 60,
				['price_to_owner'] = 26,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 0
			},
			['xblender'] = {
				['name'] = "Blender",
				['price_to_customer'] = 1600,
				['price_to_owner'] = 700,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 0
			},
			['hotdog'] = {
				['name'] = "Hot dog",
				['price_to_customer'] = 40,
				['price_to_owner'] = 15,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 0
			},
			['fries'] = {
				['name'] = "Batata Frita",
				['price_to_customer'] = 50,
				['price_to_owner'] = 20,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 0
			},
			['soda'] = {
				['name'] = "Refrigerante de Soda",
				['price_to_customer'] = 15,
				['price_to_owner'] = 5,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 1
			},
			['cola'] = {
				['name'] = "Refrigerante de Cola",
				['price_to_customer'] = 15,
				['price_to_owner'] = 5,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 1
			},
			['orangejuice'] = {
				['name'] = "Suco de Laranja",
				['price_to_customer'] = 35,
				['price_to_owner'] = 10,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 1
			},
			['passionjuice'] = {
				['name'] = "Suco de Maracuja",
				['price_to_customer'] = 35,
				['price_to_owner'] = 10,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 1
			},
			['strawberryjuice'] = {
				['name'] = "Suco de Maracuja",
				['price_to_customer'] = 35,
				['price_to_owner'] = 10,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 1
			},
			['tangejuice'] = {
				['name'] = "Suco de Tangerina",
				['price_to_customer'] = 35,
				['price_to_owner'] = 10,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 1
			},
			['grapejuice'] = {
				['name'] = "Suco de Uva",
				['price_to_customer'] = 35,
				['price_to_owner'] = 10,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 1
			}
		},
		['pagination'] = {						-- Crie páginas para seus itens de mercado (no máximo 5 páginas)
			[0] = "Lanches",
			[1] = "Bebidas"
		},
		['blips'] = {							-- Crie os blips no mapa
			['id'] = 0,						-- ID do Blip [Defina este valor como 0 para não ter blip]
			['name'] = "Mercado",				-- Nome do Blip
			['color'] = 4,						-- Cor do Blip
			['scale'] = 0.5,					-- Escala do Blip
		}
	},

	['digitalden'] = {							-- ID do tipo de mercado
		['stock_capacity'] = 800,				-- Capacidade máxima de estoque
		['upgrades'] = {						-- Definição de cada upgrade
			['stock'] = {						-- Capacidade de estoque
				['price'] = 11000,				-- Preço
				['level_reward'] = {			-- Recompensa de cada nível (nível máximo: 5)
					[0] = 0,
					[1] = 25,
					[2] = 50,
					[3] = 100,
					[4] = 200,
					[5] = 300,
				}
			},
			['truck'] = {						-- Capacidade do caminhão
				['price'] = 3000,
				['level_reward'] = {
					[0] = 0,
					[1] = 5,
					[2] = 10,
					[3] = 15,
					[4] = 20,
					[5] = 25,
				}
			},
			['relationship'] = {				-- Relação
				['price'] = 4000,
				['level_reward'] = {
					[0] = 0,
					[1] = 5,
					[2] = 10,
					[3] = 15,
					[4] = 20,
					[5] = 25,
				}
			},
		},
		['market_items'] = {					-- Aqui você configura as definições dos itens
			['radio'] = {						-- O ID do item
				['name'] = "Radio",				-- O nome de exibição do item
				['price_to_customer'] = 1200,	-- Preço que o cliente pagará ao comprar o produto na loja
				['price_to_owner'] = 600,		-- Preço que o dono da loja deve pagar ao importar mercadorias para sua loja
				['amount_to_owner'] = 15,		-- Quantidade de mercadorias que o proprietário receberá ao importar para a loja (este valor pode ser aumentado se ele aumentar a capacidade do caminhão)
				['amount_to_delivery'] = 15,	-- Quantidade máxima de mercadorias que o proprietário pode definir ao criar um trabalho para o entregador
				['page'] = 0					-- Defina em qual página este item aparecerá
			},
			['cellphone'] = {
				['name'] = "Cellphone",
				['price_to_customer'] = 2000,
				['price_to_owner'] = 900,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 0
			},
			['notebook'] = {
				['name'] = "Notebook",
				['price_to_customer'] = 2000,
				['price_to_owner'] = 900,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 0
			},
			['binoculars'] = {
				['name'] = "Binoculo",
				['price_to_customer'] = 500,
				['price_to_owner'] = 200,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 0
			},
			['camera'] = {
				['name'] = "Camera",
				['price_to_customer'] = 500,
				['price_to_owner'] = 200,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 0
			},
			['vape'] = {
				['name'] = "Vape",
				['price_to_customer'] = 30000,
				['price_to_owner'] = 12000,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 0
			}
		},
		['pagination'] = {						-- Crie páginas para seus itens de mercado (no máximo 5 páginas)
			[0] = "Eletronicos"
		},
		['blips'] = {							-- Crie os blips no mapa
			['id'] =  521,						-- ID do Blip [Defina este valor como 0 para não ter blip]
			['name'] = "Eletronicos",			-- Nome do Blip
			['color'] = 2,						-- Cor do Blip
			['scale'] = 0.6,					-- Escala do Blip
		}
	},

	['cacastore'] = {							-- ID do tipo de mercado
		['stock_capacity'] = 800,				-- Capacidade máxima de estoque
		['upgrades'] = {						-- Definição de cada upgrade
			['stock'] = {						-- Capacidade de estoque
				['price'] = 11000,				-- Preço
				['level_reward'] = {			-- Recompensa de cada nível (nível máximo: 5)
					[0] = 0,
					[1] = 25,
					[2] = 50,
					[3] = 100,
					[4] = 200,
					[5] = 300,
				}
			},
			['truck'] = {						-- Capacidade do caminhão
				['price'] = 3000,
				['level_reward'] = {
					[0] = 0,
					[1] = 5,
					[2] = 10,
					[3] = 15,
					[4] = 20,
					[5] = 25,
				}
			},
			['relationship'] = {				-- Relação
				['price'] = 4000,
				['level_reward'] = {
					[0] = 0,
					[1] = 5,
					[2] = 10,
					[3] = 15,
					[4] = 20,
					[5] = 25,
				}
			},
		},
		['market_items'] = {					-- Aqui você configura as definições dos itens
			['WEAPON_MUSKET'] = {						-- O ID do item
				['name'] = "Mosquete",				-- O nome de exibição do item
				['price_to_customer'] = 5000,	-- Preço que o cliente pagará ao comprar o produto na loja
				['price_to_owner'] = 2000,		-- Preço que o dono da loja deve pagar ao importar mercadorias para sua loja
				['amount_to_owner'] = 15,		-- Quantidade de mercadorias que o proprietário receberá ao importar para a loja (este valor pode ser aumentado se ele aumentar a capacidade do caminhão)
				['amount_to_delivery'] = 15,	-- Quantidade máxima de mercadorias que o proprietário pode definir ao criar um trabalho para o entregador
				['page'] = 0					-- Defina em qual página este item aparecerá
			},
			['WEAPON_MUSKET_AMMO'] = {
				['name'] = "Munição de Mosquete",
				['price_to_customer'] = 2,
				['price_to_owner'] = 1,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 0
			},
			['divingsuit'] = {
				['name'] = "Roupa de Mergulho",
				['price_to_customer'] = 5000,
				['price_to_owner'] = 2000,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 1
			},
			['fishingrod'] = {
				['name'] = "Vara de Pesca",
				['price_to_customer'] = 3500,
				['price_to_owner'] = 1200,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 1
			},
			['bait'] = {
				['name'] = "Isca",
				['price_to_customer'] = 10,
				['price_to_owner'] = 5,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 1
			}
		},
		['pagination'] = {						-- Crie páginas para seus itens de mercado (no máximo 5 páginas)
			[0] = "caça",
			[1] = "pesca"
		},
		['blips'] = {							-- Crie os blips no mapa
			['id'] =  141,						-- ID do Blip [Defina este valor como 0 para não ter blip]
			['name'] = "Caça e Acessorios",			-- Nome do Blip
			['color'] = 25,						-- Cor do Blip
			['scale'] = 0.6,					-- Escala do Blip
		}
	},

	['sementestore'] = {						-- ID do tipo de mercado
		['stock_capacity'] = 800,				-- Capacidade máxima de estoque
		['upgrades'] = {						-- Definição de cada upgrade
			['stock'] = {						-- Capacidade de estoque
				['price'] = 11000,				-- Preço
				['level_reward'] = {			-- Recompensa de cada nível (nível máximo: 5)
					[0] = 0,
					[1] = 25,
					[2] = 50,
					[3] = 100,
					[4] = 200,
					[5] = 300,
				}
			},
			['truck'] = {						-- Capacidade do caminhão
				['price'] = 3000,
				['level_reward'] = {
					[0] = 0,
					[1] = 5,
					[2] = 10,
					[3] = 15,
					[4] = 20,
					[5] = 25,
				}
			},
			['relationship'] = {				-- Relação
				['price'] = 4000,
				['level_reward'] = {
					[0] = 0,
					[1] = 5,
					[2] = 10,
					[3] = 15,
					[4] = 20,
					[5] = 25,
				}
			},
		},
		['market_items'] = {				
			['sementealface'] = {
				['name'] = "Semente de Alface",
				['price_to_customer'] = 3,
				['price_to_owner'] = 1,
				['amount_to_owner'] = 5,
				['amount_to_delivery'] = 5,
				['page'] = 0
			},
			['sementesoja'] = {
				['name'] = "Semente de Soja",
				['price_to_customer'] = 3,
				['price_to_owner'] = 1,
				['amount_to_owner'] = 5,
				['amount_to_delivery'] = 5,
				['page'] = 0
			},
			['sementecacau'] = {
				['name'] = "Semente de Cacau",
				['price_to_customer'] = 3,
				['price_to_owner'] = 1,
				['amount_to_owner'] = 5,
				['amount_to_delivery'] = 5,
				['page'] = 0
			},
			['sementeorange'] = {
				['name'] = "Semente de Laranja",
				['price_to_customer'] = 3,
				['price_to_owner'] = 1,
				['amount_to_owner'] = 5,
				['amount_to_delivery'] = 5,
				['page'] = 0
			},
			['sementestrawberry'] = {
				['name'] = "Semente de Morango",
				['price_to_customer'] = 3,
				['price_to_owner'] = 1,
				['amount_to_owner'] = 5,
				['amount_to_delivery'] = 5,
				['page'] = 0
			},
			['sementecebolinha'] = {
				['name'] = "Semente de Cebolinha",
				['price_to_customer'] = 3,
				['price_to_owner'] = 1,
				['amount_to_owner'] = 5,
				['amount_to_delivery'] = 5,
				['page'] = 0
			},
			['sementesalsinha'] = {
				['name'] = "Semente de Salsinha",
				['price_to_customer'] = 3,
				['price_to_owner'] = 1,
				['amount_to_owner'] = 5,
				['amount_to_delivery'] = 5,
				['page'] = 0
			},
			['sementecebola'] = {
				['name'] = "Semente de Cebola",
				['price_to_customer'] = 3,
				['price_to_owner'] = 1,
				['amount_to_owner'] = 5,
				['amount_to_delivery'] = 5,
				['page'] = 0
			},
			['sementetomate'] = {
				['name'] = "Semente de Tomate",
				['price_to_customer'] = 3,
				['price_to_owner'] = 1,
				['amount_to_owner'] = 5,
				['amount_to_delivery'] = 5,
				['page'] = 0
			},
			['sementebatata'] = {
				['name'] = "Semente de Batata",
				['price_to_customer'] = 3,
				['price_to_owner'] = 1,
				['amount_to_owner'] = 5,
				['amount_to_delivery'] = 5,
				['page'] = 0
			},
			['sementebanana'] = {
				['name'] = "Semente de Banana",
				['price_to_customer'] = 3,
				['price_to_owner'] = 1,
				['amount_to_owner'] = 5,
				['amount_to_delivery'] = 5,
				['page'] = 0
			},
			['sementepassion'] = {
				['name'] = "Semente de Maracuja",
				['price_to_customer'] = 3,
				['price_to_owner'] = 1,
				['amount_to_owner'] = 5,
				['amount_to_delivery'] = 5,
				['page'] = 0
			},
			['bucket'] = {
				['name'] = "Balde",
				['price_to_customer'] = 200,
				['price_to_owner'] = 85,
				['amount_to_owner'] = 5,
				['amount_to_delivery'] = 5,
				['page'] = 0
			},
			['compost'] = {
				['name'] = "Adubo",
				['price_to_customer'] = 30,
				['price_to_owner'] = 12,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 0
			}		
		},
		['pagination'] = {						-- Crie páginas para seus itens de mercado (no máximo 5 páginas)
			[0] = "Sementes"
		},
		['blips'] = {							-- Crie os blips no mapa
			['id'] =  120,						-- ID do Blip [Defina este valor como 0 para não ter blip]
			['name'] = "Sementes",				-- Nome do Blip
			['color'] = 43,						-- Cor do Blip
			['scale'] = 0.6,					-- Escala do Blip
		}
	},
	
	['ammunation'] = {
		['stock_capacity'] = 700,
		['upgrades'] = {
			['stock'] = {
				['price'] = 5000,
				['level_reward'] = {
					[0] = 0,
					[1] = 30,
					[2] = 60,
					[3] = 120,
					[4] = 240,
					[5] = 480,
				}
			},
			['truck'] = {
				['price'] = 7000,
				['level_reward'] = {
					[0] = 0,
					[1] = 1,
					[2] = 2,
					[3] = 3,
					[4] = 4,
					[5] = 5,
				}
			},
			['relationship'] = {
				['price'] = 6000,
				['level_reward'] = {
					[0] = 0,
					[1] = 3,
					[2] = 5,
					[3] = 8,
					[4] = 10,
					[5] = 13,
				}
			},
		},
		['market_items'] = {
			['WEAPON_KNIFE'] = {
				['name'] = "Faca",
				['price_to_customer'] = 2000,
				['price_to_owner'] = 1000,
				['amount_to_owner'] = 4,
				['amount_to_delivery'] = 4,
				['page'] = 0
			},
			['WEAPON_DAGGER'] = {
				['name'] = "Adaga",
				['price_to_customer'] = 2000,
				['price_to_owner'] = 1000,
				['amount_to_owner'] = 4,
				['amount_to_delivery'] = 4,
				['page'] = 0
			},
			['WEAPON_KNUCKLE'] = {
				['name'] = "Soco-Inglês",
				['price_to_customer'] = 2000,
				['price_to_owner'] = 1000,
				['amount_to_owner'] = 4,
				['amount_to_delivery'] = 4,
				['page'] = 0
			},
			['WEAPON_SWITCHBLADE'] = {
				['name'] = "Canivete",
				['price_to_customer'] = 2000,
				['price_to_owner'] = 1000,
				['amount_to_owner'] = 4,
				['amount_to_delivery'] = 4,
				['page'] = 0
			},
			['WEAPON_WRENCH'] = {
				['name'] = "Chave de Grifo",
				['price_to_customer'] = 2000,
				['price_to_owner'] = 1000,
				['amount_to_owner'] = 4,
				['amount_to_delivery'] = 4,
				['page'] = 0
			},
			['WEAPON_HAMMER'] = {
				['name'] = "Martelo",
				['price_to_customer'] = 2000,
				['price_to_owner'] = 1000,
				['amount_to_owner'] = 4,
				['amount_to_delivery'] = 4,
				['page'] = 0
			},
			['WEAPON_GOLFCLUB'] = {
				['name'] = "Taco de Golf",
				['price_to_customer'] = 2000,
				['price_to_owner'] = 1000,
				['amount_to_owner'] = 4,
				['amount_to_delivery'] = 4,
				['page'] = 0
			},
			['WEAPON_CROWBAR'] = {
				['name'] = "Pé de Cabra",
				['price_to_customer'] = 2000,
				['price_to_owner'] = 1000,
				['amount_to_owner'] = 4,
				['amount_to_delivery'] = 4,
				['page'] = 0
			},
			['WEAPON_HATCHET'] = {
				['name'] = "Machado",
				['price_to_customer'] = 2000,
				['price_to_owner'] = 1000,
				['amount_to_owner'] = 4,
				['amount_to_delivery'] = 4,
				['page'] = 0
			},
			['WEAPON_BAT'] = {
				['name'] = "Taco de Beisebol",
				['price_to_customer'] = 2000,
				['price_to_owner'] = 1000,
				['amount_to_owner'] = 4,
				['amount_to_delivery'] = 4,
				['page'] = 0
			},
			['WEAPON_BOTTLE'] = {
				['name'] = "Garrafa",
				['price_to_customer'] = 2000,
				['price_to_owner'] = 1000,
				['amount_to_owner'] = 4,
				['amount_to_delivery'] = 4,
				['page'] = 0
			},
			['WEAPON_BATTLEAXE'] = {
				['name'] = "Machado de batalha",
				['price_to_customer'] = 2000,
				['price_to_owner'] = 1000,
				['amount_to_owner'] = 4,
				['amount_to_delivery'] = 4,
				['page'] = 0
			},
			['WEAPON_POOLCUE'] = {
				['name'] = "Taco de sinuca",
				['price_to_customer'] = 2000,
				['price_to_owner'] = 1000,
				['amount_to_owner'] = 4,
				['amount_to_delivery'] = 4,
				['page'] = 0
			},
			['WEAPON_STONE_HATCHET'] = {
				['name'] = "Machado de pedra",
				['price_to_customer'] = 2000,
				['price_to_owner'] = 1000,
				['amount_to_owner'] = 4,
				['amount_to_delivery'] = 4,
				['page'] = 0
			},
			['WEAPON_FLASHLIGHT'] = {
				['name'] = "Lanterna",
				['price_to_customer'] = 2000,
				['price_to_owner'] = 1000,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 0
			},
			['GADGET_PARACHUTE'] = {
				['name'] = "Paraquedas",
				['price_to_customer'] = 3000,
				['price_to_owner'] = 1000,
				['amount_to_owner'] = 15,
				['amount_to_delivery'] = 15,
				['page'] = 0
			}
		},
		['pagination'] = {
			[0] = "Armas Brancas"
		},
		['blips'] = {
			['id'] = 110,
			['name'] = "Ammunation",
			['color'] = 1,
			['scale'] = 0.6,
		}
	}
}

-- Caminhões para cada nível ao melhorar a carga do caminhão
Config.trucks = {
	[0] = 'speedo',
	[1] = 'gburrito',
	[2] = 'mule3',
	[3] = 'mule4',
	[4] = 'pounder',
	[5] = 'pounder2'
}
Config.keyToUnlockTruck = 182 	-- Tecla L

-- Locais de busca de produtos
Config.delivery_locations = {
	[1] = { -952.31, -1077.87, 2.48 },
	[2] = { -978.23, -1108.09, 2.16 },
	[3] = { -1024.49, -1139.6, 2.75 }, 
	[4] = { -1063.76, -1159.88, 2.56 }, 
	[5] = { -1001.68, -1218.78, 5.75 }, 
	[6] = { -1171.54, -1575.61, 4.51 }, 
	[7] = { -1097.94, -1673.36, 8.4 }, 
	[8] = { -1286.17, -1267.12, 4.52 }, 
	[9] = { -1335.75, -1146.55, 6.74 }, 
	[10] = { -1750.47, -697.09, 10.18 }, 
	[11] = { -1876.84, -584.39, 11.86 }, 
	[12] = { -1772.23, -378.12, 46.49 }, 
	[13] = { -1821.38, -404.97, 46.65 }, 
	[14] = { -1965.33, -296.96, 41.1 }, 
	[15] = { -3089.24, 221.49, 14.07 }, 
	[16] = { -3088.62, 392.3, 11.45 },
	[17] = { -3077.98, 658.9, 11.67 }, 
	[18] = { -3243.07, 931.84, 17.23 },
	[19] = { 1230.8, -1590.97, 53.77 }, 
	[20] = { 1286.53, -1604.26, 54.83 }, 
	[21] = { 1379.38, -1515.23, 58.24 }, 
	[22] = { 1379.38, -1515.23, 58.24 }, 
	[23] = { 1437.37, -1492.53, 63.63 }, 
	[24] = { 450.04, -1863.49, 27.77 },
	[25] = { 403.75, -1929.72, 24.75 }, 
	[26] = { 430.16, -1559.31, 32.8 }, 
	[27] = { 446.06, -1242.17, 30.29 },
	[28] = { 322.39, -1284.7, 30.57 }, 
	[29] = { 369.65, -1194.79, 31.34 },
	[30] = { 474.27, -635.05, 25.65 }, 
	[31] = { 158.87, -1215.65, 29.3 }, 
	[32] = { 154.68, -1335.62, 29.21 }, 
	[33] = { 215.54, -1461.67, 29.19 },
	[34] = { 167.46, -1709.3, 29.3 },
	[35] = { -444.47, 287.68, 83.3 }, 
	[36] = { -179.56, 314.25, 97.88 }, 
	[37] = { -16.07, 216.7, 106.75 }, 
	[38] = { 164.02, 151.87, 105.18 },
	[39] = { 840.2, -181.93, 74.19 }, 
	[40] = { 952.27, -252.17, 67.77 },
	[41] = { 1105.27, -778.84, 58.27 }, 
	[42] = { 1099.59, -345.68, 67.19 }, 
	[43] = { -1211.12, -401.56, 38.1 }, 
	[44] = { -1302.69, -271.32, 40.0 }, 
	[45] = { -1468.65, -197.3, 48.84 }, 
	[46] = { -1583.18, -265.78, 48.28 }, 
	[47] = { -603.96, -774.54, 25.02 },
	[48] = { -805.14, -959.54, 18.13 }, 
	[49] = { -325.07, -1356.35, 31.3 }, 
	[50] = { -321.94, -1545.74, 31.02 }, 
	[51] = { -428.95, -1728.13, 19.79 }, 
	[52] = { -582.38, -1743.65, 22.44 }, 
	[53] = { -670.43, -889.09, 24.5 },
	[54] = { 1691.4, 3866.21, 34.91 }, 
	[55] = { 1837.93, 3907.12, 33.26 },
	[56] = { 1937.08, 3890.89, 32.47}, 
	[57] = { 2439.7, 4068.45, 38.07 },
	[58] = { 2592.26, 4668.98, 34.08 }, 
	[59] = { 1961.53, 5184.91, 47.98 },
	[60] = { 2258.59, 5165.84, 59.12 }, 
	[61] = { 1652.7, 4746.1, 42.03 },
	[62] = { -359.09, 6062.05, 31.51 }, 
	[63] = { -160.13, 6432.2, 31.92 },
	[64] = { 33.33, 6673.27, 32.19 }, 
	[65] = { 175.03, 6643.14, 31.57 },
	[66] = { 22.8, 6488.44, 31.43 }, 
	[67] = { 64.39, 6309.17, 31.38 },
	[68] = { 122.42, 6406.02, 31.37 }, 
	[69] = { 1681.2, 6429.11, 32.18 },
	[70] = { 2928.01, 4474.74, 48.04 }, 
	[71] = { 2709.92, 3454.83, 56.32 },
	[72] = { -688.75, 5788.9, 17.34 }, 
	[73] = { -436.13, 6154.93, 31.48 },
	[74] = { -291.09, 6185.0, 31.49 }, 
	[75] = { 405.31, 6526.38, 27.69 },
	[76] = { -20.38, 6567.13, 31.88 }, 
	[77] = { -368.06, 6341.4, 29.85 },
	[78] = { 1842.89, 3777.72, 33.16 }, 
	[79] = { 1424.82, 3671.73, 34.18 },
	[80] = { 996.54, 3575.55, 34.62 }, 
	[81] = { 1697.52, 3596.14, 35.56 },
	[82] = { 2415.05, 5005.35, 46.68 }, 
	[83] = { 2336.21, 4859.41, 41.81},
	[84] = { 1800.9, 4616.07, 37.23 },
	[85] = { -453.3, 6336.9, 13.11 },
	[86] = { -425.4, 6356.43, 13.33 },
	[87] = { -481.9, 6276.47, 13.42 },
	[88] = { -693.92, 5761.95, 17.52 },
	[89] = { -682.03, 5770.96, 17.52 },
	[90] = { -379.44, 6062.07, 31.51 },
	[91] = { -105.68, 6528.7, 30.17 },
	[92] = { 35.02, 6662.61, 32.2 },
	[93] = { 126.41, 6353.64, 31.38 },
	[94] = { 48.15, 6305.99, 31.37 },
	[95] = { 1417.68, 6343.83, 24.01 },
	[96] = { 1510.21, 6326.28, 24.61 },
	[97] = { 1698.22, 6425.66, 32.77 },
	[98] = { 2434.69, 5011.7, 46.84 },
	[99] = { 1718.88, 4677.32, 43.66 },
	[100] = { 1673.21, 4958.09, 42.35 },
	[101] = { 1364.33, 4315.43, 37.67 },
	[102] = { -1043.6, 5326.84, 44.58 },
	[103] = { -329.63, 6150.58, 32.32 },
	[104] = { -374.41, 6191.04, 31.73 },
	[105] = { -356.63, 6207.34, 31.85 },
	[106] = { -347.15, 6224.69, 31.7 },
	[107] = { -315.61, 6194.0, 31.57 },
	[108] = { -33.3, 6455.87, 31.48 },
	[109] = { 405.52, 6526.59, 27.7 },
	[110] = { 1470.41, 6513.71, 21.23 },
	[111] = { 1593.73, 6460.56, 25.32 },
	[112] = { 1741.31, 6420.19, 35.05 }
}