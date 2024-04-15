<?php
// Include database connection details
require_once('DBconnect.php');

if(isset($_POST['username'])){
  // Get user data from POST request (replace with actual validation)
  $username = $_POST['username'];
  $password = password_hash($_POST['password'], PASSWORD_DEFAULT); // Hash password for security
  $firstName = $_POST['firstName'];
  $lastName = $_POST['lastName'];
  $address = $_POST['address'];
  $email = $_POST['email'];


  $users = SQLQuery("SELECT `ID_customer`, `userName`, `Password`, `Fname`, `Lname`, `Address`, `Email`
                      FROM `Customer` 
                      WHERE `userName` = '$username' OR `Email` = '$email'  ");


  if(count($users) > 0){
      
      echo json_encode(array('errorExist' => true, 'message' => 'This user name or email already exist, try another !'));
  }
  else{
    // Prepare SQL query to insert user data
    $query = "INSERT INTO `Customer` (`userName`, `Password`, `Fname`, `Lname`, `Address`, `Email`) VALUES (:username , :password , :firstName , :lastName, :address, :email)";

    $data = [
        ":username"     =>  $username,
        ":password"       =>  $password,
        ":firstName"        => $firstName,
        ":lastName"       =>  $lastName,
        ":address"      =>   $address,
        ":email"   =>      $email
    ];

    // Execute query using SQLWithData
    $result = SQLWithData($query, $data);



    if ($result) {
      echo json_encode(array('success' => true, 'message' => 'Registration successful!'));
    } else {
      echo json_encode(array('success' => false, 'message' => 'Registration failed!'));
    }
  }   
}
?>