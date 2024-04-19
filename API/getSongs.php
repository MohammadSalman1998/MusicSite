<?php
include "DBconnect.php";

// $sql = SQLQuery("SELECT `Title`, `Type`, `Price`, `ID_artist` FROM `Song` ORDER BY `Title` ASC");
$sql = SQLQuery("SELECT  `Title`, `Type`, `Price`, `Artist`.`Fname`, `Artist`.`Lname` FROM `Song`,Artist WHERE `Song`.`ID_artist` = `Artist`.`ID_artist` ORDER BY `Title` ASC");

$songs = [];

foreach($sql as $q){
    $songs[] = [
        'Title' => $q['Title'],
        'Type' => $q['Type'],
        'Price' => $q['Price'],
        'Fname' => $q['Fname'],
        'Lname' => $q['Lname']
    ];
}

header('Content-Type: application/json');
echo json_encode($songs);

?>