--Find the top 2 customers who rent cars with driver(s) most frequently
SET SEARCH_PATH TO carschema;
drop table if exists q2 cascade;

--Table to save result from q1 query
create table q2(
customer_name VARCHAR(50),
email VARCHAR(50),
age INT,
num_of_shared_reservations INT
);


-- intermediate steps to get result
DROP VIEW IF EXISTS non_canceled CASCADE;
DROP VIEW IF EXISTS carpool CASCADE;
DROP VIEW IF EXISTS top_two CASCADE;


--get all the reservations that werent canceled
create view non_canceled as
  select *
  from reservation
  where status <> 'Cancelled';

--get counts for shared drives based on customer
create view carpool as
  select cr1.customer_email, COUNT(DISTINCT cr1.reservation_id) as shared_res --count a shared reservation only once, not per passenger
  from customerReservation as cr1 join customerReservation as cr2
      on cr1.customer_email <> cr2.customer_email --make sure its not same person
      and cr1.reservation_id = cr2.reservation_id
    join non_canceled
      on cr1.reservation_id = non_canceled.id --get non cancled out of thoose
  group by cr1.customer_email;


--top 2 customers
create view top_two as
  select name, email, age, shared_res
  from carpool join customer
      on customer_email = email
  ORDER BY shared_res desc,email
  LIMIT 2;

-- the answer to the query
insert into q2 select * from top_two;

--print out answer with
select * from q2;