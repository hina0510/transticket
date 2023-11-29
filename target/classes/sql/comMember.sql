CREATE TABLE comMember
(
    c_id       VARCHAR2(20)    NOT NULL, 
    c_pwd      VARCHAR2(300)    NOT NULL, 
    c_comname    VARCHAR2(20)    NOT NULL, 
    c_addr       VARCHAR2(300)    NOT NULL, 
    c_email      VARCHAR2(100)    NOT NULL, 
    c_sessionid VARCHAR2(100)    NULL,
     PRIMARY KEY (c_id)
);