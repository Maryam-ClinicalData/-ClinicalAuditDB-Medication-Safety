-- 1. Departments Table
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
);

-- 2. Staff Table
CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    role VARCHAR(50) -- e.g., 'Nurse', 'Doctor'
);

-- 3. Medications Table
CREATE TABLE Medications (
    med_id INT PRIMARY KEY,
    med_name VARCHAR(100) NOT NULL,
    dosage_unit VARCHAR(20) -- e.g., 'mg', 'ml'
);

-- 4. Patients Table
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dob DATE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- 5. Prescriptions Table
CREATE TABLE Prescriptions (
    prescription_id INT PRIMARY KEY,
    patient_id INT,
    med_id INT,
    start_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (med_id) REFERENCES Medications(med_id)
);

-- 6. Administration_Logs Table (The Audit Table)
CREATE TABLE Administration_Logs (
    log_id INT PRIMARY KEY,
    prescription_id INT,
    staff_id INT,
    admin_time TIMESTAMP,
    is_successful BOOLEAN, -- 1 for Success, 0 for Error
    error_type VARCHAR(50), -- e.g., 'Wrong Dosage', 'Wrong Patient'
    FOREIGN KEY (prescription_id) REFERENCES Prescriptions(prescription_id),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);
