-- Create tables for car owners and cars
CREATE TABLE car_owners (
    owner_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    address VARCHAR(255),
    email VARCHAR(100),
    phone_number VARCHAR(20)
);

CREATE TABLE cars (
    car_id INT AUTO_INCREMENT PRIMARY KEY,
    owner_id INT,
    brand VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    color VARCHAR(20),
    year INT,
    FOREIGN KEY (owner_id) REFERENCES car_owners(owner_id)
);

-- Insert sample data for car owners
INSERT INTO car_owners (first_name, last_name, address, email, phone_number) 
VALUES 
    ('John', 'Doe', '123 Main St, Cityville', 'john.doe@example.com', '555-1234'),
    ('Jane', 'Smith', '456 Elm St, Townsville', 'jane.smith@example.com', '555-5678'),
    ('Alice', 'Johnson', '789 Oak St, Villageton', 'alice.johnson@example.com', '555-9012');

-- Insert sample data for cars
INSERT INTO cars (owner_id, brand, model, color, year) 
VALUES 
    (1, 'Toyota', 'Camry', 'Silver', 2019),
    (1, 'Honda', 'Civic', 'Red', 2018),
    (2, 'Ford', 'Mustang', 'Black', 2020),
    (3, 'BMW', 'X5', 'White', 2017),
    (3, 'Tesla', 'Model S', 'Blue', 2021);

-- Select all car owners with their cars
SELECT 
    o.first_name, o.last_name, o.address, o.email, o.phone_number,
    c.brand, c.model, c.color, c.year
FROM 
    car_owners o
JOIN 
    cars c ON o.owner_id = c.owner_id;

-- Update car owner's email
UPDATE car_owners
SET email = 'new_email@example.com'
WHERE first_name = 'John' AND last_name = 'Doe';

-- Delete a car
DELETE FROM cars
WHERE brand = 'Ford' AND model = 'Mustang';

-- Count cars per owner
SELECT 
    o.first_name, o.last_name, COUNT(c.car_id) AS car_count
FROM 
    car_owners o
LEFT JOIN 
    cars c ON o.owner_id = c.owner_id
GROUP BY 
    o.first_name, o.last_name;

-- Search for cars by color
SELECT 
    o.first_name, o.last_name, c.brand, c.model, c.color, c.year
FROM 
    car_owners o
JOIN 
    cars c ON o.owner_id = c.owner_id
WHERE 
    c.color = 'Red';
