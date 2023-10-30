CREATE TABLE musicalBoard
(
    writeNo            NUMBER(10)     PRIMARY KEY, 
    title              VARCHAR2(100)    NOT NULL, 
    type               VARCHAR2(50)     NOT NULL, 
    comname            VARCHAR2(50)     NOT NULL, 
    mu_date           DATE             NOT NULL, 
    mu_place          VARCHAR2(100)    NOT NULL, 
    content            VARCHAR2(300)    NOT NULL, 
    image_file_name    VARCHAR2(100)    NULL, 
    hit                NUMBER(10,0) default 0, 
    saveDate           DATE  default sysdate, 
    form               VARCHAR2(100)    NOT NULL
);