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

	$app->get('/admin/login', function(){

		$page = new PageAdmin();
		$page->setTpl("user-login");

	});

	$app->post('/admin/login', function(){

		User::login($_POST["user"], $_POST["senha"]);
			header("Location: /admin");
		exit;
		
	});

	$app->get('/admin/logout', function(){

		User::logout();

		header("/admin/login");
		exit;

	});

	$app->run();


?>