<?php
	session_start();
	require_once("vendor/autoload.php");

	use \Slim\slim;
	use \Seguradora\Page;
	use \Seguradora\PageAdmin;
	use \Seguradora\Model\User;
	use \Seguradora\Model\Clientes;
	use \Seguradora\Model\Parcial;
	use \Seguradora\Model\Despesas;
	

	$app = new \Slim\Slim();

	$app->config('debug', true);

	$app->get('/', function() {

		$page = new Page();
		$page->setTpl("index");

	});

	$app->get('/er/manutencao', function(){
		$page = new Page([
			"footer" =>false
		]);
		$page->setTpl("manutencao");
	});

	$app->get('/admin', function() {

		User::verifyLogin();
		$page = new PageAdmin();

		$page->setTpl("index");

	});

	$app->get('/usuario/login', function(){

		
		User::verifyLogado();

		$page = new PageAdmin();
		$page->setTpl("user-login");

	});

	$app->post('/usuario/login', function(){

		User::login($_POST["user"], $_POST["senha"]);
			header("Location: /admin");
		exit;
		
	});

	$app->get('/usuario/logout', function(){

		User::logout();

		header("Location: /usuario/login");
		exit;

	});

	$app->get('/usuario/novo', function(){

		$page = new PageAdmin();
		$page->setTpl("user-cadastro");

	});

	$app->post('/usuario/novo', function(){
		//var_dump($_POST);


		$user = new User();
		$user->setDados($_POST);
		$user->salvar();
		header("Location: /usuario/login");
		exit;
	});

	$app->get('/admin/clientes', function(){

		User::verifyLogin();
		$clientes = Clientes::listAll();
		$conta = count($clientes);

		$page = new PageAdmin();
		$page->setTpl("app-clientes", array(
			"clientes"=>$clientes,
			"contagem"=>$conta
		));
	});

	$app->get('/admin/clientes/novo', function(){

		User::verifyLogin();
		$bairros = Parcial::bairrosList();
		$page = new PageAdmin();
		$page->setTpl("app-clientes-novo", array(
			"bairros"=>$bairros
		));
	});

	$app->get('/admin/clientes/editar/:id_cliente', function($id_cliente){

		User::verifyLogin();
		$clientes = new Clientes();
		$clientes->get((int)$id_cliente);
		
		$bairros = Parcial::bairrosList();

		$page = new PageAdmin();
		$page->setTpl("app-clientes-editar", array(
			"clientes"=>$clientes->getValues(),
			"bairros"=>$bairros
		));
	});

	$app->get('/admin/clientes/deletar/:id_cliente', function($id_cliente){

		User::verifyLogin();
		$cliente = new Clientes();

		$cliente->get((int)$id_cliente);

		$cliente->deletar();
		header("Location: /admin/clientes");
		exit;
	});

	$app->post('/admin/clientes/novo', function(){

		User::verifyLogin();

		$clientes = new Clientes();
		$clientes->setDados($_POST);
		$clientes->cadastrar();
		header("Location: /admin/clientes");
		exit;


	});

	$app->post('/admin/clientes/editar/:id_cliente', function($id_cliente){

		User::verifyLogin();
		$clientes = new Clientes();
		$clientes->get((int)$id_cliente);
		$clientes->setDados($_POST);
		$clientes->editar();
		header("Location: /admin/clientes");
		exit;
	});

	$app->get('/admin/despesas', function(){
		
		User::verifyLogin();
		$clientes = Clientes::listAll();
		$tipo_despesa = Despesas::TiposDespesa();
		$forma_pagamento = Despesas::forma_pagamento();
		$rows = Despesas::rows();
		$total = Despesas::totDespesas();
		//$conta = count($despesas);

		$parcial = new Parcial();
		$meses = $parcial->meses($clientes);
		$anos = $parcial->anos($clientes);

		$page = new PageAdmin();
		$page->setTpl("app-despesas", array(
			"clientes"=>$clientes,
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
		$cliente = Clientes::listWhere($id_cliente);
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
		$rows = Despesas::rowsClientes($id_cliente);
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

	$app->post('/admin/despesas/editar', function(){

		$despesas = new Despesas();
		User::verifyLogin();
		$despesas->setDados($_POST);
		$id_cliente = $despesas->editar();
		header("Location: /admin/despesas/cliente/$id_cliente");
		exit;
	});

	$app->run();


?>