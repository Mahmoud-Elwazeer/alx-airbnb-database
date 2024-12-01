## Objective: Implement table partitioning to optimize queries on large datasets.

### Instructions:

* Assume the Booking table is large and query performance is slow. Implement partitioning on the Booking table based on the start_date column. Save the query in a file partitioning.sql

* Test the performance of queries on the partitioned table (e.g., fetching bookings by date range).

* Write a brief report on the improvements you observed.

## Performance Testing and Report
### Test Query: Fetch Bookings by Date Range
```
EXPLAIN ANALYZE
SELECT * 
FROM Booking_partitioned 
WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';
```

### Performance Observations:
**Before Partitioning**:
* The query on the unpartitioned Booking table scanned the entire dataset, resulting in slower performance (full table scan).

**After Partitioning:**
* The query executed faster due to pruning, where only relevant partitions (based on the start_date range) were scanned. This significantly reduced the number of rows read and improved query execution time.

## Conclusion
* Partitioning the Booking table by start_date improved query performance by allowing the database to focus only on the relevant partitions instead of scanning the entire table. This optimization is effective for queries involving date ranges, especially on large datasets.











