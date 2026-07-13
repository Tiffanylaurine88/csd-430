<%@ page import="com.tiffany.csd430.MovieBean" %>

<%--
    Tiffany Davidson
    Module 5.3 / 6.3 Assignment
    File: movieTableManager.jsp
    Purpose: Uses JavaBean methods to create, populate, and drop the tiffany_movies_data table.
--%>

<%
    String action = request.getParameter("action");
    String message = "";

    if (action != null) {
        MovieBean movieData = new MovieBean();

        if (action.equals("create")) {
            message = movieData.createTable();
        } else if (action.equals("populate")) {
            message = movieData.populateTable();
        } else if (action.equals("drop")) {
            message = movieData.dropTable();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Movie Table Manager</title>
</head>
<body>
    <h1>Movie Table Manager</h1>

    <p>
        This page uses Java code from the packaged JavaBean to create, populate,
        or drop the same database table used in the Module 5.2 assignment.
    </p>

    <h2>Database Table Actions</h2>

    <form action="movieTableManager.jsp" method="post">
        <button type="submit" name="action" value="create">Create Table</button>
        <button type="submit" name="action" value="populate">Populate Table</button>
        <button type="submit" name="action" value="drop">Drop Table</button>
    </form>

    <%
        if (!message.equals("")) {
    %>
        <p><strong>Result:</strong> <%= message %></p>
    <%
        }
    %>

    <p><a href="selectMovie.jsp">Go to Movie Record Selection</a></p>
    <p><a href="index.jsp">Back to Module Links</a></p>
</body>
</html>
