<?php

// Load environment variables from .env file
$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

// Database configuration
$host = $_ENV['DB_HOST'];
$dbname = $_ENV['DB_NAME'];
$username = $_ENV['DB_USERNAME'];
$password = $_ENV['DB_PASSWORD'];

// Connect to the database
$mysqli = new mysqli($host, $username, $password, $dbname);

// Check connection
if ($mysqli->connect_error) {
    echo  "failed";
    die("Connection failed: " . $mysqli->connect_error);
}

echo "Connected successfully";

// Perform a query to retrieve data
$sql = "SELECT * FROM your_table";
$result = $mysqli->query($sql);

// Check if the query was successful
if ($result) {
    // Output data of each row
    while ($row = $result->fetch_assoc()) {
        echo "id: " . $row["id"] . " - Name: " . $row["name"] . "<br>";
    }
} else {
    echo "Error: " . $mysqli->error;
}

// Close the connection
$mysqli->close();

?>
