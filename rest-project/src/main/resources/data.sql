-- Drop tables if they exist (optional, for fresh initialization)
DROP TABLE IF EXISTS car;
DROP TABLE IF EXISTS brand;

-- Create the brand table
CREATE TABLE brand (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_brand BIGINT NOT NULL,
    name VARCHAR(255) NOT NULL,
    brand_year INT NOT NULL, -- Renamed year to car_year
    details VARCHAR(255),
    UNIQUE (id_brand)
);

-- Create the car table
CREATE TABLE car (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    id_car BIGINT NOT NULL,
    model VARCHAR(255) NOT NULL,
    car_year INT NOT NULL, -- Renamed year to car_year
    color VARCHAR(255),
    description VARCHAR(255),
    observations VARCHAR(255),
    brand_id BIGINT,
    CONSTRAINT FK_brand FOREIGN KEY (brand_id) REFERENCES brand(id) ON DELETE SET NULL,
    UNIQUE (id_car)
);


-- Insert example brands (adding 5 more Japanese brands)
INSERT INTO brand (id, id_brand, name, brand_year, details) VALUES
(1, 1, 'Toyota', 1937, 'Japanese automotive manufacturer'),
(2, 2, 'Ford', 1903, 'American multinational automaker'),
(3, 3, 'Honda', 1948, 'Japanese multinational conglomerate'),
(4, 4, 'Nissan', 1933, 'Japanese automobile manufacturer'),
(5, 5, 'Mazda', 1920, 'Japanese automaker known for its rotary engines'),
(6, 6, 'Subaru', 1953, 'Japanese automaker best known for its all-wheel-drive vehicles'),
(7, 7, 'Mitsubishi', 1870, 'Japanese automotive manufacturer part of Mitsubishi Group');

-- Insert example cars for each brand
-- Toyota
INSERT INTO car (id, id_car, model, car_year, color, description, observations, brand_id) VALUES
(1, 1, 'Corolla', 2020, 'Red', 'Compact car', 'None', 1),
(2, 2, 'Camry', 2021, 'Blue', 'Midsize sedan', 'None', 1),
(3, 3, 'Prius', 2019, 'Green', 'Hybrid car', 'None', 1);

-- Ford
INSERT INTO car (id, id_car, model, car_year, color, description, observations, brand_id) VALUES
(4, 4, 'Mustang', 2021, 'Blue', 'Sports car', 'None', 2),
(5, 5, 'F-150', 2022, 'Black', 'Pickup truck', 'None', 2);

-- Honda
INSERT INTO car (id, id_car, model, car_year, color, description, observations, brand_id) VALUES
(6, 6, 'Civic', 2021, 'Silver', 'Compact sedan', 'None', 3),
(7, 7, 'Accord', 2020, 'White', 'Midsize sedan', 'None', 3),
(8, 8, 'CR-V', 2022, 'Red', 'Compact crossover SUV', 'None', 3);

-- Nissan
INSERT INTO car (id, id_car, model, car_year, color, description, observations, brand_id) VALUES
(9, 9, 'Altima', 2021, 'Black', 'Midsize sedan', 'None', 4),
(10, 10, 'GT-R', 2020, 'Silver', 'Sports car', 'None', 4),
(11, 11, 'Rogue', 2022, 'Blue', 'Compact crossover SUV', 'None', 4);

-- Mazda
INSERT INTO car (id, id_car, model, car_year, color, description, observations, brand_id) VALUES
(12, 12, 'Mazda3', 2021, 'Gray', 'Compact car', 'None', 5),
(13, 13, 'CX-5', 2022, 'White', 'Compact crossover SUV', 'None', 5),
(14, 14, 'MX-5 Miata', 2020, 'Red', 'Convertible sports car', 'None', 5);

-- Subaru
INSERT INTO car (id, id_car, model, car_year, color, description, observations, brand_id) VALUES
(15, 15, 'Impreza', 2021, 'Blue', 'Compact car', 'None', 6),
(16, 16, 'Forester', 2020, 'Green', 'Compact crossover SUV', 'None', 6),
(17, 17, 'Outback', 2022, 'Black', 'Mid-size crossover SUV', 'None', 6);

-- Mitsubishi
INSERT INTO car (id, id_car, model, car_year, color, description, observations, brand_id) VALUES
(18, 18, 'Lancer', 2019, 'Red', 'Compact car', 'None', 7),
(19, 19, 'Outlander', 2021, 'White', 'Mid-size crossover SUV', 'None', 7),
(20, 20, 'Eclipse Cross', 2022, 'Silver', 'Compact crossover SUV', 'None', 7);
