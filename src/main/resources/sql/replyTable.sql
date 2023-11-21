CREATE TABLE replyTable
(
    write_no    NUMBER          NOT NULL, 
    reply_no    NUMBER          NOT NULL,
    n_id        VARCHAR2(20)    NOT NULL, 
    saveDate    DATE            default sysdate, 
    content     VARCHAR2(100)    NOT NULL,
    c_id        varchar2(20)    not null,
    PRIMARY KEY (reply_no)
);

CREATE SEQUENCE replyTable_seq INCREMENT BY 1 
MAXVALUE 9999999999999999999999999999 
MINVALUE 1 
CACHE 20;

drop table replyTable;

ALTER TABLE replyTable
    ADD CONSTRAINT replyTable_wNo_Board_wNo FOREIGN KEY (write_no)
        REFERENCES genBoard (write_no) ON DELETE CASCADE;
        
ALTER TABLE replyTable
    ADD CONSTRAINT replyTable_nId_gmember_nId FOREIGN KEY (n_id)
        REFERENCES genMember (n_id) ON DELETE CASCADE;

ALTER TABLE replyTable
    ADD CONSTRAINT replyTable_cId_cmember_cId FOREIGN KEY (c_id)
        REFERENCES commember (c_id) ON DELETE CASCADE ;
        
select * from replyTable;