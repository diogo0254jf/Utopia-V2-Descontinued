var selectPage = "rules";
var reversePage = "rules";
/* ---------------------------------------------------------------------------------------------------------------- */
$(document).ready(function(){
	rulesPage();

	window.addEventListener("message",function(event){
		switch (event["data"]["action"]){
			case "openSystem":
				$("#mainPage").fadeIn(100);
			break;

			case "closeSystem":
				$("#mainPage").fadeOut(100);
			break;

			case "messageTwitter":
				updateMedia(event["data"]["data"]);
			break;

			case "messageEbay":
				updateEbay();
			break;

			case "updatePossuidos":
				updatePossuidos();
			break;

			case 'updateCarros':
				updateCarros();
			break;

			case 'updateMotos':
				updateMotos();
			break;

			case "aboutPage":
				aboutPage();
			break;
		};
	});

	document.onkeyup = function(data){
		if (data["which"] == 27){
			$.post("http://tablet/closeSystem");
		};
	};
});
/* ---------------------------------------------------------------------------------------------------------------- */
$(document).on("click","#mainMenu li",function(){
	if (selectPage != reversePage){
		let isActive = $(this).hasClass("active");
		$("#mainMenu li").removeClass("active");
		if (!isActive){
			$(this).addClass("active");
			reversePage = selectPage;
		};
	};
});
/* ---------------------------------------------------------------------------------------------------------------- */
const commandsPage = () => {
	selectPage = "commands";

	$("#content").html(`
		<div id="titleContent">PRINCIPAIS</div>
		<div id="pageDiv">
			<b>/vehs</b> - Lista de seus veículos<br>
			<b>/servico</b> - Entra e sair de serviço<br>
			<b>/procurado</b> - Verifica o nível de procurado<br>
			<b>/outfit</b> - Colocar/Retirar roupas<br>
			<b>/repouso</b> - Verifica seu repouso<br>
			<b>/andar x</b> - Modifica o modo de andar<br>
			<b>/entrar</b> - Entrar em uma propriedade
		</div>
		<div id="pageDiv">
			<b>/wins 1/0</b> - Abrir/Fechar os vidros do veículo<br>
			<b>/chapeu 1/0</b> - Para colocar/retirar um chapéu<br>
			<b>/oculos 1/0</b> - Para colocar/retirar um óculos<br>
			<b>/mascara 1/0</b> - Para colocar/retirar uma máscara<br>
			<b>/me</b> - Efetuar uma animação não existente<br>
			<b>/fatura</b> - Cria uma fatura para o cliente<br>
			<b>/desmanche</b> - Visualiza a lista do desmanche
		</div>
		<div id="pageDiv">
			<b>/tow</b> - Colocar o veículo na prancha<br>
			<b>/vtuning</b> - Verifica informações do veículo<br>
			<b>/debug</b> - Recarrega os dados do personagem<br>
			<b>/limbo</b> - Utilizado quando cair no limbo e morrer<br>
			<b>/chat</b> - Ativa/Desativa o chat<br>
			<b>/seat x</b> - Trocar de assento nos veículos<br>
			<b>/props</b> - Mostra todas as propriedades existentes
		</div>

		<div id="divContent"></div>

		<div id="titleContent">BOTÕES DE ATALHO</div>
		<div id="pageDiv">
			<b>F1</b> - Abrir tablet<br>
			<b>F2</b> - Abrir registro de chamados.<br>
			<b>F4</b> - Abrir console do veículo.<br>
			<b>F6</b> - Cancela qualquer animação ativa
		</div>
		<div id="pageDiv">
			<b>ARROW UP</b> - Saudação<br>
			<b>ARROW DOWN</b> - Assobiar<br>
			<b>ARROW LEFT</b> - Joia<br>
			<b>ARROW RIGHT</b> - Facepalm
		</div>
		<div id="pageDiv">
			<b>HOME</b> - Muda a distancia de falar<br>
			<b>B</b> - Apontar com o dedo<br>
			<b>Z</b> - Liga/Desliga motor e Agachar-se<br>
			<b>X</b> - Levanta as mãos
		</div>

		<div id="divContent"></div>

		<div id="titleContent">ANIMAÇÕES ANDANDO</div>
		<div id="pageDiv">
			<b>/e caixa</b> - Segurar uma caixa na mão<br>
			<b>/e cafe</b> - Segurar um copo de café<br>
			<b>/e cafe2</b> - Segurar e beber um copo de café<br>
			<b>/e anotar</b> - Anotações em uma caderneta<br>
			<b>/e binoculos</b> - Para usar um binóculo<br>
			<b>/e camera</b> - Para pegar uma câmera fotográfica<br>
			<b>/e camera2</b> - Para pegar uma filmadora<br>
			<b>/e mapa</b> - Olhar para o mapa da cidade<br>
			<b>/e selfie</b> - Pegar o celular para tirar uma selfie<br>
			<b>/e selfie2</b> - Pegar o celular para tirar uma selfie<br>
			<b>/e chuva</b> - Usar guarda-chuva<br>
			<b>/e chuva2</b> - Usar guarda-chuva<br>
			<b>/e peace</b> - Saudar a pessoa com um paz e amor<br>
			<b>/e lero</b> - Balaçar as mãos<br>
			<b>/e beijo</b> - Mandar um beijo<br>
			<b>/e pano</b> - Limpa o veículo mais próximo<br>
			<b>/e limpar</b> - Limpar a roupa<br>
			<b>/e alongar2</b> - Alongar-se<br>
			<b>/e cuidar2</b> - Cuidar do paciente<br>
			<b>/e verificar</b> - Verificar corpo<br>
			<b>/e prebeber3</b> - Segurar bebida<br>
			<b>/e bolsa</b> - Segurar bolsa na mão<br>
			<b>/e bolsa4</b> - Segurar bolsa na mão<br>
			<b>/e nervoso</b> - Ficar nervoso<br>
			<b>/e argue</b> - Breve uma descrição do mesmo<br>
			<b>/e bird</b> - Breve uma descrição do mesmo<br>
			<b>/e blowkiss</b> - Breve uma descrição do mesmo
		</div>
		<div id="pageDiv">
			<b>/e digitar</b> - Digitar no computador de uma mesa<br>
			<b>/e postura</b> - Postura com mãos no cinto<br>
			<b>/e postura2</b> - Postura com mãos no cinto<br>
			<b>/e palmas</b> - Bater palmas<br>
			<b>/e palmas2</b> - Bater palmas com entusiasmo<br>
			<b>/e palmas3</b> - Bater palmas com entusiasmo<br>
			<b>/e palmas4</b> - Bater palmas de forma discreta<br>
			<b>/e comer</b> - Comer um x-burguer<br>
			<b>/e comer2</b> - Comer um cachorro-quente<br>
			<b>/e comer3</b> - Comer uma rosquinha<br>
			<b>/e beber</b> - Consumir bebida alcoólica<br>
			<b>/e beber2</b> - Consumir bebida energética<br>
			<b>/e malicia</b> - Ato provocativo<br>
			<b>/e radio</b> - Usar o rádio da policia<br>
			<b>/e placa</b> - Segurar uma placa<br>
			<b>/e pano2</b> - Limpa o veículo mais próximo<br>
			<b>/e galinha</b> - Bater os braços igual galinha<br>
			<b>/e bora</b> - Chamar uma pessoa<br>
			<b>/e cansado</b> - Estar cansado<br>
			<b>/e cuidar3</b> - Cuidar do paciente<br>
			<b>/e prebeber</b> - Segurar bebida<br>
			<b>/e lixo</b> - Segurar saco de lixo<br>
			<b>/e bolsa2</b> - Segurar bolsa na mão<br>
			<b>/e clapangry</b> - Breve uma descrição do mesmo<br>
			<b>/e comeatmebro</b> - Breve uma descrição do mesmo<br>
			<b>/e peace2</b> - Breve uma descrição do mesmo<br>
			<b>/e bringiton</b> - Breve uma descrição do mesmo
		</div>
		<div id="pageDiv">
			<b>/e continencia</b> - Prestar continência<br>
			<b>/e prancheta</b> - Anotações em uma prancheta<br>
			<b>/e ligar</b> - Realizar uma ligação<br>
			<b>/e musica</b> - Tocar guitarra<br>
			<b>/e musica2</b> - Tocar guitarra<br>
			<b>/e musica3</b> - Tocar violão<br>
			<b>/e musica4</b> - Tocar violão<br>
			<b>/e beber3</b> - Consumir cerveja<br>
			<b>/e beber4</b> - Consumir whisky<br>
			<b>/e beber5</b> - Consumir cerveja<br>
			<b>/e beber6</b> - Consumir cerveja<br>
			<b>/e beber7</b> - Consumir água<br>
			<b>/e varrer</b> - Varrer o chão<br>
			<b>/e placa2</b> - Segurar uma placa<br>
			<b>/e placa3</b> - Segurar uma placa<br>
			<b>/e amem</b> - Agradecer a deus<br>
			<b>/e meleca</b> - Retirar meleca do nariz<br>
			<b>/e cuidar</b> - Cuidar do paciente<br>
			<b>/e mexer</b> - Mexer no objeto<br>
			<b>/e prebeber2</b> - Segurar bebida<br>
			<b>/e caixa2</b> - Segurar uma caixa na mão<br>
			<b>/e bolsa3</b> - Segurar bolsa na mão<br>
			<b>/e radio2</b> - Segurar rádio na mão<br>
			<b>/e superhero</b> - Breve uma descrição do mesmo<br>
			<b>/e type</b> - Breve uma descrição do mesmo<br>
			<b>/e yeah</b> - Breve uma descrição do mesmo
		</div>

		<div id="divContent"></div>

		<div id="titleContent">ANIMAÇÕES PARADAS</div>
		<div id="pageDiv">
			<b>/e deitar</b> - Deitar com o braço na frente do rostoo<br>
			<b>/e deitar2</b> - Deitar de bruços<br>
			<b>/e deitar3</b> - Deitar de barriga pra cima<br>
			<b>/e deitar4</b> - Deitar de barriga para baixo<br>
			<b>/e debrucar</b> - Debruçar num parapeito<br>
			<b>/e sexo</b> - Ato sexual<br>
			<b>/e sexo2</b> - Ato sexual<br>
			<b>/e sexo3</b> - Ato sexual<br>
			<b>/e sexo4</b> - Ato sexual<br>
			<b>/e sexo5</b> - Ato sexual<br>
			<b>/e sexo6</b> - Ato sexual<br>
			<b>/e dancar</b> - Dançar ( total de 258 )<br>
			<b>/e trotar</b> - Performar um trote parado<br>
			<b>/e sentar</b> - Sentar em uma cadeira/banco<br>
			<b>/e sentar2</b> - Sentar no chão<br>
			<b>/e sentar3</b> - Sentar no chão<br>
			<b>/e fumar4</b> - Fumar<br>
			<b>/e tragar</b> - Tragar cigarro não convencional<br>
			<b>/e malhar</b> - Performar musculação com uma barra<br>
			<b>/e malhar2</b> - Performar musculação com uma barra alta<br>
			<b>/e martelo</b> - Martelar<br>
			<b>/e pescar</b> - Usar uma vara de pesca<br>
			<b>/e chill</b> - Breve uma descrição do mesmo<br>
			<b>/e crawl</b> - Breve uma descrição do mesmo<br>
			<b>/e flip</b> - Breve uma descrição do mesmo<br>
			<b>/e flip2</b> - Breve uma descrição do mesmo<br>
			<b>/e inspect</b> - Breve uma descrição do mesmo
		</div>
		<div id="pageDiv">
			<b>/e sentar4</b> - Sentar no chão<br>
			<b>/e striper</b> - Posar como uma striper<br>
			<b>/e escutar</b> - Escutar através da parede/porta<br>
			<b>/e alongar</b> - Alongar-se<br>
			<b>/e dj</b> - Agir como um DJ<br>
			<b>/e rock</b> - Tocar um guitarra invisível<br>
			<b>/e rock2</b> - Fazer o símbolo do rock com as mãos<br>
			<b>/e abracar</b> - Abraçar<br>
			<b>/e abracar2</b> - Abraçar<br>
			<b>/e peitos</b> - Realçar os peitos<br>
			<b>/e espernear</b> - Espernear no chão<br>
			<b>/e arrumar</b> - Pegar e arrumar coisas do chão<br>
			<b>/e bebado</b> - Cair e levantar algumas vezes no chão<br>
			<b>/e bebado2</b> - Levantar do chão<br>
			<b>/e bebado3</b> - Levantar do chão<br>
			<b>/e yoga</b> - Performar yoga<br>
			<b>/e pescar2</b> - Usar uma vara de pesca<br>
			<b>/e procurar</b> - Agachar-se no chão para procurar<br>
			<b>/e sinalizar</b> - Usar um sinalizador<br>
			<b>/e soprador</b> - Usar um soprador<br>
			<b>/e mecanico</b> - Deitar-se no chão e mexer no motor<br>
			<b>/e morrer</b> - Fingir de morto<br>
			<b>/e passout</b> - Breve uma descrição do mesmo<br>
			<b>/e prone</b> - Breve uma descrição do mesmo<br>
			<b>/e sentar7</b> - Breve uma descrição do mesmo<br>
			<b>/e sitchair</b> - Breve uma descrição do mesmo
		</div>
		<div id="pageDiv">
			<b>/e abdominal</b> - Performar abdominais<br>
			<b>/e bixa</b> - Posar como uma striper<br>
			<b>/e britadeira</b> - Usar um britadeira<br>
			<b>/e cerveja</b> - Beber cerveja<br>
			<b>/e churrasco</b> - Usar uma churrasqueira<br>
			<b>/e consertar</b> - Pega o massarico na mão<br>
			<b>/e dormir</b> - Deitar para dormir<br>
			<b>/e ajoelhar</b> - Ajoelha no chão<br>
			<b>/e dormir2</b> - Deitar para dormir<br>
			<b>/e dormir2</b> - Deitar para dormir<br>
			<b>/e flexao</b> - Performar flexões<br>
			<b>/e esquentar</b> - Esquentar as mãos<br>
			<b>/e fumar</b> - Fumar (masculino)<br>
			<b>/e fumar2</b> - Fumar (feminino)<br>
			<b>/e fumar3</b> - Fumar<br>
			<b>/e mecanico3</b> - Apoiar-se na frente do veículo<br>
			<b>/e beijar</b> - Beijar<br>
			<b>/e estatua</b> - Performar uma estátua<br>
			<b>/e encostar</b> - Encostar-se<br>
			<b>/e plantar</b> - Agachar-se no chão<br>
			<b>/e mecanico2</b> - Apoiar-se na frente do veículo<br>
			<b>/e sitchair2</b> - Breve uma descrição do mesmo<br>
			<b>/e sitchair3</b> - Breve uma descrição do mesmo<br>
			<b>/e sitchair4</b> - Breve uma descrição do mesmo<br>
			<b>/e sitchair5</b> - Breve uma descrição do mesmo<br>
			<b>/e meditate</b> - Breve uma descrição do mesmo
		</div>

		<div id="divContent"></div>

		<div id="titleContent">POLÍCIA / PARAMÉDICO</div>
		<div id="pageDiv">
			<b>/placa</b> - Mostra a placa do veículo mais próximo<br>
			<b>/re</b> - Reanimar a pessoa em coma<br>
			<b>/cv x</b> - X é o número do assento do veículo<br>
			<b>/revistar</b> - Inspecionar os itens da pessoa<br>
			<b>/c</b> - Carregar a pessoa mais próxima<br>
			<b>/cam</b> - Mudar uma câmera de segurança
		</div>
		<div id="pageDiv">
			<b>/preset</b> - Muda a roupa com base no número<br>
			<b>/invadir</b> - Invadir uma propriedade<br>
			<b>/sangramento</b> - Estanca o sangramento do paciente<br>
			<b>/diagnostico</b> - Vizualiza o diagnostico da pessoa<br>
			<b>/setrepose x</b> - X é o número de minutos de repouso<br>
			<b>/c2</b> - Carregar a pessoa mais próxima nos ombros
		</div>
		<div id="pageDiv">
			<b>/detido</b> - Deixa o veículo na detenção<br>
			<b>/911</b> - Chat de conversa dos policiais<br>
			<b>/112</b> - Chat de conversa dos paramédicos<br>
			<b>/tratamento</b> - Inicia o tratamento no paciente<br>
			<b>/rv</b> - Remover a pessoa do veículo<br>
			<b>/emservico</b> - Visualiza todos em serviço
		</div>
	`);
};
/* ---------------------------------------------------------------------------------------------------------------- */
const rulesPage = () => {
	selectPage = "rules";

	$("#content").html(`
		<div id="titleContent">ANTI-ROLEPLAY</div>
		<div id="pageContent">
			<b>1:</b> Proibido chamar um serviço no celular e efetuar qualquer atividade ilegal contra o mesmo.<br>
			<b>2:</b> Reféns não podem ter envolvimento com os sequestradores, pense bem antes de iniciar um sequestro.<br>
			<b>3:</b> Após ser reanimado não volte para ação, efetue sua retirada do local imediatamente.<br>
			<b>4:</b> O <s>voip</s> não pode ser utilizado para dialogar assuntos que não tem coerência com o roleplay.<br>
			<b>5:</b> Durante uma ação caso ocorra do seu jogo crashar, é <s>obrigatório</s> voltar e dar continuidade na história.<br>
			<b>6:</b> Não é permitido sequestrar uma pessoa e obriga-lá a efetuar transferências bancárias e afins em troca de sua vida.<br>
			<b>7:</b> Na utilização de máscaras <s>não é possível</s> efetuar o reconhecimento por voz.<br>
			<b>8:</b> Nocauteado você só pode dar <s>/gg</s> após a finalização do roleplay ou com a confirmação de todas as partes.<br>
			<b>9:</b> Proibido pegar uma pessoa nocauteada, reanima-lá e obriga-lá a passar informação, rouba-lá ou qualquer tipo de atividade.<br>
			<b>10:</b> Ao adentrar em um cenário de suicídio tenha a absoluta certeza que ao cometer o mesmo seu personagem é excluído.<br>
			<b>11:</b> Veículos de serviço não podem ser utilizados para efetuar atividades ilegais.<br>
			<b>12:</b> Policiais e sequestradores não podem abrir fogo até que o refém esteja em segurança.<br>
			<b>13:</b> Após ganhar ações contra policiais, você não pode chamar os paramédicos, utilize o <s>Hospital Clandestino</s>.<br>
			<b>14:</b> Após ser nocauteado propositalmente por outra pessoa, você esquece de todo o ocorrido automaticamente.<br>
			<b>15:</b> Roubo de viaturas policiais só podem ser feitas em roubos automatizados como <s>bancos</s> e afins.<br>
			<b>16:</b> Proibido assalto a civís, isso não quer dizer que a mesma não possa ser incluida em qualquer tipo de roleplay.<br>
			<b>17:</b> Após nocautear a vitima, conclua o roleplay e se retire do local.<br>
			<b>18:</b> Proibido qualquer atividade criminal na ilha de <s>Cayo Perico</s>.<br>
			<b>19:</b> Atividades criminais de rua são limitadas a <s>5 Bandidos</s> e <s>8 Policiais</s>.<br>
			      <s>O limite foi imposto para controle situacional, não passe do limite de pessoas do mesmo grupo.</s><br>
			<b>20:</b> Proibido a utilização de arma de fogo durante as <s>Corridas Clandestinas</s> por parte dos corredores.
		</div>

		<div id="divContent"></div>

		<div id="titleContent">POLÍCIA / PARAMÉDICO</div>
		<div id="pageContent">
			<b>1:</b> Qualquer tipo de corrupção dentro da corporação é <s>extremamente proibido</s>.<br>
			<b>2:</b> Viaturas não podem ser utilizadas fora de serviço ou dar carona aos civís.<br>
			<b>3:</b> Em caso de resgates a polícia está apta a efetuar disparos contra os mesmos.
		</div>

		<div id="divContent"></div>

		<div id="titleContent">LOJA DE DEPARTAMENTO</div>
		<div id="pageContent">
			<b>1:</b> Máximo <s>4</s> assaltantes e <s>5</s> policiais.<br>
			<b>2:</b> Obrigatório cada integrante do roubo utilizar uma arma de fogo.
		</div>

		<div id="divContent"></div>

		<div id="titleContent">LOJA DE ARMAS</div>
		<div id="pageContent">
			<b>1:</b> Máximo <s>3</s> assaltantes e <s>4</s> policiais.<br>
			<b>2:</b> Obrigatório cada integrante do roubo utilizar uma arma de fogo.
		</div>

		<div id="divContent"></div>

		<div id="titleContent">BANCO FLEECA</div>
		<div id="pageContent">
			<b>1:</b> Máximo <s>4</s> assaltantes e <s>6</s> policiais.<br>
			<b>2:</b> Obrigatório cada integrante do roubo utilizar uma arma de fogo.<br>
			<b>3:</b> Obrigação mínima de <s>1</s> e máximo <s>2</s> reféns.
		</div>

		<div id="divContent"></div>

		<div id="titleContent">BARBEARIA / CAIXA ELETRÔNICO</div>
		<div id="pageContent">
			<b>1:</b> Máximo <s>4</s> assaltantes e <s>4</s> policiais.<br>
			<b>2:</b> Durante o ocorrido só pode a utilização de arma branca.
		</div>

		<div id="divContent"></div>

		<div id="titleContent">VINEWOOD VAULT / SAVINGS BANK</div>
		<div id="pageContent">
			<b>1:</b> Máximo <s>6</s> assaltantes e <s>8</s> policiais.<br>
			<b>2:</b> Obrigatório cada integrante do roubo utilizar uma arma de fogo.<br>
			<b>3:</b> Obrigação mínima de <s>1</s> e máximo <s>4</s> reféns.
		</div>

		<div id="divContent"></div>

		<div id="titleContent">CARRO FORTE</div>
		<div id="pageContent">
			<b>1:</b> Obrigatório cada integrante do roubo utilizar uma arma de fogo.<br>
			<b>2:</b> Cada grupo só pode efetuar o roubo de 1 veículo por vez.<br>
			<b>3:</b> Proibido reféns, a mesma é uma ação de confronto direto.
		</div>

		<div id="divContent"></div>

		<div id="titleContent">HUMANE LABS</div>
		<div id="pageContent">
			<b>1:</b> Máximo <s>6</s> assaltantes e <s>8</s> policiais.<br>
			<b>2:</b> Obrigatório cada integrante do roubo utilizar no mínimo uma submetralhadora.<br>
			<b>3:</b> Obrigação mínima de <s>1</s> e máximo <s>2</s> reféns.
		</div>

		<div id="divContent"></div>

		<div id="titleContent">PERSONAGEM SECUNDÁRIO</div>
		<div id="pageContent">
			<b>1:</b> Nenhuma informação pode ser compartilhada entre personagens.<br>
			<b>2:</b> Nenhum parentesco é permitido entre os personagens de sua conta.<br>
			<b>3:</b> Nenhum tipo de transferência dos bens entre seus personagens é permitido.<br>
			<b>4:</b> Não pode participar de grupos/gangs que os demais personagens já participam.
		</div>
	`);
};
/* ---------------------------------------------------------------------------------------------------------------- */
const twitterPage = () => {
	selectPage = "twitter";

	$("#content").html(`
		<div id="mediaLeft">
			<div id="titleLeft">TWITTAR...</div>
			<textarea id="twitterArea" spellcheck="false" value="" maxlength="300" placeholder="Escreva um novo tweet..."></textarea>
			<button id="twitterButton">ENVIAR TWEET</button>

			<div id="titleLeft" style="margin-top: 20px;">ANUNCIAR...</div>
			<textarea id="ebayArea" spellcheck="false" value="" maxlength="200" placeholder="Escreva um novo anuncio..."></textarea>
			<button id="ebayButton">ENVIAR ANUNCIO</button>
			<button id="ebayClose">✕</button>
		</div>

		<div id="mediaMiddle"></div>
		<div id="mediaRight"></div>
	`);

	$.post("http://tablet/requestMedia",JSON.stringify({}),(data) => {
		$.each(JSON.parse(data),(k,v) => {
			$("#mediaMiddle").prepend(`
				<div id="backTwitter">
					<div id="avatarTwitter">${v["avatar"]}</div>
					<div id="contentTwitter">
						<titles>${v["name"]}:</titles> <timers>${v["date"]}</timers> ${v["premium"] == true ? "<i class=\"material-icons verified\">verified</i>":""}<br>${v["message"]}
					</div>
				</div>
			`);
		});
	});

	$.post("http://tablet/requestEbay",JSON.stringify({}),(data) => {
		$.each(JSON.parse(data),(k,v) => {
			if (v["premium"] == true){
				$("#mediaRight").append(`
					<div id="backEbayPremium" data-phone="${v["phone"]}">
						<div id="avatarEbayPremium"><i class="material-icons phone">call</i></div>
						<div id="contentEbayPremium">
							<titlesPremium>${v["name"]}:</titlesPremium> <timersPremium>${v["date"]}</timersPremium><br>${v["message"]}
						</div>
					</div>
				`);
			} else {
				$("#mediaRight").append(`
					<div id="backEbay" data-phone="${v["phone"]}">
						<div id="avatarEbay"><i class="material-icons phone">call</i></div>
						<div id="contentEbay">
							<titles>${v["name"]}:</titles> <timers>${v["date"]}</timers><br>${v["message"]}
						</div>
					</div>
				`);
			}
		});
	});
};
/* ----------UPDATEMEDIA---------- */
const updateMedia = (data) => {
	if (selectPage == "twitter"){
		$("#mediaMiddle").prepend(`
			<div id="backTwitter">
				<div id="avatarTwitter">${data["avatar"]}</div>
				<div id="contentTwitter">
					<titles>${data["name"]}:</titles> <timers>${data["date"]}</timers> ${data["premium"] == true ? "<i class=\"material-icons verified\">verified</i>":""}<br>${data["message"]}
				</div>
			</div>
		`);
	}
}
/* ----------TWITTERBUTTON---------- */
$(document).on("click","#twitterButton",function(){
	let messageTwitter = $("#twitterArea").val();
	if (messageTwitter != ""){
		$.post("http://tablet/messageTwitter",JSON.stringify({ message: messageTwitter }));
		$("#twitterArea").val("");
	}
});
/* ----------EBAYBUTTON---------- */
$(document).on("click","#ebayButton",function(){
	let messageEbay = $("#ebayArea").val();
	if (messageEbay != ""){
		$.post("http://tablet/messageEbay",JSON.stringify({ message: messageEbay }));
		$("#ebayArea").val("");
	}
});
/* ----------EBAYCLOSE---------- */
$(document).on("click","#ebayClose",function(){
	$.post("http://tablet/closeEbay");
});
/* ----------AVATAREBAY---------- */
$(document).on("click","#avatarEbay",function(e){
	$.post("http://tablet/ebayCall",JSON.stringify({ phone: e["currentTarget"]["parentNode"]["dataset"]["phone"] }));
});
/* ----------AVATAREBAYPREMIUM---------- */
$(document).on("click","#avatarEbayPremium",function(e){
	$.post("http://tablet/ebayCall",JSON.stringify({ phone: e["currentTarget"]["parentNode"]["dataset"]["phone"] }));
});
/* ----------UPDATEEBAY---------- */
const updateEbay = (data) => {
	if (selectPage == "twitter"){
		twitterPage();
	}
}
/* ---------------------------------------------------------------------------------------------------------------- */
const racesPage = (raceId) => {
	selectPage = "races";

	if (raceId == undefined){
		raceId = 1;
	}

	$("#content").html(`
		<div id="raceBar">
			<li id="circuits" data-id="1" ${raceId == 1 ? "class=active":""}>01</li>
			<li id="circuits" data-id="2" ${raceId == 2 ? "class=active":""}>02</li>
			<li id="circuits" data-id="3" ${raceId == 3 ? "class=active":""}>03</li>
			<li id="circuits" data-id="4" ${raceId == 4 ? "class=active":""}>04</li>
			<li id="circuits" data-id="5" ${raceId == 5 ? "class=active":""}>05</li>
			<li id="circuits" data-id="6" ${raceId == 6 ? "class=active":""}>06</li>
			<li id="circuits" data-id="7" ${raceId == 7 ? "class=active":""}>07</li>
			<li id="circuits" data-id="8" ${raceId == 8 ? "class=active":""}>08</li>
			<li id="circuits" data-id="9" ${raceId == 9 ? "class=active":""}>09</li>
			<li id="circuits" data-id="10" ${raceId == 10 ? "class=active":""}>10</li>
			<li id="circuits" data-id="11" ${raceId == 11 ? "class=active":""}>11</li>
			<li id="circuits" data-id="12" ${raceId == 12 ? "class=active":""}>12</li>
		</div>

		<div id="raceContent"></div>
	`);

	$.post("http://tablet/requestRanking",JSON.stringify({ id: raceId }),(data) => {
		let position = 0;

		$.each(JSON.parse(data),(k,v) => {
			$('#raceContent').append(`
				<div id="raceLine">
					<div class="racePosition">${position = position + 1}</div>
					<div class="raceName">${v["name"]} ${(position == 1 || position == 2 || position == 3) ? "<img src=\"images/"+position+".png\">":""}</div>
					<div class="raceVehicle">${v["vehicle"]}</div>
					<div class="racePoints">${format(v["points"])} Pontos</div>
					<div class="raceDate">${v["date"]}</div>
				</div>
			`);
		});
	});
};
/* ----------CLICKRACES---------- */
$(document).on("click","#circuits",function(e){
	racesPage(e["target"]["dataset"]["id"]);
});
/* ---------------------------------------------------------------------------------------------------------------- */

const UpdateLista = (mode) => {
	$("#content").html(`
		<div id="raceBar">
		<li id="benefactor" onclick="UpdateLista('Carros');" data-id="Carros" ${mode == "Carros" ? "class=active":""}>CARROS</li>
		<li id="benefactor" onclick="UpdateLista('Motos');" data-id="Motos" ${mode == "Motos" ? "class=active":""}>MOTOS</li>
		<li id="benefactor" onclick="UpdateLista('Possuidos');" data-id="Possuidos" ${mode == "Possuidos" ? "class=active":""}>POSSUÍDOS</li>
		</div>

		<div id="contentVehicles">
			<div id="titleVehicles">${mode}</div>
			<div id="pageVehicles"></div>
		</div>
	`);
	$.post(`http://tablet/request${mode}`,JSON.stringify({}),(data) => {
		let i = 0;
		const nameList = data.veiculos.sort((a,b) => (a.nome > b.nome) ? 1: -1);
		if (mode == "Possuidos"){
			$("#pageVehicles").html(`
			${nameList.map((item) => (`<span>
				<left>
					<b>Nome:</b> ${item["name"]}<br>
					<b>Valor:</b> $${format(item["price"])}<br>
					<b>Porta-Malas:</b> ${format(item["chest"])}Kg
				</left>
				<right>
					<div id="benefactorSell" data-name="${item["k"]}">Vender</div><br>
				</right>
			</span>`)).join('')}
		`);
		} else {
			$("#pageVehicles").html(`
				${nameList.map((item) => (`<span>
					<left>
						<b>Nome:</b> ${item["name"]}<br>
						<b>Valor:</b> $${format(item["price"])}<br>
						<b>Porta-Malas:</b> ${format(item["chest"])}Kg
					</left>
					<right>
						<br>
						<div id="benefactorBuy" data-name="${item["k"]}">Comprar</div>
					</right>
				</span>`)).join('')}
			`);
		}
	});
}


const benefactor = () => {
	selectPage = "benefactor";
	$("#content").html(`
		<div id="raceBar">
		<li id="benefactor" onclick="UpdateLista('Carros');" data-id="Carros" class="active">CARROS</li>
		<li id="benefactor" onclick="UpdateLista('Motos');" data-id="Motos">MOTOS</li>
		<li id="benefactor" onclick="UpdateLista('Possuidos');" data-id="Possuidos">POSSUÍDOS</li>
		</div>

		<div id="contentVehicles">
			<div id="titleVehicles">Carros</div>
			<div id="pageVehicles"></div>
		</div>
	`);

	$.post(`http://tablet/requestCarros`,JSON.stringify({}),(data) => {
		let i = 0;
		const nameList = data.veiculos.sort((a,b) => (a.nome > b.nome) ? 1: -1);
		$("#pageVehicles").html(`
			${nameList.map((item) => (`<span>
				<left>
					<b>Nome:</b> ${item["name"]}<br>
					<b>Valor:</b> $${format(item["price"])}<br>
					<b>Porta-Malas:</b> ${format(item["chest"])}Kg
				</left>
				<right>
					<br>
					<div id="benefactorBuy" data-name="${item["k"]}">Comprar</div>
				</right>
			</span>`)).join('')}
		`);
	});
}

$(document).on("click","#benefactorBuy",function(e){
	$.post("http://tablet/buyDealer",JSON.stringify({
		name: e["target"]["dataset"]["name"]
	}));
	UpdateLista('Carros');
	$.post("http://tablet/closeSystem");
});

$(document).on("click","#benefactorSell",function(e){
	$.post("http://tablet/sellDealer",JSON.stringify({
		name: e["target"]["dataset"]["name"]
	}));
	UpdateLista('Carros');
	$.post("http://tablet/closeSystem");
});
/* ----------BENEFACTORTAX---------- */
$(document).on("click","#benefactorTax",function(e){
	$.post("http://tablet/requestTax",JSON.stringify({ name: e["target"]["dataset"]["name"] }));
});
/* ----------BENEFACTORDRIVE---------- */
$(document).on("click","#benefactorDrive",function(e){
	$.post("http://tablet/requestDrive",JSON.stringify({ name: e["target"]["dataset"]["name"] }));
});
/* ---------------------------------------------------------------------------------------------------------------- */
const penalPage = () => {
	selectPage = "penal";

	$('#content').html(`
		<div id='penalTitle01'>CRIMES</div>
		<div id='penalTitle02'>SERVIÇOS</div>
		<div id='penalTitle03'>MULTAS</div>
		<div id='penalTitle04'>OBSERVAÇÕES</div>

		<div id='penalContent01' class='black'>Ameaça</div>
		<div id='penalContent02' class='black'>10</div>
		<div id='penalContent03' class='black'>$3.000</div>
		<div id='penalContent04' class='black'>Ameaçar alguém por palavra, escrito ou gesto.</div>

		<div id='penalContent01' class='white'>Assalto a Cívil</div>
		<div id='penalContent02' class='white'>30</div>
		<div id='penalContent03' class='white'>$15.000</div>
		<div id='penalContent04' class='white'>Subtrair posses alheias, para si ou para outrem, mediante grave ameaça ou violência.</div>

		<div id='penalContent01' class='black'>Associação criminosa</div>
		<div id='penalContent02' class='black'>10</div>
		<div id='penalContent03' class='black'>$3.000</div>
		<div id='penalContent04' class='black'>Associarem-se 3 ou mais pessoas, para fim específico de cometer crimes.</div>

		<div id='penalContent01' class='white'>Corridas ilegais</div>
		<div id='penalContent02' class='white'>20</div>
		<div id='penalContent03' class='white'>$5.000</div>
		<div id='penalContent04' class='white'>Participar de corridas clandestinas.</div>

		<div id='penalContent01' class='black'>Conspiração</div>
		<div id='penalContent02' class='black'>15</div>
		<div id='penalContent03' class='black'>0</div>
		<div id='penalContent04' class='black'>Planejar atividade ilegal.</div>

		<div id='penalContent01' class='white'>Corrupção</div>
		<div id='penalContent02' class='white'>120</div>
		<div id='penalContent03' class='white'>$80.000</div>
		<div id='penalContent04' class='white'>Solicitar, receber, obter ou utilizar para si ou para outrem, diretamente ou indiretamente.</div>

		<div id='penalContent01' class='black'>Comportamento Indisciplinar</div>
		<div id='penalContent02' class='black'>0</div>
		<div id='penalContent03' class='black'>$25.000</div>
		<div id='penalContent04' class='black'>Se comportar indevidamente com base no seu emprego.</div>

		<div id='penalContent01' class='white'>Dano ao Patrimônio</div>
		<div id='penalContent02' class='white'>0</div>
		<div id='penalContent03' class='white'>$4.000</div>
		<div id='penalContent04' class='white'>Danificar o bem de outra pessoa ou do estado.</div>

		<div id='penalContent01' class='black'>Denuncia caluniosa</div>
		<div id='penalContent02' class='black'>10</div>
		<div id='penalContent03' class='black'>$2.500</div>
		<div id='penalContent04' class='black'>Dar causa à instauração de investigação policial de processo judicial.</div>

		<div id='penalContent01' class='white'>Desacato</div>
		<div id='penalContent02' class='white'>20</div>
		<div id='penalContent03' class='white'>$10.000</div>
		<div id='penalContent04' class='white'>Desacatar funcionário público no exercício de sua função ou em razão dela.</div>

		<div id='penalContent01' class='black'>Desobediência</div>
		<div id='penalContent02' class='black'>20</div>
		<div id='penalContent03' class='black'>$5.000</div>
		<div id='penalContent04' class='black'>Desobedecer ordem de funcionário público.</div>

		<div id='penalContent01' class='white'>Dinheiro Ilícito</div>
		<div id='penalContent02' class='white'>10</div>
		<div id='penalContent03' class='white'>0</div>
		<div id='penalContent04' class='white'>Em roubos de grande porte a pena é dobrada.</div>

		<div id='penalContent01' class='black'>Estelionato</div>
		<div id='penalContent02' class='black'>15</div>
		<div id='penalContent03' class='black'>$3.000</div>
		<div id='penalContent04' class='black'>Obter para si ou para outrem vantagem ilícita em prejuízo alheio.</div>

		<div id='penalContent01' class='white'>Extorsão</div>
		<div id='penalContent02' class='white'>20</div>
		<div id='penalContent03' class='white'>$3.000</div>
		<div id='penalContent04' class='white'>Obrigar a tomar um determinado comportamento por meio de ameaça ou violência.</div>

		<div id='penalContent01' class='black'>Falsa Identidade</div>
		<div id='penalContent02' class='black'>5</div>
		<div id='penalContent03' class='black'>$4.000</div>
		<div id='penalContent04' class='black'>Atribuir-se ou atribuir a terceiro para obter vantagem em proveito próprio ou alheio.</div>

		<div id='penalContent01' class='white'>Falsidade ideologica</div>
		<div id='penalContent02' class='white'>10</div>
		<div id='penalContent03' class='white'>$2.000</div>
		<div id='penalContent04' class='white'>Atribuir à si ou a terceiros falsa identidade para obter vantagem em proveito alheio.</div>

		<div id='penalContent01' class='black'>Falso testemunho</div>
		<div id='penalContent02' class='black'>10</div>
		<div id='penalContent03' class='black'>$2.500</div>
		<div id='penalContent04' class='black'>Fazer afirmação falsa, negar ou calar a verdade.</div>

		<div id='penalContent01' class='white'>Fraude</div>
		<div id='penalContent02' class='white'>12</div>
		<div id='penalContent03' class='white'>$2.000</div>
		<div id='penalContent04' class='white'>Mentorar ou participar de esquema ilícito ou de má-fé visando obter vantagens.</div>

		<div id='penalContent01' class='black'>Fuga</div>
		<div id='penalContent02' class='black'>10</div>
		<div id='penalContent03' class='black'>$2.000</div>
		<div id='penalContent04' class='black'>Evadir-se da polícia.</div>

		<div id='penalContent01' class='white'>Furto</div>
		<div id='penalContent02' class='white'>12</div>
		<div id='penalContent03' class='white'>$2.000</div>
		<div id='penalContent04' class='white'>Subtrair, para si ou para outrem coisa móvel alheia.</div>

		<div id='penalContent01' class='black'>Injúria</div>
		<div id='penalContent02' class='black'>10</div>
		<div id='penalContent03' class='black'>$2.000</div>
		<div id='penalContent04' class='black'>Injuriar alguém, ofendendo-lhe a dignidade ou o decoro.</div>

		<div id='penalContent01' class='white'>Invasão</div>
		<div id='penalContent02' class='white'>15</div>
		<div id='penalContent03' class='white'>$2.000</div>
		<div id='penalContent04' class='white'>Invadir áreas privadas, ou públicas de acesso restrito.</div>

		<div id='penalContent01' class='black'>Latrocínio</div>
		<div id='penalContent02' class='black'>35</div>
		<div id='penalContent03' class='black'>$6.000</div>
		<div id='penalContent04' class='black'>Roubo seguido de morte.</div>

		<div id='penalContent01' class='white'>Lesão corporal</div>
		<div id='penalContent02' class='white'>10</div>
		<div id='penalContent03' class='white'>$2.000</div>
		<div id='penalContent04' class='white'>Ofender a integridade corporal ou a saúde de outrem.</div>

		<div id='penalContent01' class='black'>Multas não pagas</div>
		<div id='penalContent02' class='black'>4</div>
		<div id='penalContent03' class='black'>$2.000</div>
		<div id='penalContent04' class='black'>Multas com atrasao de 24 horas no pagamento.</div>

		<div id='penalContent01' class='white'>Objetos roubados</div>
		<div id='penalContent02' class='white'>10</div>
		<div id='penalContent03' class='white'>$2.00</div>
		<div id='penalContent04' class='white'>Objetos subtraidos através de roubos.</div>

		<div id='penalContent01' class='black'>Obstrução da justiça</div>
		<div id='penalContent02' class='black'>15</div>
		<div id='penalContent03' class='black'>$2.000</div>
		<div id='penalContent04' class='black'>Cometer o impedimento ou qualquer forma que atrapalhe a investigação.</div>

		<div id='penalContent01' class='white'>Ocultação Facial</div>
		<div id='penalContent02' class='white'>10</div>
		<div id='penalContent03' class='white'>$25.000</div>
		<div id='penalContent04' class='white'>Utilização de adornos ou acessórios que ocultem totalmente ou parcialmente a face.</div>

		<div id='penalContent01' class='black'>Omissão de socorro</div>
		<div id='penalContent02' class='black'>10</div>
		<div id='penalContent03' class='black'>$2.000</div>
		<div id='penalContent04' class='black'>Deixar de prestar assistência, quando possível fazê-lo sem risco pessoal ou ferida.</div>

		<div id='penalContent01' class='white'>Perseguição</div>
		<div id='penalContent02' class='white'>20</div>
		<div id='penalContent03' class='white'>0</div>
		<div id='penalContent04' class='white'>Seguir alguém, perseguir ou qualquer coisa do genero.</div>

		<div id='penalContent01' class='black'>Porte/Posse ilegal de armas classe 1</div>
		<div id='penalContent02' class='black'>10</div>
		<div id='penalContent03' class='black'>$2.000</div>
		<div id='penalContent04' class='black'>Porte / Posse ilegal de armas semi-automáticas.</div>

		<div id='penalContent01' class='white'>Porte/Posse ilegal de armas classe 2</div>
		<div id='penalContent02' class='white'>15</div>
		<div id='penalContent03' class='white'>$3.000</div>
		<div id='penalContent04' class='white'>Porte / Posse ilegal de armas automáticas.</div>

		<div id='penalContent01' class='black'>Produtos Ilícitos</div>
		<div id='penalContent02' class='black'>10</div>
		<div id='penalContent03' class='black'>$2.000</div>
		<div id='penalContent04' class='black'>Produto adquirido por roubos ou utilizado para crimes.</div>

		<div id='penalContent01' class='white'>Receptação</div>
		<div id='penalContent02' class='white'>10</div>
		<div id='penalContent03' class='white'>0</div>
		<div id='penalContent04' class='white'>Receptar, em proveito próprio ou alheio, coisa que se saiba ser produto de crime.</div>

		<div id='penalContent01' class='black'>Resistência</div>
		<div id='penalContent02' class='black'>15</div>
		<div id='penalContent03' class='black'>0</div>
		<div id='penalContent04' class='black'>Opor-se à execução de ato legal, mediante violência ou ameaça ao funcionário.</div>

		<div id='penalContent01' class='white'>Roubo</div>
		<div id='penalContent02' class='white'>15</div>
		<div id='penalContent03' class='white'>$3.000</div>
		<div id='penalContent04' class='white'>Subtrair posses alheias, para si ou para outrem, mediante grave ameaça ou violência.</div>

		<div id='penalContent01' class='black'>Roupas policiais</div>
		<div id='penalContent02' class='black'>0</div>
		<div id='penalContent03' class='black'>$5.000</div>
		<div id='penalContent04' class='black'>Utilizar qualquer utilitário exclusivo policial.</div>

		<div id='penalContent01' class='white'>Sequestro</div>
		<div id='penalContent02' class='white'>20</div>
		<div id='penalContent03' class='white'>$3.000</div>
		<div id='penalContent04' class='white'>Privar alguém de sua liberdade mediante sequestro ou cárcere privado.</div>

		<div id='penalContent01' class='black'>Suborno</div>
		<div id='penalContent02' class='black'>15</div>
		<div id='penalContent03' class='black'>$3.000</div>
		<div id='penalContent04' class='black'>Oferecer ou prometer vantagem indevida a funcionário público.</div>

		<div id='penalContent01' class='white'>Tentativa / Homicídio</div>
		<div id='penalContent02' class='white'>20 + 5</div>
		<div id='penalContent03' class='white'>$5.000</div>
		<div id='penalContent04' class='white'>Quando o suspeito quis o resultado e assumiu o risco de produzí-lo.</div>

		<div id='penalContent01' class='black'>Tentativa / Homicídio Oficial</div>
		<div id='penalContent02' class='black'>25 + 5</div>
		<div id='penalContent03' class='black'>$7.500</div>
		<div id='penalContent04' class='black'>Quando o suspeito quis o resultado e assumiu o risco de produzí-lo em um oficial do governo.</div>

		<div id='penalContent01' class='white'>Terrorismo</div>
		<div id='penalContent02' class='white'>50</div>
		<div id='penalContent03' class='white'>$10.000</div>
		<div id='penalContent04' class='white'>Cuja violência ilegítima passa a denominar-se terror.</div>

		<div id='penalContent01' class='black'>Tráfico</div>
		<div id='penalContent02' class='black'>1</div>
		<div id='penalContent03' class='black'>$100</div>
		<div id='penalContent04' class='black'>Para cada 2 <s>drogas</s> ilícitas possuídas.</div>

		<div id="divContent"></div>

		<div id='penalTitle01'>INFRAÇÕES</div>
		<div id='penalTitle02'>SERVIÇOS</div>
		<div id='penalTitle03'>MULTAS</div>
		<div id='penalTitle04'>OBSERVAÇÕES</div>

		<div id='penalContent01' class='white'>Alta velocidade</div>
		<div id='penalContent02' class='white'>0</div>
		<div id='penalContent03' class='white'>$2.000</div>
		<div id='penalContent04' class='white'>Aumenta $300 dólares a cada 10mph.</div>

		<div id='penalContent01' class='black'>Direção imprudente</div>
		<div id='penalContent02' class='black'>0</div>
		<div id='penalContent03' class='black'>$2.500</div>
		<div id='penalContent04' class='black'>Conduta imprudente no transito utilizando um caminhão ou ônibus.</div>

		<div id='penalContent01' class='white'>Direção perigosa</div>
		<div id='penalContent02' class='white'>0</div>
		<div id='penalContent03' class='white'>$2.000</div>
		<div id='penalContent04' class='white'>Uso negligente ou imprudente de um veículo.</div>

		<div id='penalContent01' class='black'>Estacionar em local proibido</div>
		<div id='penalContent02' class='black'>0</div>
		<div id='penalContent03' class='black'>$2.000</div>
		<div id='penalContent04' class='black'>Deixar o veículo em local indevido.</div>

		<div id='penalContent01' class='white'>Pousar em local proibido ou sem designação</div>
		<div id='penalContent02' class='white'>0</div>
		<div id='penalContent03' class='white'>$25.000</div>
		<div id='penalContent04' class='white'>Pousar veículos aéreos fora de locais adequados e seguros.</div>

		<div id='penalContent01' class='black'>Veículo abandonado</div>
		<div id='penalContent02' class='black'>0</div>
		<div id='penalContent03' class='black'>$2.000</div>
		<div id='penalContent04' class='black'>Abandonar veículo em local indevido.</div>

		<div id="divContent"></div>

		<div id='titleContent'>OBSERVAÇÕES GERAIS</div>
		<div id='pageContent'>
			<b>1:</b> Posse legal de drogas é até 5 unidades, passando da quantidade legal o mesmo é indiciado pelo crime de Tráfico.<br>
			<b>2:</b> Veículos são apreendidos quando o condutor ou passageiro atenta contra a vida de um cidadão utilizando uma arma de fogo ou quando o veículo é jogado dentro do mar propositalmente.<br>
			<b>3:</b> Cada serviço pode ser convertido em $2.000 dólares, crimes que atentam contra a vida de outro cidadão não estão sujeitas a fiança.<br>
			<b>4:</b> Não há crime de cumplicidade, as pessoas que colaboram diretamente ou indiretamente para o crime receberão a mesma pena.<br>
			<b>5:</b> Conversas entre suspeitos e advogados são confidenciais, dê uma distância respeitosa para que os mesmos conversem sem interrupções.<br>
			<b>6:</b> Limite de velocidade dentro da cidade é de <b>60 kmh</b>, veículos de grande porte o limite de velocidade é de <s>40kmh</s>.
		</div>
	`);
};
/* ---------------------------------------------------------------------------------------------------------------- */
const aboutPage = () => {
	selectPage = "about";

	$.post("http://tablet/requestAbout",JSON.stringify({}),(data) => {

		$("#content").html(`
			<div id="titleContent">SOBRE</div>
			<div id="aboutInfos">
				<b>Passaporte:</b> <span id="aboutResult">${data[0]}</span><br>
				<b>Nome:</b> <span id="aboutResult">${data[1]}</span><br>
				<b>Telefone:</b> <span id="aboutResult">${data[2]}</span><br>
				<b>Identidade:</b> <span id="aboutResult">${data[3]}</span><br>
				<b>Saldo Bancário:</b> <span id="aboutResult">$${format(data[4])}</span><br>
				<b>Total de Gemas:</b> <span id="aboutResult">${format(data[5])}</span><br>
				<b>Premium:</b> <span id="aboutResult">${data[6] == false ? 'Não':'Sim'}</span><br>
				<b>Maximo de Veiculos:</b> <span id="aboutResult">${data[7]}</span>
			</div>

			<div id="animalGame">
				<b>JOGO DO BICHO</b><br>
				Você pode apostar uma vez em cada bicho disponível.<br>
				<input id="gameValue" class="gameValue" type="number" spellcheck="false" onKeyPress="if(this.value.length==9) return false;" value="" placeholder="VALOR..">
				<input id="gameAnimal" class="gameValue" type="number" spellcheck="false" onKeyPress="if(this.value.length==1) return false;" value="" placeholder="BICHO..">
				<div id="gameSubmit"><i class="material-icons done">done</i></div>

				<div id="gameLegends">
					<div id="gameCollum">
						<b>1:</b> Camelo<br>
						<b>2:</b> Pavão<br>
						<b>3:</b> Elefante
					</div>
					<div id="gameCollum">
						<b>4:</b> Coelho<br>
						<b>5:</b> Burro<br>
						<b>6:</b> Gato
					</div>
					<div id="gameCollum">
						<b>7:</b> Galo<br>
						<b>8:</b> Tigre<br>
						<b>9:</b> Rato
					</div>
				</div>
			</div>

		`);
	});
};
/* ----------GAMESUBMIT---------- */
$(document).on("click","#gameSubmit",function(e){
	let value = parseInt($("#gameValue").val());
	let animal = parseInt($("#gameAnimal").val());

	if (value > 0 && animal > 0){
		$.post("http://tablet/inputGame",JSON.stringify({ value: value, animal: animal }));
	}
	$("#gameValue").val('')
	$("#gameAnimal").val('')
});
/* ----------FORMAT---------- */
const format = (n) => {
	var n = n.toString();
	var r = '';
	var x = 0;

	for (var i = n.length; i > 0; i--) {
		r += n.substr(i - 1, 1) + (x == 2 && i != 1 ? '.' : '');
		x = x == 2 ? 0 : x + 1;
	}

	return r.split('').reverse().join('');
}