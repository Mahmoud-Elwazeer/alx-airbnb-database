USE airbnb_db;

-- Write a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.

SELECT b.id,
    b.*,
    u.id,
    u.name,
    u.email,
FROM Booking b
    INNER JOIN User u ON b.userId = u.id;

-- Write a query using aLEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.

SELECT p.*, r.*
FROM Property p
LEFT JOIN Review r ON p.id = r.propertyId;

-- Write a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.

SELECT u.id, u.name, u.email,
    b.*
FROM User u
FULL OUTER JOIN Booking b ON u.id = b.userId;