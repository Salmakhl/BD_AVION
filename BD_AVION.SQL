Enter password: ******************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 74
Server version: 8.0.19 MySQL Community Server - GPL

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> shows databases ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'shows databases' at line 1
mysql> show databases ;
+--------------------+
| Database           |
+--------------------+
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
| trammm             |
| trammmmm           |
+--------------------+
14 rows in set (0.13 sec)

mysql> drop trammm;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'trammm' at line 1
mysql> drop database trammm;
Query OK, 0 rows affected (0.27 sec)

mysql> drop database trammmmm;
Query OK, 0 rows affected (0.14 sec)

mysql> show databases ;
+--------------------+
| Database           |
+--------------------+
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
12 rows in set (0.00 sec)

mysql> create BDvol ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'BDvol' at line 1
mysql> create database BDvol :
    -> ^C
mysql> create database BDvol ;
Query OK, 1 row affected (0.07 sec)

mysql> use BDvol ;
Database changed
mysql> create table avion (
    -> ID_A int primary key ,
    -> nom varchar(20) ,
    -> capacite int ,
    -> localite varchar(20)
    -> );
Query OK, 0 rows affected (0.38 sec)

mysql> create table pilote (
    -> ID_P INT PRIMARY KEY ,
    -> nom_p varchar(40) ,
    -> adress varchar(40)
    -> );
Query OK, 0 rows affected (0.59 sec)

mysql> crate table Vol (
    -> ^C
mysql> create table Vol (
    -> ID_V INT PRIMARY KEY ,
    -> ID_A int ,
    -> ID_P INT  ,
    -> villeArrivee varchar(20) ,
    -> villeDepart varchar(20) ,
    -> heureDepart varchar(5)
    -> ,
    -> heureArrivee varchar(5)
    -> );
Query OK, 0 rows affected (0.34 sec)

mysql> alter table Vol
    -> add foreign key (ID_A) references avion(ID_A);
Query OK, 0 rows affected (1.13 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table Vol
    -> add foreign key (ID_P) references pilote(ID_P);
Query OK, 0 rows affected (1.24 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC AVION ;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| ID_A     | int         | NO   | PRI | NULL    |       |
| nom      | varchar(20) | YES  |     | NULL    |       |
| capacite | int         | YES  |     | NULL    |       |
| localite | varchar(20) | YES  |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
4 rows in set (0.08 sec)

mysql> show desc Vol ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'desc Vol' at line 1
mysql> show create table avion ;
+-------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table | Create Table                                                                                                                                                                                                                                    |
+-------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| avion | CREATE TABLE `avion` (
  `ID_A` int NOT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `capacite` int DEFAULT NULL,
  `localite` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_A`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> show create table Vol ;
+-------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table | Create Table                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
+-------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Vol   | CREATE TABLE `vol` (
  `ID_V` int NOT NULL,
  `ID_A` int DEFAULT NULL,
  `ID_P` int DEFAULT NULL,
  `villeArrivee` varchar(20) DEFAULT NULL,
  `villeDepart` varchar(20) DEFAULT NULL,
  `heureDepart` varchar(5) DEFAULT NULL,
  `heureArrivee` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`ID_V`),
  KEY `ID_A` (`ID_A`),
  KEY `ID_P` (`ID_P`),
  CONSTRAINT `vol_ibfk_1` FOREIGN KEY (`ID_A`) REFERENCES `avion` (`ID_A`),
  CONSTRAINT `vol_ibfk_2` FOREIGN KEY (`ID_P`) REFERENCES `pilote` (`ID_P`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+-------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> insert into avion values
    -> (100 , 'AIRBUS' , 300 ,'RABAT'),
    -> (101 , 'B737' , 250 ,'CASA'),
    -> (102 , 'B737' , 220 ,'RABAT');
Query OK, 3 rows affected (0.10 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SElect * from avion
    -> order by ID_A ;
+------+--------+----------+----------+
| ID_A | nom    | capacite | localite |
+------+--------+----------+----------+
|  100 | AIRBUS |      300 | RABAT    |
|  101 | B737   |      250 | CASA     |
|  102 | B737   |      220 | RABAT    |
+------+--------+----------+----------+
3 rows in set (0.05 sec)

mysql> SElect * from avion
    -> order by capacite ;
+------+--------+----------+----------+
| ID_A | nom    | capacite | localite |
+------+--------+----------+----------+
|  102 | B737   |      220 | RABAT    |
|  101 | B737   |      250 | CASA     |
|  100 | AIRBUS |      300 | RABAT    |
+------+--------+----------+----------+
3 rows in set (0.00 sec)

mysql> select nom , capacite from avion ;
+--------+----------+
| nom    | capacite |
+--------+----------+
| AIRBUS |      300 |
| B737   |      250 |
| B737   |      220 |
+--------+----------+
3 rows in set (0.00 sec)

mysql> select distinct localite
    -> from avion ;
+----------+
| localite |
+----------+
| RABAT    |
| CASA     |
+----------+
2 rows in set (0.00 sec)

mysql> select *  from avion
    -> where laoalit = 'RABAT' or localite ='CASA';
ERROR 1054 (42S22): Unknown column 'laoalit' in 'where clause'
mysql> select *  from avion
    -> where localite = 'RABAT' or localite ='CASA';
+------+--------+----------+----------+
| ID_A | nom    | capacite | localite |
+------+--------+----------+----------+
|  100 | AIRBUS |      300 | RABAT    |
|  101 | B737   |      250 | CASA     |
|  102 | B737   |      220 | RABAT    |
+------+--------+----------+----------+
3 rows in set (0.00 sec)

mysql> alter table avion
    -> update capacite=220 where ID_A=101.
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'update capacite=220 where ID_A=101.' at line 2
mysql> alter table avion
    -> update capacite=220 where ID_A=101;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'update capacite=220 where ID_A=101' at line 2
mysql> alter table avion
    -> update column capacite=220 where ID_A=101;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'update column capacite=220 where ID_A=101' at line 2
mysql> update avion
    -> set capacite = 220
    -> WHERE ID_A = 101;
Query OK, 1 row affected (0.06 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> delete from avion
    -> where capacite<200 ;
Query OK, 0 rows affected (0.02 sec)

mysql> select max(capacite) from avion ;
+---------------+
| max(capacite) |
+---------------+
|           300 |
+---------------+
1 row in set (0.05 sec)

mysql> select min(capacite) from avion ;
+---------------+
| min(capacite) |
+---------------+
|           220 |
+---------------+
1 row in set (0.00 sec)

mysql> select avg(capacite) from avion ;
+---------------+
| avg(capacite) |
+---------------+
|      246.6667 |
+---------------+
1 row in set (0.08 sec)

mysql> select *
    -> from avion
    -> where capacite = (
    -> select min(capacite) from avion ) ;
+------+------+----------+----------+
| ID_A | nom  | capacite | localite |
+------+------+----------+----------+
|  101 | B737 |      220 | CASA     |
|  102 | B737 |      220 | RABAT    |
+------+------+----------+----------+
2 rows in set (0.06 sec)

mysql> select *
    -> from avion
    -> where capacite>  ( select avg(capacite) from avion);
+------+--------+----------+----------+
| ID_A | nom    | capacite | localite |
+------+--------+----------+----------+
|  100 | AIRBUS |      300 | RABAT    |
+------+--------+----------+----------+
1 row in set (0.00 sec)

mysql>