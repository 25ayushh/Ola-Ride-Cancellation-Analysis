create database Ola;
use ola;

select * from bookings
limit 5;

-- 1. Retrieve all successful bookings:
Create view Successfull_Booking as
select * from bookings
where Booking_Status like"Success"
limit 5;

-- 2. Find the average ride distance for each vehicle type:
Create view Avg_ride_dist as
select Vehicle_Type,avg(ride_distance) from bookings
group by Vehicle_Type
 ;


-- 3. Get the total number of cancelled rides by customers:
Create view cancelled_rides as
select count(*) from bookings
where booking_status like"Canceled by Customer"
;


-- 4. List the top 5 customers who booked the highest number of rides:
Create view Highest_Number_Rides as
SELECT Customer_ID, COUNT(Booking_ID) as total_rides 
FROM bookings 
GROUP BY Customer_ID 
ORDER BY total_rides DESC 
LIMIT 5;



-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Create view Rides_can_by_Driver as
select * from bookings
Where booking_status like"Canceled by Driver" and canceled_rides_by_driver like"Personal & Car related issue"
limit 5

;



-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create view Min_max_rating as
select Vehicle_Type, min(driver_ratings)  ,min(Customer_Rating) ,max(driver_ratings),max(Customer_Rating)
from bookings 
where Vehicle_Type like"Prime Sedan"
group by Vehicle_Type
limit 5
;

#7. Retrieve all rides where payment was made using UPI:
Create view Payment_Method as
select * from bookings
where Payment_method like"UPI"
limit 5;

-- 8. Find the average customer rating per vehicle type:
Create view Avg_custd_Rating as
select Vehicle_type, avg(customer_rating) as Cust_ratings
from bookings
group by vehicle_type 
limit 5;



-- 9. Calculate the total booking value of rides completed successfully:
Create view Total_booking_rides_completed_Successfully as
select booking_status,sum(booking_value) as Booking_value
from bookings
where booking_status like"Success"
group by booking_status
;


-- 10. List all incomplete rides along with the reason:
Create view Incomplete_rides_Reasons as
select Date,Customer_ID,Incomplete_Rides_Reason
from bookings
where Incomplete_Rides like"Yes"
;




select * from Successfull_Booking; #1
select * from Avg_ride_dist;#2
select * from cancelled_rides;#3
select * from Highest_Number_Rides;#4
select * from Rides_can_by_Driver;#5
select * from Min_max_rating;#6
select * from Avg_custd_Rating;#8
select * from Payment_Method;#7
select * from Total_booking_rides_completed_Successfully;#9
select * from Incomplete_rides_Reasons;#10