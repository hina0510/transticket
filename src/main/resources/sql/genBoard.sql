CREATE TABLE genBoard
(
    write_no     NUMBER           NOT NULL, 
    category     VARCHAR2(20)     NOT NULL, 
    n_id           VARCHAR2(20)     NOT NULL, 
    title        VARCHAR2(20)     NOT NULL, 
    content      VARCHAR2(100)    NOT NULL, 
    savedate     DATE            default sysdate, 
    viewCount    NUMBER          DEFAULT 0 , 
    hit          NUMBER          DEFAULT 0 , 
    imageName1    VARCHAR2(255)      NULL,
    imageName2    VARCHAR2(255)      NULL,
    imageName3    VARCHAR2(255)      NULL,
    imageName4    VARCHAR2(255)      NULL,
    imageName5    VARCHAR2(255)      NULL,
     PRIMARY KEY (write_no)
);