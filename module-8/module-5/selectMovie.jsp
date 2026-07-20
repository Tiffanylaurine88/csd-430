<%@ page import="java.util.ArrayList" %>
<%@ page import="com.tiffany.csd430.MovieBean" %>

<%--
    Tiffany Davidson
    Module 5.3 / 6.3 Assignment
    File: selectMovie.jsp
    Purpose: Displays a dropdown menu containing the primary key values from the database.
--%>

<%
    MovieBean movieData = new MovieBean();
    ArrayList<MovieBean> movies = movieData.getMovieKeys();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Select Movie Record</title>
</head>
<body>
    <h1>Select a Movie Record</h1>

    <p>
        This page gathers movie data from the CSD430 MySQL database using a packaged JavaBean.
        Select one movie ID from the dropdown menu to view the full record.
    </p>

    <h2>Movie Key Selection</h2>

    <form action="displayMovie.jsp" method="post">
        <label for="movie_id">Choose a Movie ID:</label>

        <select name="movie_id" id="movie_id" required>
            <option value="">-- Select a Movie --</option>

            <%
                for (MovieBean movie : movies) {
            %>
                <option value="<%= movie.getMovieId() %>">
                    <%= movie.getMovieId() %> - <%= movie.getTitle() %>
                </option>
            <%
                }
            %>
        </select>

        <input type="submit" value="Display Movie Record">
    </form>

    <p><a href="index.jsp">Back to Module Links</a></p>
</body>
</html>
