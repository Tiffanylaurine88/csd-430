<%--
    Tiffany Davidson
    Module 7 Project Part 2
    File: addMovie.jsp
    Purpose: Displays an HTML form that gathers the five non-key movie fields
             needed to add a new database record.
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add a Movie Record</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 900px;
            margin: 40px auto;
            padding: 0 20px;
            line-height: 1.5;
            background-color: #f7f7f7;
            color: #222222;
        }
        main {
            background-color: #ffffff;
            padding: 28px;
            border: 1px solid #cccccc;
            border-radius: 8px;
        }
        .form-row {
            margin-bottom: 16px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input, select {
            width: 100%;
            max-width: 500px;
            padding: 9px;
            border: 1px solid #888888;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button {
            padding: 10px 18px;
            cursor: pointer;
        }
        .note {
            background-color: #eef4fa;
            border-left: 4px solid #174a7e;
            padding: 12px;
        }
        a {
            color: #174a7e;
        }
    </style>
</head>
<body>
    <main>
        <h1>Add a New Movie Record</h1>

        <p>
            Enter the movie information below. The database automatically creates the
            movie ID after the form is submitted, so the key field is not entered by the user.
        </p>

        <p class="note">
            All fields are required. After the record is added, the next page displays
            every movie record in the database table.
        </p>

        <form action="movieRecords.jsp" method="post">
            <div class="form-row">
                <label for="title">Movie Title</label>
                <input type="text" id="title" name="title" maxlength="100" required>
            </div>

            <div class="form-row">
                <label for="genre">Genre</label>
                <input type="text" id="genre" name="genre" maxlength="50" required>
            </div>

            <div class="form-row">
                <label for="release_year">Release Year</label>
                <input type="number" id="release_year" name="release_year"
                       min="1888" max="2100" required>
            </div>

            <div class="form-row">
                <label for="rating">Movie Rating</label>
                <select id="rating" name="rating" required>
                    <option value="">-- Select a Rating --</option>
                    <option value="G">G</option>
                    <option value="PG">PG</option>
                    <option value="PG-13">PG-13</option>
                    <option value="R">R</option>
                    <option value="NR">NR</option>
                </select>
            </div>

            <div class="form-row">
                <label for="director">Director</label>
                <input type="text" id="director" name="director" maxlength="100" required>
            </div>

            <button type="submit">Add Movie and Display All Records</button>
        </form>

        <p><a href="movieRecords.jsp">View All Current Records</a></p>
        <p><a href="index.jsp">Back to Module 7 Index</a></p>
    </main>
</body>
</html>
