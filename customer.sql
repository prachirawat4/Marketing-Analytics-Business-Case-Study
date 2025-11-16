SELECT 
    c.CustomerID, 
    c.CustomerName, 
    c.Email, 
    c.Gender, 
    c.Age,
    -- Subquery to fetch Country
    (SELECT Country FROM dbo.geography WHERE GeographyID = c.GeographyID) AS Country,
    -- Subquery to fetch City
    (SELECT City FROM dbo.geography WHERE GeographyID = c.GeographyID) AS City
FROM 
    dbo.customers AS c;
