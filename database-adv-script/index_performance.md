# **Airbnb Database Indexing**

## **Overview**

This project is focused on optimizing SQL queries for the Airbnb database (**`airbnb_db`**) by creating indexes on frequently queried columns and analyzing query performance using **`EXPLAIN ANALYZE`**. The goal is to improve query execution speed and reduce response time, especially for complex queries involving **`JOIN`** operations across multiple tables like **`Booking`**, **`Property`**, **`User`**, **`Payment`**, **`Review`**, and **`Message`**.

## **Database Setup**

The following operations are performed in this script:

1. **Creating Indexes**: Indexes are created on frequently queried columns to optimize query performance.
2. **Measure the query performance**: Queries are analyzed using **`EXPLAIN ANALYZE`** to measure execution times before and after adding indexes
3. **Indexing Strategy**: Indexes are created on columns used in **`WHERE`**, **`JOIN`**, and **`ORDER BY`** clauses to enhance the speed of data retrieval.

## **Steps**

1. **Connect to the Database**
    
    ```sql
    
    USE airbnb_db;
    
    ```
    
2. **Create Indexes on Frequently Queried Columns**
    
    The following indexes are created to speed up common queries:
    
    - **User Table**: Index on **`email`** for faster lookups by email.
    - **Property Table**: Index on **`hostId`** and **`location`** to speed up queries filtering or joining by these columns.
    - **Booking Table**: Indexes on **`propertyId`**, **`userId`**, and **`status`** for filtering and joining by these attributes.
    - **Payment Table**: Index on **`bookingId`** to speed up queries joining bookings with payments.
    - **Review Table**: Indexes on **`userId`** and **`propertyId`** for faster filtering and aggregation.
    - **Message Table**: Indexes on **`senderId`** and **`receiverId`** for faster message retrieval based on users.
    
    ```sql
    -- Create indexes to improve performance
    CREATE INDEX idx_user_email ON User(email);
    CREATE INDEX idx_property_host ON Property(hostId);
    CREATE INDEX idx_property_location ON Property(location);
    CREATE INDEX idx_booking_property ON Booking(propertyId);
    CREATE INDEX idx_booking_user ON Booking(userId);
    CREATE INDEX idx_booking_status ON Booking(status);
    CREATE INDEX idx_payment_booking ON Payment(bookingId);
    CREATE INDEX idx_review_user ON Review(userId);
    CREATE INDEX idx_review_property ON Review(propertyId);
    CREATE INDEX idx_sender_message ON Message(senderId);
    CREATE INDEX idx_receiver_message ON Message(receiverId);
    
    ```
    
3. **Analyze Query Performance Using `EXPLAIN ANALYZE`**
    
    Use **`EXPLAIN ANALYZE`** to analyze the performance of a query that joins multiple tables (**`Booking`**, **`Property`**, **`User`**) based on the **`status`** of the booking. This helps identify the cost of executing the query and the execution plan used by the database.
    
    **Query 1:**
    
    ```sql
    
    EXPLAIN ANALYZE
    SELECT *
    FROM Booking b
    JOIN Property p ON b.property_id = p.property_id
    JOIN User u ON b.user_id = u.user_id
    WHERE b.status = 'confirmed';
    
    ```
    
    **Explanation**: This query retrieves bookings with a **`confirmed`** status, along with their related property and user details. The **`EXPLAIN ANALYZE`** statement will provide insights into how the database is executing the query and where improvements can be made.
    
    **Query 2:**
    
    ```sql
    
    EXPLAIN ANALYZE
    SELECT *
    FROM Booking b
    JOIN Property p ON b.property_id = p.property_id
    JOIN User u ON b.user_id = u.user_id
    WHERE b.status = 'confirmed';
    
    ```
    
    **Note**: The same query is run twice to measure performance before and after optimization. The results of **`EXPLAIN ANALYZE`** will show if the indexes have improved performance and reduced the cost of the execution.
    
4. **Refactor Queries Based on `EXPLAIN` Output**
    
    Based on the output of **`EXPLAIN ANALYZE`**, you can identify potential performance bottlenecks such as full table scans or inefficient joins. Refactor the queries by ensuring the appropriate indexes are used and unnecessary joins are avoided.
    

---

## **Result**

By applying these indexes, you should see improved query performance, particularly for complex joins and filtering conditions. The **`EXPLAIN ANALYZE`** output will help ensure that the database is using the indexes efficiently, reducing query execution time.

---

## **Future Steps**

- **Further Indexing**: Depending on future queries, consider adding more indexes for commonly filtered columns.
- **Continuous Monitoring**: Regularly monitor query performance and optimize queries as the database grows.
- **Use of Query Caching**: In high-traffic systems, consider caching the results of frequently run queries.

---

## **Conclusion**

This approach significantly enhances query performance by creating appropriate indexes and analyzing the query execution using **`EXPLAIN ANALYZE`**. Proper indexing is a critical part of database optimization, especially for applications like Airbnb that require fast, efficient querying.