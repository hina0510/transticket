CREATE TABLE performBoard
(
    writeNo            NUMBER(10)       PRIMARY KEY, 
    title              VARCHAR2(100)    NOT NULL, 
    type               VARCHAR2(50)     NOT NULL, 
    comname            VARCHAR2(50)     NOT NULL, 
    pf_stDate          VARCHAR2(100)    NOT NULL, 
    pf_endDate         VARCHAR2(100)    NOT NULL,
    pf_place           VARCHAR2(100)    NOT NULL, 
    price              NUMBER(50)       NOT NULL,
    content            VARCHAR2(300)    NULL, 
    imageName1         VARCHAR2(255)    NULL,
    imageName2         VARCHAR2(255)    NULL,
    imageName3         VARCHAR2(255)    NULL,
    imageName4         VARCHAR2(255)    NULL,
    imageName5         VARCHAR2(255)    NULL,
    hit                NUMBER(10,0) default 0, 
    saveDate           DATE  default sysdate, 
    form               VARCHAR2(100)    NOT NULL
);
create sequence perform_board_seq;