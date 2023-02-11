/* Creating a demo database for a typical Nigerian school of health offering National Diploma, ND and Higher National Diploma, HND
Certificates in the
following health education fields;
- Community Health Extension Worker (CHEW) - ND & HND
- Health Infromation Management (HIM) - ND & HND
- Medical Laboratory Tech (MLT) - ND & HND
- Pharmacy Health Tech (PHT) - ND & HND
- Public Health (PH) - ND & HND
;*/

create database "School of Health";

/*Creating the respective tables for the database, which would include the respective tables for students, employees, academic departments, 
operational departments. Starting with tables for the students.*/

-- creating table for students infromation.
create table "Students Bio"
(
"Student ID" varchar(8) NOT NULL primary key,
"Matriculation Number" varchar(10) NOT NULL unique,
"First Name" varchar(100) NOT NULL,
"Surname" varchar(100) NOT NULL,
"Other Name" varchar(100) NOT NULL,
"Date of Birth" date NOT NULL check("Date of Birth" >= '2010-07-01') /*This ensures that students are over the age of 16.;*/,
Gender varchar(1) NOT NULL check(Gender in ('M','F')),
"Marital Status" varchar(10) NOT NULL check("Marital Status" in ('married', 'single', 'divorced', 'seperated')),
Nationality varchar(100) NOT NULL,
"State of Origin" varchar(100) NOT NULL,
"Local Government Area" varchar(100) NOT NULL,
"Residential Address" varchar(255) NOT NULL,
Phone int NOT NULL unique,
"Alternative Phone" int NULL unique,
Email varchar(100) NOT NULL unique,
Department varchar(50) NOT NULL check(Department in ('Community Health Extension Worker', 'Health Infromation Management',
'Medical Laboratory Tech', 'Pharmacy Health Tech', 'Public Health')),
"Department ID" varchar(3) NOT NULL check("Department ID" in ('CHW', 'HIM', 'MLT', 'PHT', 'PH')),
"Certificate" varchar(3) NOT NULL check("Certificate" in ('ND', 'HND')),
"Level" varchar(6) NOT NULL check("Level" in ('Part-1', 'Part-2')),
"Mode of Entry" varchar(4) check("Mode of Entry" in ('SSCE', 'DE', 'ND')),
"Study Mode" varchar(9) NOT NULL check("Study Mode" in ('Full-Time', 'Part-Time'))
);

-- Creating table for entrance certificate for each students.
create table "Students SSCE"
(
"Student ID" varchar(8) NOT NULL foreign key references "Students Bio"("Student ID"),
"Examination Title" varchar(100) NOT NULL,
"Examination Year" date NOT NULL check("Examination Year" >= '2013-01-01') /*This ensures the entrance certificate is not older than 10 years.;*/,
"Student Exam No" varchar(30) primary key,
"Mathematics Grade" varchar(2) NOT NULL check("Mathematics Grade" in ('A1', 'B2', 'B3', 'C4', 'C5', 'C6', 'D7', 'E8', 'F9')),
"English Grade" varchar(2) NOT NULL check("English Grade" in ('A1', 'B2', 'B3', 'C4', 'C5', 'C6', 'D7', 'E8', 'F9')),
"Biology Grade" varchar(2) NOT NULL check("Biology Grade" in ('A1', 'B2', 'B3', 'C4', 'C5', 'C6', 'D7', 'E8', 'F9')),
"Chemistry Grade" varchar(2) NOT NULL check("Chemistry Grade" in ('A1', 'B2', 'B3', 'C4', 'C5', 'C6', 'D7', 'E8', 'F9')),
"Physics Grade" varchar(2) NOT NULL check("Physics Grade" in ('A1', 'B2', 'B3', 'C4', 'C5', 'C6', 'D7', 'E8', 'F9')),
);

-- Creating table to carry the respective contact information for each student, i.e their respective sponsor/guardian.
create table "Students Contact"
(
"Student ID" varchar(8) NOT NULL foreign key references "Students Bio"("Student ID"),
"Designation" varchar(10) NOT NULL,
"First Name" varchar(100) NOT NULL,
"Surname" varchar(100) NOT NULL,
"Other Name" varchar(100) NOT NULL,
Occupation varchar(100) NOT NULL,
Nationality varchar(100) NOT NULL,
"State of Origin" varchar(100) NOT NULL,
"Local Government Area" varchar(100) NOT NULL,
Phone int NOT NULL,
"Alternative Phone" int NULL,
Email varchar(100) NOT NULL,
"Residential Address" varchar(255) NOT NULL,
);

-- Students medical details.
create table "Students Medicals"
(
"Student ID" varchar(8) NOT NULL foreign key references "Students Bio"("Student ID"),
"Blood Group" varchar(2) NOT NULL,
Genotype varchar(2) NOT NULL,
"Underlying Sickness" varchar(255) NOT NULL,
Disability varchar(255) NOT NULL,
);

-- Creating table for Employees information.
create table "Employee Bio"
(
"Employee ID" varchar(8) NOT NULL primary key,
Designation varchar(100) NOT NULL,
"First Name" varchar(100) NOT NULL,
"Surname" varchar(100) NOT NULL,
"Other Name" varchar(100) NOT NULL,
"Qualification" varchar(100) NOT NULL,
"Appointment Title" varchar(100) NOT NULL,
"Appointment Type" varchar(100) NOT NULL,
Department varchar(50) NOT NULL,
"Department ID" varchar(3) NOT NULL,
Gender varchar(1) NOT NULL check(Gender in ('M','F')) /*This check ensures that the gender takes either male or female values.;*/,
"Date of Birth" date NOT NULL,
"Marital Status" varchar(10) NOT NULL check("Marital Status" in ('married', 'single', 'divorced', 'seperated')),
"State of Origin" varchar(100) NOT NULL,
"Local Government Area" varchar(100) NOT NULL,
"Residential Address" varchar(255) NOT NULL,
Phone int NOT NULL unique,
"Alternative Phone" int NULL unique,
Email varchar(100) NOT NULL,
"Means of Identification" varchar(255) NOT NULL,
"Identification No" varchar(100) NOT NULL,
"State of Issuance" varchar(100) NULL,
"No of Primary Dependant" int NOT NULL,
);

-- Employee Appointment data.
create table "Employee Appointment Info"
(
"Employee ID" varchar(8) NOT NULL foreign key references "Employee Bio"("Employee ID"),
"Current Annual Earning" decimal(10, 2) NOT NULL,
"First Appointment Title" varchar(100) NULL,
"First Appointment Date" date NULL,
"First Appointment Annual Earning" decimal(10, 2) NULL,
"Date of Last Promotion" date NOT NULL,
);

-- Creating table for employee education and qualification background.
create table "Employee Education and Certification"
(
"Employee ID" varchar(8) NOT NULL foreign key references "Employee Bio"("Employee ID"),
"Highest Degree Obtained" varchar(100) NOT NULL,
"Employee's Major" varchar(100) NOT NULL,
"Institution Name" varchar(255) NOT NULL,
"Graduation Date" date NOT NULL,
"Professional Certificate 1" varchar(255) NOT NULL,
"Issuer 1" varchar(255) NULL,
"Date of Issue 1" date NULL,
"Professional Certfication 2" varchar(255) NULL,
"Issuer 2" varchar(255) NULL,
"Date of Issue 2" date NULL,
"Professional Certfication 3" varchar(255) NULL,
"Issuer 3" varchar(255) NULL,
"Date of Issue 3" date NULL,
"Licence 1" varchar(255) NULL,
"Licencer 1" varchar(255) NULL,
"Date of Licencing 1" date NULL,
"Licence 1 Expiry Date" date NULL,
"Licence 2" varchar(255) NULL,
"Licencer 2" varchar(255) NULL,
"Date of Licencing 2" date NULL,
"Licence 2 Expiry Date" date NULL,
"Licence 3" varchar(255) NULL,
"Licencer 3" varchar(255) NULL,
"Date of Licencing 3" date NULL,
"Licence 3 Expiry Date" date NULL,
);

-- Employee contact and next of kin.
create table "Employee contact" 
(
"Employee ID" varchar(8) NOT NULL foreign key references "Employee Bio"("Employee ID"),
Designation varchar(100),
"First Name" varchar(100) NOT NULL,
"Surname" varchar(100) NOT NULL,
"Other Name" varchar(100) NULL,
"Relationship" varchar(100) NOT NULL,
"Nationality" varchar(255) NOT NULL,
"Local Government Area" varchar(255) NOT NULL,
"Residential Address"  varchar(255) NOT NULL,
Phone int NOT NULL,
"Phone 2" int NULL,
Email varchar(100) NULL,
);

-- Creating table for all functional departments in the school.
create table Departments
(
"Department ID" varchar(100) NOT NULL primary key,
"Department Title" varchar(255) NOT NULL,
"Department Type" varchar(15) NOT NULL check("Department Type" in ('Administrative', 'Academics', 'Operational')),
"Department Building Name" varchar(255) NOT NULL,
"Department Room No" int NOT NULL,
"Department Subunit Count" int NOT NULL,
"Department Subunits" varchar(255) NOT NULL,
"Department Office phone 1" int NOT NULL,
"Department Office phone 2" int NULL,
"Department Office phone 3" int NULL,
"Department Office Email" varchar(255) NULL,
"Department Website Address" varchar(255) NULL,
"Department Employee Count" int NOT NULL,
"Teaching Employee Count" int NULL,
"Non-teaching Employee Count" int NULL,
"Students Count" int NULL,
"HOD Employee ID" varchar(8) NOT NULL foreign key references "Employee Bio"("Employee ID"),
);



-- Creating Table for Academics Department to show their courses.
create table "Community Health Extension Worker"
(
"Course Code" varchar(6) NOT NULL primary key,
"Course Title" varchar(255) NOT NULL,
"Credit Load" int NOT NULL,
Program varchar(3) NOT NULL check(Program in ('ND', 'HND')),
"Academic Level" int NOT NULL check("Academic Level" in ('Part-1', 'Part-2')),
Semester int NOT NULL check(Semester in (1, 2)),
"Required" int NOT NULL check("Required" in ('True', 'False')),
"Tutor ID" varchar(8) NOT NULL foreign key references "Employee Bio"("Employee ID"),
);

-- Creating Table for Academics Department to show their courses.
create table "Health Information Management"
(
"Course Code" varchar(6) NOT NULL primary key,
"Course Title" varchar(255) NOT NULL,
"Credit Load" int NOT NULL,
Program varchar(3) NOT NULL check(Program in ('ND', 'HND')),
"Academic Level" int NOT NULL check("Academic Level" in ('Part-1', 'Part-2')),
Semester int NOT NULL check(Semester in (1, 2)),
"Required" int NOT NULL check("Required" in ('True', 'False')),
"Tutor ID" varchar(8) NOT NULL foreign key references "Employee Bio"("Employee ID"),
);

-- Creating Table for Academics Department to show their courses.
create table "Medical Laboratory Tech"
(
"Course Code" varchar(6) NOT NULL primary key,
"Course Title" varchar(255) NOT NULL,
"Credit Load" int NOT NULL,
Program varchar(3) NOT NULL check(Program in ('ND', 'HND')),
"Academic Level" int NOT NULL check("Academic Level" in ('Part-1', 'Part-2')),
Semester int NOT NULL check(Semester in (1, 2)),
"Required" int NOT NULL check("Required" in ('True', 'False')),
"Tutor ID" varchar(8) NOT NULL foreign key references "Employee Bio"("Employee ID"),
);

-- Creating Table for Academics Department to show their courses.
create table "Pharmacy Tech"
(
"Course Code" varchar(6) NOT NULL primary key,
"Course Title" varchar(255) NOT NULL,
"Credit Load" int NOT NULL,
Program varchar(3) NOT NULL check(Program in ('ND', 'HND')),
"Academic Level" int NOT NULL check("Academic Level" in ('Part-1', 'Part-2')),
Semester int NOT NULL check(Semester in (1, 2)),
"Required" int NOT NULL check("Required" in ('True', 'False')),
"Tutor ID" varchar(8) NOT NULL foreign key references "Employee Bio"("Employee ID"),
);

-- Creating Table for Academics Department to show their courses.
create table "Public Health"
(
"Course Code" varchar(6) NOT NULL primary key,
"Course Title" varchar(255) NOT NULL,
"Credit Load" int NOT NULL,
Program varchar(3) NOT NULL check(Program in ('ND', 'HND')),
"Academic Level" int NOT NULL check("Academic Level" in ('Part-1', 'Part-2')),
Semester int NOT NULL check(Semester in (1, 2)),
"Required" int NOT NULL check("Required" in ('True', 'False')),
"Tutor ID" varchar(8) NOT NULL foreign key references "Employee Bio"("Employee ID"),
);
