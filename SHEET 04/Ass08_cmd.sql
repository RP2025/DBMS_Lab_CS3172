use dbms;

-- 1) Give names of customer who have sent packages (shipments)
-- to Kolkata, Chennai and Munbai.
SELECT
    DISTINCT cust_name
FROM
    shipment s,
    customer c
WHERE
    s.cust_id = c.cust_id
    AND destination IN ('Chennai', 'Kolkata', 'Mumbai');

-- 2) List the names of the driver who have delivered shipments weighing over 200
-- pounds.

SELECT
    DISTINCT driver_name
FROM
    shipment s,
    truck t
WHERE
    s.truck_no = t.truck_no
    AND s.weight > 200;

-- 3) Retrieve the maximum and minimum weights of the shipments. 
-- Rename the output as
-- Max_Weight and Min_Weight respectively.

SELECT
    max(weight) AS MaxWeight,
    min(weight) AS MinWeight
FROM
    shipment;
    
-- 4) For each customer, what is the average weight of package sent by the customer?

SELECT
    cust_id,
    avg(weight) AS AverageWeight
FROM
    shipment
GROUP BY
    cust_id
ORDER BY
    cust_id;

-- 5) List the names and populations of cities that have received 
-- a shipment weighing over 100 pounds.

SELECT
    city_name,
    population
FROM
    shipment s,
    city c
WHERE
    s.destination = c.city_name
    AND weight > 100
GROUP BY
    city_name;
    
-- 6) List cities that have received shipments from every customer.

SELECT
    city_name
FROM
    shipment s,
    city c
WHERE
    s.destination = c.city_name
GROUP BY
    city_name
HAVING
    count(DISTINCT cust_id) = (SELECT count(*) FROM customer);

-- 7) For each city, what is the maximum weight of a package sent to that city?

SELECT
    city_name,
    max(weight)
FROM
    city c,
    shipment s
WHERE
    c.city_name = s.destination
GROUP BY
    city_name;

-- 8) List the name and annual revenue of customers whose shipments 
-- have been delivered
-- by truck driver ‘IQBAL’.

SELECT
    cust_name,
    annual_revenue
FROM
    customer c,
    shipment s,
    truck t
WHERE
    c.cust_id = s.cust_id
    AND s.truck_no = t.truck_no
    AND driver_name = 'Kiara';

-- 9) List drivers who have delivered shipments to every city.

SELECT
    t.truck_no,
    t.driver_name
FROM
    shipment s,
    truck t
WHERE
    s.truck_no = t.truck_no
GROUP BY
    t.truck_no
HAVING
    count(DISTINCT(destination)) = (SELECT count(*) FROM city );

        

-- 10) For each city, with population over 1 million, 
-- what is the minimum weight of a
-- package sent to that city.

SELECT
    city_name,
    min(weight)
FROM
    shipment,
    city
WHERE
    destination = city_name
    AND population > 1000000
GROUP BY
    city_name;