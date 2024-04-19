<?php
include "DBconnect.php";

if(isset($_POST['ID_customer'])){

  $ID_customer = $_POST['ID_customer'];

$sql = SQLQuery("
                    SELECT `Song`.`Title`, `Song`.`Type`, `Artist`.`Fname`, `Artist`.`Lname`, `Invoice`.`Date`, `Invoice`.`Total`
                    FROM `Song`
                    JOIN `Artist` ON `Song`.`ID_artist` = `Artist`.`ID_artist`
                    JOIN `Order` ON `Song`.`ID_song` = `Order`.`ID_song`
                    JOIN `Invoice` ON `Invoice`.`ID_invoice` = `Order`.`ID_invoice`
                    WHERE `Invoice`.`ID_customer` = '$ID_customer'
                    ORDER BY `Invoice`.`Date` DESC
                    ");

$MySongs = [];

foreach($sql as $q){
    $MySongs[] = [
        'Title' => $q['Title'],
        'Type' => $q['Type'],
        'Fname' => $q['Fname'],
        'Lname' => $q['Lname'],
        'Date' => $q['Date'],
        'Total' => $q['Total'],

    ];
}

header('Content-Type: application/json');
echo json_encode($MySongs);
}

?>