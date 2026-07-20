<%@ page import="com.tiffany.csd430.MovieBean" %>

<%--
    Tiffany Davidson
    Module 8.2 Project Part 3
    File: editMovie.jsp
    Purpose: Retrieves the selected database record and displays the five
             editable values in input tags. The primary key is displayed as
             non-updatable text.
--%>

<%!
    private String escapeHtml(String value) {
        if (value == null) {
            return "";
        }

        return value.replace("&", "&amp;")
                    .replace("<", "&lt;")
                    .replace(">", "&gt;")
                    .replace("\"", "&quot;")
                    .replace("'", "&#39;");
    }
%>

<%
    request.setCharacterEncoding("UTF-8");

    String errorMessage = "";
    MovieBean selectedMovie = null;
    String movieIdText = request.getParameter("movie_id");

    if (movieIdText == null || movieIdText.trim().isEmpty()) {
        errorMessage = "Select a movie record before opening the update form.";
    } else {
        try {
            int movieId = Integer.parseInt(movieIdText.trim());

            if (movieId <= 0) {
                errorMessage = "The selected movie key is invalid.";
            } else {
                MovieBean movieData = new MovieBean();
                selectedMovie = movieData.getMovieById(movieId);

                if (selectedMovie == null) {
                    errorMessage = "The selected movie record could not be found.";
                }
            }
        } catch (NumberFormatException e) {
            errorMessage = "The selected movie key must be a whole number.";
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Movie Record</title>
    <style>
        * {
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            max-width: 900px;
            margin: 40px auto;
            padding: 0 20px;
            line-height: 1.5;
            background-color: #f3f6f9;
            color: #1f2933;
        }
        main {
            background-color: #ffffff;
            padding: 30px;
            border: 1px solid #c8d2dc;
            border-radius: 10px;
            box-shadow: 0 4px 14px rgba(0, 0, 0, 0.08);
        }
        h1 {
            color: #173f67;
        }
        .form-row {
            margin-bottom: 17px;
        }
        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
        }
        input {
            width: 100%;
            max-width: 600px;
            padding: 10px;
            border: 1px solid #73879a;
            border-radius: 5px;
        }
        .key-value {
            max-width: 600px;
            padding: 10px;
            border: 1px solid #aebcc8;
            border-radius: 5px;
            background-color: #e9eef3;
            font-weight: bold;
        }
        .note {
            padding: 13px;
            background-color: #eef5fb;
            border-left: 5px solid #25679b;
        }
        .error {
            padding: 12px;
            border: 1px solid #a33a3a;
            background-color: #fff0f0;
        }
        button {
            padding: 11px 18px;
            border: 0;
            border-radius: 5px;
            background-color: #174f7a;
            color: #ffffff;
            font-weight: bold;
            cursor: pointer;
        }
        button:hover {
            background-color: #103b5d;
        }
        a {
            color: #174f7a;
        }
    </style>
</head>
<body>
    <main>
        <h1>Update Movie Record</h1>

        <%
            if (!errorMessage.isEmpty()) {
        %>
            <p class="error"><%= escapeHtml(errorMessage) %></p>
            <p><a href="selectMovie.jsp">Return to the Movie Dropdown</a></p>
        <%
            } else {
        %>
            <p class="note">
                The Movie ID is the primary key and cannot be changed. Update any
                of the five remaining values, then submit the form.
            </p>

            <form action="updateMovie.jsp" method="post">
                <div class="form-row">
                    <label>Movie ID (Primary Key)</label>
                    <div class="key-value"><%= selectedMovie.getMovieId() %></div>
                    <input type="hidden" name="movie_id" value="<%= selectedMovie.getMovieId() %>">
                </div>

                <div class="form-row">
                    <label for="title">Movie Title</label>
                    <input type="text" id="title" name="title" maxlength="100"
                           value="<%= escapeHtml(selectedMovie.getTitle()) %>" required>
                </div>

                <div class="form-row">
                    <label for="genre">Genre</label>
                    <input type="text" id="genre" name="genre" maxlength="50"
                           value="<%= escapeHtml(selectedMovie.getGenre()) %>" required>
                </div>

                <div class="form-row">
                    <label for="release_year">Release Year</label>
                    <input type="number" id="release_year" name="release_year"
                           min="1888" max="2100"
                           value="<%= selectedMovie.getReleaseYear() %>" required>
                </div>

                <div class="form-row">
                    <label for="rating">Movie Rating</label>
                    <input type="text" id="rating" name="rating" maxlength="10"
                           value="<%= escapeHtml(selectedMovie.getRating()) %>" required>
                </div>

                <div class="form-row">
                    <label for="director">Director</label>
                    <input type="text" id="director" name="director" maxlength="100"
                           value="<%= escapeHtml(selectedMovie.getDirector()) %>" required>
                </div>

                <button type="submit">Update Movie Record</button>
            </form>

            <p><a href="selectMovie.jsp">Choose a Different Movie</a></p>
        <%
            }
        %>

        <p><a href="index.jsp">Back to Module 8 Index</a></p>
    </main>
</body>
</html>
