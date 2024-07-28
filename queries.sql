-- Find the guest who has made the most bookings.
 WITH GuestBooking AS (
	 SELECT g.guest_id ,
	 CONCAT(g.first_name , ' ',g.last_name) AS full_name,
	 COUNT(b.booking_id) AS booking_count
	 FROM Guests g
	 JOIN Bookings b
	 ON g.guest_id = b.guest_id
	 GROUP BY g.guest_id, g.first_name , g.last_name
 ),
 RankedGuests AS (
	SELECT guest_id ,
    full_name ,
    booking_count,
    DENSE_RANK() OVER(ORDER BY booking_count DESC ) rnk
    FROM GuestBooking 
)
SELECT guest_id , full_name , booking_count 
FROM RankedGuests
WHERE rnk =1;
    
-- List the guests who have bookings from 25-May to 1-June.
SELECT b.guest_id, 
CONCAT(g.first_name ,' ', g.last_name ) AS Guest_name
FROM Guests g
JOIN Bookings b 
ON g.guest_id = b.guest_id 
WHERE check_in_date BETWEEN '2024-05-25' AND '2024-06-01' ;

-- Find the total revenue generated from all bookings.

SELECT
    SUM(
		CASE 
			WHEN DATEDIFF(check_out_date, check_in_date) = 0  THEN 1
            ELSE DATEDIFF(check_out_date, check_in_date)
            END * amount
    ) AS total_revenue
FROM Bookings;

-- Find the average stay duration of guests.
WITH Stay AS (
	SELECT 
		CASE 
			WHEN DATEDIFF(check_out_date , check_in_date) = 0
            THEN 1 
            ELSE DATEDIFF(check_out_date , check_in_date)
		END AS stay_duration
	FROM 
		Bookings
)
SELECT 
	ROUND(AVG(stay_duration), 2) AS average_stay_duration
FROM 
	Stay;
    
-- Find the guest who booked/Get the same room multiple times.
SELECT CONCAT(g.first_name, ' ' , g.last_name) AS  full_name ,
b.guest_id , b.room_number,
COUNT(*) AS Booking_count
FROM Bookings b 
JOIN Guests g 
ON b.guest_id = g.guest_id
GROUP BY 
g.first_name , g.last_name , b.guest_id , b.room_number
HAVING COUNT(*) > 1;

-- List the top 2 guests by total amount spent.
SELECT G.first_name, G.last_name, SUM(B.amount) AS total_amount_spent
FROM Guests G
JOIN Bookings B ON G.guest_id = B.guest_id
GROUP BY G.guest_id, G.first_name, G.last_name
ORDER BY SUM(B.amount) DESC
LIMIT 2;

-- Find the average total amount spent by guests who stayed more than 3 days.
SELECT ROUND(AVG(total_amount_spent),2) AS average_amount_spent
FROM (
    SELECT G.guest_id, SUM(B.amount) AS total_amount_spent
    FROM Guests G
    JOIN Bookings B ON G.guest_id = B.guest_id
    WHERE DATEDIFF(B.check_out_date, B.check_in_date) > 3
    GROUP BY G.guest_id
) AS subquery;

-- List all guests along with their total stay duration and amount across all bookings.

SELECT G.guest_id,CONCAT(G.first_name, ' ',G.last_name) AS full_name, 
       SUM(DATEDIFF(B.check_out_date, B.check_in_date)) AS total_stay_duration,
       SUM(B.amount) AS total_amount_spent
FROM Guests G
JOIN Bookings B ON G.guest_id = B.guest_id
GROUP BY G.guest_id, full_name;

-- find the city from where the most guests have stayed.
SELECT G.city, COUNT(*) AS number_of_guests
FROM Guests G
JOIN Bookings B ON G.guest_id = B.guest_id
GROUP BY G.city
ORDER BY COUNT(*) DESC 
LIMIT 1;
