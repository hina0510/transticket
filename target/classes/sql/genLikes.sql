CREATE TABLE genLikes
(
    n_id        VARCHAR2(20)    not NULL, 
    write_no    NUMBER          not NULL   
);

ALTER TABLE genLikes
    ADD CONSTRAINT FK_genLikes_id_genMember_id FOREIGN KEY (n_id)
        REFERENCES genMember (n_id) ON DELETE CASCADE ;

ALTER TABLE genLikes
    ADD CONSTRAINT genLikes_writeNo_Board_writeNo FOREIGN KEY (write_no)
        REFERENCES genBoard (write_no) ON DELETE CASCADE;

