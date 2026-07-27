Tiffany Davidson
Date: July 26, 2026
Module 9.2 Project Part 4

Purpose
-------
This project continues the CSD430 tiffany_movies_data database project. The
Module 9 page displays every record in an HTML table, places every remaining
primary key in an HTML select dropdown, deletes the selected record, and then
redisplays the remaining records and keys. When no records remain, the table
continues to display its thead header row.

New or Updated Module 9 Files
-----------------------------
1. index.jsp
2. deleteMovies.jsp
3. WEB-INF/classes/com/tiffany/csd430/MovieBean.java
4. WEB-INF/classes/com/tiffany/csd430/MovieBean.class

Database Connection
-------------------
Database: CSD430
Table: tiffany_movies_data
User: student1
Password: pass
JDBC URL: jdbc:mysql://localhost:3306/CSD430

Deployment
----------
Copy the complete module-9 folder to:
C:\apache-tomcat-10\webapps\module-9

Start MySQL and Tomcat, then open:
http://localhost:8080/module-9/

Testing
-------
1. Confirm all movie records appear in the table.
2. Confirm the dropdown contains every current Movie ID and title.
3. Select one key and submit the delete form.
4. Confirm the success message appears.
5. Confirm the deleted row and key are no longer displayed.
6. Continue deleting records and confirm the page updates after each deletion.
7. Confirm the empty table still displays its thead header row after the final deletion.
8. Use the earlier Modules 5 and 6 Populate Table page to restore the 10 records.

Source Note
-----------
Developed with assistance from OpenAI ChatGPT, https://chatgpt.com/.
