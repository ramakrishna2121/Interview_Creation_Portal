create database interview_website;
use interview_website;
drop table interviewtimes;

CREATE TABLE Participants (
	Id int not null primary key,
    pname varchar(50),
    pass varchar(50)
);
INSERT INTO participants (id, pname,pass)
VALUES (1,"uday","1212");
INSERT INTO participants (id, pname,pass)
VALUES (2,"thanu","1515");
INSERT INTO participants (id, pname,pass)
VALUES (3,"manoj","1313");
select * from participants;
create table Interviewtimes (
	    
	Id int not null,
    pname varchar(50),
    dates varchar(50),
    starttime varchar(15),
    endtime varchar(15),
    Ino int,
	primary key(Ino)
);
select * from interviewtimes;
UPDATE interviewtimes SET starttime="17:33" WHERE ino=2;
select * from interviewtimes;

