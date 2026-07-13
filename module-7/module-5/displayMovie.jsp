<%@ page import="com.tiffany.csd430.MovieBean" %>

<%--
    Tiffany Davidson
    Module 5.3 / 6.3 Assignment
    File: displayMovie.jsp
    Purpose: Displays the selected movie record from the CSD430 database in an HTML table.
--%>

<%
    String selectedMovieId = request.getParameter("movie_id");
    MovieBean selectedMovie = null;

    if (selectedMovieId != null && !selectedMovieId.equals("")) {
        int movieId = Integer.parseInt(selectedMovieId);
        MovieBean movieData = new MovieBean();
        selectedMovie = movieData.getMovieById(movieId);
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Movie Record Display</title>
</head>
<body>
    <h1>Movie Record Display</h1>

    <p>
        The table below displays the full database record for the selected movie key.
        Each database field is shown in its own table column.
    </p>

    <h2>Field Description</h2>

    <p>
        The movie ID is the primary key. The remaining fields describe the movie title,
        genre, release year, rating, and director.
    </p>

    <%
        if (selectedMovie != null) {
    %>

    <table border="1" cellpadding="8" cellspacing="0">
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
            <tr>
                <td><%= selectedMovie.getMovieId() %></td>
                <td><%= selectedMovie.getTitle() %></td>
                <td><%= selectedMovie.getGenre() %></td>
                <td><%= selectedMovie.getReleaseYear() %></td>
                <td><%= selectedMovie.getRating() %></td>
                <td><%= selectedMovie.getDirector() %></td>
            </tr>
        </tbody>
    </table>

    <%
        } else {
    %>

    <p>No movie record was found. Please return to the selection page and choose a movie ID.</p>

    <%
        }
    %>

    <p><a href="selectMovie.jsp">Select Another Movie</a></p>
    <p><a href="index.jsp">Back to Module Links</a></p>
</body>
</html>
