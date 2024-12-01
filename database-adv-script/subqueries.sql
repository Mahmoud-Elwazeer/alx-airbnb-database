

USE airbnb_db;


SELECT p.*
FROM Property p
WHERE (
    SELECT AVG(r.rating)
    FROM Review r
    WHERE r.propertyId = p.id) > 4.0;

SELECT u.id, u.email, u.name
FROM User u
WHERE (
    SELECT COUNT(*)
    FROM Booking b
    WHERE b.userId = u.id ) > 3