\c postgres

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE Regions (
    region_id SERIAL PRIMARY KEY,
    region_name VARCHAR(20)
);

CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY, 
    username VARCHAR(15), 
    email VARCHAR(30),
    preferred_region_id INT,
    FOREIGN KEY (preferred_region_id) REFERENCES Regions(region_id)
);

CREATE TABLE Posts (
    post_id SERIAL PRIMARY KEY, 
    title VARCHAR(30), 
    text TEXT, 
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id), 
    location VARCHAR(50), 
    region_id INT,
    FOREIGN KEY (region_id) REFERENCES Regions(region_id)
);

CREATE TABLE Categories (
    category_id SERIAL PRIMARY KEY, 
    category_name VARCHAR(20)
);

CREATE TABLE Post_Categories (
    post_id INT, 
    category_id INT,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);