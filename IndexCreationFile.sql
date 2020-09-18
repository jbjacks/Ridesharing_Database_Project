USE cuber;

alter table person add index
person_id(id);

alter table vehicle add index
vehicle_id(car_id);

alter table trips add index
trip_for_trip(trip_id);

alter table payments add index
payment_id(transaction_num);
