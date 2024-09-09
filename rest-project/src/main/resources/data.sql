-- Drop tables if they exist
DROP TABLE IF EXISTS car;
DROP TABLE IF EXISTS brand;

-- Create the brand table with a single id
CREATE TABLE brand (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL, -- Escaped name since it's a reserved word
    `year` INT NOT NULL,          -- Escaped year since it's a reserved word
    details VARCHAR(255)
);

-- Create the car table with a single id and foreign key referencing brand
CREATE TABLE car (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    model VARCHAR(255) NOT NULL,
    `year` INT NOT NULL,          -- Escaped year since it's a reserved word
    color VARCHAR(255),
    `description` VARCHAR(255),   -- Escaped description since it's a reserved word
    observations VARCHAR(255),
    available BOOLEAN NOT NULL DEFAULT TRUE, -- New boolean column for availability
    brand_id BIGINT,
    CONSTRAINT FK_brand FOREIGN KEY (brand_id) REFERENCES brand(id) ON DELETE SET NULL
);

-- Insert example brands
INSERT INTO brand (id, `name`, `year`, details) VALUES
(1, 'Toyota', 1937, 'Japanese automotive manufacturer'),
(2, 'Ford', 1903, 'American multinational automaker'),
(3, 'Honda', 1948, 'Japanese multinational conglomerate'),
(4, 'Nissan', 1933, 'Japanese automobile manufacturer'),
(5, 'Mazda', 1920, 'Japanese automaker known for its rotary engines'),
(6, 'Subaru', 1953, 'Japanese automaker best known for its all-wheel-drive vehicles'),
(7, 'Mitsubishi', 1870, 'Japanese automotive manufacturer part of Mitsubishi Group');

-- Insert example cars with the 'available' column
INSERT INTO car (id, model, `year`, color, `description`, observations, available, brand_id) VALUES
(1, 'Corolla', 2020, 'Red', 'Compact car', 'None', TRUE, 1),
(2, 'Camry', 2021, 'Blue', 'Midsize sedan', 'None', TRUE, 1),
(3, 'Prius', 2019, 'Green', 'Hybrid car', 'None', FALSE, 1),
(4, 'Mustang', 2021, 'Blue', 'Sports car', 'None', TRUE, 2),
(5, 'F-150', 2022, 'Black', 'Pickup truck', 'None', FALSE, 2),
(6, 'Civic', 2021, 'Silver', 'Compact sedan', 'None', TRUE, 3),
(7, 'Accord', 2020, 'White', 'Midsize sedan', 'None', TRUE, 3),
(8, 'Altima', 2021, 'Black', 'Midsize sedan', 'None', FALSE, 4),
(9, 'GT-R', 2020, 'Silver', 'Sports car', 'None', TRUE, 4),
(10, 'Mazda3', 2021, 'Gray', 'Compact car', 'None', TRUE, 5),
(11, 'CX-5', 2022, 'White', 'Compact crossover SUV', 'None', TRUE, 5),
(12, 'Impreza', 2021, 'Blue', 'Compact car', 'None', TRUE, 6),
(13, 'Forester', 2020, 'Green', 'Compact crossover SUV', 'None', TRUE, 6),
(14, 'Lancer', 2019, 'Red', 'Compact car', 'None', TRUE, 7),
(15, 'Outlander', 2021, 'White', 'Mid-size crossover SUV', 'None', FALSE, 7);
