#Query 1:
select first_name, last_name from person join driver on (person.id = driver.id);

#Query 2:
#use the address to calculate distances
#uses november as an example
select address from(
select address, time_of from stops where (stops.time_of < '2019-12-01 00:00:00') ) as months_before
where(months_before.time_of > '2019-10-31 23:59:59'); 

#Query 3:
#using this query you would get a list of all the drivers and their trips and then you could loop through for each driver and find the count
select id from(
select driver.id, time_of from(person join driver join fufills  join stops on (person.id = driver.id = fufills.id = stops.id)) where (stops.time_of < '2019-12-01 00:00:00')) as months_before
where(months_before.time_of > '2019-10-31 23:59:59');
