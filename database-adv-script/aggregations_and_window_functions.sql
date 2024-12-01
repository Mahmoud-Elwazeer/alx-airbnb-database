-- Objective: Use SQL aggregation and window functions to analyze data.


USE airbnb_db;

SELECT u.id, u.name, u.email, COUNT(b.id) AS total_bookings
FROM User u
LEFT JOIN 
    Booking b ON b.userId = u.id
GROUP BY u.id;

SELECT p.id, p.title, p.location,
    COUNT(b.id) As total_bookings,
    RANK() OVER (ORDER BY COUNT(b.id) DESC) As booking_rank,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.id) DESC) AS booking_row_number
FROM Property p 
LEFT JOIN Booking b ON p.id = b.propertyId
GROUP BY p.id
ORDER BY booking_rank;