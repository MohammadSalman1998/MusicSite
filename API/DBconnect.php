<?php 

  $connect = new PDO("mysql:host=localhost;dbname=id22034906_musicsitedb;charset=utf8", "id22034906_musicsitedb", "MusicSite@123456");



// Function for executing SQL queries without data binding
function SQLQuery($q)
{
    global $connect;
    $statement = $connect->prepare($q);
    $statement->execute();
    return $statement->fetchAll();
}

// Function for executing SQL queries with data binding
function SQLWithData($query, $data)
{
    global $connect;
    $statement = $connect->prepare($query);
    $statement->execute($data);
    return $statement->fetchAll();
}
// Function for executing SQL queries to get last ID
function SQLlastID($query)
{
    global $connect;
    $statement = $connect->lastInsertId($query);
    return $statement;
}



?>