--Find the top 2 customers with the highest reservation cancellation ratio.
SET SEARCH_PATH TO carschema;
drop table if exists q1 cascade;

--Table to save result from q1 query
create table q1(
customer_name VARCHAR(50),
email VARCHAR(50),
age INT,
ratio REAL
);


-- intermediate steps to get result
DROP VIEW IF EXISTS cancellations CASCADE;
DROP VIEW IF EXISTS total_res CASCADE;
DROP VIEW IF EXISTS top_two CASCADE;


--count number of cancellations for each customer
create view cancellations as
  select customer_email, COUNT(status) as num_cancellations
  from customerReservation join reservation
      on reservation_id = reservation.id
  where status = 'Cancelled'
  group by customer_email;

--count number of non-cancellation reservations for each customer
create view total_res as
  select customer_email as total_email, COUNT(*) as num_total
  from customerReservation join reservation
      on reservation_id = reservation.id
  where status <> 'Cancelled'
  group by customer_email;

--top 2 customers with the highest reservation cancellation ratio.
create view top_two as
  select name, email, age, CAST(num_cancellations AS float)/CAST(num_total AS float) as ratio
  from cancellations join customer
      on customer_email = email
    join total_res
      on total_email = email
  ORDER BY ratio desc,email
  LIMIT 2;

-- the answer to the query
insert into q1 select * from top_two;

--print out answer with
select * from q1;