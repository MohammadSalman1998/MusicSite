<?php
if ($_SERVER['REQUEST_METHOD'] != "POST") {
    return;
}

require_once('DBconnect.php');


$username = $_POST['username'];
$password = password_hash($_POST['password'], PASSWORD_DEFAULT); // Hash password for security
$email = $_POST['email'];


$users = SQLQuery("SELECT `ID_customer`, `userName`, `Password`, `Fname`, `Lname`, `Address`, `Email`
                    FROM `Customer` 
                    WHERE (`userName` = '$userName' OR `Email` = '$email')
                    AND `Password` = '$Password'");


if(count($users) > 0){
    echo json_encode('successLogin');
}


?>