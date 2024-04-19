<?php

include 'DBconnect.php';
include 'verifyLogin.php';

if(isset($_POST['CreditCard'])){
session_start();
  $ID_customer = $_SESSION['customerID'];
  $Total = $_POST['Total'];
  $CreditCard = $_POST['CreditCard'];

    // Prepare SQL query to insert user data
    $query = "INSERT INTO `Invoice` (`ID_customer`, `Date`, `Total`, `CreditCard`) 
    VALUES (:ID_customer , CURRENT_DATE, :Total, :CreditCard)";

    $data = [
        ":ID_customer"        => $ID_customer,
        ":Total"      =>   $Total,
        ":CreditCard"   =>      $CreditCard
    ];

    // Execute query using SQLWithData
    $result = SQLWithData($query, $data);

    if ($result) {
      echo json_encode('successBuy');
    } else {
      echo json_encode('faildBuy');
    }
  }   
?>