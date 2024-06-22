-- Active: 1714435088107@@127.0.0.1@3306
CREATE DATABASE downloadsUser;
    DEFAULT CHARACTER SET = 'utf8mb4';
use downloadsUser;
CREATE TABLE product (
  IdProduct         INT            PRIMARY KEY ,
  NameProduct       VARCHAR(100)   NOT NULL           
);

CREATE TABLE user (
    userId         INT            PRIMARY KEY ,
    EmailAddress   VARCHAR(100)   NOT NULL,
    FirstName      VARCHAR(100)   NOT NULL,
    LastName       VARCHAR(100)   NOT NULL          
);
CREATE TABLE download (
  IdDownload   INT,
  FileName     VARCHAR(100)     NOT NULL,
  timeDownload DATETIME         NOT NULL,
  IdProduct INT,
  userId    INT,
  PRIMARY key (IdDownload, IdProduct, userId),
  FOREIGN KEY (IdProduct) REFERENCES product(IdProduct),     
  FOREIGN KEY (userId) REFERENCES user(userId)
);

