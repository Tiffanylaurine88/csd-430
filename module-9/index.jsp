<%--
    Tiffany Davidson
    Date: July 26, 2026
    Module 9.2 Project Part 4
    File: index.jsp
    Purpose: Provides the main project page and links to the Module 9 delete-record form
             and the earlier movie database project parts.
    Source note: Developed with assistance from OpenAI ChatGPT, https://chatgpt.com/.
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CSD430 Module 9 Movie Database</title>
    <style>
        * {
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            max-width: 960px;
            margin: 40px auto;
            padding: 0 20px;
            line-height: 1.6;
            background-color: #f3f6f9;
            color: #1f2933;
        }
        main {
            background-color: #ffffff;
            padding: 32px;
            border: 1px solid #c8d2dc;
            border-radius: 10px;
            box-shadow: 0 4px 14px rgba(0, 0, 0, 0.08);
        }
        h1, h2 {
            color: #173f67;
        }
        .project-note {
            padding: 14px;
            background-color: #eef5fb;
            border-left: 5px solid #25679b;
            border-radius: 4px;
        }
        .action-card {
            margin: 22px 0;
            padding: 20px;
            border: 1px solid #b9c8d6;
            border-radius: 8px;
            background-color: #fafcfe;
        }
        .button-link {
            display: inline-block;
            padding: 11px 18px;
            background-color: #174f7a;
            color: #ffffff;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }
        .button-link:hover {
            background-color: #103b5d;
        }
        a {
            color: #174f7a;
        }
        li {
            margin-bottom: 9px;
        }
    </style>
</head>
<body>
    <main>
        <h1>CSD430 Module 9 Movie Database</h1>

        <p class="project-note">
            This is Project Part 4. It continues to use the CSD430 MySQL database
            and the tiffany_movies_data table created in Modules 5 and 6.
        </p>

        <section class="action-card">
            <h2>Module 9.2 Delete Records</h2>
            <p>
                View every movie record, choose a primary key from the dropdown,
                delete the selected record, and immediately display all remaining
                records and keys on the same page.
            </p>
            <a class="button-link" href="deleteMovies.jsp">Open the Delete Record Form</a>
        </section>

        <h2>Earlier Project Parts</h2>
        <ul>
            <li><a href="selectMovie.jsp">Module 8: Select and Update a Movie Record</a></li>
            <li><a href="module-7/index.jsp">Module 7: Add and Display Movie Records</a></li>
            <li><a href="module-5/index.jsp">Modules 5 and 6: Create, Populate, Drop, and Select Records</a></li>
        </ul>
    </main>
</body>
</html>
