<?php
// if ($_SERVER['REQUEST_METHOD'] != "POST") {
//     return;
// }

include 'DBconnect.php';

if(isset($_POST['username'])){
    
    $username = $_POST['username'];
    $password = SHA1($_POST['password']); // Hash password for security

    
    $users = SQLQuery("SELECT * FROM `Customer`  WHERE (`userName` = '$username' OR `Email` = '$username')
                                AND `Password` = '$password'");
    
    
    if(count($users) > 0){
        session_start();
        // $_SESSION['customerID'] = $users[0]['ID_customer'];
        $ID = $users[0]['ID_customer'];
        $admin = $users[0]['isAdmin'];
        if($username == 'Admin' && $admin == 1){
            $response = array('status' => 'successAdminLogin', 'ID' => $ID);
        }else{
        $response = array('status' => 'successLogin', 'ID' => $ID);
        }
        echo json_encode($response);
    }else{
        echo json_encode(array('status' => 'errorLogin'));
    }
}

?>