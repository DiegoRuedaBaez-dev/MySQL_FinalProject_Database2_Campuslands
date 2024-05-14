INSERT INTO country (vname) VALUES
('España'),
('Francia'),
('Italia'),
('Alemania'),
('Portugal'),
('Reino Unido'),
('Estados Unidos'),
('China'),
('Japón'),
('Brasil');

-- Inserting Regions --

INSERT INTO region (vname, id_country) VALUES
('Madrid', 1),  -- Madrid, España
('Cataluña', 1), -- Cataluña, España
('Île-de-France', 2), -- Île-de-France, Francia
('Lombardía', 3), -- Lombardía, Italia
('Baviera', 4), -- Baviera, Alemania
('Lisboa', 5), -- Lisboa, Portugal
('Londres', 6), -- Londres, Reino Unido
('California', 7), -- California, Estados Unidos
('Shanghái', 8), -- Shanghái, China
('Kantō', 9), -- Kantō, Japón
('São Paulo', 10); -- São Paulo, Brasil

-- Inserting Cities --

INSERT INTO city (vname, id_region) VALUES
('Madrid', 1),  -- Madrid, España
('Barcelona', 2), -- Barcelona, España
('París', 3), -- París, Francia
('Milán', 4), -- Milán, Italia
('Múnich', 5), -- Múnich, Alemania
('Lisboa', 6), -- Lisboa, Portugal
('Londres', 7), -- Londres, Reino Unido
('Los Ángeles', 8), -- Los Ángeles, Estados Unidos
('Shanghái', 9), -- Shanghái, China
('Tokio', 10), -- Tokio, Japón
('São Paulo', 11); -- São Paulo, Brasil

-- Inserting Addresses --

INSERT INTO vaddress (linea_vaddress, barrio, codigo_postal, id_city) VALUES
('Calle Gran Vía, 1', 'Centro', '28013', 1), -- Calle Gran Vía, 1, Centro, Madrid, España
('Avinguda Diagonal, 123', 'Eixample', '08008', 2), -- Avinguda Diagonal, 123, Eixample, Barcelona, España
('Rue de Rivoli, 1', 'Louvre', '75001', 3), -- Rue de Rivoli, 1, Louvre, París, Francia
('Via Monte Napoleone, 1', 'Quadrilatero della moda', '20121', 4), -- Via Monte Napoleone, 1, Quadrilatero della moda, Milán, Italia
('Marienplatz, 1', 'Altstadt-Lehel', '80331', 5), -- Marienplatz, 1, Altstadt-Lehel, Múnich, Alemania
('Praça do Comércio, 1', 'Baixa', '1100-148', 6), -- Praça do Comércio, 1, Baixa, Lisboa, Portugal
('Buckingham Palace Road, 1', 'Westminster', 'SW1A 1AA', 7), -- Buckingham Palace Road, 1, Westminster, Londres, Reino Unido
('Hollywood Boulevard, 123', 'Hollywood', '90028', 8), -- Hollywood Boulevard, 123, Hollywood, Los Ángeles, Estados Unidos
('Nanjing Road, 123', 'Huangpu', '200000', 9), -- Nanjing Road, 123, Huangpu, Shanghái, China
('Shibuya Crossing, 1', 'Shibuya', '150-0002', 10), -- Shibuya Crossing, 1, Shibuya, Tokio, Japón
('Avenida Paulista, 1234', 'Bela Vista', '01310-100', 11); -- Avenida Paulista, 1234, Bela Vista, São Paulo, Brasil

-- Inserting Providers --

INSERT INTO vprovider (phone, vname) VALUES
('123-456-789', 'Proveedor 1'), -- Proveedor 1
('234-567-890', 'Proveedor 2'), -- Proveedor 2
('345-678-901', 'Proveedor 3'), -- Proveedor 3
('456-789-012', 'Proveedor 4'), -- Proveedor 4
('567-890-123', 'Proveedor 5'); -- Proveedor 5

-- Associating Providers with Addresses --

INSERT INTO vprovider_address (id_vprovider, id_vaddress) VALUES
(1, 1), -- Proveedor 1, Calle Gran Vía, 1, Centro, Madrid, España
(2, 2), -- Proveedor 2, Avinguda Diagonal, 123, Eixample, Barcelona, España
(3, 3), -- Proveedor 3, Rue de Rivoli, 1, Louvre, París, Francia
(4, 4), -- Proveedor 4, Via Monte Napoleone, 1, Quadrilatero della moda, Milán, Italia
(5, 5); -- Proveedor 5, Marienplatz, 1, Altstadt-Lehel, Múnich, Alemania

-- Inserting Offices --

INSERT INTO office (vname, phone) VALUES
('Oficina Madrid', '123-456-789'), -- Oficina Madrid
('Oficina Barcelona', '234-567-890'), -- Oficina Barcelona
('Oficina París', '345-678-901'), -- Oficina París
('Oficina Milán', '456-789-012'), -- Oficina Milán
('Oficina Múnich', '567-890-123'); -- Oficina Múnich

-- Associating Offices with Addresses --

INSERT INTO office_vaddress (id_office, id_vaddress) VALUES
(1, 1), -- Oficina Madrid, Calle Gran Vía, 1, Centro, Madrid, España
(2, 2), -- Oficina Barcelona, Avinguda Diagonal, 123, Eixample, Barcelona, España
(3, 3), -- Oficina París, Rue de Rivoli, 1, Louvre, París, Francia
(4, 4), -- Oficina Milán, Via Monte Napoleone, 1, Quadrilatero della moda, Milán, Italia
(5, 5); -- Oficina Múnich, Marienplatz, 1, Altstadt-Lehel, Múnich, Alemania

-- Inserting Product Brands --

INSERT INTO product_brand (brand, descripcion_texto, descripcion_html, imagen) VALUES
('Marca A', 'Descripción de la Marca A', '<p>Descripción de la <b>Marca A</b></p>', 'imagen_marca_a.jpg'), -- Marca A
('Marca B', 'Descripción de la Marca B', '<p>Descripción de la <b>Marca B</b></p>', 'imagen_marca_b.jpg'), -- Marca B
('Marca C', 'Descripción de la Marca C', '<p>Descripción de la <b>Marca C</b></p>', 'imagen_marca_c.jpg'), -- Marca C
('Marca D', 'Descripción de la Marca D', '<p>Descripción de la <b>Marca D</b></p>', 'imagen_marca_d.jpg'), -- Marca D
('Marca E', 'Descripción de la Marca E', '<p>Descripción de la <b>Marca E</b></p>', 'imagen_marca_e.jpg'); -- Marca E

-- Inserting Measurements --

INSERT INTO measurements (alto, ancho, profundidad, diametro, unidad_de_medida) VALUES
(10.0, 20.0, 30.0, NULL, 'cm'), -- Alto: 10 cm, Ancho: 20 cm, Profundidad: 30 cm
(NULL, NULL, NULL, 15.0, 'cm'), -- Diámetro: 15 cm
(5.0, 10.0, 15.0, NULL, 'cm'), -- Alto: 5 cm, Ancho: 10 cm, Profundidad: 15 cm
(20.0, 25.0, 30.0, NULL, 'cm'), -- Alto: 20 cm, Ancho: 25 cm, Profundidad: 30 cm
(8.0, 12.0, 16.0, NULL, 'cm'); -- Alto: 8 cm, Ancho: 12 cm, Profundidad: 16 cm

-- Inserting Products --

INSERT INTO products (vname, descrip, provider_price, sell_price, id_measurements, id_vprovider, id_brand) VALUES
('Producto 1', 'Descripción del Producto 1', 100.00, 150.00, 1, 1, 1), -- Producto 1, Medidas 1, Proveedor 1, Marca A
('Producto 2', 'Descripción del Producto 2', 200.00, 250.00, 2, 2, 2), -- Producto 2, Medidas 2, Proveedor 2, Marca B
('Producto 3', 'Descripción del Producto 3', 150.00, 200.00, 3, 3, 3), -- Producto 3, Medidas 3, Proveedor 3, Marca C
('Producto 4', 'Descripción del Producto 4', 300.00, 350.00, 4, 4, 4), -- Producto 4, Medidas 4, Proveedor 4, Marca D
('Producto 5', 'Descripción del Producto 5', 120.00, 170.00, 5, 5, 5); -- Producto 5, Medidas 5, Proveedor 5, Marca E

-- Inserting Inventory --

INSERT INTO inventory (id_products, cantidad_en_stock, ubicacion) VALUES
(1, 100, 'Almacén A'), -- Producto 1, 100 unidades, Almacén A
(2, 200, 'Almacén B'), -- Producto 2, 200 unidades, Almacén B
(3, 150, 'Almacén C'), -- Producto 3, 150 unidades, Almacén C
(4, 300, 'Almacén D'), -- Producto 4, 300 unidades, Almacén D
(5, 120, 'Almacén E'); -- Producto 5, 120 unidades, Almacén E

-- Inserting Employees --

INSERT INTO employees (vname, sn1, sn2, extension, email, id_office, id_boss, position) VALUES
('John', 'Doe', 'Smith', '1001', 'john.doe@example.com', 1, NULL, 'Manager'), -- John Doe, Oficina Madrid, Manager
('Jane', 'Doe', 'Smith', '1002', 'jane.doe@example.com', 2, 1, 'Sales Representative'), -- Jane Doe, Oficina Barcelona, Vendedor, Jefe: John Doe
('Alice', 'Johnson', 'Brown', '1003', 'alice.johnson@example.com', 3, 1, 'Sales Representative'), -- Alice Johnson, Oficina París, Vendedor, Jefe: John Doe
('Bob', 'Williams', 'Davis', '1004', 'bob.williams@example.com', 4, 1, 'Sales Representative'), -- Bob Williams, Oficina Milán, Vendedor, Jefe: John Doe
('Charlie', 'Jones', 'Wilson', '1005', 'charlie.jones@example.com', 5, 1, 'Sales Representative'); -- Charlie Jones, Oficina Múnich, Vendedor, Jefe: John Doe

-- Inserting Contact Info --

INSERT INTO contact_info (vname_contact_info, sn_contact_info) VALUES
('David', 'Brown'), -- David Brown
('Eva', 'White'), -- Eva White
('Frank', 'Green'), -- Frank Green
('Grace', 'Black'), -- Grace Black
('Hank', 'Blue'); -- Hank Blue

-- Inserting Clients --

INSERT INTO client (vname_client, sn1_client, sn2_client, phone, email, id_contact_info, id_vaddress, id_employees) VALUES
('Cliente 1', 'Apellido1', 'Apellido2', '111-222-333', 'cliente1@example.com', 1, 1, 1), -- Cliente 1, Contacto: David Brown, Dirección: Madrid, Vendedor: John Doe
('Cliente 2', 'Apellido1', 'Apellido2', '222-333-444', 'cliente2@example.com', 2, 2, 2), -- Cliente 2, Contacto: Eva White, Dirección: Barcelona, Vendedor: Jane Doe
('Cliente 3', 'Apellido1', 'Apellido2', '333-444-555', 'cliente3@example.com', 3, 3, 3), -- Cliente 3, Contacto: Frank Green, Dirección: París, Vendedor: Alice Johnson
('Cliente 4', 'Apellido1', 'Apellido2', '444-555-666', 'cliente4@example.com', 4, 4, 4), -- Cliente 4, Contacto: Grace Black, Dirección: Milán, Vendedor: Bob Williams
('Cliente 5', 'Apellido1', 'Apellido2', '555-666-777', 'cliente5@example.com', 5, 5, 5); -- Cliente 5, Contacto: Hank Blue, Dirección: Múnich, Vendedor: Charlie Jones

-- Inserting Sales --

INSERT INTO sales (id_client, id_products, id_employees, quantity, sale_date, total_price) VALUES
(1, 1, 1, 2, '2024-01-01', 300.00), -- Venta de 2 unidades de Producto 1 a Cliente 1 por John Doe el 1 de enero de 2024, Total: 300.00
(2, 2, 2, 3, '2024-02-01', 750.00), -- Venta de 3 unidades de Producto 2 a Cliente 2 por Jane Doe el 1 de febrero de 2024, Total: 750.00
(3, 3, 3, 1, '2024-03-01', 200.00), -- Venta de 1 unidad de Producto 3 a Cliente 3 por Alice Johnson el 1 de marzo de 2024, Total: 200.00
(4, 4, 4, 4, '2024-04-01', 1400.00), -- Venta de 4 unidades de Producto 4 a Cliente 4 por Bob Williams el 1 de abril de 2024, Total: 1400.00
(5, 5, 5, 5, '2024-05-01', 850.00); -- Venta de 5 unidades de Producto 5 a Cliente 5 por Charlie Jones el 1 de mayo de 2024, Total: 850.00
