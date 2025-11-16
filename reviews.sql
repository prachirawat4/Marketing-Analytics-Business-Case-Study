SELECT 
    ReviewID, 
    CustomerID, 
    ProductID, 
    ReviewDate, 
    Rating, 
    -- Nesting REPLACE ensures that sequences of 3 or 4 spaces are also reduced to a single space
    REPLACE(REPLACE(ReviewText, '  ', ' '), '  ', ' ') AS ReviewText
FROM 
    dbo.customer_reviews;
