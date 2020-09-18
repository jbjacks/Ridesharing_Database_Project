USE cuber;

create table if not exists person
(
id	varchar(8) not null,
first_name varchar(20) not null,
last_name	varchar(20) not null,
card_num	varchar(20),
card_exp 	date,
address 	varchar(250),
primary key (id)
);

create table if not exists phone_nums
(
id varchar(8) not null,
phone_num	varchar(15),
primary key (id, phone_num),
foreign key (id) references person(id)on delete cascade
);

create table if not exists emails
(
id varchar(8) not null,
emails	varchar(50),
primary key (id, emails),
foreign key (id) references person(id) on delete cascade
);

create table if not exists driver
(
id varchar(8) not null primary key references person(id), 
license_num	varchar(7) not null,
license_state varchar(20) not null,
license_issued date,
license_exp date not null
);

create table if not exists customer
(
id varchar(8) not null primary key references person(id)
);

create table if not exists payments
(
d_id varchar(8) not null,
c_id varchar(8) not null,
transaction_num varchar(8) not null,
amount float, #not null(will eventually be derived,
date_paid timestamp not null,
primary key (d_id, c_id, transaction_num),
foreign key (d_id) references driver(id) on delete cascade,
foreign key (c_id) references customer(id) on delete cascade
);

create table if not exists trips
(
trip_id varchar(8) not null,
id varchar(8) not null,
primary key(trip_id, id),
foreign key (id) references customer(id) on delete cascade
);

create table if not exists stops
(
id varchar(8) not null,
trip_id varchar(8) not null,
time_of timestamp not null,
address varchar(250) not null,
primary key(trip_id, id, address),
foreign key(trip_id) references trips(trip_id) on delete cascade,
foreign key(id) references trips(id) on delete cascade
);

create table if not exists vehicle
(
car_id varchar(8) not null,
tag_num varchar(8) not null,
tag_state varchar(20),
make varchar(20) not null,
model varchar(50),
car_year year,
seats int not null,
luggage_cap varchar(20) check (luggage_cap in ('small', 'medium', 'large')),
availability bool not null,
address varchar(250),
primary key(car_id)
);

create table if not exists fufills
(
id varchar(8) not null,
trip_id varchar(8) not null,
car_id varchar(8) not null,
primary key(id, trip_id, car_id),
foreign key(car_id) references vehicle (car_id) on delete cascade,
foreign key(trip_id) references trips(trip_id) on delete cascade,
foreign key(id) references trips(id) on delete cascade
);

create table if not exists owns
(
d_id varchar(8) not null,
car_id varchar(8) not null,
primary key(d_id, car_id),
foreign key(d_id) references driver(id) on delete cascade,
foreign key(car_id) references vehicle(car_id) on delete cascade
);






