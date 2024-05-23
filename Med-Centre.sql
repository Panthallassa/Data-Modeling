
\c postgres

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE Doctors (
    doctor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(15), 
    last_name VARCHAR(15), 
    specialization VARCHAR(100), 
    employment_date DATE
);

CREATE TABLE Patients (
    patient_id SERIAL PRIMARY KEY, 
    first_name VARCHAR(15), 
    last_name VARCHAR(15), 
    date_of_birth DATE, 
    contact_information VARCHAR(100)
);

CREATE TABLE Visits (
    visit_id SERIAL PRIMARY KEY, 
    patient_id INT, 
    doctor_id INT, 
    visit_date DATE, 
    notes TEXT, 
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE Diseases (
    disease_id SERIAL PRIMARY KEY, 
    disease_name VARCHAR(50), 
    description TEXT
);

CREATE TABLE Diagnoses (
    diagnosis_id SERIAL PRIMARY KEY, 
    visit_id INT, 
    disease_id INT,
    diagnosis_date DATE, 
    FOREIGN KEY (visit_id) REFERENCES Visits(visit_id),
    FOREIGN KEY (disease_id) REFERENCES Diseases(disease_id)
);