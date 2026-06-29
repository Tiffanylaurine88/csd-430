<%--
    Name: Tiffany Davidson
    Assignment: Restaurant Feedback Display
    Course: CSD-430
    Date: June 2026

    Description:
    This JSP file receives form data from feedbackForm.jsp.
    Java Scriptlets are used to collect and prepare the user-submitted data.
    The submitted data is displayed in an HTML table.
--%>

<%
    request.setCharacterEncoding("UTF-8");

    String customerName = request.getParameter("customerName");
    String email = request.getParameter("email");
    String visitDate = request.getParameter("visitDate");
    String mealType = request.getParameter("mealType");
    String serviceRating = request.getParameter("serviceRating");
    String foodQuality = request.getParameter("foodQuality");
    String comments = request.getParameter("comments");

    String[] likedItemsArray = request.getParameterValues("likedItems");
    String likedItems = "";

    if (likedItemsArray != null) {
        for (int i = 0; i < likedItemsArray.length; i++) {
            likedItems += likedItemsArray[i];

            if (i < likedItemsArray.length - 1) {
                likedItems += ", ";
            }
        }
    } else {
        likedItems = "No items selected";
    }

    if (comments == null || comments.trim().equals("")) {
        comments = "No comments provided";
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Submitted Restaurant Feedback</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>

<body>

    <div class="container">
        <h1>Submitted Restaurant Feedback</h1>

        <p class="description">
            The table below displays the restaurant feedback record submitted by the customer.
            Each row includes the field name, a description of the field, and the data entered by the user.
        </p>

        <table>
            <tr>
                <th>Field Name</th>
                <th>Field Description</th>
                <th>Submitted Data</th>
            </tr>

            <tr>
                <td>Customer Name</td>
                <td>The name of the customer who completed the feedback form.</td>
                <td><%= customerName %></td>
            </tr>

            <tr>
                <td>Customer Email</td>
                <td>The customer’s email address for possible follow-up.</td>
                <td><%= email %></td>
            </tr>

            <tr>
                <td>Date of Visit</td>
                <td>The date the customer visited the restaurant.</td>
                <td><%= visitDate %></td>
            </tr>

            <tr>
                <td>Meal Type</td>
                <td>The type of meal or service the customer received.</td>
                <td><%= mealType %></td>
            </tr>

            <tr>
                <td>Service Rating</td>
                <td>The customer’s rating of the service experience.</td>
                <td><%= serviceRating %></td>
            </tr>

            <tr>
                <td>Food Quality Rating</td>
                <td>A rating from 1 to 10 showing how the customer felt about the food quality.</td>
                <td><%= foodQuality %> out of 10</td>
            </tr>

            <tr>
                <td>Liked Items</td>
                <td>The areas of the restaurant experience the customer enjoyed.</td>
                <td><%= likedItems %></td>
            </tr>

            <tr>
                <td>Additional Comments</td>
                <td>Extra feedback provided by the customer.</td>
                <td><%= comments %></td>
            </tr>
        </table>

        <a class="back-link" href="feedbackForm.jsp">Return to Feedback Form</a>
    </div>

</body>
</html>