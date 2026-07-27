<%@ page import="com.tiffany.csd430.MovieBean" %>

<%--
    Tiffany Davidson
    Module 8.2 Project Part 3
    File: updateMovie.jsp
    Purpose: Validates the submitted values, updates the selected database
             record, and displays the updated record in a table whose headers
             identify each database field type.
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

    String message = "";
    boolean updateSuccessful = false;
    MovieBean updatedMovie = null;

    if (!"POST".equalsIgnoreCase(request.getMethod())) {
        message = "Open this page by submitting the movie update form.";
    } else {
        String movieIdText = request.getParameter("movie_id");
        String title = request.getParameter("title");
        String genre = request.getParameter("genre");
        String releaseYearText = request.getParameter("release_year");
        String rating = request.getParameter("rating");
        String director = request.getParameter("director");

        if (movieIdText != null) {
            movieIdText = movieIdText.trim();
        }
        if (title != null) {
            title = title.trim();
        }
        if (genre != null) {
            genre = genre.trim();
        }
        if (releaseYearText != null) {
            releaseYearText = releaseYearText.trim();
        }
        if (rating != null) {
            rating = rating.trim();
        }
        if (director != null) {
            director = director.trim();
        }

        if (movieIdText == null || movieIdText.isEmpty()
                || title == null || title.isEmpty()
                || genre == null || genre.isEmpty()
                || releaseYearText == null || releaseYearText.isEmpty()
                || rating == null || rating.isEmpty()
                || director == null || director.isEmpty()) {

            message = "The movie key and all five editable fields are required.";

        } else {
            try {
                int movieId = Integer.parseInt(movieIdText);
                int releaseYear = Integer.parseInt(releaseYearText);

                if (movieId <= 0) {
                    message = "The movie key is invalid.";
                } else if (releaseYear < 1888 || releaseYear > 2100) {
                    message = "Enter a release year between 1888 and 2100.";
                } else {
                    MovieBean movieData = new MovieBean();
                    message = movieData.updateMovie(
                        movieId,
                        title,
                        genre,
                        releaseYear,
                        rating,
                        director
                    );

                    updateSuccessful = message.equals("The movie record was updated successfully.");

                    if (updateSuccessful) {
                        updatedMovie = movieData.getMovieById(movieId);

                        if (updatedMovie == null) {
                            updateSuccessful = false;
                            message = "The update completed, but the updated record could not be retrieved.";
                        }
                    }
                }

            } catch (NumberFormatException e) {
                message = "The movie key and release year must be valid whole numbers.";
            }
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Updated Movie Record</title>
    <style>
        * {
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            max-width: 1200px;
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
        h1, h2 {
            color: #173f67;
        }
        .success {
            padding: 13px;
            border: 1px solid #397a3f;
            background-color: #edf8ee;
        }
        .error {
            padding: 13px;
            border: 1px solid #a33a3a;
            background-color: #fff0f0;
        }
        .description {
            padding: 13px;
            background-color: #eef5fb;
            border-left: 5px solid #25679b;
        }
        .table-wrap {
            overflow-x: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 18px;
        }
        th, td {
            border: 1px solid #6f8192;
            padding: 10px;
            text-align: left;
            vertical-align: top;
        }
        th {
            background-color: #dfeaf3;
            color: #173f67;
        }
        .field-type {
            display: block;
            margin-top: 4px;
            font-size: 0.82rem;
            color: #3f5365;
            font-weight: normal;
        }
        a {
            color: #174f7a;
        }
    </style>
</head>
<body>
    <main>
        <h1>Updated Movie Record</h1>

        <p class="<%= updateSuccessful ? "success" : "error" %>">
            <strong>Result:</strong> <%= escapeHtml(message) %>
        </p>

        <%
            if (updateSuccessful && updatedMovie != null) {
        %>
            <p class="description">
                The table below displays the updated database record. Each header
                includes the field name and its MySQL data type.
            </p>

            <h2>Updated Record Data</h2>

            <div class="table-wrap">
                <table>
                    <thead>
                        <tr>
                            <th>Movie ID<span class="field-type">INT, Primary Key, AUTO_INCREMENT</span></th>
                            <th>Title<span class="field-type">VARCHAR(100), NOT NULL</span></th>
                            <th>Genre<span class="field-type">VARCHAR(50), NOT NULL</span></th>
                            <th>Release Year<span class="field-type">INT, NOT NULL</span></th>
                            <th>Rating<span class="field-type">VARCHAR(10), NOT NULL</span></th>
                            <th>Director<span class="field-type">VARCHAR(100), NOT NULL</span></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><%= updatedMovie.getMovieId() %></td>
                            <td><%= escapeHtml(updatedMovie.getTitle()) %></td>
                            <td><%= escapeHtml(updatedMovie.getGenre()) %></td>
                            <td><%= updatedMovie.getReleaseYear() %></td>
                            <td><%= escapeHtml(updatedMovie.getRating()) %></td>
                            <td><%= escapeHtml(updatedMovie.getDirector()) %></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        <%
            }
        %>

        <p><a href="selectMovie.jsp">Select Another Movie to Update</a></p>
        <p><a href="index.jsp">Back to Module 8 Index</a></p>
    </main>
</body>
</html>
