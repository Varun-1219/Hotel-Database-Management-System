CREATE TABLE Guests (
guest_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100),
phone_number VARCHAR(15),
address VARCHAR(200),
city VARCHAR(50)
);

-- create table booking 
CREATE TABLE Bookings (
booking_id INT PRIMARY KEY AUTO_INCREMENT,
guest_id INT,
room_number INT,
check_in_date DATE,
check_out_date DATE,
amount DECIMAL(10,2),
FOREIGN KEY (guest_id) REFERENCES Guests(guest_id)
);