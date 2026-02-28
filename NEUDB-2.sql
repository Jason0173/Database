-- Create the NEU database
CREATE DATABASE NEU;
GO

USE NEU;

-- Create the Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- Create the Professors table
CREATE TABLE Professors (
    ProfessorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Create the Courses table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    DepartmentID INT,
    Credits INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Create the CourseSections table
CREATE TABLE CourseSections (
    CourseSectionID INT PRIMARY KEY,
    CourseID INT,
    ProfessorID INT,
    Semester VARCHAR(10),
    Year INT,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (ProfessorID) REFERENCES Professors(ProfessorID)
);

-- Create the Majors table
CREATE TABLE Majors (
    MajorID INT PRIMARY KEY,
    MajorName VARCHAR(50)
);

-- Create the Advisors table
CREATE TABLE Advisors (
    AdvisorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Create the Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Birthdate DATE,
    MajorID INT,
    AdvisorID INT,
    FOREIGN KEY (MajorID) REFERENCES Majors(MajorID),
    FOREIGN KEY (AdvisorID) REFERENCES Advisors(AdvisorID)
);

-- Create the Registrations table
CREATE TABLE Registrations (
    RegistrationID INT PRIMARY KEY,
    StudentID INT,
    CourseSectionID INT,
    Grade VARCHAR(2),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseSectionID) REFERENCES CourseSections(CourseSectionID)
);

-- Sample data for Departments
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (1, 'Computer Science');
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (2, 'Art and Design');
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (3, 'Marketing');
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (4, 'Mechanical Engineering');
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES (5, 'Nursing');

-- Sample data for Professors
INSERT INTO Professors (ProfessorID, FirstName, LastName, Email, DepartmentID) VALUES (1, 'Professor', 'Johnson', 'prof.johnson@example.com', 1);
INSERT INTO Professors (ProfessorID, FirstName, LastName, Email, DepartmentID) VALUES (2, 'Mary', 'Smith', 'mary.smith@example.com', 2);
INSERT INTO Professors (ProfessorID, FirstName, LastName, Email, DepartmentID) VALUES (3, 'Robert', 'Davis', 'robert.davis@example.com', 3);
INSERT INTO Professors (ProfessorID, FirstName, LastName, Email, DepartmentID) VALUES (4, 'Elizabeth', 'Wilson', 'elizabeth.wilson@example.com', 4);
INSERT INTO Professors (ProfessorID, FirstName, LastName, Email, DepartmentID) VALUES (5, 'William', 'Brown', 'william.brown@example.com', 5);

-- Sample data for Courses
INSERT INTO Courses (CourseID, CourseName, DepartmentID, Credits) VALUES (1, 'Introduction to Programming', 1, 3);
INSERT INTO Courses (CourseID, CourseName, DepartmentID, Credits) VALUES (2, 'Calculus I', 1, 4);
INSERT INTO Courses (CourseID, CourseName, DepartmentID, Credits) VALUES (3, 'Graphic Design Fundamentals', 2, 3);
INSERT INTO Courses (CourseID, CourseName, DepartmentID, Credits) VALUES (4, 'Principles of Marketing', 3, 3);
INSERT INTO Courses (CourseID, CourseName, DepartmentID, Credits) VALUES (5, 'Thermodynamics', 4, 4);

-- Sample data for Majors
INSERT INTO Majors (MajorID, MajorName) VALUES (1, 'Computer Science');
INSERT INTO Majors (MajorID, MajorName) VALUES (2, 'Art and Design');
INSERT INTO Majors (MajorID, MajorName) VALUES (3, 'Marketing');
INSERT INTO Majors (MajorID, MajorName) VALUES (4, 'Mechanical Engineering');
INSERT INTO Majors (MajorID, MajorName) VALUES (5, 'Nursing');

-- Sample data for Advisors
INSERT INTO Advisors (AdvisorID, FirstName, LastName, Email, DepartmentID) VALUES (1, 'Advisor', 'Smith', 'advisor.smith@example.com', 1);
INSERT INTO Advisors (AdvisorID, FirstName, LastName, Email, DepartmentID) VALUES (2, 'Sarah', 'Miller', 'sarah.miller@example.com', 2);
INSERT INTO Advisors (AdvisorID, FirstName, LastName, Email, DepartmentID) VALUES (3, 'James', 'Davis', 'james.davis@example.com', 3);
INSERT INTO Advisors (AdvisorID, FirstName, LastName, Email, DepartmentID) VALUES (4, 'Jennifer', 'Anderson', 'jennifer.anderson@example.com', 4);
INSERT INTO Advisors (AdvisorID, FirstName, LastName, Email, DepartmentID) VALUES (5, 'Karen', 'Clark', 'karen.clark@example.com', 5);

-- Sample data for Students
INSERT INTO Students (StudentID, FirstName, LastName, Email, Birthdate, MajorID, AdvisorID) VALUES (1, 'John', 'Doe', 'john.doe@example.com', '1995-08-15', 1, 1);
INSERT INTO Students (StudentID, FirstName, LastName, Email, Birthdate, MajorID, AdvisorID) VALUES (2, 'Jane', 'Smith', 'jane.smith@example.com', '1996-03-22', 1, 1);
INSERT INTO Students (StudentID, FirstName, LastName, Email, Birthdate, MajorID, AdvisorID) VALUES (3, 'Michael', 'Johnson', 'michael.johnson@example.com', '1997-02-10', 2, 2);
INSERT INTO Students (StudentID, FirstName, LastName, Email, Birthdate, MajorID, AdvisorID) VALUES (4, 'Emily', 'Wilson', 'emily.wilson@example.com', '1998-05-28', 3, 3);
INSERT INTO Students (StudentID, FirstName, LastName, Email, Birthdate, MajorID, AdvisorID) VALUES (5, 'David', 'Brown', 'david.brown@example.com', '1999-11-15', 4, 4);
INSERT INTO Students (StudentID, FirstName, LastName, Email, Birthdate, MajorID, AdvisorID) VALUES (6, 'Sarah', 'Thomas', 'sarah.thomas@example.com', '2000-04-12', 5, 5);
INSERT INTO Students (StudentID, FirstName, LastName, Email, Birthdate, MajorID, AdvisorID) VALUES (7, 'Daniel', 'Harris', 'daniel.harris@example.com', '1999-07-30', 1, 1);
INSERT INTO Students (StudentID, FirstName, LastName, Email, Birthdate, MajorID, AdvisorID) VALUES (8, 'Linda', 'Allen', 'linda.allen@example.com', '2001-01-25', 2, 2);
INSERT INTO Students (StudentID, FirstName, LastName, Email, Birthdate, MajorID, AdvisorID) VALUES (9, 'William', 'Young', 'william.young@example.com', '2002-03-18', 3, 3);
INSERT INTO Students (StudentID, FirstName, LastName, Email, Birthdate, MajorID, AdvisorID) VALUES (10, 'Emily', 'Martinez', 'emily.martinez@example.com', '2003-05-10', 4, 4);

-- Sample data for CourseSections
INSERT INTO CourseSections (CourseSectionID, CourseID, ProfessorID, Semester, Year) VALUES (1, 1, 1, 'Fall', 2023);
INSERT INTO CourseSections (CourseSectionID, CourseID, ProfessorID, Semester, Year) VALUES (2, 1, 2, 'Spring', 2023);
INSERT INTO CourseSections (CourseSectionID, CourseID, ProfessorID, Semester, Year) VALUES (3, 2, 3, 'Fall', 2023);
INSERT INTO CourseSections (CourseSectionID, CourseID, ProfessorID, Semester, Year) VALUES (4, 2, 4, 'Spring', 2023);
INSERT INTO CourseSections (CourseSectionID, CourseID, ProfessorID, Semester, Year) VALUES (5, 3, 5, 'Fall', 2023);
INSERT INTO CourseSections (CourseSectionID, CourseID, ProfessorID, Semester, Year) VALUES (6, 3, 1, 'Spring', 2023);
INSERT INTO CourseSections (CourseSectionID, CourseID, ProfessorID, Semester, Year) VALUES (7, 4, 2, 'Fall', 2023);
INSERT INTO CourseSections (CourseSectionID, CourseID, ProfessorID, Semester, Year) VALUES (8, 4, 3, 'Spring', 2023);
INSERT INTO CourseSections (CourseSectionID, CourseID, ProfessorID, Semester, Year) VALUES (9, 5, 4, 'Fall', 2023);
INSERT INTO CourseSections (CourseSectionID, CourseID, ProfessorID, Semester, Year) VALUES (10, 5, 5, 'Spring', 2023);

-- Sample data for Registrations (students registering for CourseSections)
INSERT INTO Registrations (RegistrationID, StudentID, CourseSectionID, Grade) VALUES (1, 1, 1, 'A');
INSERT INTO Registrations (RegistrationID, StudentID, CourseSectionID, Grade) VALUES (2, 1, 3, 'B');
INSERT INTO Registrations (RegistrationID, StudentID, CourseSectionID, Grade) VALUES (3, 2, 2, 'A');
INSERT INTO Registrations (RegistrationID, StudentID, CourseSectionID, Grade) VALUES (4, 2, 4, 'B');
INSERT INTO Registrations (RegistrationID, StudentID, CourseSectionID, Grade) VALUES (5, 3, 5, 'A');
INSERT INTO Registrations (RegistrationID, StudentID, CourseSectionID, Grade) VALUES (6, 3, 7, 'B');
INSERT INTO Registrations (RegistrationID, StudentID, CourseSectionID, Grade) VALUES (7, 4, 8, 'A');
INSERT INTO Registrations (RegistrationID, StudentID, CourseSectionID, Grade) VALUES (8, 4, 10, 'B');
INSERT INTO Registrations (RegistrationID, StudentID, CourseSectionID, Grade) VALUES (9, 5, 9, 'A');
INSERT INTO Registrations (RegistrationID, StudentID, CourseSectionID, Grade) VALUES (10, 5, 6, 'B');
