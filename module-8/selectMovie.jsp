<%@ page import="java.util.ArrayList" %>
<%@ page import="com.tiffany.csd430.MovieBean" %>

<%--
    Tiffany Davidson
    Module 8.2 Project Part 3
    File: selectMovie.jsp
    Purpose: Uses JSP scriptlets and the packaged MovieBean to place every
             database key in an HTML dropdown menu.
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
    MovieBean movieData = new MovieBean();
    ArrayList<MovieBean> movieKeys = movieData.getMovieKeys();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select a Movie to Update</title>
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
        .instructions {
            padding: 13px;
            background-color: #eef5fb;
            border-left: 5px solid #25679b;
        }
        label {
            display: block;
            margin: 22px 0 7px;
            font-weight: bold;
        }
        select {
            width: 100%;
            max-width: 600px;
            padding: 11px;
            border: 1px solid #73879a;
            border-radius: 5px;
            background-color: #ffffff;
        }
        button {
            margin-top: 18px;
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
        .error {
            padding: 12px;
            border: 1px solid #a33a3a;
            background-color: #fff0f0;
        }
        a {
            color: #174f7a;
        }
    </style>
</head>
<body>
    <main>
        <h1>Select a Movie Record</h1>

        <p class="instructions">
            The dropdown contains the primary key values currently stored in the
            tiffany_movies_data table. Select one record to open its update form.
        </p>

        <%
            if (movieKeys.isEmpty()) {
        %>
            <p class="error">
                No movie records were found. Use the Module 5 and 6 project pages
                to create and populate the table before continuing.
            </p>
        <%
            } else {
        %>
            <form action="editMovie.jsp" method="post">
                <label for="movie_id">Movie Key and Title</label>
                <select id="movie_id" name="movie_id" required>
                    <option value="">-- Select a Movie Record --</option>
                    <%
                        for (MovieBean movie : movieKeys) {
                    %>
                        <option value="<%= movie.getMovieId() %>">
                            <%= movie.getMovieId() %> - <%= escapeHtml(movie.getTitle()) %>
                        </option>
                    <%
                        }
                    %>
                </select>

                <br>
                <button type="submit">Open Record for Update</button>
            </form>
        <%
            }
        %>

        <p><a href="index.jsp">Back to Module 8 Index</a></p>
    </main>
</body>
</html>
