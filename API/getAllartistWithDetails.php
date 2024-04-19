<?php
include "DBconnect.php";

$sql = SQLQuery("
                    SELECT DISTINCT
                    `Artist`.`Fname`,
                    `Artist`.`Lname`,
                    GROUP_CONCAT(`Song`.`Title`) AS 'Title',
                    `Artist`.`gender`,
                    `Artist`.`country`
                    FROM
                    `Song`
                    JOIN `Artist` ON `Song`.`ID_artist` = `Artist`.`ID_artist`
                    GROUP BY
                    `Artist`.`Fname` ASC
                    ");

$ArtistDetails = [];

foreach($sql as $q){
    $ArtistDetails[] = [
        'Fname' => $q['Fname'],
        'Lname' => $q['Lname'],
        'gender' => $q['gender'],
        'country' => $q['country'],
        'Artist\'s songs' => $q['Artist\'s songs']
    ];
}

header('Content-Type: application/json');
echo json_encode($ArtistDetails);

?>