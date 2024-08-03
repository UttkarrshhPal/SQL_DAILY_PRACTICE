CREATE TABLE Orders(
  OrderID INT PRIMARY KEY,
  OrderDate DATE,
  TotalAmount DECIMAL(10,2)
);
INSERT INTO Orders(OrderID,OrderDate,TotalAmount) VALUES
(1, '2023-01-15', 150.50),
(2, '2023-02-20', 200.75),
(3, '2023-02-28', 300.25),
(4, '2023-03-10', 180.00),
(5, '2023-04-05', 250.80);

CREATE TABLE Returns(
  ReturnID INT PRIMARY KEY,
  OrderID INT,
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
  );

INSERT INTO Returns (ReturnID, OrderID) VALUES
(101, 2),
(102, 4),
(103, 5),
(104, 1),
(105, 3);

SELECT * FROM Orders;
SELECT * FROM Returns;

-- Write a SQL Query to calculate total Number of Returned Items Each Months

-- Approach order_id LEFT JOIN
-- Order by date
-- Gruop by date

SELECT
   DATE_FORMAT(o.OrderDate,'%Y-%M') AS OrderMonth,
   COUNT(r.ReturnID) AS TotalReturns
FROM Orders o
LEFT JOIN Returns r
ON o.OrderID = r.OrderID
GROUP BY o.OrderDate
ORDER BY o.OrderDate;

-- Write a SQL Query to calculate total number of orders retrned B/w any  2 months
-- Lets suppose b/w jan to april 

SELECT
  DATE_FORMAT(o.OrderDate,'%Y-%M') AS OrderMonth,
  COUNT(r.ReturnID) AS TotalReturns
FROM Orders o
LEFT JOIN Returns r
ON o.OrderID = r.OrderID
WHERE o.OrderDate BETWEEN '2023-01-01' AND '2023-04-30'
GROUP BY o.OrderDate
ORDER BY o.OrderDate 