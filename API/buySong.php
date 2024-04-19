<?php

include 'DBconnect.php';

if(isset($_POST['CreditCard'])){
  $ID_customer = $_POST['IDCustomer'];
  $Total = $_POST['Total'];
  $CreditCard = $_POST['CreditCard'];
  $ID_song = $_POST['ID_song'];

    $query = "INSERT INTO `Invoice` (`ID_customer`, `Date`, `Total`, `CreditCard`) VALUES (:ID_customer , CURRENT_DATE, :Total, :CreditCard)";

    $data = [
        ":ID_customer"        => $ID_customer,
        ":Total"      =>   $Total,
        ":CreditCard"   =>      $CreditCard
    ];

    // Execute query using SQLWithData
    $resultBuy = SQLWithData($query, $data);
    
    $lastInvoiceId = SQLlastID($query);
    
     $queryOrder = "INSERT INTO `Order`( `ID_song`, `ID_invoice`) VALUES (:ID_song , :ID_invoice)";

    $dataOrder = [
        ":ID_song"        => $ID_song,
        ":ID_invoice"      =>   $lastInvoiceId
    ];

    // Execute query using SQLWithData
    $resultOrder = SQLWithData($queryOrder, $dataOrder);
    

    if ($resultBuy && $resultOrder) {
    //   echo json_encode('successBuy');
      echo json_encode(array('statusBuy' => 'successBuy'));
    } else {
    //   echo json_encode('faildBuy');
      echo json_encode(array('statusBuy' => 'faildBuy'));
    }
  }
  else {
    echo json_encode('Please provide a credit card number.');
}
?>