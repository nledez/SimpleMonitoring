Install
=======

Config
------
cp config/database.rb.sample config/database.rb
edit config/database.rb to replace right values

Databaase
---------
Connect to DB and create table:
CREATE TABLE status (id INT, data VARCHAR(30));

Test
====
Connect to DB and launch there SQL commands:
insert into status(data) values(NOW());
select * from status;

mysql> select * from status;
+------+---------------------+
| id   | data                |
+------+---------------------+
| NULL | 2012-04-04 07:37:25 |
+------+---------------------+
1 row in set (0.00 sec)

Yepee ! It's working :)
