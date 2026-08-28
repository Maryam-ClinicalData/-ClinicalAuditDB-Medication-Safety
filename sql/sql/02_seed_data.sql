-- Insert Departments
INSERT INTO Departments VALUES (1, 'ICU'), (2, 'Emergency'), (3, 'Cardiology');

-- Insert Staff
INSERT INTO Staff VALUES (101, 'Sara Ahmadi', 'Nurse'), (102, 'Ali Rezaei', 'Nurse'), (103, 'Dr. Parsa', 'Doctor');

-- Insert Medications
INSERT INTO Medications VALUES (1, 'Insulin', 'units'), (2, 'Morphine', 'mg'), (3, 'Aspirin', 'mg');

-- Insert Patients
INSERT INTO Patients VALUES (1, 'John Doe', '1980-05-15', 1), (2, 'Jane Smith', '1992-08-22', 2), (3, 'Bob Johnson', '1975-12-01', 1);

-- Insert Prescriptions
INSERT INTO Prescriptions VALUES (1, 1, 1, '2026-08-01'), (2, 2, 2, '2026-08-01'), (3, 3, 3, '2026-08-02');

-- Insert Administration Logs (Includes some deliberate errors for analysis)
INSERT INTO Administration_Logs VALUES 
(1, 1, 101, '2026-08-01 08:00:00', 1, NULL),
(2, 2, 102, '2026-08-01 09:30:00', 0, 'Wrong Dosage'),
(3, 3, 101, '2026-08-02 10:00:00', 1, NULL),
(4, 1, 102, '2026-08-02 14:00:00', 0, 'Wrong Patient'),
(5, 2, 101, '2026-08-02 15:30:00', 1, NULL);
