--Find the top 2 customers who rent cars with driver(s) most frequently
SET SEARCH_PATH TO carschema;
drop table if exists q4 cascade;


--Table to save result from q1 query
create table q4(
customer_Ids VARCHAR(50)
);


-- intermediate steps to get result
DROP VIEW IF EXISTS reservation_18months CASCADE;
DROP VIEW IF EXISTS youngDriver CASCADE;
DROP VIEW IF EXISTS changed CASCADE;
DROP VIEW IF EXISTS changedTwice CASCADE;


--get all reservation in last 18 months.
create view reservation_18months as
  select reservation.id as resId, start_date,customer_email as curr_email, old_res
  from reservation join customerReservation on reservation_id = reservation.id
  join customer on customer.email = customer_email
  where start_date + INTERVAL '18 MONTH' >= CURRENT_DATE;

--get all user and their reservation who are under 30 in last 18 months.
create view youngDriver as
  select customer.id as userId, resId, email, old_res
  from customer
  join reservation_18months on customer.email = reservation_18months.curr_email
  where customer.age < 30;

--get all user who are under 30 and changed their reservation in last 18 months.
create view changed as
  select userId
  from youngDriver
  where old_res is not NULL;

--get all user who are under 30 and changed at least twice in last 18 months.
create view changedTwice as
  select userId as customer_Ids
  from
  (select userId
    from changed
    group by userId
    having count(*)>=2
  ) counts;

-- the answer to the query
insert into q4 select * from changedTwice;

--print out answer with
select * from q4;
