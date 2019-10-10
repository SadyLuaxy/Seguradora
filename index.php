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

	$app->get('/admin', function() {

		User::verifyLogin();
		$page = new PageAdmin();

		$page->setTpl("index");

	});

	$app->get('/admin/usuario/login', function(){

		$page = new PageAdmin();
		$page->setTpl("user-login");

	});

	$app->post('/admin/usuario/login', function(){

		User::login($_POST["user"], $_POST["senha"]);
			header("Location: /admin");
		exit;
		
	});

	$app->get('/admin/usuario/logout', function(){

		User::logout();

		header("/admin/usuario/login");
		exit;

	});

	$app->get('/admin/usuario/novo', function(){

		$page = new PageAdmin();
		$page->setTpl("user-cadastro");

	});

	$app->post('/admin/usuario/novo', function(){
		//var_dump($_POST);

		$user = new User();
		$user->setDados($_POST);
		$user->salvar();
		header("Location: /admin/usuario/login");
		exit;
	});

	$app->run();


?>