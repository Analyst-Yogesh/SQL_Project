SELECT * FROM booking.bookings_1;

CREATE view successful_bookings AS(
SELECT *
FROM bookings_1
WHERE Booking_Status="SUCCESS");

SELECT * FROM successful_bookings;


CREATE VIEW average_ride_distance AS 
(SELECT VEHICLE_TYPE,avg(Ride_Distance) AS average_ride_distance
FROM bookings_1
GROUP BY Vehicle_Type);
SELECT * FROM average_ride_distance;

CREATE VIEW cancelled_rides_by_customers AS (
SELECT  COUNT(*)
FROM bookings_1
WHERE Canceled_Rides_by_Customer IS NOT NULL);

SELECT * FROM cancelled_rides_by_customers;

create view 5_highest_number_of_rides as(
SELECT customer_id, count(Customer_ID) as highest_ride
from bookings_1
group by Customer_ID
order by count(Customer_ID) desc
limit 5);

select * from 5_highest_number_of_rides;

create view rides_cancelled_by_drivers_personal_and_car_related_issues as (
select count(*)
 from bookings_1
 where Canceled_Rides_by_Driver="Personal & Car related issue");

select * from rides_cancelled_by_drivers_personal_and_car_related_issues;
 
 create view Driver_Min_Max_Ratings as(
 select min(Driver_Ratings) as Min_Driver_Ratings,max(Driver_Ratings) as Max_Driver_Ratings
 from bookings_1
 where Vehicle_Type="Prime Sedan");
 
 select * from Driver_Min_Max_Ratings;
 
 create view Payment_Method_UPI as(
 select * 
 from bookings_1
 where Payment_Method="UPI");
 
 select * from Payment_Method_UPI;
 
 create view Average_Customer_Rating as(
 select Vehicle_Type,avg(Customer_Rating)as Average_Customer_Rating
 from bookings_1
 group by Vehicle_Type);
 
 select * from Average_Customer_Rating;
 
 create view Total_Booking_Values as(
 select sum(Booking_Value) as Total_Booking_Value
 from bookings_1
 where Booking_Status="Success");
 
 select * from Total_Booking_Values;
 
 create view Incomplete_Rides_With_Reason as(
 select Booking_ID,Incomplete_Rides_Reason 
 from bookings_1
 where Incomplete_Rides="Yes");
 
 select * from Incomplete_Rides_With_Reason;
