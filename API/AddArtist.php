<?php

include 'DBconnect.php';

if(isset($_POST['firstName'])){

  $firstName = $_POST['firstName'];
  $lastName = $_POST['lastName'];
  $gender = $_POST['gender'];
  $country = $_POST['country'];

    // Prepare SQL query to insert user data
    $query = "INSERT INTO `Artist` (`Fname`, `Lname`, `gender`, `country`) VALUES (:firstName , :lastName, :gender, :country)";

    $data = [
        ":firstName"        => $firstName,
        ":lastName"       =>  $lastName,
        ":gender"      =>   $gender,
        ":country"   =>      $country
    ];

    // Execute query using SQLWithData
    $result = SQLWithData($query, $data);

    if ($result) {
      echo json_encode('successAddArtist');
    } else {
      echo json_encode('faildAddArtist');
    }
  }   
?>