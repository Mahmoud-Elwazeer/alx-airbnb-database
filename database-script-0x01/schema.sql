
CREATE DATABASE IF NOT EXISTS airbnb_db;
USE airbnb_db;


--  User Table
CREATE TABLE IF NOT EXISTS User (
    id UUID PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'guest', 'host') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Profile Table
CREATE TABLE IF NOT EXISTS Profile (
    id UUID PRIMARY KEY,
    userId UUID NOT NULL,
    bio TEXT,
    image VARCHAR(255) DEFAULT 'default.png',
    phone VARCHAR(20),
    FOREIGN KEY (userId) REFERENCES User(id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Property (
    id UUID PRIMARY KEY,
    hostId UUID NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    images VARCHAR(255),
    max_guests INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (hostId) REFERENCES User(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Booking (
    id UUID PRIMARY KEY,
    propertyId UUID NOT NULL,
    userId UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (propertyId) REFERENCES Property(id) ON DELETE CASCADE,
    FOREIGN KEY (userId) REFERENCES User(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Payment (
    id UUID PRIMARY KEY,
    bookingId UUID UNIQUE NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('paypal', 'stripe') NOT NULL,
    status ENUM('pending', 'failed', 'success') NOT NULL,
    FOREIGN KEY (bookingId) REFERENCES Booking(id) ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS Review (
    id UUID PRIMARY KEY,
    propertyId UUID NOT NULL,
    userId UUID NOT NULL,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (propertyId) REFERENCES Property(id) ON DELETE CASCADE,
    FOREIGN KEY (userId) REFERENCES User(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Message (
    id UUID PRIMARY KEY,
    senderId UUID NOT NULL,
    receiverId UUID NOT NULL,
    message TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (senderId) REFERENCES User(id) ON DELETE CASCADE,
    FOREIGN KEY (receiverId) REFERENCES User(id) ON DELETE CASCADE
);

-- Create indexes on commonly queried columns for optimization
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_property_host ON Property(hostId);
CREATE INDEX idx_booking_property ON Booking(propertyId);
CREATE INDEX idx_booking_user ON Booking(userId);
CREATE INDEX idx_payment_booking ON Payment(bookingId);