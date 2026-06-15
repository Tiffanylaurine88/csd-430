<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    /*
        Name: Tiffany Davidson
        Date: June 2026
        Assignment: Module 2.2 JSP Scriptlets Assignment
        Purpose: This JSP page uses Java Scriptlets to store travel data
                 and display the records in a dynamic HTML table.
    */

    // Field descriptions for the table columns
    String fieldOneDescription = "Location: The state or country visited.";
    String fieldTwoDescription = "Category: The type of trip or travel experience.";
    String fieldThreeDescription = "Favorite Feature: A short description of what made the place memorable.";

    // Overall data description
    String dataDescription = "This page displays a small travel record of states and countries I have enjoyed visiting. "
                           + "The data is grouped by topical categories and displayed in an HTML table.";

    // Two-dimensional array holding the travel records
    // Each record contains: Category, Location, Favorite Feature
    String[][] travelRecords = {
        {"Beach Destination", "Jamaica", "Clear water, warm weather, and relaxing resort views"},
        {"Mountain Destination", "Tennessee", "Beautiful mountain scenery and peaceful cabin areas"},
        {"Family Trip", "Florida", "Theme parks, beaches, and fun family activities"},
        {"Outdoor Adventure", "Arkansas", "Lakes, trails, and natural scenery close to home"},
        {"City Experience", "Texas", "Shopping, restaurants, and larger city attractions"}
    };
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Favorite Travel Places</title>
    <link rel="stylesheet" href="styles.css">
</head>

<body>

    <main class="container">

        <header>
            <h1>Favorite Travel Places</h1>
            <p class="subtitle">A Dynamic JSP Page Using Scriptlets</p>
        </header>

        <section class="description-box">
            <h2>Overall Data Description</h2>
            <p><%= dataDescription %></p>
        </section>

        <section class="description-box">
            <h2>Field Descriptions</h2>
            <p><strong>Field 1:</strong> <%= fieldOneDescription %></p>
            <p><strong>Field 2:</strong> <%= fieldTwoDescription %></p>
            <p><strong>Field 3:</strong> <%= fieldThreeDescription %></p>
        </section>

        <section>
            <h2>Travel Records</h2>

            <table>
                <thead>
                    <tr>
                        <th>Category</th>
                        <th>Location</th>
                        <th>Favorite Feature</th>
                    </tr>
                </thead>

                <tbody>
                    <%
                        /*
                            This loop dynamically creates one table row
                            for each travel record stored in the array.
                            The HTML table tags remain outside the Java Scriptlet sections.
                        */
                        for (int i = 0; i < travelRecords.length; i++) {
                    %>

                    <tr>
                        <td><%= travelRecords[i][0] %></td>
                        <td><%= travelRecords[i][1] %></td>
                        <td><%= travelRecords[i][2] %></td>
                    </tr>

                    <%
                        }
                    %>
                </tbody>
            </table>
        </section>

        <section class="summary-box">
            <h2>Record Summary</h2>
            <p>
                This table contains <strong><%= travelRecords.length %></strong> travel records.
                Each record includes a category, location, and favorite feature.
            </p>
        </section>

    </main>

</body>
</html>