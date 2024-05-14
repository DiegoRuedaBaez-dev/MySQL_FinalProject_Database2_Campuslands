CREATE TABLE country(
    id_country INT(11) NOT NULL AUTO_INCREMENT,
    vname VARCHAR(100) NOT NULL,
    PRIMARY KEY(id_country)
);

CREATE TABLE region(
    id_region INT(11) NOT NULL AUTO_INCREMENT,
    vname VARCHAR(100) NOT NULL,
    id_country INT(11) NOT NULL,
    PRIMARY KEY(id_region),
    CONSTRAINT FK_region_country FOREIGN KEY (id_country) REFERENCES country(id_country)
);

CREATE TABLE city(
    id_city INT(11) NOT NULL AUTO_INCREMENT,
    vname VARCHAR(100) NOT NULL,
    id_region INT(11) NOT NULL,
    PRIMARY KEY(id_city),
    CONSTRAINT FK_city_region FOREIGN KEY (id_region) REFERENCES region(id_region)
);

CREATE TABLE vaddress(
    id_vaddress INT(11) NOT NULL AUTO_INCREMENT,
    linea_vaddress VARCHAR(50) NOT NULL,
    barrio VARCHAR(100) NOT NULL,
    codigo_postal VARCHAR(10),
    id_city INT(11) NOT NULL,
    PRIMARY KEY(id_vaddress),
    CONSTRAINT FK_vaddress_city FOREIGN KEY(id_city) REFERENCES city(id_city)
);

CREATE TABLE vprovider(
    id_vprovider INT(11) NOT NULL AUTO_INCREMENT,
    phone VARCHAR(20) NOT NULL,
    vname VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_vprovider)
);

CREATE TABLE vprovider_address (
    id_vprovider INT(11) NOT NULL,
    id_vaddress INT(11) NOT NULL,
    PRIMARY KEY (id_vprovider, id_vaddress),
    FOREIGN KEY (id_vprovider) REFERENCES vprovider(id_vprovider),
    FOREIGN KEY (id_vaddress) REFERENCES vaddress(id_vaddress)
);

CREATE TABLE office (
    id_office INT(11) NOT NULL AUTO_INCREMENT,
    vname VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    PRIMARY KEY (id_office)
);

CREATE TABLE office_vaddress (
    id_office INT(11) NOT NULL,
    id_vaddress INT(11) NOT NULL,
    PRIMARY KEY (id_office, id_vaddress),
    FOREIGN KEY (id_office) REFERENCES office(id_office),
    FOREIGN KEY (id_vaddress) REFERENCES vaddress(id_vaddress)
);

CREATE TABLE product_brand(
    id_brand INT(11) NOT NULL AUTO_INCREMENT,
    brand VARCHAR (50) NOT NULL,
    descripcion_texto TEXT,
    descripcion_html TEXT,
    imagen VARCHAR(256),
    PRIMARY KEY (id_brand)
);

CREATE TABLE measurements(
    id_measurements INT(11) NOT NULL AUTO_INCREMENT,
    alto DECIMAL(5,2),
    ancho DECIMAL(5,2),
    profundidad DECIMAL(5,2),
    diametro DECIMAL(5,2),
    unidad_de_medida VARCHAR(10),
    PRIMARY KEY (id_measurements)
);

CREATE TABLE products(
    id_products INT(11) NOT NULL AUTO_INCREMENT,
    vname VARCHAR(100) NOT NULL,
    descrip TEXT,
    provider_price DECIMAL (12,5),
    sell_price DECIMAL(12,5) NOT NULL,
    id_measurements INT(11),
    FOREIGN KEY (id_measurements) REFERENCES measurements(id_measurements),
    id_vprovider INT(11),
    FOREIGN KEY (id_vprovider) REFERENCES vprovider(id_vprovider),
    id_brand INT(11) NOT NULL,
    FOREIGN KEY (id_brand) REFERENCES product_brand(id_brand),
    PRIMARY KEY (id_products)
);

CREATE TABLE inventory (
    id_inventory INT(11) NOT NULL AUTO_INCREMENT,
    id_products INT(11) NOT NULL,
    cantidad_en_stock SMALLINT(6) NOT NULL,
    ubicacion VARCHAR(100), 
    PRIMARY KEY (id_inventory),
    FOREIGN KEY (id_products) REFERENCES products(id_products)
);

CREATE TABLE employees (
    id_employees INT(11) NOT NULL AUTO_INCREMENT,
    vname VARCHAR(50) NOT NULL,
    sn1 VARCHAR(50) NOT NULL,
    sn2 VARCHAR(50) NOT NULL,
    extension VARCHAR(10) NOT NULL,
    email VARCHAR(100) NOT NULL,
    id_office INT(11) NOT NULL,
    id_boss INT(11),
    position VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_employees),
    CONSTRAINT FK_employees_office FOREIGN KEY (id_office) REFERENCES office(id_office),
    CONSTRAINT FK_employees_boss FOREIGN KEY (id_boss) REFERENCES employees(id_employees)
);

CREATE TABLE contact_info (
    id_contact_info INT(11) NOT NULL AUTO_INCREMENT,
    vname_contact_info VARCHAR(50) NOT NULL,
    sn_contact_info VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_contact_info)
);

CREATE TABLE client (
    id_client INT(11) NOT NULL AUTO_INCREMENT,
    vname_client VARCHAR(50) NOT NULL,
    sn1_client VARCHAR(50) NOT NULL,
    sn2_client VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    id_employees_sellrep INT(11),
    credit_limit DECIMAL(15,2),
    id_contact_info INT(11),
    PRIMARY KEY (id_client),
    CONSTRAINT FK_contact_info_client FOREIGN KEY (id_contact_info) REFERENCES contact_info(id_contact_info),
    CONSTRAINT FK_client_employees_sellrep FOREIGN KEY (id_employees_sellrep) REFERENCES employees(id_employees)
);

CREATE TABLE client_vaddress (
    id_client INT(11) NOT NULL,
    id_vaddress INT(11) NOT NULL,
    PRIMARY KEY (id_client, id_vaddress),
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_vaddress) REFERENCES vaddress(id_vaddress)
);

CREATE TABLE order_status(
    id_status INT(11) NOT NULL AUTO_INCREMENT,
    vstatus VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_status)
);

CREATE TABLE vorder(
    id_vorder INT(11) NOT NULL AUTO_INCREMENT,
    date_order DATE NOT NULL,
    date_aprox DATE NOT NULL,
    date_arrive DATE,
    comments TEXT,
    id_status INT(11) NOT NULL,
    id_client INT(11) NOT NULL,
    PRIMARY KEY(id_vorder),
    CONSTRAINT FK_order_status FOREIGN KEY (id_status) REFERENCES order_status (id_status),
    CONSTRAINT FK_order_client FOREIGN KEY (id_client) REFERENCES client(id_client)
);

CREATE TABLE order_details (
    id_vorder INT(11) NOT NULL,
    id_products INT(11) NOT NULL,
    cantidad INT(11),
    precio_unidad DECIMAL(15,2),
    numero_linea SMALLINT(6),
    PRIMARY KEY (id_vorder, id_products),
    FOREIGN KEY (id_vorder) REFERENCES vorder(id_vorder),
    FOREIGN KEY (id_products) REFERENCES products(id_products)
);

CREATE TABLE payment(
    id_transaction INT(11) NOT NULL AUTO_INCREMENT,
    id_client INT(11) NOT NULL,
    payment_type VARCHAR(40) NOT NULL,
    date_payment DATE NOT NULL,
    total DECIMAL(15,2) NOT NULL,
    PRIMARY KEY (id_transaction),
    CONSTRAINT FK_payment_client FOREIGN KEY (id_client) REFERENCES client(id_client)
);
