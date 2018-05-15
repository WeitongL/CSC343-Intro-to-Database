--Find the top 2 customers who rent cars with driver(s) most frequently
SET SEARCH_PATH TO carschema;
drop table if exists q3 cascade;


--Table to save result from q1 query
create table q3(
car_name VARCHAR(50)
);


-- intermediate steps to get result
DROP VIEW IF EXISTS rental CASCADE;
DROP VIEW IF EXISTS countModel CASCADE;
DROP VIEW IF EXISTS theMost CASCADE;


--get all car rentals completed in 2017 in Toronto.
create view rental as
  select reservation.id as resId, cars.carmodel as modelId, carModel.name as modelName
  from reservation join cars on cars.id = car_id
  join stations on cars.location_code = stations.code
  join carModel on cars.carmodel = carModel.id
  where extract(year from start_date) = 2017
  and extract(year from end_date) = 2017
  and reservation.status = 'Completed'
  and city = 'Toronto';


--count unique car model from 2017 rental.
create view countModel as
  select modelId, count(modelName) as model_occurrence
  from rental
  group by modelId
  order by model_occurrence DESC
  limit 1;


--the most frequently rented car in 2017 in toronto.
create view theMost as
  select carModel.name as car_name
  from countModel join carModel on countModel.modelId = carModel.id;


-- the answer to the query
insert into q3 select car_name from theMost;

--print out answer with
select * from q3;
