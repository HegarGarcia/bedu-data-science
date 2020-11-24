CREATE DATABASE IF NOT EXISTS bedu;

USE bedu;

CREATE TABLE IF NOT EXISTS users (
	id INT PRIMARY KEY,
    gender CHAR(1),
	age INT,
    occupation INT,
    zipcode VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS movies (
   id INT PRIMARY KEY, 
   title VARCHAR(100), 
   genres VARCHAR(100)
); 

CREATE TABLE IF NOT EXISTS ratings (
   id INT PRIMARY KEY AUTO_INCREMENT,
   user INT, 
   movie INT, 
   rating INT, 
   timestamp BIGINT,
   FOREIGN KEY (user) REFERENCES users(id),
   FOREIGN KEY (movie) REFERENCES movies(id)
);