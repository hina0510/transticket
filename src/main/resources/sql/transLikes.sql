CREATE TABLE transLikes
(
    n_id        VARCHAR2(20)    not NULL, 
    write_no    NUMBER          not NULL   
);

ALTER TABLE transLikes
    ADD CONSTRAINT FK_transLikes_id_genMember_id FOREIGN KEY (n_id)
        REFERENCES genMember (n_id) ON DELETE CASCADE ;

ALTER TABLE transLikes
    ADD CONSTRAINT transLikes_wNo_Board_wNo FOREIGN KEY (write_no)
        REFERENCES transBoard (write_no) ON DELETE CASCADE;