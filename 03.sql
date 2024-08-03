DROP TABLE IF EXISTS products;
CREATE TABLE products(
   product_id INT PRIMARY KEY,
   product_name VARCHAR(50),
   category VARCHAR(50),
   quantity_sold INT
);

INSERT INTO products (product_id,product_name,category,quantity_sold) VALUES
(1, 'Samsung Galaxy S20', 'Electronics', 100),
(2, 'Apple iPhone 12 Pro', 'Electronics', 150),
(3, 'Sony PlayStation 5', 'Electronics', 80),
(4, 'Nike Air Max 270', 'Clothing', 200),
(5, 'Adidas Ultraboost 20', 'Clothing', 200),
(6, 'Levis Mens 501 Jeans', 'Clothing', 90),
(7, 'Instant Pot Duo 7-in-1', 'Home & Kitchen', 180),
(8, 'Keurig K-Classic Coffee Maker', 'Home & Kitchen', 130),
(9, 'iRobot Roomba 675 Robot Vacuum', 'Home & Kitchen', 130),
(10, 'Breville Compact Smart Oven', 'Home & Kitchen', 90),
(11, 'Dyson V11 Animal Cordless Vacuum', 'Home & Kitchen', 90);

-- Write a SQL query to find top selling products in each category 
SELECT *
FROM 
(SELECT *,
DENSE_RANK() OVER(PARTITION BY category ORDER BY quantity_sold DESC) rnk
FROM products) x
WHERE x.rnk = 1;


-- Method 2 
SELECT *
FROM 
(	
	SELECT 
		*,
		RANK() OVER(PARTITION BY category ORDER BY quantity_sold DESC) ranks
	FROM products
	ORDER BY category, quantity_sold DESC
) as subquery	
WHERE ranks = 1;

-- Write a SQL query to find least-selling products in each category 
SELECT * 
FROM 
(
SELECT *,
RANK() OVER(PARTITION BY category ORDER BY quantity_sold) rnk
FROM products
ORDER BY quantity_sold,category
) X
WHERE x.rnk=1;

