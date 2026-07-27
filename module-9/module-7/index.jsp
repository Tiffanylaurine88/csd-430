<%--
    Tiffany Davidson
    Module 7 Project Part 2
    File: index.jsp
    Purpose: Updated project index that links to the Module 7 movie entry form
             and the complete database record display.
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CSD430 Module 7 Movie Database</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 900px;
            margin: 40px auto;
            padding: 0 20px;
            line-height: 1.6;
            background-color: #f7f7f7;
            color: #222222;
        }
        main {
            background-color: #ffffff;
            padding: 28px;
            border: 1px solid #cccccc;
            border-radius: 8px;
        }
        a {
            color: #174a7e;
        }
        li {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <main>
        <h1>CSD430 Module 7 Movie Database</h1>

        <p>
            This is Project Part 2 of the movie database project from Modules 5 and 6.
            The project continues to use the CSD430 MySQL database and the
            tiffany_movies_data table.
        </p>

        <h2>Module 7 Project Pages</h2>
        <ul>
            <li><a href="addMovie.jsp">Add a New Movie Record</a></li>
            <li><a href="movieRecords.jsp">Display All Movie Records</a></li>
        </ul>

        <h2>Previous Project Pages</h2>
        <p>
            The original Module 5 and 6 project files are included separately in the
            submission and contain the original table creation, population, deletion,
            and record-selection work.
        </p>
        <p><a href="../module-5/index.jsp">Open the Module 5 and 6 Project Index</a></p>
    </main>
</body>
</html>
