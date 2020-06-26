CREATE DATABASE IF NOT EXISTS cardgame_db;
USE cardgame_db;

DROP TABLE IF EXISTS user;

CREATE TABLE user (
    UserID int NOT NULL Identity(1,1),
    SupervisorUserID VARCHAR(50),
    UserGenderID int NOT NULL DEFAULT((0)),
    AccountName nvarchar(50),
    CommonName nvarchar(100),
    GivenName nvarchar(100),
    MiddleName nvarchar(100),
    FamilyName nvarchar(100),
    FullName nvarchar(300),
    UserNote nvarchar(500),
    ExternalUser bit NOT NULL DEFAULT((0)),
    Photo varbinary,
    Address1 nvarchar(50),
    Address2 nvarchar(50),
    City nvarchar(50),
    Region nvarchar(50),
    Active bit NOT NULL DEFAULT((1)),
    CreatedByUserID int,
    CreatedDate datetime NOT NULL DEFAULT(getdate()),
    ModifiedByUserID int,
    ModifiedDate datetime NOT NULL DEFAULT(getdate())
    PRIMARY KEY (UserID)
)

DROP TABLE IF EXISTS UserUserRole;

CREATE TABLE UserUserRole (
    UserRoleID int NOT NULL,
    UserID int NOT NULL,
    BeginDate  datetime NOT NULL DEFAULT(getdate()),
    EndDate  datetime NOT NULL DEFAULT(getdate()),
    CreatedByUserID int,
    CreatedDate  datetime NOT NULL DEFAULT(getdate())
    PRIMARY KEY (UserRoleID, UserID)
)

DROP TABLE IF EXISTS UserRole;

CREATE TABLE UserRole (
    UserRoleID int NOT NUll Identity(1,1),
    UserRoleName nvarchar(50) NOT NULL,
    UserRoleNote nvarchar(250),
    Active bit NOT NULL DEFAULT((1)),
    CreatedByUserID int,
    CreatedDate datetime NOT NULL DEFAULT(getdate()),
    ModifiedByUserID int,
    ModifiedDate datetime NOT NULL DEFAULT(getdate())
    PRIMARY KEY (UserRoleID)