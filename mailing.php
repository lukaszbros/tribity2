<?php
	if (function_exists("date_default_timezone_set"))
	{	
		date_default_timezone_set('Europe/Warsaw');
	}
	
    require_once('php/mail.php');
	
	$mailServerConnection = new MailServerConnection();
	$body ="Someone filed and send form from site <br />";
	$body.=" First name: ".htmlentities($_REQUEST['first_name'])."<br />";
	$body.=" Last name: ".htmlentities($_REQUEST['last_name'])."<br />";
	$body.=" Email: ".htmlentities($_REQUEST['email'])."<br />";
	$body.=" Purpose: ".htmlentities($_REQUEST['purpose'])."<br />";
	$body.=" Project description: ".htmlentities($_REQUEST['project_description'])."<br />";
	if ($mailServerConnection->sendMail('office@tribity.com', 'Tribity page form', $body)) {
		echo 'success';
	} else {
		echo 'error';
	}
?>