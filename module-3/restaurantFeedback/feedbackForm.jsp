<%--
    Name: Tiffany Davidson
    Assignment: Restaurant Feedback Form
    Course: CSD-430
    Date: June 2026

    Description:
    This JSP file displays a restaurant feedback form.
    The form collects customer feedback using multiple input types.
    The form submits the data to displayFeedback.jsp for processing and display.
--%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Restaurant Experience Feedback Form</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>

<body>

    <div class="container">
        <h1>Restaurant Experience Feedback Form</h1>

        <p class="description">
            This form gathers feedback from a customer about a restaurant meal and service experience.
            The customer enters basic visit information, rates the service, and provides comments.
            The submitted data will be displayed on a separate JSP page in an HTML table.
        </p>

        <form action="displayFeedback.jsp" method="post">

            <label for="customerName">Customer Name:</label>
            <input type="text" id="customerName" name="customerName" required>

            <label for="email">Customer Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="visitDate">Date of Visit:</label>
            <input type="date" id="visitDate" name="visitDate" required>

            <label for="mealType">Meal Type:</label>
            <select id="mealType" name="mealType" required>
                <option value="">Select a meal type</option>
                <option value="Breakfast">Breakfast</option>
                <option value="Lunch">Lunch</option>
                <option value="Dinner">Dinner</option>
                <option value="Takeout">Takeout</option>
            </select>

            <p class="field-title">Service Rating:</p>
            <div class="radio-group">
                <input type="radio" id="excellent" name="serviceRating" value="Excellent" required>
                <label for="excellent">Excellent</label>

                <input type="radio" id="good" name="serviceRating" value="Good">
                <label for="good">Good</label>

                <input type="radio" id="fair" name="serviceRating" value="Fair">
                <label for="fair">Fair</label>

                <input type="radio" id="poor" name="serviceRating" value="Poor">
                <label for="poor">Poor</label>
            </div>

            <label for="foodQuality">Food Quality Rating:</label>
            <input type="range" id="foodQuality" name="foodQuality" min="1" max="10" value="5">

            <p class="field-title">What did you enjoy? Select all that apply:</p>
            <div class="checkbox-group">
                <input type="checkbox" id="food" name="likedItems" value="Food">
                <label for="food">Food</label>

                <input type="checkbox" id="service" name="likedItems" value="Service">
                <label for="service">Service</label>

                <input type="checkbox" id="cleanliness" name="likedItems" value="Cleanliness">
                <label for="cleanliness">Cleanliness</label>

                <input type="checkbox" id="atmosphere" name="likedItems" value="Atmosphere">
                <label for="atmosphere">Atmosphere</label>
            </div>

            <label for="comments">Additional Comments:</label>
            <textarea id="comments" name="comments" rows="5" required></textarea>

            <button type="submit">Submit Feedback</button>

        </form>
    </div>

</body>
</html>