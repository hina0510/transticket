CREATE TABLE payAccount
(
    account        VARCHAR2(20)    PRIMARY KEY, 
    name           VARCHAR2(20)    not NULL, 
    money          NUMBER          NULL
);

INSERT INTO payAccount VALUES('1234567891234', '111', 500000);
INSERT INTO payAccount VALUES('2345678912345', '222', 500000);