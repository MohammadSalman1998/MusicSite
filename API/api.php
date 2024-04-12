<?php 

$serverName = 'localhost';
$userName = 'id22034906_musicsitedb';
$Password = 'MusicSite@123456';
$dbName = 'id22034906_musicsitedb';
$table = '';

$con = new mysqli($serverName, $userName, $Password, $dbName);

if($con->connect_error){
    die("Connection failed: ". $con->connect_error);
    return;
}

$action = $_POST['action'];

?>