-- Schema for Car rental system
--Not able to implement the following: A customer can change a confirmed reservation (only once)
 -- because we cannot use CHECK subquery when createing table in psql.

 -- What constraints that could have been enforced were not enforced? Why not?
 -- I don't think it's necessary to enforece the car to be picked up and dropped off at one particular station only.
 -- In realiaty I know some companies like Zipcar do have this policy but it is really not convenient for customer.
 -- But others like Car2go just let you park wherever is legal and convinent. I think the later one would be more user-friendly.

drop schema if exists carschema cascade;
create schema carschema;
set search_path to carschema;

--relation for car model
CREATE TABLE carModel(
  id INT primary key,
  -- Model Number of car.
  model_num INT NOT NULL,
  --Model name
  name VARCHAR(50) NOT NULL,
  --type of car
  type VARCHAR(50) NOT NULL,
  --# of seats in car
  capacity INT NOT NULL,
  --make sure the same car info isnt repated
  UNIQUE (model_num, name, type)
);

--relation for stations
CREATE TABLE stations(
  id INT primary key,
  -- station code.
  code INT NOT NULL UNIQUE,
  --name of station
  name VARCHAR(50) NOT NULL,
  --stations location
  address VARCHAR(50) NOT NULL,
  --stations area code
  area_code VARCHAR(50),
  --city that station is in
  city VARCHAR(50)
);

--relation for cars
CREATE TABLE cars(
  id INT primary key,
  -- Model Number of car.
  carModel INT REFERENCES carModel(id),
  --License plate number
  plate VARCHAR(50) NOT NULL UNIQUE,
  --location of car given by station code
  location_code INT REFERENCES stations(code)
);

--relation for customers
CREATE TABLE customer(
  id INT primary key,
  -- customer's name
  name VARCHAR(100) NOT NULL,
  --customer's email
  email VARCHAR(50) NOT NULL UNIQUE,
  --customer's age. No age check since driving ages change from country to country
  age INT
);

--Types of reservation statuses
--"A reservation status can be confirmed (before journey), ongoing (during journey),
-- completed (after journey completion) or cancelled"
CREATE TYPE reservationStatus AS ENUM(
	'Confirmed', 'Ongoing','Completed','Cancelled');

--relation for reservations
CREATE TABLE reservation(
  id INT primary key,
  --rental start date
  start_date DATE NOT NULL,
  --rental end date
  end_date DATE NOT NULL,
  --A specific car.
  car_id INT REFERENCES cars(id),
  --Old reservation
  old_res INT REFERENCES reservation(id),
  --status
  status reservationStatus NOT NULL
);


--Relation linking a customer with a reservation
CREATE TABLE customerReservation(
  id INT primary key,
  --reservation
  reservation_id INT REFERENCES reservation(id),
  --customer
  customer_email VARCHAR(50) REFERENCES customer(email),
  --make sure the same car info isnt repated
  UNIQUE (reservation_id, customer_email)
);
