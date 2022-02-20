-- Cleansed DIM_Customers Table 
SELECT 
  c.customerkey AS CustomerKey, 
  c.firstname AS FirstName, 
  c.lastname AS LastName, 
  c.firstname + ' ' + lastname AS FullName,
  CASE c.gender WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS Gender,
  c.datefirstpurchase AS DateFirstPurchase,
  g.city AS CustomerCity -- Joined in Customer City from Geography Table

FROM 
  AdventureWorksDW2019.dbo.DimCustomer AS c
  LEFT JOIN AdventureWorksDW2019.dbo.DimGeography AS g 
  ON g.geographykey = c.geographykey 

ORDER BY 
  CustomerKey ASC -- Ordered List by CustomerKey