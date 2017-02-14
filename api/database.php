<?php
$servername = "localhost";
$username = "root";
$password = "Nashua";
$table = "vending";

// Create connection
$con = new mysqli($servername, $username, $password, $table);

// Check connection
if ($con->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
//echo "Connected successfully";
?>