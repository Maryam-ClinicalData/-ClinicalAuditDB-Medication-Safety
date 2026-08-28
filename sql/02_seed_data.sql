-- =====================================================
-- ClinicalAuditDB: Seed Data
-- Module: 02_seed_data.sql
-- Focus: Real-world Clinical Audit & Medication Safety
-- =====================================================

-- 1. Insert Departments
INSERT INTO Departments (DepartmentID, DepartmentName, LocationFloor) VALUES
(1, 'Cardiology', 3),
(2, 'Pediatrics', 2),
(3, 'Emergency', 1),
(4, 'Internal Medicine', 4),
(5, 'Intensive Care Unit (ICU)', 2);

-- 2. Insert Staff
INSERT INTO Staff (StaffID, FirstName, LastName, Role, DepartmentID) VALUES
(101, 'Sarah', 'Jenkins', 'Physician', 1),
(102, 'Michael', 'Chang', 'Physician', 2),
(103, 'Elena', 'Rostova', 'Physician', 3),
(104, 'David', 'Kim', 'Nurse', 1),
(105, 'Emma', 'Watson', 'Nurse', 2),
(106, 'Lucas', 'Muller', 'Nurse', 3),
(107, 'Anna', 'Kowalska', 'Nurse', 5);

-- 3. Insert Medications
INSERT INTO Medications (MedicationID, GenericName, BrandName, Route, HighRiskFlag) VALUES
(201, 'Heparin', 'Hep-Lock', 'IV', 1),
(202, 'Insulin Regular', 'Humulin R', 'Subcutaneous', 1),
(203, 'Amoxicillin', 'Amoxil', 'Oral', 0),
(204, 'Morphine Sulfate', 'Duramorph', 'IV', 1),
(205, 'Metformin', 'Glucophage', 'Oral', 0),
(206, 'Potassium Chloride', 'K-Tab', 'IV', 1);

-- 4. Insert Patients
INSERT INTO Patients (PatientID, FirstName, LastName, DateOfBirth, Gender, AdmissionDate) VALUES
(301, 'John', 'Doe', '1965-04-12', 'M', '2026-08-01 08:30:00'),
(302, 'Maria', 'Garcia', '1988-11-23', 'F', '2026-08-03 14:15:00'),
(303, 'Liam', 'Smith', '2018-06-05', 'M', '2026-08-05 10:00:00'),
(304, 'Fatima', 'Al-Mansoor', '1952-01-30', 'F', '2026-08-10 18:45:00'),
(305, 'Robert', 'Taylor', '1979-09-17', 'M', '2026-08-12 11:20:00');

-- 5. Insert Prescriptions
INSERT INTO Prescriptions (PrescriptionID, PatientID, StaffID, MedicationID, PrescribedDosage, Frequency, StartDate, EndDate) VALUES
(401, 301, 101, 201, '5000 units', 'Q8H', '2026-08-01 09:00:00', '2026-08-05 09:00:00'),
(402, 302, 101, 205, '500 mg', 'BID', '2026-08-03 15:00:00', '2026-08-10 15:00:00'),
(403, 303, 102, 203, '250 mg', 'TID', '2026-08-05 11:00:00', '2026-08-12 11:00:00'),
(404, 304, 103, 204, '2 mg', 'Q4H PRN', '2026-08-10 19:30:00', '2026-08-14 19:30:00'),
(405, 305, 103, 202, '10 units', 'AC Meals', '2026-08-12 12:00:00', '2026-08-18 12:00:00');

-- 6. Insert Administration Logs (Clinical Auditing Scenarios)
INSERT INTO Administration_Logs (LogID, PrescriptionID, AdministeredByStaffID, AdministeredTime, DoseGiven, Status, ErrorType, ErrorSeverity) VALUES
(501, 401, 104, '2026-08-01 09:15:00', '5000 units', 'Given', 'None', 'None'),
(502, 401, 104, '2026-08-01 17:00:00', '5000 units', 'Given', 'None', 'None'),
(503, 402, 104, '2026-08-03 15:30:00', '1000 mg', 'Given', 'Wrong Dosage', 'Moderate'),
(504, 403, 105, '2026-08-05 11:10:00', '250 mg', 'Given', 'None', 'None'),
(505, 404, 106, '2026-08-10 20:00:00', '4 mg', 'Given', 'Overdose', 'Critical'),
(506, 405, 107, '2026-08-12 12:45:00', '0 units', 'Omitted', 'Dose Omission', 'Minor'),
(507, 401, 104, '2026-08-02 01:10:00', '5000 units', 'Given', 'Wrong Timing', 'Minor');
