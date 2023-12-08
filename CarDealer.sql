CREATE DATABASE CarDealership;
USE CarDealership;
CREATE TABLE dealerships (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(50),
    phone VARCHAR(12)
);
ALTER TABLE dealerships
MODIFY COLUMN phone VARCHAR(15);

CREATE TABLE vehicles (
    VIN VARCHAR(17) PRIMARY KEY,
    SOLD BOOLEAN
);
ALTER TABLE vehicles
ADD COLUMN CarType VARCHAR(50);

INSERT INTO vehicles (VIN, SOLD, CarType) VALUES
('1HGCM82633A666777', FALSE, 'Red Sedan'),
('JTDKB20U477121412', TRUE, 'Blue Hybrid'),
('5YJSA1E28JF151111', FALSE, 'White Mustang');

CREATE TABLE inventory (
    dealership_id INT,
    VIN VARCHAR(17),
    PRIMARY KEY (dealership_id, VIN),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);
UPDATE inventory
SET dealership_id = 1
WHERE VIN IN ('1HGCM82633A666777', 'JTDKB20U477121412');

UPDATE inventory
SET dealership_id = 2
WHERE VIN = '5YJSA1E28JF151111';

CREATE TABLE sales_contracts (
    contract_id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);
ALTER TABLE sales_contracts
ADD COLUMN sale_date DATE,
ADD COLUMN sale_amount DECIMAL(10, 2);

CREATE TABLE lease_contracts (
    contract_id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);
INSERT INTO dealerships (name, address, phone) VALUES
('MobilityMaryMobiles', '1998 Jeff Goldblum St', '(323)960-3500');

INSERT INTO dealerships (name, address, phone) VALUES
('TylerTheCarDealer', '1844 Liberty St', '(407)903-0044');

INSERT INTO vehicles (VIN, SOLD, CarType) VALUES
('1HGCM82633A666777', FALSE, 'Red Sedan');

INSERT INTO vehicles (VIN, SOLD, CarType) VALUES
('JTDKB20U477121412', TRUE, 'Blue Hybrid');

INSERT INTO vehicles (VIN, SOLD, CarType) VALUES
('5YJSA1E28JF151111', FALSE, 'White Mustang');

INSERT INTO inventory (dealership_id, VIN) VALUES
(1, '1HGCM82633A666777');
INSERT INTO inventory (dealership_id, VIN) VALUES
(1, 'JTDKB20U477121412');
INSERT INTO inventory (dealership_id, VIN) VALUES
(2, '5YJSA1E28JF151111');
INSERT INTO sales_contracts (VIN) VALUES
('JTDKB20U477121412');
INSERT INTO sales_contracts (VIN) VALUES 
('5YJSA1E28JF151111');

INSERT INTO sales_contracts (VIN, sale_date, sale_amount)
SELECT VIN, '2020-09-28', 25000.00
FROM inventory
WHERE dealership_id = 1 AND VIN = 'JTDKB20U477121412';

INSERT INTO sales_contracts (VIN, sale_date, sale_amount)
SELECT VIN, '2023-02-19', 30000.00
FROM inventory
WHERE dealership_id = 2 AND VIN = '5YJSA1E28JF151111';