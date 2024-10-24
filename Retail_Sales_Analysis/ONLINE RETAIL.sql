--Total Revenue from all sales
SELECT SUM(Quantity * UnitPrice) AS Total_Revenue
  FROM [Online Retail]

  --Monthly Sales Performance
  SELECT YEAR(InvoiceDate) AS Year, 
         MONTH(InvoiceDate) AS Month, 
	     SUM(Quantity * UnitPrice) AS Monthly_Revenue
    FROM [Online Retail] 
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate) 
ORDER BY Year, Month 
  
  --Top Ten Selling Items
  SELECT TOP 10 Description, 
         SUM(Quantity) AS Total_Quantity_Sold
    FROM [Online Retail]
GROUP BY Description
ORDER BY Total_Quantity_Sold DESC 

-- Top Customers 
  SELECT TOP 10 CustomerID, 
           SUM(Quantity * UnitPrice) AS Total_Spent
    FROM [Online Retail] 
GROUP BY CustomerID
ORDER BY Total_Spent DESC

--Sales By Country 
  SELECT Country,
         SUM(Quantity * UnitPrice) AS Total_Revenue
    FROM [Online Retail]
GROUP BY Country
ORDER BY Total_Revenue DESC 

  --Total Returns and Total Revenue Generated
  SELECT SUM(CASE WHEN Quantity < 0 THEN Quantity * UnitPrice ELSE 0 END) AS Total_Returns,
         SUM(CASE WHEN Quantity > 0 THEN Quantity * UnitPrice ELSE 0 END) AS Total_Revenue
	FROM [Online Retail]


      