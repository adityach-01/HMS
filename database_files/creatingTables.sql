CREATE DATABASE hms;
\c hms

-- Table 1
CREATE TABLE IF NOT EXISTS Users (
    user_id VARCHAR(10) NOT NULL ,
    name VARCHAR(100) NOT NULL,
    ph_number VARCHAR(12) NOT NULL,
    password VARCHAR(255) NOT NULL,
    type CHAR(3) NOT NULL,
    access_token VARCHAR(1000),
    access_token_expiry TIMESTAMP,
    address VARCHAR(255) NOT NULL,
    PRIMARY KEY (user_id)
);

-- Table 2
CREATE TABLE IF NOT EXISTS Doctors (
    doc_id VARCHAR(10) NOT NULL ,
    docType VARCHAR(20) NOT NULL,
    email VARCHAR(255) NOT NULL,
    user_id VARCHAR(10) NOT NULL,
    PRIMARY KEY (doc_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Table 3
CREATE TABLE IF NOT EXISTS Patients (
    patient_id VARCHAR(10) NOT NULL ,
    patient_name VARCHAR(100) NOT NULL,
    dob TIMESTAMP NOT NULL,
    email VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    conditions VARCHAR(255),
    gender VARCHAR(6),
    ph_number VARCHAR(12),
    PRIMARY KEY (patient_id)
);

-- Table 4
CREATE TABLE IF NOT EXISTS Room (
    room_no VARCHAR(5) NOT NULL,
    room_type VARCHAR(20) NOT NULL,
    PRIMARY KEY (room_no) 
);

-- Table 5
CREATE TABLE IF NOT EXISTS Test (
    test_id VARCHAR(10) NOT NULL,
    test_name VARCHAR(20) NOT NULL,
    PRIMARY KEY (test_id) 
);

-- Table 6
CREATE TABLE IF NOT EXISTS Admit (
    patient_id VARCHAR(10) NOT NULL,
    room_no VARCHAR(5) NOT NULL,
    admit_date TIMESTAMP NOT NULL,
    discharge_date TIMESTAMP,
    PRIMARY KEY (patient_id, admit_date),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (room_no) REFERENCES Room(room_no)
);

-- Table 7
CREATE TABLE IF NOT EXISTS doc_slots (
    doc_id VARCHAR(10) NOT NULL,
    doc_slot VARCHAR(100) NOT NULL,
    doc_date TIMESTAMP NOT NULL,
    PRIMARY KEY (doc_id, doc_date),
    FOREIGN KEY (doc_id) REFERENCES Doctors(doc_id)
);

-- Table 8
CREATE TABLE IF NOT EXISTS test_slots (
    test_id VARCHAR(10) NOT NULL,
    test_slot VARCHAR(100) NOT NULL,
    test_date TIMESTAMP NOT NULL,
    PRIMARY KEY (test_id, test_date),
    FOREIGN KEY (test_id) REFERENCES Test(test_id)
);

-- Table 9
CREATE TABLE IF NOT EXISTS doc_appointment (
    doc_appointment_id VARCHAR(10) NOT NULL,
    doc_id VARCHAR(10) NOT NULL,
    patient_id VARCHAR(10) NOT NULL,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    appointment_status CHAR(1),
    symptoms VARCHAR(255),
    treatment VARCHAR(255),
    PRIMARY KEY (doc_appointment_id),
    FOREIGN KEY (doc_id) REFERENCES Doctors(doc_id),
    FOREIGN KEY (patient_id) REFERENCES Pateints(patient_id)
);

-- Table 10
CREATE TABLE IF NOT EXISTS test_appointment (
    test_appointment_result_id VARCHAR(10) NOT NULL,
    test_id VARCHAR(10) NOT NULL,
    patient_id VARCHAR(10) NOT NULL,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    test_status CHAR(1),
    report_link VARCHAR(255),
    result TEXT,
    comment VARCHAR(255),
    PRIMARY KEY (test_appointment_result_id),
    FOREIGN KEY (test_id) REFERENCES Test(test_id),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- Table 11
CREATE TABLE IF NOT EXISTS ids (
    doc INT NOT NULL,
    dba INT NOT NULL,
    fdo INT NOT NULL,
    deo INT NOT NULL,
    PRIMARY KEY(doc, dba, fdo, deo)
);

-- Demo


-- new insertions
INSERT INTO Patients VALUES ('P1', 'Nirbhay', '2018-04-24 10:47', 'abc', 'gaya', 'bawasir');

-- new insertions
INSERT INTO Patients VALUES ('P2', 'Astitva', '2018-04-24 10:47', 'abc', 'purnia', 'fever');
INSERT INTO Users VALUES ('User2', 'Strange', '9112', 'strange', 'D', 'New york'); 


-- room insertions
INSERT INTO Room VALUES ('B100', 'ICU');
INSERT INTO Room VALUES ('B101', 'ICU');
INSERT INTO Room VALUES ('B102', 'ICU');
INSERT INTO Room VALUES ('B103', 'ICU');
INSERT INTO Room VALUES ('C101', 'CCU');
INSERT INTO Room VALUES ('C102', 'CCU');
INSERT INTO Room VALUES ('C103', 'CCU');
INSERT INTO Room VALUES ('C104', 'CCU');
INSERT INTO Room VALUES ('A200', 'OT');
INSERT INTO Room VALUES ('A201', 'OT');
INSERT INTO Room VALUES ('C201', 'General Ward');
INSERT INTO Room VALUES ('C202', 'General Ward');
INSERT INTO Room VALUES ('C203', 'General Ward');
INSERT INTO Room VALUES ('C204', 'General Ward');
INSERT INTO Room VALUES ('A301', 'AC Ward');
INSERT INTO Room VALUES ('A302', 'AC Ward');
INSERT INTO Room VALUES ('A303', 'AC Ward');
INSERT INTO Room VALUES ('A304', 'AC Ward');

-- patient insertions -- final
INSERT INTO Patients VALUES ('P5', 'Thor', '1934-03-04', 'abc', 'Asgard', 'Broken Bone');
INSERT INTO Patients VALUES ('P6', 'Iron Man', '1980-03-04', 'abc', 'New York', 'Lung puncture');
INSERT INTO Patients VALUES ('P7', 'Captain', '1928-03-04', 'abc', 'Germany', 'Broken Heart');
INSERT INTO Patients VALUES ('P8', 'Black Panther','2010-03-04', 'abc', 'Wakanda', 'Throat Pain');
INSERT INTO Patients VALUES ('P9', 'Black Widow', '1990-03-04', 'abc', 'Delhi', 'Accident');
INSERT INTO Users VALUES ('DOC5', 'Superman', '9112', 'abc', 'doc', 'Gotham'); 
INSERT INTO Doctors VALUES ('DOC5', 'OPD', 'adityachoudhary.01m@gmail.com','DOC5');
INSERT INTO doc_slots (doc_id, doc_slot, doc_date) VALUES ('DOC5', '10001200,13001400', '2023-03-12'); 
INSERT INTO doc_slots (doc_id, doc_slot, doc_date) VALUES ('DOC5', '10001200,13001400', '2023-03-19'); 
INSERT INTO doc_slots (doc_id, doc_slot, doc_date) VALUES ('DOC5', '10001200,13001400', '2023-03-26'); 
INSERT INTO doc_slots (doc_id, doc_slot, doc_date) VALUES ('DOC5', '10001200,13001400', '2023-04-03'); 
INSERT INTO doc_slots (doc_id, doc_slot, doc_date) VALUES ('DOC5', '10001200,13001400', '2023-04-10');
INSERT INTO doc_appointment VALUES ('DA3', 'DOC1', 'P4', '2023-03-05 10:00:00', '2023-03-5 10:15:00', '1', 'Fever', 'Calpol, Injection');
INSERT INTO doc_appointment VALUES ('DA4', 'DOC1', 'P3', '2023-03-05 10:15:00', '2023-03-05 10:30:00', '1', 'Fever', 'Cetrezine');
INSERT INTO doc_appointment VALUES ('DA5', 'DOC1', 'P3', '2023-03-05 10:30:00', '2023-03-05 10:45:00', '1', 'Fever', 'Paracetamol');
INSERT INTO doc_appointment VALUES ('DA6', 'DOC1', 'P6', '2023-03-13 10:15:00', '2023-03-13 10:30:00', '0', 'Diarrhea', '');
INSERT INTO doc_appointment VALUES ('DA7', 'DOC1', 'P7', '2023-03-15 14:00:00', '2023-03-15 14:15:00', '0', 'Stomach Ache', '');
INSERT INTO doc_appointment VALUES ('DA8', 'DOC2', 'P5', '2023-03-19 14:15:00', '2023-03-19 14:30:00', '0', 'Fever', '');
INSERT INTO doc_appointment VALUES ('DA9', 'DOC2', 'P5', '2023-03-19 14:30:00', '2023-03-19 14:45:00', '0', 'Fever', ' Cold water treatment');
INSERT INTO doc_appointment VALUES ('DA10', 'DOC2', 'P4', '2023-03-19 14:45:00', '2023-03-19 15:00:00', '0', 'Fever', '');
INSERT INTO doc_appointment VALUES ('DA11', 'DOC3', 'P6', '2023-03-06 15:00:00', '2023-03-06 15:15:00', '1', 'Fever', '');
INSERT INTO doc_appointment VALUES ('DA12', 'DOC3', 'P6', '2023-03-06 15:15:00', '2023-03-06 15:30:00', '1', 'Fever', 'Blood test, CBC, Medicine');
INSERT INTO doc_appointment VALUES ('DA13', 'DOC3', 'P2', '2023-03-06 15:30:00', '2023-03-06 15:45:00', '1', 'Fever', 'Medicine and rest');
INSERT INTO doc_appointment VALUES ('DA14', 'DOC3', 'P1', '2023-03-18 16:00:00', '2023-03-18 16:00:15', '0', 'Persisting Chest Pain', '');
INSERT INTO doc_appointment VALUES ('DA15', 'DOC3', 'P1', '2023-03-18 16:30:00', '2023-03-18 16:45:00', '0', 'Still Persisting Pain in the stomach', '');
INSERT INTO Admit VALUES ('P1', 'B100', '2018-04-24', '2018-04-30');
INSERT INTO Admit VALUES ('P1', 'B100', '2020-04-24', '2020-04-30');
INSERT INTO Admit VALUES ('P4', 'A200', '2023-03-1', NULL);
INSERT INTO Admit VALUES ('P2', 'A301', '2020-04-24', '2020-04-30');
INSERT INTO Admit VALUES ('P2', 'A201', '2022-03-1', NULL);
INSERT INTO Admit VALUES ('P3', 'C101', '2020-04-24', '2020-04-30');
INSERT INTO Admit VALUES ('P3', 'C101', '2023-03-1', NULL);
INSERT INTO Admit VALUES ('P5', 'B102', '2020-04-24', '2020-04-30');
INSERT INTO test_appointment VALUES ('TAR6', 'T1', 'P1', '2018-04-24 10:47','2018-04-24 10:53','1',NULL,NULL,NULL);
INSERT INTO test_appointment VALUES ('TAR1', 'T3', 'P3', '2018-04-24 10:47','2018-04-24 10:53','1',NULL,NULL,NULL);
INSERT INTO test_appointment VALUES ('TAR2', 'T4', 'P3', '2018-04-24 10:47','2018-04-24 10:53','1',NULL,NULL,NULL);
INSERT INTO test_appointment VALUES ('TAR3', 'T1', 'P5', '2018-04-24 10:47','2018-04-24 10:53','1',NULL,NULL,NULL);
INSERT INTO test_appointment VALUES ('TAR4', 'T5', 'P5', '2018-04-24 10:47','2018-04-24 10:53','1',NULL,NULL,NULL);
INSERT INTO test_appointment VALUES ('TAR5', 'T4', 'P6', '2018-04-24 10:47','2018-04-24 10:53','1',NULL,NULL, NULL);



-- Doctors insertion
INSERT INTO Users VALUES ('DOC2', 'Strange', '9112', 'abc', 'doc', 'New york'); 
INSERT INTO Doctors VALUES ('DOC2', 'OPD', 'adityachoudhary.01m@gmail.com','DOC2');
INSERT INTO Users VALUES ('DOC4', 'Hulk', '9112', 'abc', 'doc', 'Mumbai'); 
INSERT INTO Doctors VALUES ('DOC4', 'Heart Surgeon', 'adityachoudhary.01m@gmail.com','DOC4');
INSERT INTO Users VALUES ('DOC3', 'Batman', '9112', 'abc', 'doc', 'Gotham'); 
INSERT INTO Doctors VALUES ('DOC3', 'OPD', 'adityachoudhary.01m@gmail.com','DOC3');


-- fdo insertions
INSERT INTO Users VALUES ('F1235', 'Rishi', '9112', 'abc', 'fdo', 'Aurangabad'); 
INSERT INTO Users VALUES ('F1234', 'Vikas', '911234567890', 'asdfghjkl', 'fdo', 'Delhi');

-- deo insertions
INSERT INTO Users VALUES ('F1236', 'Yashraj', '9112', 'abc', 'deo', 'Mumbai'); 

-- admin
INSERT INTO Users VALUES ('F1237', 'Aditya', '9112', 'Hulk', 'dba', 'Mumbai'); 

-- Test insertions
INSERT INTO Test VALUES ('T1', 'X-Ray');
INSERT INTO Test VALUES ('T2', 'Blood Test');
INSERT INTO Test VALUES ('T3', 'CBC');
INSERT INTO Test VALUES ('T4', 'Dengue');
INSERT INTO Test VALUES ('T5', 'MRI');

-- appointment insertions



-- Admit Insertions



-- test_appointments insertions
-- problems while inserting




--- doc_slots

INSERT INTO doc_slots (doc_id, doc_slot, doc_date) VALUES ('DOC2', '10001200,14001600', '2023-03-05'); 
INSERT INTO doc_slots (doc_id, doc_slot, doc_date) VALUES ('DOC2', '10001200,14001600', '2023-03-07'); 
INSERT INTO doc_slots (doc_id, doc_slot, doc_date) VALUES ('DOC2', '10001200,14001600', '2023-03-09'); 
INSERT INTO doc_slots (doc_id, doc_slot, doc_date) VALUES ('DOC2', '10001200,14001600', '2023-03-11'); 
INSERT INTO doc_slots (doc_id, doc_slot, doc_date) VALUES ('DOC2', '10001200,14001600', '2023-03-13'); 
INSERT INTO doc_slots (doc_id, doc_slot, doc_date) VALUES ('DOC2', '10001200,14001600', '2023-03-15'); 
INSERT INTO doc_slots (doc_id, doc_slot, doc_date) VALUES ('DOC2', '10001200,14001600', '2023-03-17'); 
INSERT INTO doc_slots (doc_id, doc_slot, doc_date) VALUES ('DOC2', '10001200,14001600', '2023-03-19'); 
INSERT INTO doc_slots (doc_id, doc_slot, doc_date) VALUES ('DOC1', '10001200,13001400', '2023-03-05'); 
INSERT INTO doc_slots (doc_id, doc_slot, doc_date) VALUES ('DOC1', '10001200,13001400', '2023-03-12'); 
INSERT INTO doc_slots (doc_id, doc_slot, doc_date) VALUES ('DOC1', '10001200,13001400', '2023-03-19'); 
INSERT INTO doc_slots (doc_id, doc_slot, doc_date) VALUES ('DOC1', '10001200,13001400', '2023-03-26'); 
INSERT INTO doc_slots (doc_id, doc_slot, doc_date) VALUES ('DOC1', '10001200,13001400', '2023-04-03'); 
INSERT INTO doc_slots (doc_id, doc_slot, doc_date) VALUES ('DOC1', '10001200,13001400', '2023-04-10'); 
INSERT INTO doc_slots (doc_id, doc_slot, doc_date) VALUES ('DOC3', '15001900', '2023-03-06'); 
INSERT INTO doc_slots (doc_id, doc_slot, doc_date) VALUES ('DOC3', '15001900', '2023-03-20'); 
INSERT INTO doc_slots (doc_id, doc_slot, doc_date) VALUES ('DOC3', '15001900', '2023-04-04'); 
INSERT INTO doc_slots (doc_id, doc_slot, doc_date) VALUES ('DOC3', '15001900', '2023-04-18'); 
INSERT INTO doc_slots (doc_id, doc_slot, doc_date) VALUES ('DOC3', '15001900', '2023-05-02'); 
INSERT INTO doc_slots (doc_id, doc_slot, doc_date) VALUES ('DOC3', '15001900', '2023-05-16'); 
INSERT INTO doc_slots (doc_id, doc_slot, doc_date) VALUES ('DOC4', '09001200', '2023-03-06'); 
INSERT INTO doc_slots (doc_id, doc_slot, doc_date) VALUES ('DOC4', '09001200', '2023-03-10'); 
INSERT INTO doc_slots (doc_id, doc_slot, doc_date) VALUES ('DOC4', '09001200', '2023-03-14'); 
INSERT INTO doc_slots (doc_id, doc_slot, doc_date) VALUES ('DOC4', '09001200', '2023-03-18'); 
INSERT INTO doc_slots (doc_id, doc_slot, doc_date) VALUES ('DOC4', '09001200', '2023-03-22');
INSERT INTO doc_slots (doc_id, doc_slot, doc_date) VALUES ('DOC4', '09001200', '2023-03-26');
INSERT INTO doc_slots (doc_id, doc_slot, doc_date) VALUES ('DOC4', '09001200', '2023-03-30');   

--- test_slots

INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T2', '10001200,14001600', '2023-03-05'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T2', '10001200,14001600', '2023-03-07'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T2', '10001200,14001600', '2023-03-09'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T2', '10001200,14001600', '2023-03-11'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T2', '10001200,14001600', '2023-03-13'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T2', '10001200,14001600', '2023-03-15'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T2', '10001200,14001600', '2023-03-17'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T2', '10001200,14001600', '2023-03-19'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T1', '10001200,13001400', '2023-03-05'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T1', '10001200,13001400', '2023-03-12'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T1', '10001200,13001400', '2023-03-19'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T1', '10001200,13001400', '2023-03-26'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T1', '10001200,13001400', '2023-04-03'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T1', '10001200,13001400', '2023-04-10'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T3', '15001900', '2023-03-06'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T3', '15001900', '2023-03-20'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T3', '15001900', '2023-04-04'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T3', '15001900', '2023-04-18'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T3', '15001900', '2023-05-02'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T3', '15001900', '2023-05-16'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T4', '09001200', '2023-03-06'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T4', '09001200', '2023-03-10'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T4', '09001200', '2023-03-14'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T4', '09001200', '2023-03-18'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T4', '09001200', '2023-03-22');
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T4', '09001200', '2023-03-26');
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T4', '09001200', '2023-03-30'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T5', '09001800', '2023-03-05'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T5', '09001800', '2023-03-06'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T5', '09001800', '2023-03-07'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T5', '09001800', '2023-03-08'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T5', '09001800', '2023-03-09'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T5', '09001800', '2023-03-10'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T5', '09001800', '2023-03-11'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T5', '09001800', '2023-03-12'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T5', '09001800', '2023-03-13'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T5', '09001800', '2023-03-14'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T5', '09001800', '2023-03-15'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T5', '09001800', '2023-03-16'); 
INSERT INTO test_slots (test_id, test_slot, test_date) VALUES ('T5', '09001800', '2023-03-17');
