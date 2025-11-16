WITH CleanedJourney AS (
    SELECT 
        JourneyID, 
        CustomerID, 
        ProductID, 
        VisitDate, 
        UPPER(Stage) AS Stage,  -- Standardize Stage
        Action, 
        Duration,
        -- Calculate average duration per date for filling nulls later
        AVG(Duration) OVER (PARTITION BY VisitDate) AS avg_duration,
        -- Identify duplicates
        ROW_NUMBER() OVER (
            PARTITION BY CustomerID, ProductID, VisitDate, UPPER(Stage), Action 
            ORDER BY JourneyID
        ) AS row_num
    FROM 
        dbo.customer_journey
)
SELECT 
    JourneyID, 
    CustomerID, 
    ProductID, 
    VisitDate, 
    Stage, 
    Action, 
    -- Fill NULL duration with the calculated average
    COALESCE(Duration, avg_duration) AS Duration
FROM 
    CleanedJourney
WHERE 
    row_num = 1; -- Keep only the unique records
