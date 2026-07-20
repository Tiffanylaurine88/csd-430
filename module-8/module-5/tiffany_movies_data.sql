-- Tiffany Davidson
-- Module 5.2 Assignment
-- CSD430 Database Setup
-- Topic: Movies
-- This script creates the CSD430 database, creates the student1 user,
-- creates the tiffany_movies_data table, and inserts 10 movie records.

CREATE DATABASE IF NOT EXISTS CSD430;

CREATE USER IF NOT EXISTS 'student1'@'localhost' IDENTIFIED BY 'pass';

GRANT ALL PRIVILEGES ON CSD430.* TO 'student1'@'localhost';

FLUSH PRIVILEGES;

USE CSD430;

DROP TABLE IF EXISTS tiffany_movies_data;

CREATE TABLE tiffany_movies_data (
    movie_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    release_year INT NOT NULL,
    rating VARCHAR(10) NOT NULL,
    director VARCHAR(100) NOT NULL,
    PRIMARY KEY (movie_id)
);

INSERT INTO tiffany_movies_data (title, genre, release_year, rating, director)
VALUES
('Sweet Home Alabama', 'Romantic Comedy', 2002, 'PG-13', 'Andy Tennant'),
('Remember the Titans', 'Sports Drama', 2000, 'PG', 'Boaz Yakin'),
('The Blind Side', 'Sports Drama', 2009, 'PG-13', 'John Lee Hancock'),
('Twister', 'Action', 1996, 'PG-13', 'Jan de Bont'),
('Top Gun: Maverick', 'Action', 2022, 'PG-13', 'Joseph Kosinski'),
('Steel Magnolias', 'Drama', 1989, 'PG', 'Herbert Ross'),
('The Proposal', 'Romantic Comedy', 2009, 'PG-13', 'Anne Fletcher'),
('Forrest Gump', 'Drama', 1994, 'PG-13', 'Robert Zemeckis'),
('Fried Green Tomatoes', 'Drama', 1991, 'PG-13', 'Jon Avnet'),
('The Notebook', 'Romance', 2004, 'PG-13', 'Nick Cassavetes');

SELECT * FROM tiffany_movies_data;
