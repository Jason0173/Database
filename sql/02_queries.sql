-- Answers to the 14 assignment questions.
-- Run 01_schema_and_seed.sql first to create and populate the NEU database.
USE NEU;
GO

-- 1) Find all professors who belong to the "Computer Science" department.
SELECT p.*
FROM Professors AS p
JOIN Departments AS d ON d.DepartmentID = p.DepartmentID
WHERE d.DepartmentName = 'Computer Science';

-- 2) Retrieve all courses that offer more than 3 credits.
SELECT *
FROM Courses
WHERE Credits > 3;

-- 3) Find all course sections offered in the "Fall" semester.
SELECT *
FROM CourseSections
WHERE Semester = 'Fall';

-- 4) List all distinct semesters in which courses have been offered.
SELECT DISTINCT Semester
FROM CourseSections;

-- 5) Retrieve all advisors whose email ends with "@neu.edu".
SELECT *
FROM Advisors
WHERE Email LIKE '%@neu.edu';

-- 6) List all professors whose last name starts with 'S'.
SELECT *
FROM Professors
WHERE LastName LIKE 'S%';

-- 7) Find the total number of professors in the database.
SELECT COUNT(*) AS TotalProfessors
FROM Professors;

-- 8) Find the highest number of credits assigned to a course.
SELECT MAX(Credits) AS HighestCredits
FROM Courses;

-- 9) Count the number of courses offered by each department.
SELECT d.DepartmentID,
       d.DepartmentName,
       COUNT(c.CourseID) AS CourseCount
FROM Departments AS d
LEFT JOIN Courses AS c ON c.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName;

-- 10) Retrieve departments that offer more than 5 courses.
SELECT d.DepartmentID,
       d.DepartmentName,
       COUNT(c.CourseID) AS CourseCount
FROM Departments AS d
JOIN Courses AS c ON c.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName
HAVING COUNT(c.CourseID) > 5;

-- 11) Find the average number of credits for courses in each department.
SELECT d.DepartmentID,
       d.DepartmentName,
       AVG(CAST(c.Credits AS DECIMAL(10,2))) AS AverageCredits
FROM Departments AS d
JOIN Courses AS c ON c.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName;

-- 12) Retrieve all courses sorted by credits in descending order.
SELECT *
FROM Courses
ORDER BY Credits DESC;

-- 13) Find all students who were born in the year 2000.
SELECT *
FROM Students
WHERE YEAR(Birthdate) = 2000;

GO

-- 14) Create a view showing all courses with more than 3 credits.
-- CREATE VIEW must be the first statement in its batch, hence the GO above.
-- CREATE OR ALTER (SQL Server 2016 SP1+) lets the script be re-run safely.
CREATE OR ALTER VIEW vw_CoursesMoreThan3Credits AS
SELECT CourseID,
       CourseName,
       DepartmentID,
       Credits
FROM Courses
WHERE Credits > 3;
GO

-- View execution script
SELECT *
FROM vw_CoursesMoreThan3Credits;
