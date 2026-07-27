<%@ page import="java.util.ArrayList" %>
<%@ page import="com.tiffany.csd430.MovieBean" %>

<%--
    Tiffany Davidson
    Module 7 Project Part 2
    File: movieRecords.jsp
    Purpose: Uses JSP scriptlets and the packaged MovieBean to add a submitted
             movie record and display all database records in an HTML table.
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
    String message = "";
    boolean addSuccessful = false;
    MovieBean movieData = new MovieBean();

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String title = request.getParameter("title");
        String genre = request.getParameter("genre");
        String releaseYearText = request.getParameter("release_year");
        String rating = request.getParameter("rating");
        String director = request.getParameter("director");

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

        if (title == null || title.isEmpty()
                || genre == null || genre.isEmpty()
                || releaseYearText == null || releaseYearText.isEmpty()
                || rating == null || rating.isEmpty()
                || director == null || director.isEmpty()) {

            message = "All five movie fields are required.";

        } else {
            try {
                int releaseYear = Integer.parseInt(releaseYearText);

                if (releaseYear < 1888 || releaseYear > 2100) {
                    message = "Enter a release year between 1888 and 2100.";
                } else {
                    message = movieData.addMovie(
                        title,
                        genre,
                        releaseYear,
                        rating,
                        director
                    );
                    addSuccessful = message.equals("The movie record was added successfully.");
                }

            } catch (NumberFormatException e) {
                message = "Release year must be a valid whole number.";
            }
        }
    }

    ArrayList<MovieBean> movies = movieData.getAllMovies();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Movie Records</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 1200px;
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 18px;
        }
        th, td {
            border: 1px solid #777777;
            padding: 9px;
            text-align: left;
            vertical-align: top;
        }
        th {
            background-color: #e8eef5;
        }
        .success {
            padding: 12px;
            border: 1px solid #397a3f;
            background-color: #edf8ee;
        }
        .error {
            padding: 12px;
            border: 1px solid #a33a3a;
            background-color: #fff0f0;
        }
        .description {
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
        <h1>All Movie Database Records</h1>

        <p class="description">
            This table displays every record stored in the tiffany_movies_data table.
            Each database field appears in its own column, including the automatically
            generated movie ID key.
        </p>

        <h2>Field Descriptions</h2>
        <p>
            Movie ID is the primary key. Title identifies the movie. Genre describes
            its category. Release Year shows when it was released. Rating gives the
            content rating, and Director identifies the person who directed the movie.
        </p>

        <%
            if (!message.isEmpty()) {
        %>
            <p class="<%= addSuccessful ? "success" : "error" %>">
                <strong>Result:</strong> <%= escapeHtml(message) %>
            </p>
        <%
            }
        %>

        <h2>Movie Records</h2>

        <%
            if (movies.isEmpty()) {
        %>
            <p>No movie records were found. Create and populate the table before adding a new record.</p>
        <%
            } else {
        %>
            <table>
                <thead>
                    <tr>
                        <th>Movie ID</th>
                        <th>Title</th>
                        <th>Genre</th>
                        <th>Release Year</th>
                        <th>Rating</th>
                        <th>Director</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (MovieBean movie : movies) {
                    %>
                        <tr>
                            <td><%= movie.getMovieId() %></td>
                            <td><%= escapeHtml(movie.getTitle()) %></td>
                            <td><%= escapeHtml(movie.getGenre()) %></td>
                            <td><%= movie.getReleaseYear() %></td>
                            <td><%= escapeHtml(movie.getRating()) %></td>
                            <td><%= escapeHtml(movie.getDirector()) %></td>
                        </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        <%
            }
        %>

        <p><a href="addMovie.jsp">Add Another Movie Record</a></p>
        <p><a href="index.jsp">Back to Module 7 Index</a></p>
    </main>
</body>
</html>
