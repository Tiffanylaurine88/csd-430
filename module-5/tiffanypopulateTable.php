<?php
/*
 * Tiffany Davidson
 * Module 5.2 Assignment
 * File: tiffanypopulateTable.php
 * Purpose: Populates the tiffany_movies_data table with 10 movie records.
 */

$servername = "localhost";
$username = "student1";
$password = "pass";
$dbname = "CSD430";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$clearTable = "DELETE FROM tiffany_movies_data";
$conn->query($clearTable);

$resetAutoIncrement = "ALTER TABLE tiffany_movies_data AUTO_INCREMENT = 1";
$conn->query($resetAutoIncrement);

$sql = "INSERT INTO tiffany_movies_data (title, genre, release_year, rating, director)
VALUES
('Sweet Home Alabama', 'Romantic Comedy', 2002, 'PG-13', 'Andy Tennant'),
('Remember the Titans', 'Sports Drama', 2000, 'PG', 'Boaz Yakin'),
('The Blind Side', 'Sports Drama', 2009, 'PG-13', 'John Lee Hancock'),
('Twister', 'Action', 1996, 'PG-13', 'Jan de Bont'),
('Top Gun: Maverick', 'Action', 2022, 'PG-13', 'Joseph Kosinski'),
('Steel Magnolias', 'Drama', 1989, 'PG', 'Herbert Ross'),
('The Proposal', 'Romantic Comedy', 2009, 'PG-13', 'Anne Fletcher'),
('Forrest Gump', 'Drama', 1994, 'PG-13', 'Robert Zemeckis'),
('Fried Green Tomatoes', 'Drama', 1991, 'PG-13', 'Jon Avnet'),
('The Notebook', 'Romance', 2004, 'PG-13', 'Nick Cassavetes')";

echo "<!DOCTYPE html>";
echo "<html>";
echo "<head><title>Populate Movies Table</title></head>";
echo "<body>";
echo "<h1>Populate Movies Table</h1>";

if ($conn->query($sql) === TRUE) {
    echo "<p>10 records were inserted into tiffany_movies_data successfully.</p>";
} else {
    echo "<p>Error inserting records: " . $conn->error . "</p>";
}

$result = $conn->query("SELECT * FROM tiffany_movies_data");

if ($result->num_rows > 0) {
    echo "<h2>Current Movie Records</h2>";
    echo "<table border='1' cellpadding='8' cellspacing='0'>";
    echo "<tr><th>ID</th><th>Title</th><th>Genre</th><th>Release Year</th><th>Rating</th><th>Director</th></tr>";

    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" . $row["movie_id"] . "</td>";
        echo "<td>" . $row["title"] . "</td>";
        echo "<td>" . $row["genre"] . "</td>";
        echo "<td>" . $row["release_year"] . "</td>";
        echo "<td>" . $row["rating"] . "</td>";
        echo "<td>" . $row["director"] . "</td>";
        echo "</tr>";
    }

    echo "</table>";
} else {
    echo "<p>No records found.</p>";
}

echo "<p><a href='index.jsp'>Back to Module Links</a></p>";
echo "</body>";
echo "</html>";

$conn->close();
?>
