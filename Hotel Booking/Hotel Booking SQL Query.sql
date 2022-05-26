#DROP TABLE hotel_bookings_final;
CREATE TABLE hotel_bookings_final (
SELECT 
Hotel,
Agent,
Assigned_Room_Type,
Company,
case when Country="CN" then "CHN" else Country end as Country_Guest,
c.short_name as Country_Name_Short,
b.Latitude as Country_Latitude,
b.Longitude as Country_Longitude,
c.currency_unit as Country_Currency,
c.long_name as Country_Long_Name,
c.region as Country_Region,
c.Income_group as Country_Income_Group,
Customer_Type,
Deposit_Type,
Distribution_Channel,
Market_Segment,
Meal,
case when meal="BB" then "Bed & Breakfast"
when meal="HB" then "Breakfast and One Other"
when meal="FB" then "Breakfast, Lunch, Dinner"
when meal in ("SC", "Undefined") then "No Meal"
else "no meal" end as meal_adj,
Reservation_Status,
Reservation_Status_Date,
Reserved_Room_Type,
Arrival_Date_Day_Of_Month,
Arrival_Date_Week_Number,
Arrival_Date_Month,
case when arrival_date_month = "January" then 1
when arrival_date_month = "February" then 2
when arrival_date_month = "March" then 3
when arrival_date_month = "April" then 4
when arrival_date_month = "May" then 5
when arrival_date_month = "June" then 6
when arrival_date_month = "July" then 7
when arrival_date_month = "August" then 8
when arrival_date_month = "September" then 9
when arrival_date_month = "October" then 10
when arrival_date_month = "November" then 11
when arrival_date_month = "December" then 12
else null end as arrival_date_month_adj,
Arrival_Date_Year,
Stays_In_Weekend_Nights,
Stays_In_Week_Nights,
(stays_in_weekend_nights + stays_in_week_nights) as total_roomnights,
Lead_Time,
case when lead_time=0 then 0
when lead_time between 1 and 99 then "1-99"
when lead_time between 100 and 199 then "100-199"
when lead_time between 200 and 299 then "200-299"
when lead_time between 300 and 399 then "300-399"
when lead_time between 400 and 499 then "400-499"
when lead_time between 500 and 599 then "500-599"
when lead_time between 600 and 699 then "600-699"
when lead_time between 700 and 799 then "700-799"
else null end as lead_time_bins,
Days_In_Waiting_List,
Total_Of_Special_Requests,
ADR,
case when adr=0 then 0
when adr between .001 and 49.99 then "1-49"
when adr between 50 and 99.99 then "50-99"
when adr between 100 and 149.99 then "100-149"
when adr between 150 and 199.99 then "150-199"
when adr between 200 and 249.99 then "200-249"
when adr between 250 and 299.99 then "250-299"
when adr between 300 and 349.99 then "300-349"
when adr between 350 and 399.99 then "350-399"
when adr between 400 and 449.99 then "400-449"
when adr between 450 and 499.99 then "450-499"
when adr > 500 then "500+"
else null end as adr_adj,
Adults,
Children,
Babies,
(adults+children+babies) as total_people,
Is_Canceled,
Is_Repeated_Guest,
Booking_Changes,
Previous_Bookings_Not_Canceled,
Previous_Cancellations,
Required_Car_Parking_Spaces
FROM hotelbooking.hotel_bookings a
LEFT JOIN hotelbooking.countries b ON a.country=b.Three_Letter_Code
LEFT JOIN world_bank.wb_detailedstats c ON a.country=c.country_code
);
