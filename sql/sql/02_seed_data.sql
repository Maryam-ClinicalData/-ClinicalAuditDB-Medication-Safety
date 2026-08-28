-- ============================================================================
-- ClinicalAuditDB: Comprehensive Seed Data (Medication Safety & Clinical Logs)
-- ============================================================================

-- 1. Insert Departments
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'ICU'),
(2, 'Emergency Department'),
(3, 'Cardiology'),
(4, 'Oncology'),
(5, 'General Surgery'),
(6, 'Pediatrics');

-- 2. Insert Staff (Physicians and Nursing Staff across shifts)
INSERT INTO Staff (StaffID, FullName, Role) VALUES
(101, 'Sara Ahmadi', 'ICU Nurse'),
(102, 'Ali Rezaei', 'Emergency Nurse'),
(103, 'Elena Rostami', 'Oncology Nurse'),
(104, 'Mohammad Karimi', 'Ward Nurse'),
(105, 'Fatemeh Nouri', 'Pediatric Nurse'),
(106, 'Reza Moradi', 'Clinical Pharmacist'),
(201, 'Dr. Arash Parsa', 'Attending Physician - ICU'),
(202, 'Dr. Mina Danesh', 'Cardiologist'),
(203, 'Dr. Kaveh Tehrani', 'Oncologist'),
(204, 'Dr. Leila Samadi', 'Pediatrician');

-- 3. Insert Medications (Standard and High-Alert Drugs)
INSERT INTO Medications (MedicationID, MedicationName, Unit) VALUES
(1, 'Insulin Regular', 'units'),
(2, 'Morphine Sulfate', 'mg'),
(3, 'Aspirin', 'mg'),
(4, 'Heparin Sodium', 'units'),
(5, 'Vancomycin IV', 'mg'),
(6, 'Norepinephrine', 'mcg/min'),
(7, 'Furosemide', 'mg'),
(8, 'Potassium Chloride', 'mEq'),
(9, 'Metoprolol', 'mg'),
(10, 'Ceftriaxone', 'g');

-- 4. Insert Patients (Demographics and Assigned Departments)
INSERT INTO Patients (PatientID, FullName, DateOfBirth, DepartmentID) VALUES
(1, 'John Doe', '1980-05-15', 1),
(2, 'Jane Smith', '1992-08-22', 2),
(3, 'Robert Johnson', '1958-12-01', 3),
(4, 'Emily Davis', '1974-03-19', 4),
(5, 'Michael Brown', '1965-11-04', 1),
(6, 'Sarah Wilson', '2015-06-30', 6),
(7, 'David Martinez', '1988-09-14', 5),
(8, 'Emma Taylor', '1949-01-25', 3),
(9, 'James Anderson', '2001-04-18', 2),
(10, 'Olivia Thomas', '1983-07-09', 4);

-- 5. Insert Prescriptions
INSERT INTO Prescriptions (PrescriptionID, PatientID, MedicationID, PrescribedDate) VALUES
(1, 1, 1, '2026-08-01'),   -- Patient 1: Insulin
(2, 1, 4, '2026-08-01'),   -- Patient 1: Heparin
(3, 2, 2, '2026-08-01'),   -- Patient 2: Morphine
(4, 2, 7, '2026-08-01'),   -- Patient 2: Furosemide
(5, 3, 3, '2026-08-02'),   -- Patient 3: Aspirin
(6, 3, 9, '2026-08-02'),   -- Patient 3: Metoprolol
(7, 4, 5, '2026-08-02'),   -- Patient 4: Vancomycin
(8, 5, 6, '2026-08-03'),   -- Patient 5: Norepinephrine
(9, 5, 8, '2026-08-03'),   -- Patient 5: Potassium Chloride
(10, 6, 10, '2026-08-03'), -- Patient 6: Ceftriaxone
(11, 7, 2, '2026-08-04'),  -- Patient 7: Morphine
(12, 8, 4, '2026-08-04'),  -- Patient 8: Heparin
(13, 9, 7, '2026-08-05'),  -- Patient 9: Furosemide
(14, 10, 5, '2026-08-05'); -- Patient 10: Vancomycin

-- 6. Insert Administration Logs (Includes Successful Events and Real-world Incident Types)
-- SuccessFlag: 1 = Administered as prescribed, 0 = Incident / Medication Error
INSERT INTO Administration_Logs (LogID, PrescriptionID, StaffID, AdministrationTime, SuccessFlag, ErrorDetails) VALUES
-- Day 1 Logs
(1, 1, 101, '2026-08-01 08:00:00', 1, NULL),
(2, 2, 101, '2026-08-01 08:30:00', 1, NULL),
(3, 3, 102, '2026-08-01 09:15:00', 0, 'Wrong Dosage - Overdose prevented'),
(4, 4, 102, '2026-08-01 10:00:00', 1, NULL),
(5, 1, 104, '2026-08-01 20:00:00', 1, NULL),

-- Day 2 Logs
(6, 5, 101, '2026-08-02 08:00:00', 1, NULL),
(7, 6, 101, '2026-08-02 08:30:00', 1, NULL),
(8, 7, 103, '2026-08-02 11:00:00', 0, 'Infusion Rate Error'),
(9, 3, 102, '2026-08-02 14:00:00', 0, 'Wrong Patient - Intercepted before admin'),
(10, 7, 103, '2026-08-02 18:00:00', 1, NULL),

-- Day 3 Logs
(11, 8, 101, '2026-08-03 06:00:00', 1, NULL),
(12, 9, 101, '2026-08-03 07:30:00', 0, 'High Risk IV Push Protocol Violation'),
(13, 10, 105, '2026-08-03 09:00:00', 1, NULL),
(14, 8, 104, '2026-08-03 14:00:00', 1, NULL),
(15, 9, 104, '2026-08-03 16:30:00', 1, NULL),

-- Day 4 Logs
(16, 11, 104, '2026-08-04 10:00:00', 1, NULL),
(17, 12, 101, '2026-08-04 12:00:00', 0, 'Delayed Administration (>60 min)'),
(18, 11, 102, '2026-08-04 18:00:00', 1, NULL),
(19, 12, 101, '2026-08-04 22:00:00', 1, NULL),

-- Day 5 Logs
(20, 13, 102, '2026-08-05 08:00:00', 1, NULL),
(21, 14, 103, '2026-08-05 09:30:00', 1, NULL),
(22, 13, 102, '2026-08-05 16:00:00', 0, 'Missed Dose Due to Diagnostic Scan'),
(23, 14, 103, '2026-08-05 21:00:00', 1, NULL);
