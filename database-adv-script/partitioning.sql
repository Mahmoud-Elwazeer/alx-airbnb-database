
USE airbnb_db;

-- Step 1: Create a partitioned version of the Booking table based on `start_date`
CREATE TABLE IF NOT EXISTS Booking_partitioned (
    id UUID PRIMARY KEY,
    userId UUID NOT NULL,
    propertyId UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p_2020 VALUES LESS THAN (2021),
    PARTITION p_2021 VALUES LESS THAN (2022),
    PARTITION p_2022 VALUES LESS THAN (2023),
    PARTITION p_2023 VALUES LESS THAN (2024),
    PARTITION p_future VALUES LESS THAN MAXVALUE
);

-- Step 2: Populate the partitioned table
INSERT INTO Booking_partitioned
SELECT * FROM Booking;

-- Step 3: Verify data distribution
SELECT partition_name, table_rows
FROM information_schema.partitions
WHERE table_name = 'Booking_partitioned';


EXPLAIN ANALYZE
SELECT * 
FROM Booking_partitioned 
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';