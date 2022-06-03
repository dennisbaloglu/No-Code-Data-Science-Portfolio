SELECT a.*,
concat(arrival_date_year,"-",arrival_date_month_adj) as YearMonth
 FROM hotelbooking.hotel_bookings_final a;
 
select hotel,
sum(cast(adr as float)) as adr
FROM hotelbooking.hotel_bookings_final a
group by 1;