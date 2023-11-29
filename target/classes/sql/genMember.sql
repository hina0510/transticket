CREATE TABLE genMember
(
    n_id       VARCHAR2(20)    NOT NULL, 
    n_pwd      VARCHAR2(300)    NOT NULL, 
    n_name     VARCHAR2(20)    NOT NULL, 
    n_birth      VARCHAR2(20)  NOT NULL, 
    n_email    VARCHAR2(100)    NOT NULL, 
    n_addr     VARCHAR2(300)    NOT NULL, 
    n_tel      VARCHAR2(20)    NOT NULL, 
    n_sessionid VARCHAR2(100)  NULL,
     PRIMARY KEY (n_id)
);