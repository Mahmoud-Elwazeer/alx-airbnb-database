

USE airbnb_db;


-- Create indexes on commonly queried columns for optimization
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_property_host ON Property(hostId);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_booking_property ON Booking(propertyId);
CREATE INDEX idx_booking_user ON Booking(userId);
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_payment_booking ON Payment(bookingId);


EXPLAIN ANALYZE SELECT * FROM Booking b
JOIN Property p ON b.property_id = p.property_id
JOIN User u ON b.user_id = u.user_id
WHERE b.status = 'confirmed';

EXPLAIN ANALYZE SELECT * FROM Booking b
JOIN Property p ON b.property_id = p.property_id
JOIN User u ON b.user_id = u.user_id
WHERE b.status = 'confirmed';