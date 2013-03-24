<?php

require_once ('phpmailer.php');
/** 
* @brief Mail Server connector for system
*
* @ingroup actions
*/
class MailServerConnection
{
    private $mailServerConnection = null;
    
    function MailServerConnection()
    {
        $this->mailServerConnection = new PHPMailer();
        $this->mailServerConnection -> From = "office@tribity.com";
        $this->mailServerConnection -> FromName = "Tribity Office";
        $this->mailServerConnection->Username = 'office@tribity.com';
        $this->mailServerConnection->Password = '13022013';
        $this->mailServerConnection->CharSet = "UTF-8";
        $this->mailServerConnection->IsSMTP();
        $this->mailServerConnection->Host = 'mail.tribity.com';
        $this->mailServerConnection->SMTPAuth = true;
    }

    function sendMail($addressTo, $subject, $body)
    {    
		$this->mailServerConnection->AddAddress(trim($addressTo));
    	$this->mailServerConnection->Subject = $subject;
        $this->mailServerConnection->Body = $body;
        $this->mailServerConnection->IsHTML (true);

        if(!$this->mailServerConnection->Send()) {
	        return false;
        }
        
        $this->mailServerConnection->ClearAddresses();
		return true;
    }
}
?>