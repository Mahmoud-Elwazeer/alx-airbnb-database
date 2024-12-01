## Objective: Refactor complex queries to improve performance.

### Instructions:

* Write an initial query that retrieves all bookings along with the user details, property details, and payment details and save it on perfomance.sql

* Analyze the query’s performance using EXPLAIN and identify any inefficiencies.

* Refactor the query to reduce execution time, such as reducing unnecessary joins or using indexing.

## **Key Optimization Strategies**

- **Indexing**:
    - Added indexes on columns frequently used in **`JOIN`** and **`GROUP BY`** clauses:
        - **`Booking(status, start_date)`**
        - **`Booking(propertyId)`**
        - **`Booking(userId)`**
- **Refactoring**:
    - Improved the efficiency of joins and sorting by ensuring indexes are utilized.

---

## **Performance Gains**

- **Before Optimization**: The query might perform full table scans, causing slow response times for large datasets.
- **After Optimization**: Using indexes improves query execution time by allowing efficient data retrieval.