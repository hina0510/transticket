CREATE TABLE genBoard
(
    write_no     NUMBER           NOT NULL, 
    category     VARCHAR2(20)     NOT NULL, 
    n_id           VARCHAR2(20)     NOT NULL, 
    title        VARCHAR2(20)     NOT NULL, 
    content      VARCHAR2(100)    NOT NULL, 
    savedate     DATE            default sysdate, 
    viewCount    NUMBER          DEFAULT 0 , 
    likes          NUMBER          DEFAULT 0 , 
    imageName1    VARCHAR2(255)      NULL,
    imageName2    VARCHAR2(255)      NULL,
    imageName3    VARCHAR2(255)      NULL,
    imageName4    VARCHAR2(255)      NULL,
    imageName5    VARCHAR2(255)      NULL,
    type      VARCHAR2(100)    NULL,
    keyword      VARCHAR2(100)   NULL,
     PRIMARY KEY (write_no)
);

ALTER TABLE genBoard
    ADD CONSTRAINT FK_genBoard_id_genMember_n_id FOREIGN KEY (n_id)
        REFERENCES genMember (n_id) ON DELETE CASCADE ;
        
CREATE SEQUENCE genBoard_seq INCREMENT BY 1 
MAXVALUE 9999999999999999999999999999 
MINVALUE 1 
CACHE 20;
