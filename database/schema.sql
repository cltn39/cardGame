CREATE DATABASE IF NOT EXISTS cardgame_db;
USE cardgame_db;

DROP TABLE IF EXISTS user;

CREATE TABLE user (
    UserID int NOT NULL,
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
    ModifiedDate datetime NOT NULL DEFAULT(getdate()),
    PRIMARY KEY (UserID)
);

DROP TABLE IF EXISTS Memberships;

CREATE TABLE Memberships (
    UserID int NOT NULL,
    UserRoleID int NOT NULL,
    BeginDate  datetime NOT NULL DEFAULT(getdate()),
    EndDate  datetime NOT NULL DEFAULT(getdate()),
    CreatedByUserID int,
    CreatedDate  datetime NOT NULL DEFAULT(getdate()),
    PRIMARY KEY (UserRoleID, UserID)
);

DROP TABLE IF EXISTS UserRole;

CREATE TABLE UserRole (
    UserRoleID int NOT NUll Identity(1,1),
    UserRoleName nvarchar(50) NOT NULL,
    UserRoleNote nvarchar(250),
    Active bit NOT NULL DEFAULT((1)),
    CreatedByUserID int,
    CreatedDate datetime NOT NULL DEFAULT(getdate()),
    ModifiedByUserID int,
    ModifiedDate datetime NOT NULL DEFAULT(getdate()),
    PRIMARY KEY (UserRoleID)
    );

Drop TABLE IF EXISTS UserUserNamePrefix;

CREATE TABLE UserUserNamePrefix (
    UserID int NOT NULL,
    UserNamePrefixID int NOT NULL,
    CreatedByUserID int,
    CreatedDate datetime DEFAULT(getdate()),
    PRIMARY KEY (UserID, UserNamePrefixID) NOT NULL
);

Drop TABLE IF EXISTS UserNamePrefix;

CREATE TABLE UserNamePrefix (
    UserNamePrefixID int,
    UserNamePrefix nvarchar(50),
    UserNamePrefixNote nvarchar(250),
    Active BOOLEAN DEFAULT 1,
    CreatedByUserID int,
    CreatedDate datetime DEFAULT(getdate()) NOT NULL,
    ModifiedByUserID int,
    ModifiedDate datetime DEFAULT(getdate()) NOT NULL,
    PRIMARY KEY (UserNamePrefixID)
);

DROP TABLE IF EXISTS LoginAttempt;

CREATE TABLE LoginAttempt (
    LoginAttemptID int NOT NULL,
    AccountName nvarchar(50) NOT NULL,
    Password nvarchar(50),
    IPNumber nvarchar(50),
    BrowserType nvarchar(200),
    Success BOOLEAN DEFAULT 0 NOT NULL,
    CreatedDate datetime DEFAULT(getdate()) NOT NULL,
    PRIMARY KEY (LoginAttemptID)
);

DROP TABLE IF EXISTS UserGender;

CREATE TABLE UserGender (
    UserGenderID int NOT NULL,
    GenderName nvarchar(50) NOT NULL,
    CreatedByUserID int,
    CreatedDate datetime DEFAULT(getdate()) NOT NULL,
    ModifiedByUserID int,
    ModifiedDate datetime DEFAULT(getdate()) NOT NULL,
    PRIMARY KEY (UserGenderID)
);