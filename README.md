Install
=======

Config
------

	cp config/database.rb.sample config/database.rb

edit config/database.rb to replace right values

Databaase
---------
Connect to DB and create table:

	CREATE TABLE status (id INT, data VARCHAR(30), node INT);

Test
====
Connect to DB and launch there SQL commands:
	
	mysql> insert into status(data, node) values(NOW(), 0);
	Query OK, 1 row affected (0.00 sec)
	
	mysql> select * from status;
	+------+---------------------+------+
	| id   | data                | node |
	+------+---------------------+------+
	| NULL | 2012-06-17 23:13:09 |    0 |
	+------+---------------------+------+
	1 row in set (0.00 sec)

Yepee ! It's working :)

Now you can connect to `http://<your-url>/status`
