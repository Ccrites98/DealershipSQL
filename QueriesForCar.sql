use CarDealership;
SELECT * FROM dealerships;
----
SELECT v.*, d.name AS dealership_name
FROM vehicles v
JOIN inventory i ON v.VIN = i.VIN
JOIN dealerships d ON i.dealership_id = d.dealership_id
WHERE d.dealership_id = 1; -- either 1 or 2 will designate the respective dealerships
----
SELECT *
FROM vehicles
WHERE VIN = ''; -- input the desired VIN to search for it
----
SELECT d.*
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
JOIN vehicles v ON i.VIN = v.VIN
WHERE v.VIN = ''; -- Input whichever VIN you'd like to look up
----
SELECT d.*
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
JOIN vehicles v ON i.VIN = v.VIN
WHERE v.CarType = 'Red Sedan'; -- place whichever CarType you want to look up
----
SELECT d.name AS dealership_name, s.*
FROM sales_contracts s
JOIN vehicles v ON s.VIN = v.VIN
JOIN inventory i ON v.VIN = i.VIN
JOIN dealerships d ON i.dealership_id = d.dealership_id
WHERE d.name = '' -- put in the dealer name
  AND s.sale_date BETWEEN '2020-01-01' AND '2023-12-31'; -- date range