CREATE DATABASE swiggy_db;

USE swiggy_db;

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE restaurants (
    r_id INT PRIMARY KEY AUTO_INCREMENT,
    r_name VARCHAR(255) NOT NULL,
    cuisine VARCHAR(255)
);

CREATE TABLE delivery_partners (
    partner_id INT PRIMARY KEY AUTO_INCREMENT,
    partner_name VARCHAR(50) NOT NULL
);

CREATE TABLE food (
    f_id INT PRIMARY KEY AUTO_INCREMENT,
    f_name VARCHAR(255) NOT NULL,
    type VARCHAR(255)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    r_id INT NOT NULL,
    amount INT,
    date DATE,
    partner_id INT,
    delivery_time INT,
    delivery_rating INT,
    restaurant_rating INT,

    FOREIGN KEY (user_id)
        REFERENCES users(user_id),

    FOREIGN KEY (r_id)
        REFERENCES restaurants(r_id),

    FOREIGN KEY (partner_id)
        REFERENCES delivery_partners(partner_id)
);

CREATE TABLE menu (
    menu_id INT PRIMARY KEY AUTO_INCREMENT,
    r_id INT NOT NULL,
    f_id INT NOT NULL,
    price INT NOT NULL,

    FOREIGN KEY (r_id)
        REFERENCES restaurants(r_id),

    FOREIGN KEY (f_id)
        REFERENCES food(f_id)
);

CREATE TABLE order_details (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    f_id INT NOT NULL,

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    FOREIGN KEY (f_id)
        REFERENCES food(f_id)
);