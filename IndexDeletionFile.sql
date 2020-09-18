
USE cuber;

alter table person drop index
person_id;

alter table vehicle drop index
vehicle_id;

alter table trips drop index
trip_for_trip;

alter table payments drop index
payment_id;