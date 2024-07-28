-- Insert guest records

INSERT INTO Guests (first_name, last_name, email, phone_number, address, city) VALUES
('Varun', 'Kumar', 'varun.kumar@gmail.com', '9876543210', '123 MG Road', 'Bangalore'),
('Harsh', 'Sharma', 'harsh.sharma@gmail.com', '8765432109', '456 Park Street', 'Kolkata'),
('Sakshi', 'Mehta', 'sakshi.mehta@gmail.com', '7654321098', '789 Nehru Place', 'Delhi'),
('Pooja', 'Singh', 'pooja.singh@gmail.com', '6543210987', '101 Marine Drive', 'Mumbai'),
('Rahul', 'gupta', 'rahul.gupta@gmail.com', '5432109876', '202 Ring Road', 'Ahmedabad'),
('Binu', 'Nair', 'binu.nair@gmail.com', '4321098765', '303 MG Road', 'Bangalore'),
('Vikas', 'chauhan', 'vikas.chauhan@gmail.com', '3210987654', '404 Jubilee Hills', 'Mumbai'),
('Amit', 'Verma', 'amit.verma@gmail.com', '2109876543', '505 Civil Lines', 'Lucknow'),
('Kavita', 'Joshi', 'kavita.joshi@gmail.com', '1098765432', '606 Mall Road', 'Mumbai'),
('Neeraj', 'Chopra', 'neeraj.chopra@gmail.com', '1987654321', '707 Residency Road', 'Mumbai');

-- Insert Bookings records

INSERT INTO Bookings (guest_id, room_number, check_in_date, check_out_date, amount) VALUES
(1, 101, '2024-05-20', '2024-05-21', 900.00),
(2, 102, '2024-05-22', '2024-05-27', 900.00),
(2, 104, '2024-05-25', '2024-05-26', 900.00),
(3, 103, '2024-05-23', '2024-05-28', 1000.00),
(4, 104, '2024-05-24', '2024-05-24', 1000.00),
(5, 105, '2024-05-25', '2024-05-30', 1000.00),
(6, 106, '2024-05-26', '2024-05-26', 1000.00),
(7, 107, '2024-05-27', '2024-06-01', 1200.00),
(8, 108, '2024-05-28', '2024-06-02', 1200.00),
(9, 109, '2024-05-29', '2024-06-03', 1200.00),
(10, 110, '2024-05-30', '2024-06-04', 1200.00);