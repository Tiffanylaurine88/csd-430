<%@ page import="java.lang.reflect.Constructor" %>
<%@ page import="java.lang.reflect.Method" %>

<%
/*
 * Name: Tiffany Davidson
 * Date: June 28, 2026
 * Assignment: Module 4.2 - JavaBean Data Display
 * Course: CSD 430
 *
 * Purpose:
 * This JSP page uses scriptlets to gather data from a JavaBean
 * and display the records in an HTML table.
 */

Class<?> beanClass = Class.forName("PlaceBean");

Constructor<?> constructor = beanClass.getConstructor(
    String.class, String.class, String.class, int.class, String.class
);

Object[] places = new Object[5];

places[0] = constructor.newInstance("Gatlinburg", "Tennessee", "Family Vacation", 2021, "Mountain views and shopping");
places[1] = constructor.newInstance("Destin", "Florida", "Beach Trip", 2022, "White sand beaches");
places[2] = constructor.newInstance("Branson", "Missouri", "Weekend Trip", 2023, "Shows and family attractions");
places[3] = constructor.newInstance("Jamaica", "Caribbean", "Vacation", 2026, "Clear water and relaxing beaches");
places[4] = constructor.newInstance("Natural Dam", "Arkansas", "Local Visit", 2024, "Peaceful country scenery");

Method getPlaceName = beanClass.getMethod("getPlaceName");
Method getLocation = beanClass.getMethod("getLocation");
Method getVisitType = beanClass.getMethod("getVisitType");
Method getYearVisited = beanClass.getMethod("getYearVisited");
Method getFavoriteFeature = beanClass.getMethod("getFavoriteFeature");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Module 4.2 JavaBean Data Display</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f1ec;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 85%;
            margin: 30px auto;
            background-color: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 0 8px #cccccc;
        }

        h1 {
            text-align: center;
            color: #333333;
        }

        h2 {
            text-align: center;
            color: #5c4b3b;
        }

        h3 {
            color: #444444;
            margin-top: 30px;
        }

        p {
            font-size: 16px;
            line-height: 1.5;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            margin-bottom: 25px;
        }

        th {
            background-color: #6b5b4b;
            color: white;
            padding: 10px;
            border: 1px solid #cccccc;
        }

        td {
            padding: 10px;
            border: 1px solid #cccccc;
        }

        tr:nth-child(even) {
            background-color: #f7f7f7;
        }

        .footer {
            font-style: italic;
            text-align: center;
            color: #555555;
        }
    </style>
</head>

<body>

    <div class="container">

        <h1>Module 4.2 JavaBean Data Display</h1>
        <h2>Places I Have Visited</h2>

        <p>
            This page displays travel-related data using a JavaBean. The JavaBean stores
            information about each place, including the place name, location, visit type,
            year visited, and favorite feature. The JSP page gathers the data from the
            JavaBean and displays it in formatted HTML tables.
        </p>

        <h3>Field Descriptions</h3>

        <table>
            <tr>
                <th>Field Name</th>
                <th>Description</th>
            </tr>
            <tr>
                <td>Place Name</td>
                <td>The name of the place visited.</td>
            </tr>
            <tr>
                <td>Location</td>
                <td>The state, country, or region where the place is located.</td>
            </tr>
            <tr>
                <td>Visit Type</td>
                <td>The reason or type of trip.</td>
            </tr>
            <tr>
                <td>Year Visited</td>
                <td>The year the visit happened or is planned.</td>
            </tr>
            <tr>
                <td>Favorite Feature</td>
                <td>The best or most memorable part of the visit.</td>
            </tr>
        </table>

        <h3>Travel Records</h3>

        <table>
            <tr>
                <th>Place Name</th>
                <th>Location</th>
                <th>Visit Type</th>
                <th>Year Visited</th>
                <th>Favorite Feature</th>
            </tr>

            <%
            for (int i = 0; i < places.length; i++) {
                Object place = places[i];
            %>

            <tr>
                <td><%= getPlaceName.invoke(place) %></td>
                <td><%= getLocation.invoke(place) %></td>
                <td><%= getVisitType.invoke(place) %></td>
                <td><%= getYearVisited.invoke(place) %></td>
                <td><%= getFavoriteFeature.invoke(place) %></td>
            </tr>

            <%
            }
            %>

        </table>

        <p class="footer">
            This assignment demonstrates how a JavaBean can hold data and how a JSP page
            can gather that data using Java scriptlets and display it in an HTML table.
        </p>

    </div>

</body>
</html>