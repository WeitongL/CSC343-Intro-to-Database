--Manually inserting data from text file into tables

--inserting customer
insert into customer values (1,'Sofia Jan','j.s@mail.com',24);
insert into customer values (2,'Atena Najm','a.n@mail.com',39);
insert into customer values (3,'Yu Chang','y.c@mail.com',42);
insert into customer values (4,'Ryan King','r.k@mail.com',52);
insert into customer values (5,'Thomas George','t.g@gmail.com',34);
insert into customer values (6,'Marie Smith','ma.smith@mail.com',22);
insert into customer values (7,'Jonah Swartz','jj.swtz@mail.com',28);
insert into customer values (8,'Terry Su','terry.su@mail.com',31);
insert into customer values (9,'David Chen','dchen@mail.com',45);
insert into customer values (10,'Cynthia Nguyen','cyngu@mail.com',27);
insert into customer values (11,'Malik Abdullah','malik_aa@mail.com',27);
insert into customer values (12,'John Parkinson','jparki@mail.com',33);
insert into customer values (13,'Stan Orlowski','orlows@mail.com',26);
insert into customer values (14,'Sanja Hilbert','s.hilbert@mail.com',23);
insert into customer values (15,'Ian Hsu','shenian@mail.com',41);


--inserting Car models
insert into carModel values (1,415,'BMW X5','SUV',5);
insert into carModel values (2,1848,'Mercedes E400','Luxury',4);
insert into carModel values (3,1521,'Chevrolet Spark','Economy',4);
insert into carModel values (4,2210,'Dodge Grand Caravan','Mini Van',7);
insert into carModel values (5,1121,'Chevrolet Suburban','SUV',8);
insert into carModel values (6,1631,'Toyota Inception','Sports',2);
insert into carModel values (7,1737,'Volvo V231','Economy',4);
insert into carModel values (8,1221,'Kia T21','Economy',4);


--inserting stations
insert into stations values (1,1001,'SuperCar College','333 College St','M5T1P7','Toronto');
insert into stations values (2,1002,'SuperCar Billy Bishop Airport','200 Spadina Ave','M5V1A1','Toronto');
insert into stations values (3,1003,'SuperCar York','220 Eglinton St','M6E2G8','Toronto');
insert into stations values (4,1004,'SuperCar East Toronto','200 Richmond St E','M5A2P2','Toronto');
insert into stations values (5,1005,'SuperCar Parliament','200 Wellington St','K1A0G9','Ottawa');
insert into stations values (6,1006,'SuperCar Ottawa Airport','216 Airport Rd','K1V9B4','Ottawa');
insert into stations values (7,1007,'SuperCar Central Station','895 Rue Mansfield','H3B4G1','Montreal');
insert into stations values (8,1008,'SuperCar North Montreal','2351 Rue Masson','H1Y1V8','Montreal');
insert into stations values (9,1009,'SuperCar West Montreal','7000 Avenue Van Horne','H3S2B2','Montreal');


--inserting cars
insert into cars values (101,1,'torc566',1001);
insert into cars values (102,8,'torc212',1001);
insert into cars values (103,7,'torc631',1001);
insert into cars values (104,4,'torc522',1001);
insert into cars values (105,2,'torbb10',1002);
insert into cars values (106,7,'torbb11',1002);
insert into cars values (107,8,'torbb12',1002);
insert into cars values (108,3,'tory011',1003);
insert into cars values (109,4,'tory016',1003);
insert into cars values (110,5,'tory017',1003);
insert into cars values (111,5,'tore101',1004);
insert into cars values (112,7,'tore102',1004);
insert into cars values (113,2,'ottp111',1005);
insert into cars values (114,7,'ottp112',1005);
insert into cars values (115,8,'ottp113',1005);
insert into cars values (116,1,'otta101',1006);
insert into cars values (117,7,'otta102',1006);
insert into cars values (118,6,'otta103',1006);
insert into cars values (119,3,'mocs300',1007);
insert into cars values (120,7,'mocs302',1007);
insert into cars values (121,7,'mocs303',1007);
insert into cars values (122,8,'mono201',1008);
insert into cars values (123,4,'mono202',1008);
insert into cars values (124,5,'mono203',1008);
insert into cars values (125,8,'mowe501',1009);
insert into cars values (126,8,'mowe502',1009);
insert into cars values (127,7,'mowe503',1009);
insert into cars values (128,1,'mowe504',1009);
--inserting reservations
insert into reservation values (22001,DATE '2017-09-01 09:00:00',DATE '2017-09-03 17:00:00', 101, NULL, 'Completed');
insert into reservation values (22002,DATE '2018-03-17 16:00:00',DATE '2018-03-25 16:00:00', 101, NULL, 'Cancelled');
insert into reservation values (22003,DATE '2018-03-19 10:00:00',DATE '2018-03-23 20:00:00', 101, NULL, 'Confirmed');
insert into reservation values (22004,DATE '2018-03-01 08:00:00',DATE '2018-03-10 20:00:00', 101, NULL, 'Ongoing');
insert into reservation values (22005,DATE '2017-12-15 13:30:00',DATE '2017-12-25 18:00:00', 101, NULL, 'Completed');
insert into reservation values (22006,DATE '2017-11-01 06:00:00',DATE '2017-11-04 12:00:00', 101, NULL, 'Completed');
insert into reservation values (22007,DATE '2018-02-23 10:00:00',DATE '2018-03-05 17:00:00', 102, NULL, 'Cancelled');
insert into reservation values (22008,DATE '2018-03-10 10:00:00',DATE '2018-03-16 20:00:00', 102, 22007, 'Confirmed');
insert into reservation values (22009,DATE '2018-02-25 09:00:00',DATE '2018-03-10 21:00:00', 103, NULL, 'Ongoing');
insert into reservation values (22010,DATE '2017-12-09 14:00:00',DATE '2017-12-11 17:00:00', 103, NULL, 'Completed');
insert into reservation values (22011,DATE '2018-02-01 08:00:00',DATE '2018-02-05 16:00:00', 104, NULL, 'Cancelled');
insert into reservation values (22012,DATE '2017-12-25 09:00:00',DATE '2018-01-05 19:00:00', 106, NULL, 'Completed');
insert into reservation values (22013,DATE '2018-04-23 09:00:00',DATE '2018-05-01 14:00:00', 106, NULL, 'Confirmed');
insert into reservation values (22014,DATE '2018-02-19 08:00:00',DATE '2018-02-23 20:00:00', 107, NULL, 'Cancelled');
insert into reservation values (22015,DATE '2018-02-21 08:00:00',DATE '2018-03-10 20:00:00', 107, NULL, 'Ongoing');
insert into reservation values (22016,DATE '2017-10-09 08:00:00',DATE '2017-10-09 21:00:00', 107, NULL, 'Completed');
insert into reservation values (22017,DATE '2018-06-03 07:00:00',DATE '2018-06-20 15:00:00', 107, NULL, 'Confirmed');
insert into reservation values (22018,DATE '2018-01-14 09:00:00',DATE '2018-01-20 14:00:00', 109, NULL, 'Cancelled');
insert into reservation values (22019,DATE '2018-02-01 09:00:00',DATE '2018-02-03 16:00:00', 111, NULL, 'Completed');
insert into reservation values (22020,DATE '2018-02-26 06:00:00',DATE '2018-03-07 12:00:00', 113, Null, 'Cancelled');
insert into reservation values (22021,DATE '2018-02-28 11:00:00',DATE '2018-03-08 23:00:00', 113, 22020, 'Ongoing');
insert into reservation values (22022,DATE '2017-07-02 09:00:00',DATE '2018-07-05 21:30:00', 113, Null, 'Completed');
insert into reservation values (22023,DATE '2018-02-05 08:00:00',DATE '2018-02-08 18:00:00', 114, Null, 'Completed');
insert into reservation values (22024,DATE '2018-04-02 16:00:00',DATE '2018-04-06 16:00:00', 116, Null, 'Confirmed');
insert into reservation values (22025,DATE '2018-03-03 07:00:00',DATE '2018-03-15 23:30:00', 116, Null, 'Ongoing');
insert into reservation values (22026,DATE '2018-01-01 07:00:00',DATE '2018-01-01 17:00:00', 118, Null, 'Completed');
insert into reservation values (22027,DATE '2018-04-04 09:00:00',DATE '2018-04-06 15:00:00', 119, Null, 'Cancelled');
insert into reservation values (22028,DATE '2018-02-14 13:00:00',DATE '2018-03-25 23:00:00', 119, Null, 'Ongoing');
insert into reservation values (22029,DATE '2017-09-26 08:00:00',DATE '2017-10-03 20:00:00', 119, Null, 'Completed');
insert into reservation values (22030,DATE '2018-03-26 10:00:00',DATE '2018-03-29 16:00:00', 123, Null, 'Confirmed');
insert into reservation values (22031,DATE '2017-12-21 06:00:00',DATE '2017-12-28 22:00:00', 124, Null, 'Completed');
insert into reservation values (22032,DATE '2017-09-22 16:00:00',DATE '2017-09-23 08:00:00', 126, Null, 'Cancelled');
insert into reservation values (22033,DATE '2017-09-23 14:00:00',DATE '2017-09-23 17:00:00', 126, 22032, 'Completed');
insert into reservation values (22034,DATE '2018-01-01 22:00:00',DATE '2018-04-05 14:00:00', 127, Null, 'Ongoing');
insert into reservation values (22035,DATE '2017-12-07 09:00:00',DATE '2017-12-13 12:00:00', 127, Null, 'Cancelled');
insert into reservation values (22036,DATE '2018-03-24 10:00:00',DATE '2018-04-02 21:00:00', 128, Null, 'Confirmed');
insert into reservation values (22037,DATE '2017-09-25 09:00:00',DATE '2017-09-27 20:00:00', 103, Null, 'Cancelled');
insert into reservation values (22038,DATE '2017-09-25 09:00:00',DATE '2017-09-27 20:00:00', 104, 22037, 'Completed');


--inserting customerReservation (connecting customers with a reservation)
insert into customerReservation values (1,22001,'j.s@mail.com');
insert into customerReservation values (2,22001,'terry.su@mail.com');
insert into customerReservation values (3,22002,'s.hilbert@mail.com');
insert into customerReservation values (4,22003,'s.hilbert@mail.com');
insert into customerReservation values (5,22004,'dchen@mail.com');
insert into customerReservation values (6,22005,'jj.swtz@mail.com');
insert into customerReservation values (7,22006,'r.k@mail.com');
insert into customerReservation values (8,22006,'cyngu@mail.com');
insert into customerReservation values (9,22007,'ma.smith@mail.com');
insert into customerReservation values (10,22007,'jparki@mail.com');
insert into customerReservation values (11,22008,'ma.smith@mail.com');
insert into customerReservation values (12,22008,'jparki@mail.com');
insert into customerReservation values (13,22009,'orlows@mail.com');
insert into customerReservation values (14,22010,'j.s@mail.com');
insert into customerReservation values (15,22011,'shenian@mail.com');
insert into customerReservation values (16,22016,'shenian@mail.com');
insert into customerReservation values (17,22017,'shenian@mail.com');
insert into customerReservation values (18, 22018,'orlows@mail.com');
insert into customerReservation values (19, 22019,'t.g@gmail.com');
insert into customerReservation values (20, 22020,'t.g@gmail.com');
insert into customerReservation values (21, 22021,'t.g@gmail.com');
insert into customerReservation values (22, 22022,'orlows@mail.com');
insert into customerReservation values (23, 22023,'s.hilbert@mail.com');
insert into customerReservation values (24, 22024,'s.hilbert@mail.com');
insert into customerReservation values (25, 22025,'y.c@mail.com');
insert into customerReservation values (26, 22026,'y.c@mail.com');
insert into customerReservation values (27, 22027,'y.c@mail.com');
insert into customerReservation values (28, 22028,'cyngu@mail.com');
insert into customerReservation values (29, 22029,'dchen@mail.com');
insert into customerReservation values (30, 22030,'shenian@mail.com');
insert into customerReservation values (31, 22030,'dchen@mail.com');
insert into customerReservation values (32, 22030,'y.c@mail.com');
insert into customerReservation values (33, 22031,'t.g@gmail.com');
insert into customerReservation values (34, 22032,'malik_aa@mail.com');
insert into customerReservation values (35, 22033,'malik_aa@mail.com');
insert into customerReservation values (36, 22033,'a.n@mail.com');
insert into customerReservation values (37, 22034,'terry.su@mail.com');
insert into customerReservation values (38, 22035,'jj.swtz@mail.com');
insert into customerReservation values (39, 22036,'cyngu@mail.com');
insert into customerReservation values (40, 22037,'s.hilbert@mail.com');
insert into customerReservation values (41, 22038,'s.hilbert@mail.com');
