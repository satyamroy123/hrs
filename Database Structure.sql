CREATE TABLE user_details (
    first_name VARCHAR(20) NOT NULL,
    middle_name VARCHAR(20),
    last_name VARCHAR(20) NOT NULL,
    father_name VARCHAR(50) NOT NULL,
    username  VARCHAR(20) NOT NULL,
    Ppassword VARCHAR2(20) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender CHAR(1) NOT NULL,
    email VARCHAR2(30) NOT NULL,
    contact_no NUMBER(10) NOT NULL,
    aadhaar_no NUMBER(12),
    salary DECIMAL(8, 2),
    PRIMARY KEY(username)
);

CREATE TABLE account_info (
    username VARCHAR2(20) NOT NULL,
    password VARCHAR2(20) NOT NULL,
    account_type CHAR(1) NOT NULL,
    PRIMARY KEY(username)
);

CREATE TABLE FEEDBACK (
    name VARCHAR(50), 
    contact_no NUMBER(10), 
    email VARCHAR2(30), 
    message VARCHAR2(500),
    feedback_date date
);

INSERT INTO account_info VALUES('tnvr000@gmail.com', 'password', 'A');