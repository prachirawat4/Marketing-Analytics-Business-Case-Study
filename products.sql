SELECT 
    ProductID, 
    ProductName, 
    Price, 
    -- Nested IIF replaces the CASE statement
    IIF(Price < 50, 'Low', 
        IIF(Price <= 200, 'Medium', 'High')
    ) AS PriceCategory
FROM 
    dbo.products;
