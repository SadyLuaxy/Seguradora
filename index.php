<?php
	session_start();
	require_once("vendor/autoload.php");

	use \Slim\slim;
	use \Seguradora\Page;
	use \Seguradora\PageAdmin;
	use \Seguradora\Model\User;
	

	$app = new \Slim\Slim();

	$app->config('debug', true);

	$app->get('/', function() {

		$page = new Page();
		$page->setTpl("index");

	});

	$app->get('/er/manutencao', function(){
		$page = new Page();
		$page->setTpl("manutencao");
	});

	$app->get('/admin', function() {

		User::verifyLogin();
		$page = new PageAdmin();

		$page->setTpl("index");

	});

	$app->get('/usuario/login', function(){

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

		header("/usuario/login");
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

	$app->run();


?>