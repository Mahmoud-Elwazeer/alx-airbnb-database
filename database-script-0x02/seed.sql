
USE airbnb_db;


INSERT INTO User (id, name, email, password, role) VALUES
('111e4567-e89b-12d3-a456-426614174001', 'Mahmoud Elwazeer', 'alice@example.com', 'hash12345', 'host'),
('222e4567-e89b-12d3-a456-426614174002', 'Bob', 'bob@example.com', 'hash67890', 'guest'),
('333e4567-e89b-12d3-a456-426614174003', 'Charlie', 'charlie@example.com','hash67890', 'admin');

INSERT INTO Property (id, hostId, title, description, location, price, max_guests) VALUES
('aaa14567-e89b-12d3-a456-426614174004', '111e4567-e89b-12d3-a456-426614174001', 'Cozy Cabin', 'A small, cozy cabin in the woods.', 'Lakeview, Colorado', 150.00, 5),
('bbb24567-e89b-12d3-a456-426614174005', '111e4567-e89b-12d3-a456-426614174001', 'Beach House', 'A luxurious beach house with ocean views.', 'Malibu, California', 500.00, 2);

INSERT INTO Booking (id, propertyId, userId, start_date, end_date, total_price, status) VALUES
('ccc34567-e89b-12d3-a456-426614174006', 'aaa14567-e89b-12d3-a456-426614174004', '222e4567-e89b-12d3-a456-426614174002', '2024-12-01', '2024-12-05', 600.00, 'confirmed'),
('ddd44567-e89b-12d3-a456-426614174007', 'bbb24567-e89b-12d3-a456-426614174005', '222e4567-e89b-12d3-a456-426614174002', '2024-12-10', '2024-12-15', 2500.00, 'pending');


INSERT INTO Payment (id, bookingId, amount, payment_method) VALUES
('eee54567-e89b-12d3-a456-426614174008', 'ccc34567-e89b-12d3-a456-426614174006', 600.00, 'stripe'),
('fff64567-e89b-12d3-a456-426614174009', 'ddd44567-e89b-12d3-a456-426614174007', 2500.00, 'paypal');

