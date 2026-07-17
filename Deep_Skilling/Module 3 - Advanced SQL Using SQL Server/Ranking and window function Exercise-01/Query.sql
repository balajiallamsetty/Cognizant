
-- Create Table

CREATE TABLE Products
(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

-- Insert Data

INSERT INTO Products VALUES
(1,'Laptop','Electronics',80000),
(2,'Mobile','Electronics',60000),
(3,'Tablet','Electronics',40000),
(4,'Headphone','Electronics',10000),

(5,'Shirt','Fashion',2000),
(6,'Jeans','Fashion',3000),
(7,'Jacket','Fashion',5000),
(8,'Shoes','Fashion',4000),

(9,'Chair','Furniture',7000),
(10,'Table','Furniture',12000),
(11,'Sofa','Furniture',25000),
(12,'Bed','Furniture',30000);



-- ROW_NUMBER()

SELECT *,
ROW_NUMBER() OVER
(
    PARTITION BY Category
    ORDER BY Price DESC
) AS RowNum
FROM Products;


-- RANK()

SELECT *,
RANK() OVER
(
    PARTITION BY Category
    ORDER BY Price DESC
) AS RankNum
FROM Products;


-- DENSE_RANK()

SELECT *,
DENSE_RANK() OVER
(
    PARTITION BY Category
    ORDER BY Price DESC
) AS DenseRankNum
FROM Products;


-- Top 3 Products in Each Category

SELECT *
FROM
(
    SELECT *,
    ROW_NUMBER() OVER
    (
        PARTITION BY Category
        ORDER BY Price DESC
    ) AS RowNum
    FROM Products
) T
WHERE RowNum <= 3;