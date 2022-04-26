CREATE TABLE chatroom(
Roomname varchar(50) NOT NULL,
Date  date NOT NULL,
Ipaddress varchar(50) NOT NULL
);

INSERT INTO chatroom(roomname,date,ipaddress)
VALUES 
(“College work”, "2022-03-09", ‘192.168.1.1’),
(“Exam time”, "2022-10-02", ‘192.168.2.3’),
(“Friends for life”, "2022-01-01", ‘192.168.1.2’);
 
