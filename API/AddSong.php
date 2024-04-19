<?php

include 'DBconnect.php';

if(isset($_POST['Title']) && isset($_POST['ID_artist'])){

  $Title = $_POST['Title'];
  $Type = $_POST['Type'];
  $Price = $_POST['Price'];
  $ID_artist = $_POST['ID_artist'];

    $query = "INSERT INTO `Song` (`Title`, `Type`, `Price`, `ID_artist`) VALUES (:Title , :Type, :Price, :ID_artist)";

    $data = [
        ":Title"        => $Title,
        ":Type"       =>  $Type,
        ":Price"      =>   $Price,
        ":ID_artist"   =>      $ID_artist
    ];

    $result = SQLWithData($query, $data);

    if ($result) {
      echo json_encode('successAddSong');
    } else {
      echo json_encode('faildAddSong');
    }
  }   
?>