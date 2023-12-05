CREATE TABLE transBoard
(
    write_no     NUMBER           NOT NULL, 
    category     VARCHAR2(20)     NOT NULL, 
    n_id           VARCHAR2(20)     NOT NULL, 
    title        VARCHAR2(100)     NOT NULL, 
    content      VARCHAR2(100)    NOT NULL, 
    savedate     DATE            default sysdate, 
    viewCount    NUMBER          DEFAULT 0 , 
    likes          NUMBER          DEFAULT 0 , 
    type      VARCHAR2(100)    NULL,
    keyword      VARCHAR2(100)   NULL,
     PRIMARY KEY (write_no)
);

ALTER TABLE transBoard
    ADD CONSTRAINT FK_transBoard_id_genMem_n_id FOREIGN KEY (n_id)
        REFERENCES genMember (n_id) ON DELETE CASCADE ;
        
CREATE SEQUENCE transBoard_seq INCREMENT BY 1 
MAXVALUE 9999999999999999999999999999 
MINVALUE 1 
CACHE 20;