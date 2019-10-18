<?php
	session_start();
	require_once("vendor/autoload.php");

	use \Slim\slim;
	use \Seguradora\Page;
	use \Seguradora\PageAdmin;
	use \Seguradora\Model\User;
	use \Seguradora\Model\Clientes;
	use \Seguradora\Model\Parcial;
	

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
	
	$app->get('/admin/clientes/:id_funcionario/apagar', function($id_funcionario){

		User::verifyLogin();


	});

	$app->post('/admin/clientes/editar', function($id_funcionario){

		User::verifyLogin();
		

	});

	$app->post('/admin/clientes/novo', function(){

		User::verifyLogin();

		$clientes = new Clientes();
		$clientes->setDados($_POST);
		$clientes->cadastrar();
		header("Location: /admin/clientes");
		exit;


	});

	

	$app->run();


?>