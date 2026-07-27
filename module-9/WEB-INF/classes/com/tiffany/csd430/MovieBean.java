package com.tiffany.csd430;

/*
 * Tiffany Davidson
 * Date: July 26, 2026
 * Module 9.2 Project Part 4
 * File: MovieBean.java
 * Purpose: Packaged JavaBean used to connect to the CSD430 database and support
 *          creating, populating, adding, viewing, updating, deleting, and dropping
 *          records for the complete movie database project.
 * Source note: Developed with assistance from OpenAI ChatGPT, https://chatgpt.com/.
 */

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class MovieBean implements Serializable {
    private static final long serialVersionUID = 1L;

    private int movieId;
    private String title;
    private String genre;
    private int releaseYear;
    private String rating;
    private String director;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/CSD430";
    private static final String DB_USER = "student1";
    private static final String DB_PASSWORD = "pass";

    public MovieBean() {
    }

    public MovieBean(int movieId, String title, String genre, int releaseYear,
                     String rating, String director) {
        this.movieId = movieId;
        this.title = title;
        this.genre = genre;
        this.releaseYear = releaseYear;
        this.rating = rating;
        this.director = director;
    }

    /*
     * Loads the MySQL JDBC driver and opens a connection to the CSD430 database.
     */
    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

    /*
     * Adds one movie record. MySQL assigns the movie_id through AUTO_INCREMENT.
     */
    public String addMovie(String title, String genre, int releaseYear,
                           String rating, String director) {
        String sql = "INSERT INTO tiffany_movies_data "
                   + "(title, genre, release_year, rating, director) "
                   + "VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, title);
            pstmt.setString(2, genre);
            pstmt.setInt(3, releaseYear);
            pstmt.setString(4, rating);
            pstmt.setString(5, director);

            int rowsAdded = pstmt.executeUpdate();

            if (rowsAdded == 1) {
                return "The movie record was added successfully.";
            }

            return "The movie record was not added.";

        } catch (Exception e) {
            return "Error adding movie record: " + e.getMessage();
        }
    }

    /*
     * Retrieves every movie record for the Module 7 and Module 9 display tables.
     */
    public ArrayList<MovieBean> getAllMovies() {
        ArrayList<MovieBean> movies = new ArrayList<MovieBean>();

        String sql = "SELECT movie_id, title, genre, release_year, rating, director "
                   + "FROM tiffany_movies_data ORDER BY movie_id";

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                movies.add(new MovieBean(
                    rs.getInt("movie_id"),
                    rs.getString("title"),
                    rs.getString("genre"),
                    rs.getInt("release_year"),
                    rs.getString("rating"),
                    rs.getString("director")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return movies;
    }

    /*
     * Retrieves the primary key and movie title for HTML select dropdowns.
     */
    public ArrayList<MovieBean> getMovieKeys() {
        ArrayList<MovieBean> movies = new ArrayList<MovieBean>();

        String sql = "SELECT movie_id, title FROM tiffany_movies_data ORDER BY movie_id";

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                MovieBean movie = new MovieBean();
                movie.setMovieId(rs.getInt("movie_id"));
                movie.setTitle(rs.getString("title"));
                movies.add(movie);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return movies;
    }

    /*
     * Retrieves one complete movie record by its primary key.
     */
    public MovieBean getMovieById(int selectedMovieId) {
        MovieBean movie = null;

        String sql = "SELECT movie_id, title, genre, release_year, rating, director "
                   + "FROM tiffany_movies_data WHERE movie_id = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, selectedMovieId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    movie = new MovieBean(
                        rs.getInt("movie_id"),
                        rs.getString("title"),
                        rs.getString("genre"),
                        rs.getInt("release_year"),
                        rs.getString("rating"),
                        rs.getString("director")
                    );
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return movie;
    }

    /*
     * Updates the five editable fields for the selected movie record.
     */
    public String updateMovie(int movieId, String title, String genre,
                              int releaseYear, String rating, String director) {
        String sql = "UPDATE tiffany_movies_data "
                   + "SET title = ?, genre = ?, release_year = ?, rating = ?, director = ? "
                   + "WHERE movie_id = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, title);
            pstmt.setString(2, genre);
            pstmt.setInt(3, releaseYear);
            pstmt.setString(4, rating);
            pstmt.setString(5, director);
            pstmt.setInt(6, movieId);

            int rowsUpdated = pstmt.executeUpdate();

            if (rowsUpdated == 1) {
                return "The movie record was updated successfully.";
            }

            return "No movie record was updated. The selected key may no longer exist.";

        } catch (Exception e) {
            return "Error updating movie record: " + e.getMessage();
        }
    }

    /*
     * Deletes one movie record by its primary key for Module 9 Project Part 4.
     */
    public String deleteMovie(int selectedMovieId) {
        String sql = "DELETE FROM tiffany_movies_data WHERE movie_id = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, selectedMovieId);
            int rowsDeleted = pstmt.executeUpdate();

            if (rowsDeleted == 1) {
                return "The movie record was deleted successfully.";
            }

            return "No movie record was deleted. The selected key may no longer exist.";

        } catch (Exception e) {
            return "Error deleting movie record: " + e.getMessage();
        }
    }

    /*
     * Creates the original table used throughout Modules 5 through 9.
     */
    public String createTable() {
        String sql = "CREATE TABLE IF NOT EXISTS tiffany_movies_data ("
                   + "movie_id INT NOT NULL AUTO_INCREMENT, "
                   + "title VARCHAR(100) NOT NULL, "
                   + "genre VARCHAR(50) NOT NULL, "
                   + "release_year INT NOT NULL, "
                   + "rating VARCHAR(10) NOT NULL, "
                   + "director VARCHAR(100) NOT NULL, "
                   + "PRIMARY KEY (movie_id))";

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {

            stmt.executeUpdate(sql);
            return "The table tiffany_movies_data was created successfully.";

        } catch (Exception e) {
            return "Error creating table: " + e.getMessage();
        }
    }

    /*
     * Replaces the table data with the original 10 movie records.
     */
    public String populateTable() {
        String clearTableSql = "DELETE FROM tiffany_movies_data";
        String resetAutoIncrementSql = "ALTER TABLE tiffany_movies_data AUTO_INCREMENT = 1";

        String insertSql = "INSERT INTO tiffany_movies_data "
                         + "(title, genre, release_year, rating, director) VALUES "
                         + "('Sweet Home Alabama', 'Romantic Comedy', 2002, 'PG-13', 'Andy Tennant'), "
                         + "('Remember the Titans', 'Sports Drama', 2000, 'PG', 'Boaz Yakin'), "
                         + "('The Blind Side', 'Sports Drama', 2009, 'PG-13', 'John Lee Hancock'), "
                         + "('Twister', 'Action', 1996, 'PG-13', 'Jan de Bont'), "
                         + "('Top Gun: Maverick', 'Action', 2022, 'PG-13', 'Joseph Kosinski'), "
                         + "('Steel Magnolias', 'Drama', 1989, 'PG', 'Herbert Ross'), "
                         + "('The Proposal', 'Romantic Comedy', 2009, 'PG-13', 'Anne Fletcher'), "
                         + "('Forrest Gump', 'Drama', 1994, 'PG-13', 'Robert Zemeckis'), "
                         + "('Fried Green Tomatoes', 'Drama', 1991, 'PG-13', 'Jon Avnet'), "
                         + "('The Notebook', 'Romance', 2004, 'PG-13', 'Nick Cassavetes')";

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {

            stmt.executeUpdate(clearTableSql);
            stmt.executeUpdate(resetAutoIncrementSql);
            stmt.executeUpdate(insertSql);
            return "The table tiffany_movies_data was populated with 10 records successfully.";

        } catch (Exception e) {
            return "Error populating table: " + e.getMessage();
        }
    }

    /*
     * Drops the table when the earlier project page requests that action.
     */
    public String dropTable() {
        String sql = "DROP TABLE IF EXISTS tiffany_movies_data";

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {

            stmt.executeUpdate(sql);
            return "The table tiffany_movies_data was dropped successfully.";

        } catch (Exception e) {
            return "Error dropping table: " + e.getMessage();
        }
    }

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public int getReleaseYear() {
        return releaseYear;
    }

    public void setReleaseYear(int releaseYear) {
        this.releaseYear = releaseYear;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }
}
