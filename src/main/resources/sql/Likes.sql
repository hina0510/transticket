CREATE TABLE Likes
(
    n_id        VARCHAR2(20)    not NULL, 
    write_no    NUMBER          not NULL   
);

ALTER TABLE Likes
    ADD CONSTRAINT FK_Likes_id_genMember_id FOREIGN KEY (n_id)
        REFERENCES genMember (n_id) ON DELETE CASCADE ;

ALTER TABLE Likes
    ADD CONSTRAINT Likes_writeNo_Board_writeNo FOREIGN KEY (write_no)
        REFERENCES performBoard (writeNo) ON DELETE CASCADE;