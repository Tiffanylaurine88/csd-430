Tiffany Davidson
Module 5.3 / 6.3 Add-On Files
CSD430

Add these files to the same module-5 folder that contains the Module 5.2 files.

Required database:
Database: CSD430
User: student1
Password: pass
Table: tiffany_movies_data

Important:
The JavaBean is in a package:
com.tiffany.csd430

The source file path should be:
WEB-INF/classes/com/tiffany/csd430/MovieBean.java

You must also have the MySQL Connector/J jar available to Tomcat.
A common option is to copy mysql-connector-j-8.x.x.jar into:
C:\Program Files\Apache Software Foundation\Tomcat 10.1\lib

After placing the files, compile the JavaBean from the module-5 folder:

javac -cp ".;C:\Program Files\Apache Software Foundation\Tomcat 10.1\lib\mysql-connector-j-8.4.0.jar" WEB-INF\classes\com\tiffany\csd430\MovieBean.java

If your MySQL connector jar has a different version number, change that part of the command.

Test pages:
http://localhost:8080/module-5/index.jsp
http://localhost:8080/module-5/movieTableManager.jsp
http://localhost:8080/module-5/selectMovie.jsp
