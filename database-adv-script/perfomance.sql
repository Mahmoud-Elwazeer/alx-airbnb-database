
USE airbnb_db;


-- Write the Initial Query
SELECT u.id, u.name, u.email,
    b.*,
    p.*,
    pay.*
FROM Booking b
JOIN User u ON b.userId = u.id
JOIN Property p ON b.propertyId = p.id
LEFT JOIN Payment pay ON b.id = pay.bookingId
GROUP BY b.start_date;

-- Performance Analysis
EXPLAIN ANALYZE SELECT u.id, u.name, u.email,
    b.*,
    p.*,
    pay.*
FROM Booking b
JOIN User u ON b.userId = u.id
JOIN Property p ON b.propertyId = p.id
LEFT JOIN Payment pay ON b.id = pay.bookingId
GROUP BY b.start_date;

-- Optimized Query with Indexing
-- Ensure these indexes exist before running the query
CREATE INDEX idx_booking_status_date ON Booking(status, start_date);
CREATE INDEX idx_booking_property ON Booking(propertyId);
CREATE INDEX idx_booking_user ON Booking(userId);

-- after optimize
SELECT u.id, u.name, u.email,
    b.*,
    p.*,
    pay.*
FROM Booking b
JOIN User u ON b.userId = u.id
JOIN Property p ON b.propertyId = p.id
LEFT JOIN Payment pay ON b.id = pay.bookingId
GROUP BY b.start_date;

-- Performance Analysis
EXPLAIN ANALYZE SELECT u.id, u.name, u.email,
    b.*,
    p.*,
    pay.*
FROM Booking b
JOIN User u ON b.userId = u.id
JOIN Property p ON b.propertyId = p.id
LEFT JOIN Payment pay ON b.id = pay.bookingId
GROUP BY b.start_date;
