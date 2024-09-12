-- Drop tables if they exist
DROP TABLE IF EXISTS car;
DROP TABLE IF EXISTS brand;

CREATE TABLE brand (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    "name" VARCHAR(255) NOT NULL,
    "year" INT NOT NULL,
    details VARCHAR(255),
    "disabled" BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE TABLE car (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    model VARCHAR(255) NOT NULL,
    "year" INT NOT NULL,
    color VARCHAR(255),
    description VARCHAR(255),
    observations VARCHAR(255),
    available BOOLEAN NOT NULL DEFAULT TRUE,
    brand_id BIGINT,
    CONSTRAINT FK_brand FOREIGN KEY (brand_id) REFERENCES brand(id) ON DELETE SET NULL
);

-- Insert example brands
INSERT INTO brand ("name", "year", details) VALUES
('Toyota', 1937, 'Fabricante de automóviles japonés'),
('Ford', 1903, 'Fabricante de automóviles multinacional estadounidense'),
('Honda', 1948, 'Conglomerado multinacional japonés'),
('Nissan', 1933, 'Fabricante de automóviles japonés'),
('Mazda', 1920, 'Fabricante de automóviles japonés conocido por sus motores rotativos'),
('Subaru', 1953, 'Fabricante de automóviles japonés conocido por sus vehículos con tracción en las cuatro ruedas'),
('Mitsubishi', 1870, 'Fabricante de automóviles japonés parte del Grupo Mitsubishi'),
('Chevrolet', 1911, 'Fabricante de automóviles estadounidense'),
('BMW', 1916, 'Fabricante de automóviles alemán de lujo'),
('Audi', 1909, 'Fabricante de automóviles alemán de lujo'),
('Mercedes-Benz', 1926, 'Fabricante de automóviles alemán de lujo'),
('Volkswagen', 1937, 'Fabricante de automóviles alemán'),
('Hyundai', 1967, 'Fabricante de automóviles surcoreano'),
('Kia', 1944, 'Fabricante de automóviles surcoreano'),
('Jaguar', 1922, 'Fabricante de automóviles británico de lujo'),
('Land Rover', 1948, 'Fabricante de vehículos todoterreno británico'),
('Porsche', 1931, 'Fabricante de automóviles deportivo alemán');
INSERT INTO brand ("name", "year", details,"disabled") VALUES
('Tesla', 2003, 'Fabricante de automóviles eléctricos estadounidense',TRUE);

-- Insert 48 example cars with translated data
INSERT INTO car (model, "year", color, description, observations, available, brand_id) VALUES
-- Existing 15 cars
('Corolla', 2020, 'Rojo', 'Coche compacto', 'Ninguna', TRUE, 1),
('Camry', 2021, 'Azul', 'Sedán mediano', 'Ninguna', TRUE, 1),
('Prius', 2019, 'Verde', 'Coche híbrido', 'Ninguna', FALSE, 1),
('Mustang', 2021, 'Azul', 'Coche deportivo', 'Ninguna', TRUE, 2),
('F-150', 2022, 'Negro', 'Camioneta pickup', 'Ninguna', FALSE, 2),
('Civic', 2021, 'Plata', 'Sedán compacto', 'Ninguna', TRUE, 3),
('Accord', 2020, 'Blanco', 'Sedán mediano', 'Ninguna', TRUE, 3),
('Altima', 2021, 'Negro', 'Sedán mediano', 'Ninguna', FALSE, 4),
('GT-R', 2020, 'Plata', 'Coche deportivo', 'Ninguna', TRUE, 4),
('Mazda3', 2021, 'Gris', 'Coche compacto', 'Ninguna', TRUE, 5),
('CX-5', 2022, 'Blanco', 'SUV crossover compacto', 'Ninguna', TRUE, 5),
('Impreza', 2021, 'Azul', 'Coche compacto', 'Ninguna', TRUE, 6),
('Forester', 2020, 'Verde', 'SUV crossover compacto', 'Ninguna', TRUE, 6),
('Lancer', 2019, 'Rojo', 'Coche compacto', 'Ninguna', TRUE, 7),
('Outlander', 2021, 'Blanco', 'SUV crossover mediano', 'Ninguna', FALSE, 7),

-- Additional 33 cars
('Supra', 2020, 'Amarillo', 'Coche deportivo', 'Ninguna', TRUE, 1),
('Land Cruiser', 2022, 'Negro', 'SUV de lujo', 'Ninguna', TRUE, 1),
('Rav4', 2021, 'Blanco', 'SUV compacto', 'Ninguna', TRUE, 1),
('Explorer', 2022, 'Gris', 'SUV de tamaño completo', 'Ninguna', TRUE, 2),
('Bronco', 2021, 'Naranja', 'SUV todoterreno', 'Ninguna', TRUE, 2),
('Escape', 2021, 'Verde', 'SUV compacto', 'Ninguna', TRUE, 2),
('Fit', 2019, 'Rojo', 'Coche compacto', 'Ninguna', TRUE, 3),
('HR-V', 2021, 'Azul', 'SUV compacto', 'Ninguna', TRUE, 3),
('Odyssey', 2020, 'Negro', 'Minivan', 'Ninguna', TRUE, 3),
('370Z', 2021, 'Rojo', 'Coche deportivo', 'Ninguna', TRUE, 4),
('Murano', 2020, 'Blanco', 'SUV crossover mediano', 'Ninguna', TRUE, 4),
('Juke', 2019, 'Azul', 'SUV subcompacto', 'Ninguna', TRUE, 4),
('MX-5 Miata', 2022, 'Rojo', 'Coche deportivo', 'Ninguna', TRUE, 5),
('CX-9', 2021, 'Plata', 'SUV de tamaño completo', 'Ninguna', TRUE, 5),
('BT-50', 2020, 'Gris', 'Camioneta pickup', 'Ninguna', TRUE, 5),
('Legacy', 2022, 'Azul', 'Sedán mediano', 'Ninguna', TRUE, 6),
('Ascent', 2021, 'Negro', 'SUV de tamaño completo', 'Ninguna', TRUE, 6),
('BRZ', 2020, 'Amarillo', 'Coche deportivo', 'Ninguna', TRUE, 6),
('Eclipse', 2019, 'Rojo', 'Coche deportivo', 'Ninguna', TRUE, 7),
('Pajero', 2021, 'Blanco', 'SUV todoterreno', 'Ninguna', TRUE, 7),
('Triton', 2020, 'Gris', 'Camioneta pickup', 'Ninguna', TRUE, 7),
('Tundra', 2022, 'Negro', 'Camioneta pickup', 'Ninguna', TRUE, 1),
('Avalon', 2021, 'Plata', 'Sedán grande', 'Ninguna', TRUE, 1),
('Yaris', 2020, 'Azul', 'Coche subcompacto', 'Ninguna', TRUE, 1),
('Ranger', 2021, 'Verde', 'Camioneta pickup mediana', 'Ninguna', TRUE, 2),
('Expedition', 2020, 'Azul', 'SUV de tamaño completo', 'Ninguna', TRUE, 2),
('Ridgeline', 2021, 'Gris', 'Camioneta pickup', 'Ninguna', TRUE, 3),
('CR-V', 2022, 'Rojo', 'SUV compacto', 'Ninguna', TRUE, 3),
('Pathfinder', 2021, 'Negro', 'SUV de tamaño completo', 'Ninguna', TRUE, 4),
('Leaf', 2020, 'Verde', 'Coche eléctrico', 'Ninguna', TRUE, 4),
('CX-30', 2021, 'Azul', 'SUV subcompacto', 'Ninguna', TRUE, 5),
('Tribeca', 2020, 'Blanco', 'SUV de tamaño completo', 'Ninguna', TRUE, 6),
('Eclipse Cross', 2022, 'Plata', 'SUV crossover compacto', 'Ninguna', TRUE, 7);
