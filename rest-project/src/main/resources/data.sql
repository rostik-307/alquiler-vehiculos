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
INSERT INTO brand (id, "name", "year", details) VALUES
(1, 'Toyota', 1937, 'Fabricante de automóviles japonés'),
(2, 'Ford', 1903, 'Fabricante de automóviles multinacional estadounidense'),
(3, 'Honda', 1948, 'Conglomerado multinacional japonés'),
(4, 'Nissan', 1933, 'Fabricante de automóviles japonés'),
(5, 'Mazda', 1920, 'Fabricante de automóviles japonés conocido por sus motores rotativos'),
(6, 'Subaru', 1953, 'Fabricante de automóviles japonés conocido por sus vehículos con tracción en las cuatro ruedas'),
(7, 'Mitsubishi', 1870, 'Fabricante de automóviles japonés parte del Grupo Mitsubishi'),
(8, 'Chevrolet', 1911, 'Fabricante de automóviles estadounidense'),
(9, 'BMW', 1916, 'Fabricante de automóviles alemán de lujo'),
(10, 'Audi', 1909, 'Fabricante de automóviles alemán de lujo'),
(11, 'Mercedes-Benz', 1926, 'Fabricante de automóviles alemán de lujo'),
(12, 'Volkswagen', 1937, 'Fabricante de automóviles alemán'),
(13, 'Hyundai', 1967, 'Fabricante de automóviles surcoreano'),
(14, 'Kia', 1944, 'Fabricante de automóviles surcoreano'),
(15, 'Jaguar', 1922, 'Fabricante de automóviles británico de lujo'),
(16, 'Land Rover', 1948, 'Fabricante de vehículos todoterreno británico'),
(17, 'Porsche', 1931, 'Fabricante de automóviles deportivo alemán');
INSERT INTO brand (id, "name", "year", details,"disabled") VALUES
(18, 'Tesla', 2003, 'Fabricante de automóviles eléctricos estadounidense',TRUE);

-- Insert 48 example cars with translated data
INSERT INTO car (id, model, "year", color, description, observations, available, brand_id) VALUES
-- Existing 15 cars
(1, 'Corolla', 2020, 'Rojo', 'Coche compacto', 'Ninguna', TRUE, 1),
(2, 'Camry', 2021, 'Azul', 'Sedán mediano', 'Ninguna', TRUE, 1),
(3, 'Prius', 2019, 'Verde', 'Coche híbrido', 'Ninguna', FALSE, 1),
(4, 'Mustang', 2021, 'Azul', 'Coche deportivo', 'Ninguna', TRUE, 2),
(5, 'F-150', 2022, 'Negro', 'Camioneta pickup', 'Ninguna', FALSE, 2),
(6, 'Civic', 2021, 'Plata', 'Sedán compacto', 'Ninguna', TRUE, 3),
(7, 'Accord', 2020, 'Blanco', 'Sedán mediano', 'Ninguna', TRUE, 3),
(8, 'Altima', 2021, 'Negro', 'Sedán mediano', 'Ninguna', FALSE, 4),
(9, 'GT-R', 2020, 'Plata', 'Coche deportivo', 'Ninguna', TRUE, 4),
(10, 'Mazda3', 2021, 'Gris', 'Coche compacto', 'Ninguna', TRUE, 5),
(11, 'CX-5', 2022, 'Blanco', 'SUV crossover compacto', 'Ninguna', TRUE, 5),
(12, 'Impreza', 2021, 'Azul', 'Coche compacto', 'Ninguna', TRUE, 6),
(13, 'Forester', 2020, 'Verde', 'SUV crossover compacto', 'Ninguna', TRUE, 6),
(14, 'Lancer', 2019, 'Rojo', 'Coche compacto', 'Ninguna', TRUE, 7),
(15, 'Outlander', 2021, 'Blanco', 'SUV crossover mediano', 'Ninguna', FALSE, 7),

-- Additional 33 cars
(16, 'Supra', 2020, 'Amarillo', 'Coche deportivo', 'Ninguna', TRUE, 1),
(17, 'Land Cruiser', 2022, 'Negro', 'SUV de lujo', 'Ninguna', TRUE, 1),
(18, 'Rav4', 2021, 'Blanco', 'SUV compacto', 'Ninguna', TRUE, 1),
(19, 'Explorer', 2022, 'Gris', 'SUV de tamaño completo', 'Ninguna', TRUE, 2),
(20, 'Bronco', 2021, 'Naranja', 'SUV todoterreno', 'Ninguna', TRUE, 2),
(21, 'Escape', 2021, 'Verde', 'SUV compacto', 'Ninguna', TRUE, 2),
(22, 'Fit', 2019, 'Rojo', 'Coche compacto', 'Ninguna', TRUE, 3),
(23, 'HR-V', 2021, 'Azul', 'SUV compacto', 'Ninguna', TRUE, 3),
(24, 'Odyssey', 2020, 'Negro', 'Minivan', 'Ninguna', TRUE, 3),
(25, '370Z', 2021, 'Rojo', 'Coche deportivo', 'Ninguna', TRUE, 4),
(26, 'Murano', 2020, 'Blanco', 'SUV crossover mediano', 'Ninguna', TRUE, 4),
(27, 'Juke', 2019, 'Azul', 'SUV subcompacto', 'Ninguna', TRUE, 4),
(28, 'MX-5 Miata', 2022, 'Rojo', 'Coche deportivo', 'Ninguna', TRUE, 5),
(29, 'CX-9', 2021, 'Plata', 'SUV de tamaño completo', 'Ninguna', TRUE, 5),
(30, 'BT-50', 2020, 'Gris', 'Camioneta pickup', 'Ninguna', TRUE, 5),
(31, 'Legacy', 2022, 'Azul', 'Sedán mediano', 'Ninguna', TRUE, 6),
(32, 'Ascent', 2021, 'Negro', 'SUV de tamaño completo', 'Ninguna', TRUE, 6),
(33, 'BRZ', 2020, 'Amarillo', 'Coche deportivo', 'Ninguna', TRUE, 6),
(34, 'Eclipse', 2019, 'Rojo', 'Coche deportivo', 'Ninguna', TRUE, 7),
(35, 'Pajero', 2021, 'Blanco', 'SUV todoterreno', 'Ninguna', TRUE, 7),
(36, 'Triton', 2020, 'Gris', 'Camioneta pickup', 'Ninguna', TRUE, 7),
(37, 'Tundra', 2022, 'Negro', 'Camioneta pickup', 'Ninguna', TRUE, 1),
(38, 'Avalon', 2021, 'Plata', 'Sedán grande', 'Ninguna', TRUE, 1),
(39, 'Yaris', 2020, 'Azul', 'Coche subcompacto', 'Ninguna', TRUE, 1),
(40, 'Ranger', 2021, 'Verde', 'Camioneta pickup mediana', 'Ninguna', TRUE, 2),
(41, 'Expedition', 2020, 'Azul', 'SUV de tamaño completo', 'Ninguna', TRUE, 2),
(42, 'Ridgeline', 2021, 'Gris', 'Camioneta pickup', 'Ninguna', TRUE, 3),
(43, 'CR-V', 2022, 'Rojo', 'SUV compacto', 'Ninguna', TRUE, 3),
(44, 'Pathfinder', 2021, 'Negro', 'SUV de tamaño completo', 'Ninguna', TRUE, 4),
(45, 'Leaf', 2020, 'Verde', 'Coche eléctrico', 'Ninguna', TRUE, 4),
(46, 'CX-30', 2021, 'Azul', 'SUV subcompacto', 'Ninguna', TRUE, 5),
(47, 'Tribeca', 2020, 'Blanco', 'SUV de tamaño completo', 'Ninguna', TRUE, 6),
(48, 'Eclipse Cross', 2022, 'Plata', 'SUV crossover compacto', 'Ninguna', TRUE, 7);
