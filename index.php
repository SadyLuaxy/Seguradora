<?php

	require_once("vendor/autoload.php");

	$app = new \Slim\Slim();

	$app->config('debug', true);

	$app->get('/', function() {

		$Sql = new Seguradora\DB\Sql();

		$results = $Sql->select("SELECT * FROM clientes");
		echo json_encode($results);
	});

	$app->run();

?>