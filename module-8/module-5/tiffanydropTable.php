<?php
/*
 * Tiffany Davidson
 * Module 5.2 Assignment
 * File: tiffanydropTable.php
 * Purpose: Drops the tiffany_movies_data table from the CSD430 database.
 */

$servername = "localhost";
$username = "student1";
$password = "pass";
$dbname = "CSD430";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "DROP TABLE IF EXISTS tiffany_movies_data";

echo "<!DOCTYPE html>";
echo "<html>";
echo "<head><title>Drop Movies Table</title></head>";
echo "<body>";
echo "<h1>Drop Movies Table</h1>";

if ($conn->query($sql) === TRUE) {
    echo "<p>The table tiffany_movies_data was dropped successfully.</p>";
} else {
    echo "<p>Error dropping table: " . $conn->error . "</p>";
}

echo "<p><a href='index.jsp'>Back to Module Links</a></p>";
echo "</body>";
echo "</html>";

$conn->close();
?>
