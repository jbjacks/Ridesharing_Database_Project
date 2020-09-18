use cuber;

set SQL_SAFE_UPDATES = 0;

delete from emails;

delete from fufills;

delete from owns;

delete from payments;

delete from phone_nums;

delete from stops;

delete from trips;

delete from vehicle;

delete from customer;

delete from driver;

delete from person;

set SQL_SAFE_UPDATES = 1;