<?php
/*
 * Tiffany Davidson
 * Module 5.2 Assignment
 * File: tiffanycreateTable.php
 * Purpose: Creates the tiffany_movies_data table in the CSD430 database.
 */

$servername = "localhost";
$username = "student1";
$password = "pass";
$dbname = "CSD430";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "CREATE TABLE IF NOT EXISTS tiffany_movies_data (
    movie_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    release_year INT NOT NULL,
    rating VARCHAR(10) NOT NULL,
    director VARCHAR(100) NOT NULL,
    PRIMARY KEY (movie_id)
)";

echo "<!DOCTYPE html>";
echo "<html>";
echo "<head><title>Create Movies Table</title></head>";
echo "<body>";
echo "<h1>Create Movies Table</h1>";

if ($conn->query($sql) === TRUE) {
    echo "<p>The table tiffany_movies_data was created successfully.</p>";
} else {
    echo "<p>Error creating table: " . $conn->error . "</p>";
}

echo "<p><a href='index.jsp'>Back to Module Links</a></p>";
echo "</body>";
echo "</html>";

$conn->close();
?>
