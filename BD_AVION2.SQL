Enter password: ******************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 75
Server version: 8.0.19 MySQL Community Server - GPL

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases ;
+--------------------+
| Database           |
+--------------------+
| bdvol              |
| centre_formation   |
| hollywood          |
| information_schema |
| isgi               |
| mysql              |
| newschema          |
| performance_schema |
| sakila             |
| sys                |
| test1              |
| test2              |
| test3              |
+--------------------+
13 rows in set (0.04 sec)

mysql> use bdvol ;
Database changed
mysql> show tables;
+-----------------+
| Tables_in_bdvol |
+-----------------+
| avion           |
| pilote          |
| vol             |
+-----------------+
3 rows in set (0.04 sec)

mysql> desc pilote ;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| ID_P   | int         | NO   | PRI | NULL    |       |
| nom_p  | varchar(40) | YES  |     | NULL    |       |
| adress | varchar(40) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
3 rows in set (0.05 sec)

mysql> insert into pilote values
    -> (1 , 'Alain Prost' , 'rue 444' ),
    -> (2 , 'Ayrton Senna' , 'rue 333' ),
    -> (3 , 'Lewis Hamilton' , 'rue 222' ),
    -> (4 , 'Max Verstap' , 'rue 111');
Query OK, 4 rows affected (0.08 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select * from avion;
+------+--------+----------+----------+
| ID_A | nom    | capacite | localite |
+------+--------+----------+----------+
|  100 | AIRBUS |      300 | RABAT    |
|  101 | B737   |      220 | CASA     |
|  102 | B737   |      220 | RABAT    |
+------+--------+----------+----------+
3 rows in set (0.00 sec)

mysql> desc  Vol;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| ID_V         | int         | NO   | PRI | NULL    |       |
| ID_A         | int         | YES  | MUL | NULL    |       |
| ID_P         | int         | YES  | MUL | NULL    |       |
| villeArrivee | varchar(20) | YES  |     | NULL    |       |
| villeDepart  | varchar(20) | YES  |     | NULL    |       |
| heureDepart  | varchar(5)  | YES  |     | NULL    |       |
| heureArrivee | varchar(5)  | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
7 rows in set (0.01 sec)

mysql> insert into Vol values
    -> (1 , 100 , 3 , 'PARIS' , 'RABAT' , '13h00' , '18h00'),
    -> (2 , 102 , 4 , 'CAIRU' , 'RABAT' , '14h00' , '18h00'),
    -> (3 , 101 , 1 , ' Vancouver' , 'CASA' , '18h00' , '01h00');
Query OK, 3 rows affected (0.12 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> update Vol
    -> ^C
mysql> ALTER Vol
    -> modify cilomn ID_V VARCHAR(5) ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Vol
modify cilomn ID_V VARCHAR(5)' at line 1
mysql> ALTER Vol
    -> modify column ID_V VARCHAR(5) ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Vol
modify column ID_V VARCHAR(5)' at line 1
mysql> ALTER table Vol
    -> modify column ID_V VARCHAR(5) ;
Query OK, 3 rows affected (1.56 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> update Vol
    -> set ID_V = IT100 WHERE ID_A = 100 ,
    -> set ID_V = IT103 WHERE ID_A = 102 ,
    -> set ID_V = IT104 WHERE ID_A = 101 ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ',
set ID_V = IT103 WHERE ID_A = 102 ,
set ID_V = IT104 WHERE ID_A = 101' at line 2
mysql> update Vol
    -> set ID_V = IT100 WHERE ID_A = 100 ;
ERROR 1054 (42S22): Unknown column 'IT100' in 'field list'
mysql> update Vol
    -> set ID_V = IT100 WHERE ID_A = 100 ;
ERROR 1054 (42S22): Unknown column 'IT100' in 'field list'
mysql> select * VOL;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'VOL' at line 1
mysql> select * Vol;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Vol' at line 1
mysql> select *from  Vol;
+------+------+------+--------------+-------------+-------------+--------------+
| ID_V | ID_A | ID_P | villeArrivee | villeDepart | heureDepart | heureArrivee |
+------+------+------+--------------+-------------+-------------+--------------+
| 1    |  100 |    3 | PARIS        | RABAT       | 13h00       | 18h00        |
| 2    |  102 |    4 | CAIRU        | RABAT       | 14h00       | 18h00        |
| 3    |  101 |    1 |  Vancouver   | CASA        | 18h00       | 01h00        |
+------+------+------+--------------+-------------+-------------+--------------+
3 rows in set (0.00 sec)

mysql> update Vol
    -> set ID_V = 'IT100' where ID_A = 100;
Query OK, 1 row affected (0.08 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update Vol
    -> set ID_V = 'IT103' where ID_A = 102;
Query OK, 1 row affected (0.10 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> update Vol
    -> set ID_V = 'IT104' where ID_A = 101;
Query OK, 1 row affected (0.08 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select *from  Vol;
+-------+------+------+--------------+-------------+-------------+--------------+
| ID_V  | ID_A | ID_P | villeArrivee | villeDepart | heureDepart | heureArrivee |
+-------+------+------+--------------+-------------+-------------+--------------+
| IT100 |  100 |    3 | PARIS        | RABAT       | 13h00       | 18h00        |
| IT103 |  102 |    4 | CAIRU        | RABAT       | 14h00       | 18h00        |
| IT104 |  101 |    1 |  Vancouver   | CASA        | 18h00       | 01h00        |
+-------+------+------+--------------+-------------+-------------+--------------+
3 rows in set (0.00 sec)

mysql> select * from pilote ;
+------+----------------+---------+
| ID_P | nom_p          | adress  |
+------+----------------+---------+
|    1 | Alain Prost    | rue 444 |
|    2 | Ayrton Senna   | rue 333 |
|    3 | Lewis Hamilton | rue 222 |
|    4 | Max Verstap    | rue 111 |
+------+----------------+---------+
4 rows in set (0.00 sec)

mysql> select nom_p
    -> from pilote
    -> where ID_P = (
    -> select ID_P from Vol);
ERROR 1242 (21000): Subquery returns more than 1 row
mysql> select nom_p
    -> from pilote
    -> where ID_P in (
    -> select ID_P from Vol);
+----------------+
| nom_p          |
+----------------+
| Alain Prost    |
| Lewis Hamilton |
| Max Verstap    |
+----------------+
3 rows in set (0.05 sec)

mysql> select nom_p
    -> from pilote
    -> where ID_P not in (
    -> select ID_P from Vol);
+--------------+
| nom_p        |
+--------------+
| Ayrton Senna |
+--------------+
1 row in set (0.06 sec)

mysql> select nom_p
    -> from pilote
    -> where ID_P  in (
    -> select ID_V
    -> from avion^C
mysql> select nom_p
    -> from pilote
    -> where ID_P  in (
    -> select ID_V
    -> from Vol
    -> where ID_A = (select ID_A FROM avion where nom ='AIRBUS')
    -> );
Empty set (0.00 sec)

mysql> select * from avion;
+------+--------+----------+----------+
| ID_A | nom    | capacite | localite |
+------+--------+----------+----------+
|  100 | AIRBUS |      300 | RABAT    |
|  101 | B737   |      220 | CASA     |
|  102 | B737   |      220 | RABAT    |
+------+--------+----------+----------+
3 rows in set (0.00 sec)

mysql> select * from Vol;
+-------+------+------+--------------+-------------+-------------+--------------+
| ID_V  | ID_A | ID_P | villeArrivee | villeDepart | heureDepart | heureArrivee |
+-------+------+------+--------------+-------------+-------------+--------------+
| IT100 |  100 |    3 | PARIS        | RABAT       | 13h00       | 18h00        |
| IT103 |  102 |    4 | CAIRU        | RABAT       | 14h00       | 18h00        |
| IT104 |  101 |    1 |  Vancouver   | CASA        | 18h00       | 01h00        |
+-------+------+------+--------------+-------------+-------------+--------------+
3 rows in set (0.00 sec)

mysql>exit;