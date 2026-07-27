<%@ page import="java.util.ArrayList" %>
<%@ page import="com.tiffany.csd430.MovieBean" %>

<%--
    Tiffany Davidson
    Date: July 26, 2026
    Module 9.2 Project Part 4
    File: deleteMovies.jsp
    Purpose: Uses JSP scriptlets to display all movie records, delete the record
             selected by its primary key, and redisplay all remaining records and keys.
    Source note: Developed with assistance from OpenAI ChatGPT, https://chatgpt.com/.
--%>

<%!
    /*
     * Converts special characters before database text is placed in HTML.
     */
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

    MovieBean movieData = new MovieBean();
    String resultMessage = "";
    boolean deleteSuccessful = false;

    /*
     * Process the selected movie key only when the delete form is submitted.
     */
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String movieIdText = request.getParameter("movie_id");

        if (movieIdText == null || movieIdText.trim().isEmpty()) {
            resultMessage = "Select a movie key before submitting the delete form.";
        } else {
            try {
                int selectedMovieId = Integer.parseInt(movieIdText.trim());

                if (selectedMovieId <= 0) {
                    resultMessage = "The selected movie key is invalid.";
                } else {
                    resultMessage = movieData.deleteMovie(selectedMovieId);
                    deleteSuccessful = resultMessage.equals(
                        "The movie record was deleted successfully."
                    );
                }
            } catch (NumberFormatException e) {
                resultMessage = "The selected movie key must be a whole number.";
            }
        }
    }

    /*
     * Retrieve the table again after any delete attempt so the page always shows
     * the current database records and the current list of remaining keys.
     */
    ArrayList<MovieBean> movies = movieData.getAllMovies();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Movie Records</title>
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
        .description {
            padding: 13px;
            background-color: #eef5fb;
            border-left: 5px solid #25679b;
        }
        .field-description {
            padding: 13px;
            border: 1px solid #c8d2dc;
            border-radius: 5px;
            background-color: #fafcfe;
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
        .record-count {
            font-weight: bold;
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
        .empty-message {
            padding: 12px;
            border: 1px solid #9aa9b6;
            background-color: #f6f8fa;
        }
        form {
            margin-top: 24px;
            padding: 20px;
            border: 1px solid #b9c8d6;
            border-radius: 8px;
            background-color: #fafcfe;
        }
        label {
            display: block;
            margin-bottom: 7px;
            font-weight: bold;
        }
        select {
            width: 100%;
            max-width: 650px;
            padding: 11px;
            border: 1px solid #73879a;
            border-radius: 5px;
            background-color: #ffffff;
        }
        button {
            margin-top: 16px;
            padding: 11px 18px;
            border: 0;
            border-radius: 5px;
            background-color: #9b2c2c;
            color: #ffffff;
            font-weight: bold;
            cursor: pointer;
        }
        button:hover {
            background-color: #742121;
        }
        button:disabled {
            background-color: #87929c;
            cursor: not-allowed;
        }
        a {
            color: #174f7a;
        }
    </style>
</head>
<body>
    <main>
        <h1>Delete Movie Database Records</h1>

        <p class="description">
            This form displays every record in the tiffany_movies_data table. Select
            a Movie ID from the dropdown to delete one record. After submission, the
            page refreshes with the remaining records and remaining primary keys.
        </p>

        <h2>Field and Record Descriptions</h2>
        <p class="field-description">
            Movie ID is the unique primary key. Title identifies the movie. Genre
            describes its category. Release Year shows when the movie was released.
            Rating lists its content rating, and Director identifies the movie's director.
        </p>

        <%
            if (!resultMessage.isEmpty()) {
        %>
            <p class="<%= deleteSuccessful ? "success" : "error" %>">
                <strong>Delete Result:</strong> <%= escapeHtml(resultMessage) %>
            </p>
        <%
            }
        %>

        <h2>Current Movie Records</h2>
        <p class="record-count">Records currently stored: <%= movies.size() %></p>

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
        </div>

        <%
            if (movies.isEmpty()) {
        %>
            <p class="empty-message">
                No movie records remain. The empty table is still displayed with its
                header row as required.
            </p>
        <%
            }
        %>

        <h2>Delete a Record by Primary Key</h2>
        <form action="deleteMovies.jsp" method="post"
              onsubmit="return confirm('Delete the selected movie record?');">
            <label for="movie_id">Remaining Movie Keys</label>
            <select id="movie_id" name="movie_id" <%= movies.isEmpty() ? "disabled" : "required" %>>
                <%
                    if (movies.isEmpty()) {
                %>
                    <option value="">-- No Movie Keys Remain --</option>
                <%
                    } else {
                %>
                    <option value="">-- Select a Movie Record to Delete --</option>
                    <%
                        for (MovieBean movie : movies) {
                    %>
                        <option value="<%= movie.getMovieId() %>">
                            <%= movie.getMovieId() %> - <%= escapeHtml(movie.getTitle()) %>
                        </option>
                    <%
                        }
                    %>
                <%
                    }
                %>
            </select>

            <br>
            <button type="submit" <%= movies.isEmpty() ? "disabled" : "" %>>
                Delete Selected Movie
            </button>
        </form>

        <p><a href="index.jsp">Back to the Module 9 Index</a></p>
    </main>
</body>
</html>
