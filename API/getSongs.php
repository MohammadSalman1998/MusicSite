<?php
include "DBconnect.php";

$sql = SQLQuery("SELECT `ID_song`, `Title`, `Type`, `Price`, `Artist`.`Fname`, `Artist`.`Lname` FROM `Song`,Artist WHERE `Song`.`ID_artist` = `Artist`.`ID_artist` ORDER BY `Title` ASC");

$songs = [];

foreach($sql as $q){
    $songs[] = [
        'ID_song' => $q['ID_song'],
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