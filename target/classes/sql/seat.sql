CREATE TABLE seat
(
    s_title            VARCHAR2(100)     PRIMARY KEY,
    s_id               VARCHAR2(100)     NOT NULL,
    sr_id              VARCHAR2(100)     NOT NULL, 
    s_pwd              VARCHAR2(100)     NOT NULL,
    s_date             DATE              NOT NULL,
    s_place            VARCHAR2(100)     NOT NULL
);