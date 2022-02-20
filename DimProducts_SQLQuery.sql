-- Cleansed DIM_Products Table --
SELECT 
  p.ProductKey, 
  p.ProductAlternateKey AS ProductItemCode, 
  p.EnglishProductName AS ProductName, 
  ps.EnglishProductSubcategoryName AS SubCategory, -- Joined in from Sub Category Table
  pc.EnglishProductCategoryName AS ProductCategory, -- Joined in from Category Table
  p.Color AS ProductColor, 
  p.Size AS ProductSize, 
  p.ProductLine AS ProductLine, 
  p.ModelName AS ProductModelName, 
  p.EnglishDescription AS ProductDescription, 
 
  ISNULL (p.Status, 'Outdated') AS ProductStatus

FROM 
  AdventureWorksDW2019.dbo.DimProduct as p
  LEFT JOIN AdventureWorksDW2019.dbo.DimProductSubcategory AS ps 
  ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey
  LEFT JOIN AdventureWorksDW2019.dbo.DimProductCategory AS pc 
  ON ps.ProductCategoryKey = pc.ProductCategoryKey 

ORDER BY
  p.ProductKey asc