-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-04-24 10:17:25.313

-- tables
-- Table: CLUBS
CREATE TABLE CLUBS (
    Club_Email varchar(40) NOT NULL,
    Club_Name varchar(30) NOT NULL,
    Club_Website varchar(40) NOT NULL,
    USER_ACCT_Name varchar(50) NOT NULL,
    USER_ACCT_Email varchar(20) NOT NULL,
    USER_ACCT_Userid int NOT NULL,
    CONSTRAINT CLUBS_pk PRIMARY KEY (Club_Name)
);

-- Table: ChatRoom
CREATE TABLE ChatRoom (
    Name varchar(10) NOT NULL,
    RoomName varchar(50) NOT NULL,
    Persons varchar(30) NOT NULL,
    Date date NOT NULL,
    USER_ACCT_Name varchar(50) NOT NULL,
    USER_ACCT_Email varchar(20) NOT NULL,
    USER_ACCT_Userid int NOT NULL,
    CONSTRAINT ChatRoom_pk PRIMARY KEY (Name)
);

-- Table: Events
CREATE TABLE Events (
    EventName varchar(60) NOT NULL,
    EventDesc varchar(100) NOT NULL,
    EventDate date NOT NULL,
    USER_ACCT_Name varchar(50) NOT NULL,
    USER_ACCT_Email varchar(20) NOT NULL,
    USER_ACCT_Userid int NOT NULL,
    CLUBS_Club_Name varchar(30) NOT NULL,
    CONSTRAINT Events_pk PRIMARY KEY (EventName)
);

-- Table: Resources
CREATE TABLE Resources (
    ID int NOT NULL,
    Projects int NOT NULL,
    Notes int NOT NULL,
    Assignments int NOT NULL,
    USER_ACCT_Name varchar(50) NOT NULL,
    USER_ACCT_Email varchar(20) NOT NULL,
    USER_ACCT_Userid int NOT NULL,
    CONSTRAINT Resources_pk PRIMARY KEY (ID)
);

-- Table: USER_ACCT
CREATE TABLE USER_ACCT (
    password varchar(15) NOT NULL,
    Email varchar(20) NOT NULL,
    Name varchar(50) NOT NULL,
    Userid int NOT NULL,
    CLUBS_Club_Name varchar(30) NOT NULL,
    Resources_ID int NOT NULL,
    Events_EventName varchar(60) NOT NULL,
    CONSTRAINT USER_ACCT_pk PRIMARY KEY (Name,Email,Userid)
);

-- foreign keys
-- Reference: CLUBS_USER_ACCT (table: CLUBS)
ALTER TABLE CLUBS ADD CONSTRAINT CLUBS_USER_ACCT FOREIGN KEY CLUBS_USER_ACCT (USER_ACCT_Name,USER_ACCT_Email,USER_ACCT_Userid)
    REFERENCES USER_ACCT (Name,Email,Userid);

-- Reference: ChatRoom_USER_ACCT (table: ChatRoom)
ALTER TABLE ChatRoom ADD CONSTRAINT ChatRoom_USER_ACCT FOREIGN KEY ChatRoom_USER_ACCT (USER_ACCT_Name,USER_ACCT_Email,USER_ACCT_Userid)
    REFERENCES USER_ACCT (Name,Email,Userid);

-- Reference: Events_CLUBS (table: Events)
ALTER TABLE Events ADD CONSTRAINT Events_CLUBS FOREIGN KEY Events_CLUBS (CLUBS_Club_Name)
    REFERENCES CLUBS (Club_Name);

-- Reference: Events_USER_ACCT (table: Events)
ALTER TABLE Events ADD CONSTRAINT Events_USER_ACCT FOREIGN KEY Events_USER_ACCT (USER_ACCT_Name,USER_ACCT_Email,USER_ACCT_Userid)
    REFERENCES USER_ACCT (Name,Email,Userid);

-- Reference: Resources_USER_ACCT (table: Resources)
ALTER TABLE Resources ADD CONSTRAINT Resources_USER_ACCT FOREIGN KEY Resources_USER_ACCT (USER_ACCT_Name,USER_ACCT_Email,USER_ACCT_Userid)
    REFERENCES USER_ACCT (Name,Email,Userid);

-- Reference: USER_ACCT_CLUBS (table: USER_ACCT)
ALTER TABLE USER_ACCT ADD CONSTRAINT USER_ACCT_CLUBS FOREIGN KEY USER_ACCT_CLUBS (CLUBS_Club_Name)
    REFERENCES CLUBS (Club_Name);

-- Reference: USER_ACCT_ChatRoom (table: USER_ACCT)
ALTER TABLE USER_ACCT ADD CONSTRAINT USER_ACCT_ChatRoom FOREIGN KEY USER_ACCT_ChatRoom ()
    REFERENCES ChatRoom ();

-- Reference: USER_ACCT_Events (table: USER_ACCT)
ALTER TABLE USER_ACCT ADD CONSTRAINT USER_ACCT_Events FOREIGN KEY USER_ACCT_Events (Events_EventName)
    REFERENCES Events (EventName);

-- Reference: USER_ACCT_Resources (table: USER_ACCT)
ALTER TABLE USER_ACCT ADD CONSTRAINT USER_ACCT_Resources FOREIGN KEY USER_ACCT_Resources (Resources_ID)
    REFERENCES Resources (ID);

-- End of file.

