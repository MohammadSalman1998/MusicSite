<?php 

$connect = new PDO("mysql:host=localhost;dbname=id22034906_musicsitedb;charset=utf8", "id22034906_musicsitedb", "MusicSite@123456");
function SQLQuery($q)
{
    global $connect;
    $statement = $connect->prepare($q);
    $statement->execute();
    return $statement->fetchAll();
}

function SQLWithData($query, $data)
{
    global $connect;
    $statement = $connect->prepare($query);
    $statement->execute($data);
    return $statement->fetchAll();
}
function SQLlastID($query)
{
    global $connect;
    $statement = $connect->lastInsertId($query);
    return $statement;
}



?>