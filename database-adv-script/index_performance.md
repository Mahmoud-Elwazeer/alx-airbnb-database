
## Explanation of Indexes:
Indexes on foreign keys (userId, propertyId in both Property and Booking tables) improve the performance of JOIN operations.
Indexes on columns frequently used in filtering or sorting (e.g., email, location) allow faster data retrieval.



## Measuring Query Performance Using EXPLAIN or ANALYZE
To measure query performance before and after adding the indexes, you can use the EXPLAIN or ANALYZE statement to see the query execution plan.


## Results After Indexing:
After adding indexes, the queries should be faster, especially for large datasets. The execution plan should indicate that the database is using indexes for the joins and filtering operations, which should result in reduced I/O and faster query performance.