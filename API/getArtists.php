<?php
include "DBconnect.php";

$sql = SQLQuery("SELECT `ID_artist`, `Fname`, `Lname` FROM `Artist` ORDER BY `Fname` ASC");

$artists = [];

foreach($sql as $q){
    $artists[] = [
        'ID_artist' => $q['ID_artist'],
        'Fname' => $q['Fname'],
        'Lname' => $q['Lname']
    ];
}

header('Content-Type: application/json');
echo json_encode($artists);

?>