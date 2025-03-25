Create database Ola;
use Ola;

#1. retrieve all successful bookings
create view successful_bookings as
select *from bookings
where booking_status='success';

#2. find avg ride distance for each type of vehicle
create view ride_distance_for_each_vehicle as
select vehicle_type,avg(ride_distance)
as avg_distance from bookings
group by vehicle_type;

#3. get total cancelled rides
create view cancelled_rides_by_customer as
select count(*) from bookings
where booking_status='canceled by customer';

#4. list top 5 customers acc. to rides
create view top_5_customer as
select customer_id,count(booking_id) as total_rides
from bookings
group by customer_id
order by total_rides desc limit 5;

#5. get no. of cancelled rides due to personal and car related issue
create view rides_cancelled_by_drivers_p_c_issues as
select count(*) from bookings
where cancelled_Rides_by_Driver ='personal & car related issue';

#6.find max & min ratings for prime sedan
create view max_min_Driver_rating as
select max(driver_ratings) as max_rating,
min(driver_ratings) as min_rating
from bookings where vehicle_type='prime sedan';

#7. retrieve upi payment rides
create view upi_payments as
select *from bookings
where payment_method='UPI';

#8.find avg. customer ratings
create view avg_cust_rating as
select vehicle_type,avg(customer_rating) as avg_customer_rating
from bookings
group by vehicle_type;

#9. calculate total booking successful rides
create view total_successful_ride_value as
select sum(booking_value) as total_successful_ride_value
from bookings
where booking_status='success';

#10. list all incomplete rides with reasons
create view incomplete_rides_reason as
select booking_id,incomplete_rides_reason
from bookings
where incomplete_rides='yes';

