<?php
// Database connection parameters
$host = 'mariadb'; // The hostname of your MariaDB container
$user = 'dbking'; // The MySQL user
$password = 'dgarizad'; // The MySQL password

// Connect to MySQL server
$conn = new mysqli($host, $user, $password);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Query to fetch database names
$query = "SHOW DATABASES";
$result = $conn->query($query);

// Check if the query was successful
if ($result) {
    // Output each database name
    while ($row = $result->fetch_assoc()) {
        echo $row['Database'] . "<br>";
    }
} else {
    echo "Error: " . $conn->error;
}

// Close the database connection
$conn->close();
?>
