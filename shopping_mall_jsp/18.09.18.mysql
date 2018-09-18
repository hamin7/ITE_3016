Last login: Tue Sep 18 10:42:01 on ttys000
-bash: feff: No such file or directory
-bash: feff: No such file or directory
hamins-MacBook-Pro:~ hamin$ /usr/local/mysql/bin/mysqladmin -u root -p create basicjsp
Enter password:
hamins-MacBook-Pro:~ hamin$ /usr/local/mysql/bin/mysqladmin -u root -p create basicjsp
Enter password:
mysqladmin: CREATE DATABASE failed; error: 'Can't create database 'basicjsp'; database exists'
hamins-MacBook-Pro:~ hamin$ /usr/local/mysql/bin/mysql -u root -p
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 20
Server version: 5.7.19 MySQL Community Server (GPL)

Copyright (c) 2000, 2017, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> grant select, insert, update, delete, create, drop, alter on basicjsp
    -> .* to 'jspid'@'localhost'
    -> identified by 'jsppass';
Query OK, 0 rows affected, 1 warning (0.02 sec)

mysql> grant select, insert, update, delete, create, drop, alter
    -> on basicjsp.* to 'jspid'@'%'
    -> identified by 'jsppass';
Query OK, 0 rows affected, 1 warning (0.01 sec)

mysql> quit
Bye
hamins-MacBook-Pro:~ hamin$ /usr/local/mysql/bin/mysql -u jspid -p basicjsp
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 21
Server version: 5.7.19 MySQL Community Server (GPL)

Copyright (c) 2000, 2017, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| basicjsp           |
+--------------------+
2 rows in set (0.00 sec)

mysql> 
