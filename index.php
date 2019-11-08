<?php
    //Iniciamos Uma Sessão
	session_start();

	//Requerimos O Processamento Automático
	require_once("vendor/autoload.php");

	//Usamos As Classes Do Namespace Segurado
	use \Slim\slim;
	use \Seguradora\Page;
	use \Seguradora\PageAdmin;
	use \Seguradora\Model\User;
	use \Seguradora\Model\Segurados;
	use \Seguradora\Model\Parcial;
	use \Seguradora\Model\Despesas;
	use \Seguradora\Model\Seguradoras;
    use mikehaertl\wkhtmlto\Pdf;


	//Instaciamos O Slim
	$app = new \Slim\Slim();

	//Habilitamos O Debug Do Slim
	$app->config('debug', true);

	//Aqui Nós Exibimos A Página Inicial
	$app->get('/', function() {

		$page = new Page();
		$page->setTpl("index");

	});
	//Fim De Exibição

	//Aqui Nós Mostramos O Erro De 404
	$app->get('/er/manutencao', function(){
		$page = new Page([
			"footer" =>false
		]);
		$page->setTpl("manutencao");
	});
    //Fim De Exibição

	//Aqui Nós Iniciamos Exibindo A Área Do Admin Demo
	$app->get('/admin', function() {

		User::verifyLogin();
		$page = new PageAdmin();

		$page->setTpl("index");

	});
	//Fim De Exibição

	//Aqui Nós Exibimos O Layout De Login
	$app->get('/usuario/login', function(){

		User::verifyLogado();

		$page = new PageAdmin();
		$page->setTpl("user-login");

	});
	//Fim De Exibição

	//Aqui Nós Fazemos O Login
	$app->post('/usuario/login', function(){

		User::login($_POST["user"], $_POST["senha"]);
			header("Location: /admin");
		exit;
		
	});
	//Fim De Login

	//Aqui Nós Fazemos O LogOut
	$app->get('/usuario/logout', function(){

		User::logout();

		header("Location: /usuario/login");
		exit;
	});
	//Fim De LogOut

	//Aqui Nós Mostramos O Layout De Cadastro De Usuário Demo
	$app->get('/usuario/novo', function(){

		$page = new PageAdmin();
		$page->setTpl("user-cadastro");

	});
	//Fim De Exibição

	//Aqui Nós Recebemos Os Dados Pelo Método Post E Cadastramos O Usuário Demo
	$app->post('/usuario/novo', function(){
		//var_dump($_POST);

		$user = new User();
		$user->setDados($_POST);
		$user->salvar();
		header("Location: /usuario/login");
		exit;
	});
	//Fim De Cadastro

	//Aqui Nós Exibimos Todos Os Segurados
	$app->get('/admin/segurados', function(){

		User::verifyLogin();
		$segurados = Segurados::listAll();
		$conta = count($segurados);

		$page = new PageAdmin();
		$page->setTpl("app-segurados");
	});
	//Fim De Exibição

	//Aqui Nós Exibimos O Segurado Selecionado
	$app->get('/admin/segurados/mostrar', function(){
		User::verifyLogin();
		$page = new PageAdmin();
		$page->setTpl("app-segurados-mostrar");
	});
	//Fim De Exibição

	//Aqui Recebemos O Id Do Segurado E Enviamos Para Eliminá-lo
	$app->get('/admin/segurados/deletar/:id_segurado', function($id_segurado){

		User::verifyLogin();
		$cliente = new Segurados();

		$cliente->get((int)$id_segurado);

		$cliente->deletar();
		header("Location: /admin/segurados");
		exit;
	});
	//Fim De Eliminação

	//Aqui Nós Recebemos Os Dados De Cadastro Do Segurado Pelo Método Post E Enviamos Para Cadastrá-los
	$app->post('/admin/segurados/novo', function(){

		User::verifyLogin();

		$segurados = new Segurados();
		$segurados->setDados($_POST);
		$segurados->cadastrar();
		header("Location: /admin/segurados");
		exit;

	});
	//Fim Do Cadastro

	//Aqui Nós Recebemos Os Dados Do Segurado Com O Método Post E Enviamos Para Serem Editados
	$app->post('/admin/segurados/editar/:id_segurado', function($id_segurado){

		User::verifyLogin();
		$segurados = new Segurados();
		$segurados->get((int)$id_segurado);
		$segurados->setDados($_POST);
		$segurados->editar();
		header("Location: /admin/segurados");
		exit;
	});
	//Fim Da Edição

	//Aqui Nós Exibimos As Propostas E Ou As Apolices
	$app->get('/admin/propostasApolices', function(){
		User::verifyLogin();

		$page = new PageAdmin();
		$page->setTpl("app-propostasApolices");
	});
	//Fim De Exibição

	//Aqui Nós Exibimos A Proposta E Ou Apólice Selecionada
    $app->get('/admin/propostasApolices/mostrar', function(){
        User::verifyLogin();

        $page = new PageAdmin();
        $page->setTpl("app-propostasApolices-mostrar");

    });
    //Fim Da Exibição

    //Aqui Nós Exibimos As Parcelas E Comissões Da Apólice Selecionada
    $app->get('/admin/parcelas/mostrar', function(){
        User::verifyLogin();

        $page = new PageAdmin();
        $page->setTpl("app-parcelasComissoes");

    });
    //Fim Da Exibição

    //Aqui Nós Exibimos A Página de cadastro de Parcelas E Comissões Da Apólice Selecionada
    $app->get('/admin/parcelas/novo/mostrar', function(){
        User::verifyLogin();

        $page = new PageAdmin();
        $page->setTpl("app-parcelasComissoes-novo");

    });
    //Fim Da Exibição

    //Aqui Nós Exibimos A Página de edição de Parcelas E Comissões Da Apólice Selecionada
    $app->get('/admin/parcelas/editar/mostrar', function(){
        User::verifyLogin();

        $page = new PageAdmin();
        $page->setTpl("app-parcelasComissoes-editar");

    });
    //Fim Da Exibição

    //Aqui Nós Vamos Usar O Método Post Para Trazer Os Arquivos E Por Sua Vez, Enviamos Para Editar
    $app->post('/admin/propostasApolices/editar/:id_propostasApolices', function($id_propostasApolices){

        User::verifyLogin();


    });
    //Fim Da Edição

    //
    $app->post('/admin/propostasApolices/novo', function(){

        User::verifyLogin();


    });
    //

    //
    $app->post('/admin/parcelas/novo', function(){

        User::verifyLogin();


    });
    //

    //
    $app->post('/admin/parcelas/editar/mostrar', function(){

        User::verifyLogin();


    });
    //

    //
    $app->get('/admin/parcelas/apagar/mostrar', function(){

        User::verifyLogin();


    });
    //

    //
    $app->get('/admin/financeiro/pagamentos', function(){

        User::verifyLogin();

        $page = new PageAdmin();
        $page->setTpl("app-financeiro");

    });
    //

    //
    $app->get('/admin/financeiro/efectuarPagamento', function(){

        User::verifyLogin();

        $page = new PageAdmin();
        $page->setTpl("app-fazer-pagamento");

    });
    //


    //
    $app->get('/admin/relatorios/comissoes', function(){

        User::verifyLogin();

        $page = new PageAdmin();
        $page->setTpl("app-relatorios-comissoes");

    });
    //

    //
    $app->get('/admin/arquivos/relatorios/pdf/HVASFKHVASFHAVF', function(){

        User::verifyLogin();

        $page = new PageAdmin();
        $page->setTpl("app-relatorios-abrirpdf");

    });
    //

	$app->get('/admin/despesas', function(){
		
		User::verifyLogin();
		$segurados = Segurados::listAll();
		$tipo_despesa = Despesas::TiposDespesa();
		$forma_pagamento = Despesas::forma_pagamento();
		$rows = Despesas::rows();
		$total = Despesas::totDespesas();
		//$conta = count($despesas);

		$parcial = new Parcial();
		$meses = $parcial->meses($segurados);
		$anos = $parcial->anos($segurados);

		$page = new PageAdmin();
		$page->setTpl("app-despesas", array(
			"segurados"=>$segurados,
			"tipo_despesa"=>$tipo_despesa,
			"forma_pagamento"=>$forma_pagamento,
			"anos"=>$anos,
			"meses"=>$meses,
			"rows"=>$rows,
			"total"=>$total
		));
		
	});

	$app->get('/admin/despesas/novo/:id_cliente', function($id_cliente){
		
		User::verifyLogin();
		$cliente = Segurados::listWhere($id_cliente);
		$tipo_despesa = Despesas::TiposDespesa();
		$forma_pagamento = Despesas::forma_pagamento();
		//$conta = count($despesas);

		$page = new PageAdmin();
		$page->setTpl("app-despesas-novo", array(
			"cliente"=>$cliente,
			"tipo_despesa"=>$tipo_despesa,
			"forma_pagamento"=>$forma_pagamento
		));
		
	});

	$app->get('/admin/despesas/:id_cliente/apagar/:id_despesas', function($id_cliente,$id_despesas){
		
		User::verifyLogin();
		$despesa = new Despesas();
		$despesa->get((int)$id_despesas);

		$despesa->apagar();
		header("Location: /admin/despesas/cliente/$id_cliente");
		exit;

		
	});

	$app->get('/admin/despesas/editar/:id_despesa', function($id_despesa){
		
		User::verifyLogin();

		$cliente = Despesas::clienteDespesaEdit($id_despesa);
		$tipo_despesa = Despesas::TiposDespesa();
		$forma_pagamento = Despesas::forma_pagamento();
		//$conta = count($despesas);

		$page = new PageAdmin();
		$page->setTpl("app-despesas-editar", array(
			"cliente"=>$cliente,
			"tipo_despesa"=>$tipo_despesa,
			"forma_pagamento"=>$forma_pagamento
		));
		
	});
	

	$app->get('/admin/despesas/cliente/:id_cliente', function($id_cliente){



		$Despesas = new Despesas();
		$cliente = $Despesas->selectCliente($id_cliente);
		$despesas = $Despesas->clienteDespesa($id_cliente);
		$rows = Despesas::rowsSegurados($id_cliente);
		$total = Despesas::totDespesasCliente($id_cliente);
		$page = new PageAdmin();
		$page->setTpl("app-desp-indi", array(
			"cliente"=>$cliente,
			"despesas"=>$despesas,
			"rowsCliente"=>$rows,
			"total"=>$total
		));
		

	});

	$app->post('/admin/despesas/novo', function(){

		$despesas = new Despesas();
		User::verifyLogin();
		$despesas->setDados($_POST);
		$id_cliente = $despesas->cadastrar();
		header("Location: /admin/despesas/cliente/$id_cliente");
		exit;
	});

	$app->post('/admin/despesas/editar/:id_despesa', function($id_despesa){

		$despesas = new Despesas();
		User::verifyLogin();
		$despesas->setDados($_POST);
		$id_cliente = $despesas->editar($id_despesa);
		header("Location: /admin/despesas/cliente/$id_cliente");
		exit;
	});

	
	$app->get('/admin/seguradoras', function(){
		
		User::verifyLogin();
		$Seguradora = new Seguradoras();
		$Seguradoras = $Seguradora->listAll();
		$rows = $Seguradora->rows();	

		$page = new PageAdmin();
		$page->setTpl("app-seguradoras", array(
			"Seguradoras"=>$Seguradoras,
			"rows"=>$rows
		));
		exit;
	});

	$app->get('/admin/seguradoras/novo', function(){
		
		User::verifyLogin();	

		$page = new PageAdmin();
		$bairros = Parcial::bairrosList();
		$page->setTpl("app-seguradoras-novo", array(
			"bairros"=>$bairros
		));
		exit;
	});

	$app->get('/admin/seguradoras/editar/:id_seguradora', function($id_seguradora){
		
		User::verifyLogin();	

		$page = new PageAdmin();
		$bairros = Parcial::bairrosList();
		$page->setTpl("app-seguradoras-editar", array(
			"bairros"=>$bairros
		));
		exit;
	});

	$app->post('/admin/seguradora/novo', function(){

		User::verifyLogin();

		$segurados = new Seguradoras();
		$segurados->setDados($_POST);
		$segurados->cadastrar();
		header("Location: /admin/seguradoras");
		exit;


	});

	$app->run();


?>