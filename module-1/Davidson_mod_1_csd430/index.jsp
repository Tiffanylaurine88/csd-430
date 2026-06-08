<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CSD-430 Module 1.3 JSP Assignment</title>
</head>
<body>
    <h1>CSD-430 Module 1.3 JSP Test Page</h1>

    <p><strong>Name:</strong> Tiffany Davidson</p>
    <p><strong>Course:</strong> CSD-430</p>
    <p><strong>Assignment:</strong> Module 1.3</p>

    <hr>

    <%
        String message = "My first JSP file is running successfully through Apache Tomcat.";
        java.time.LocalDate today = java.time.LocalDate.now();
        int currentYear = today.getYear();
        int numberOne = 10;
        int numberTwo = 5;
        int total = numberOne + numberTwo;
    %>

    <h2>JSP Java Code Output</h2>

    <p><%= message %></p>
    <p>Today's date from Java code is: <%= today %></p>
    <p>The current year from Java code is: <%= currentYear %></p>
    <p>Java math example: <%= numberOne %> + <%= numberTwo %> = <%= total %></p>

    <hr>

    <p>This page includes both HTML tags and Java code inside a JSP file.</p>
</body>
</html>