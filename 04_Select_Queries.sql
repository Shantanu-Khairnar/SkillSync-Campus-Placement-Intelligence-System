USE SKILLSYNC;

--Query1: Display all students
Select *
from students;

---Query2: Display student name and cgpa
Select 
    First_Name,
    Last_Name,
    CGPA
from students;

--Query3: Students with CGPA greater than 7.5
SELECT  *
FROM Students
WHERE CGPA = 8.4;

--Query4: Students from a specific department
Select *
from Students
Where Department_ID=1;

--Query 5: display unique CPGA values 
SELECT DISTINCT CGPA
FROM Students;

--QUERY6 : display unique graguation years 
Select DISTINCT Graduation_year
FROM STUDENTS;

--Query7 : Students ordered by  CGPA
SELECT *
FROM STUDENTS
ORDER BY CGPA ASC;

--QUERY8 : Students ordered by CGPA decending
SELECT *
FROM STUDENTS
ORDER BY CGPA DESC;

--QUERY9: Top 3 students by  CGPA
SELECT TOP 3 *
FROM Students
ORDER BY CGPA DESC;

--QUERY 10 : TOP 5 STUDENTS BY  CGPA 
SELECT TOP 5 *
FROM Students
order by CGPA ASC;

--QUERY 11: Stuents with CGPA greater than 7.5 and student ID greater than 8
SELECT *
FROM Students
where  CGPA > 7.5
AND Student_ID >8;

--Query 12: Students with CGPA greater than 8 or students ID greater than 11
SELECT *
FROM  Students
WHERE CGPA > 8
OR Student_ID >11;

-- Query 13: Students with selected Student IDs
SELECT *
FROM Students
WHERE Student_ID IN (6, 8, 10);

-- Query 14: Students with CGPA between 7.0 and 8.0
SELECT *
FROM Students
WHERE CGPA BETWEEN 7.0 AND 8.0;

-- Query 15: Students whose first name starts with A
SELECT *
FROM Students
WHERE First_Name LIKE 'A%';

-- Query 16: Students whose first name ends with n
SELECT *
FROM Students
WHERE First_Name LIKE '%a';

-- Query 17: Students whose first name contains "an"
SELECT *
FROM Students
WHERE First_Name LIKE '%an%';

-- =========================
-- AGGREGATE FUNCTIONS
-- =========================

-- Query 18: Count total students
SELECT COUNT(*) AS Total_Students
FROM Students;

-- Query 19: Total package offered
SELECT SUM(Package_Offered) AS Total_Package
FROM Job_Offers;

-- Query 20: Average CGPA of all students
SELECT AVG(CGPA) AS Average_CGPA
FROM Students;

-- Query 21: Minimum and maximum CGPA
SELECT
    MIN(CGPA) AS Minimum_CGPA,
    MAX(CGPA) AS Maximum_CGPA
FROM Students;

-- Query 22: Count students in each department
SELECT
    Department_ID,
    COUNT(*) AS Total_Students
FROM Students
GROUP BY Department_ID;

-- Query 23: Average CGPA in each department
SELECT
    Department_ID,
    AVG(CGPA) AS Average_CGPA
FROM Students
GROUP BY Department_ID;

-- Query 24: Departments having average CGPA above 7.5
SELECT
    Department_ID,
    AVG(CGPA) AS Average_CGPA
FROM Students
GROUP BY Department_ID
HAVING AVG(CGPA) > 7.5;

-- Query 25: Using aliases for readable column names
SELECT
    First_Name AS Student_First_Name,
    Last_Name AS Student_Last_Name,
    CGPA AS Student_CGPA
FROM Students;

-- Query 26: Categorize students based on CGPA
SELECT
    First_Name,
    Last_Name,
    CGPA,
    CASE
        WHEN CGPA >= 8.0 THEN 'High'
        WHEN CGPA >= 7.7 THEN 'Average'
        ELSE 'Below Average'
    END AS CGPA_Category
FROM Students;

--===============================
-- SQL JOINS
--============================

--Query 27: Students with matchinng Department IDs
SELECT 
S.Student_ID,
S.First_name,
S.Last_name,
S.CGPA,
D.Department_ID
FROM Students AS S
INNER JOIN Departments AS D
   ON S.Department_ID=D.Department_ID

--Query 28: All students with matching deparment information
SELECT 
S.Student_ID,
S.First_name,
S.Last_name,
S.Department_ID,
D.Department_ID AS Matched_Department_id
FROM Students AS S
LEFT JOIN Departments AS D 
   ON S.Department_ID = D.Department_ID;

--Query 29: ALL deparments with  matching studnets
SELECT 
S.Student_ID,
S.First_name,
D.Department_ID
FROM Students AS S
RIGHT JOIN Departments AS D
   ON S.Department_ID = D.Department_ID;

--Query 30: Students and  the companies they applied to 
SELECT
S.Student_ID,
S.First_name,
S.Last_name,
A.Application_ID,
A.Company_ID
FROM Students AS S
INNER JOIN Applications AS A
   ON S.Student_ID = A.Student_ID
   INNER JOIN Companies AS C
   ON A.Company_ID = C.Company_ID;

--Query 31: Application of a specific student
SELECT 
S.Student_ID,
S.First_name,
S.Last_name,
A.Application_ID,
A.Company_ID
FROM Students AS S
INNER JOIN Applications AS A 
   ON S.Student_ID = A.Student_ID
INNER JOIN Companies AS C
   ON A.Company_ID = C.Company_ID
WHERE S.Student_ID = 6;

--Query 32: Students and  their application ordered by CGPA 
SELECT 
S. Student_ID,
S.First_name,
S.Last_name,
S.CGPA,
A.Application_ID,
A.Company_ID
FROM Students  AS S
INNER JOIN Applications AS A
     ON S.Student_ID = A.Student_ID
INNER JOIN Companies AS C
     ON A.Company_ID = C.Company_ID
ORDER BY S.CGPA DESC;


-- =========================
-- - SUBQUERIES
-- =========================

-- Query 33: Students with CGPA above average
SELECT *
FROM Students
WHERE CGPA > (
    SELECT AVG(CGPA)
    FROM Students
);

-- Query 34: Students who have submitted applications
SELECT *
FROM Students
WHERE Student_ID IN (
    SELECT Student_ID
    FROM Applications
);


-- Query 35: Students above their department's average CGPA
SELECT
    S.Student_ID,
    S.First_Name,
    S.Last_Name,
    S.Department_ID,
    S.CGPA
FROM Students AS S
WHERE S.CGPA > (
    SELECT AVG(S2.CGPA)
    FROM Students AS S2
    WHERE S2.Department_ID = S.Department_ID
);

-- Query 36: Students who have submitted applications
SELECT
    S.Student_ID,
    S.First_Name,
    S.Last_Name
FROM Students AS S
WHERE EXISTS (
    SELECT 1
    FROM Applications AS A
    WHERE A.Student_ID = S.Student_ID
);

-- Query 37: Students who have not submitted any application
SELECT
    S.Student_ID,
    S.First_Name,
    S.Last_Name
FROM Students AS S
WHERE NOT EXISTS (
    SELECT 1
    FROM Applications AS A
    WHERE A.Student_ID = S.Student_ID
);

-- Query 38: Students with the highest CGPA
SELECT
    Student_ID,
    First_Name,
    Last_Name,
    CGPA
FROM Students
WHERE CGPA = (
    SELECT MAX(CGPA)
    FROM Students
);

-- =========================
--  - PLACEMENT QUERIES
-- =========================

-- Query 39: Students who have applied to companies
SELECT
    S.Student_ID,
    S.First_Name,
    S.Last_Name,
    A.Application_ID,
    A.Company_ID
FROM Students AS S
INNER JOIN Applications AS A
    ON S.Student_ID = A.Student_ID;   


-- Query 40: Students with multiple applications
SELECT
    S.Student_ID,
    S.First_Name,
    S.Last_Name,
    COUNT(A.Application_ID) AS Total_Applications
FROM Students AS S
INNER JOIN Applications AS A
    ON S.Student_ID = A.Student_ID
GROUP BY
    S.Student_ID,
    S.First_Name,
    S.Last_Name
HAVING COUNT(A.Application_ID) >= 2;

-- Query 41: Students who received job offers
SELECT
    S.Student_ID,
    S.First_Name,
    S.Last_Name,
    A.Application_ID,
    J.Offer_ID,
    J.Package_Offered,
    J.Offer_Status
FROM Students AS S
INNER JOIN Applications AS A
    ON S.Student_ID = A.Student_ID
INNER JOIN Job_Offers AS J
    ON A.Application_ID = J.Application_ID;


    -- Query 42: Students with accepted job offers
SELECT
    S.Student_ID,
    S.First_Name,
    S.Last_Name,
    J.Offer_ID,
    J.Package_Offered,
    J.Offer_Status
FROM Students AS S
INNER JOIN Applications AS A
    ON S.Student_ID = A.Student_ID
INNER JOIN Job_Offers AS J
    ON A.Application_ID = J.Application_ID
WHERE J.Offer_Status = 'Accepted';


-- Query 43: Total applications received by each company
SELECT
    C.Company_ID,
    COUNT(A.Application_ID) AS Total_Applications
FROM Companies AS C
LEFT JOIN Applications AS A
    ON C.Company_ID = A.Company_ID
GROUP BY
    C.Company_ID
ORDER BY
    Total_Applications DESC;


-- Query 44: Company-wise job offer analysis

SELECT
    C.Company_ID,
    COUNT(J.Offer_ID) AS Total_Offers,
    AVG(J.Package_Offered) AS Average_Package
FROM Companies AS C
LEFT JOIN Applications AS A
    ON C.Company_ID = A.Company_ID
LEFT JOIN Job_Offers AS J
    ON A.Application_ID = J.Application_ID
GROUP BY
    C.Company_ID
ORDER BY
    Total_Offers DESC;


-- =========================
--  - WINDOW FUNCTIONS
-- =========================

-- Query 45: Assign row numbers based on CGPA
SELECT
    Student_ID,
    First_Name,
    Last_Name,
    CGPA,
    ROW_NUMBER() OVER (
        ORDER BY CGPA DESC
    ) AS Student_Rank
FROM Students;

-- Query 46: Rank students according to CGPA
SELECT
    Student_ID,
    First_Name,
    Last_Name,
    CGPA,
    RANK() OVER (
        ORDER BY CGPA DESC
    ) AS Student_Rank
FROM Students;

-- Query 47: Dense rank students according to CGPA
SELECT
    Student_ID,
    First_Name,
    Last_Name,
    CGPA,
    DENSE_RANK() OVER (
        ORDER BY CGPA DESC
    ) AS Student_Rank
FROM Students;

-- Query 48: Rank students within each department
SELECT
    Student_ID,
    First_Name,
    Last_Name,
    Department_ID,
    CGPA,
    RANK() OVER (
        PARTITION BY Department_ID
        ORDER BY CGPA DESC
    ) AS Department_Rank
FROM Students;


-- Query 49: Top 3 students in each department
WITH StudentRanking AS
(
    SELECT
        Student_ID,
        First_Name,
        Last_Name,
        Department_ID,
        CGPA,
        ROW_NUMBER() OVER (
            PARTITION BY Department_ID
            ORDER BY CGPA DESC, Student_ID ASC
        ) AS Student_Rank
    FROM Students
)
SELECT *
FROM StudentRanking
WHERE Student_Rank <= 3;

-- =========================
-- - ADVANCED SQL
-- =========================

-- Query 50: Company-wise offer status analysis
SELECT
    A.Company_ID,

    COUNT(J.Offer_ID) AS Total_Offers,

    SUM(CASE
        WHEN J.Offer_Status = 'Accepted' THEN 1
        ELSE 0
    END) AS Accepted_Offers,

    SUM(CASE
        WHEN J.Offer_Status = 'Pending' THEN 1
        ELSE 0
    END) AS Pending_Offers,

    SUM(CASE
        WHEN J.Offer_Status = 'Rejected' THEN 1
        ELSE 0
    END) AS Rejected_Offers

FROM Applications AS A

LEFT JOIN Job_Offers AS J
    ON A.Application_ID = J.Application_ID

GROUP BY A.Company_ID
ORDER BY Total_Offers DESC;

-- Query 51: Department-wise CGPA performance
SELECT
    Department_ID,

    COUNT(*) AS Total_Students,

    SUM(CASE
        WHEN CGPA >= 8.0 THEN 1
        ELSE 0
    END) AS High_CGPA_Students,

    SUM(CASE
        WHEN CGPA < 7.0 THEN 1
        ELSE 0
    END) AS Low_CGPA_Students

FROM Students
GROUP BY Department_ID
ORDER BY Department_ID

 -- Query 52: Company-wise placement success rate
SELECT
    C.Company_ID,

    COUNT(DISTINCT A.Application_ID) AS Total_Applications,

    COUNT(DISTINCT
        CASE
            WHEN J.Offer_Status = 'Accepted'
            THEN A.Application_ID
        END
    ) AS Accepted_Applications,

    CAST(
        100.0 *
        COUNT(DISTINCT
            CASE
                WHEN J.Offer_Status = 'Accepted'
                THEN A.Application_ID
            END
        )
        / NULLIF(COUNT(DISTINCT A.Application_ID), 0)
        AS DECIMAL(5,2)
    ) AS Success_Rate_Percentage

FROM Companies AS C

LEFT JOIN Applications AS A
    ON C.Company_ID = A.Company_ID

LEFT JOIN Job_Offers AS J
    ON A.Application_ID = J.Application_ID

GROUP BY C.Company_ID
ORDER BY Success_Rate_Percentage DESC;

-- Query 53: Department-wise placement analysis
SELECT
    S.Department_ID,

    COUNT(DISTINCT
        CASE
            WHEN J.Offer_Status = 'Accepted'
            THEN S.Student_ID
        END
    ) AS Placed_Students,

    COUNT(J.Offer_ID) AS Total_Offers,

    CAST(AVG(J.Package_Offered) AS DECIMAL(10,2))
        AS Average_Package

FROM Students AS S

LEFT JOIN Applications AS A
    ON S.Student_ID = A.Student_ID

LEFT JOIN Job_Offers AS J
    ON A.Application_ID = J.Application_ID

GROUP BY S.Department_ID
ORDER BY Placed_Students DESC;

-- Query 54: Highest package in each department
SELECT
    S.Department_ID,
    MAX(J.Package_Offered) AS Highest_Package
FROM Students AS S
INNER JOIN Applications AS A
    ON S.Student_ID = A.Student_ID
INNER JOIN Job_Offers AS J
    ON A.Application_ID = J.Application_ID
WHERE J.Offer_Status = 'Accepted'
GROUP BY S.Department_ID
ORDER BY Highest_Package DESC;

-- Query 55: Overall placement summary
SELECT
    (SELECT COUNT(*)
     FROM Students) AS Total_Students,

    (SELECT COUNT(*)
     FROM Applications) AS Total_Applications,

    (SELECT COUNT(*)
     FROM Job_Offers
     WHERE Offer_Status = 'Accepted') AS Accepted_Offers,

    (SELECT MAX(Package_Offered)
     FROM Job_Offers
     WHERE Offer_Status = 'Accepted') AS Highest_Accepted_Package;
   
   
   -- =========================
-- - BUSINESS ANALYSIS
-- =========================

-- Query 56: Students without any job offers
SELECT
    S.Student_ID,
    S.First_Name,
    S.Last_Name
FROM Students AS S
WHERE NOT EXISTS (
    SELECT 1
    FROM Applications AS A
    INNER JOIN Job_Offers AS J
        ON A.Application_ID = J.Application_ID
    WHERE A.Student_ID = S.Student_ID
);

-- Query 57: Students with multiple job offers
SELECT
    S.Student_ID,
    S.First_Name,
    S.Last_Name,
    COUNT(J.Offer_ID) AS Total_Offers
FROM Students AS S
INNER JOIN Applications AS A
    ON S.Student_ID = A.Student_ID
INNER JOIN Job_Offers AS J
    ON A.Application_ID = J.Application_ID
GROUP BY
    S.Student_ID,
    S.First_Name,
    S.Last_Name
HAVING COUNT(J.Offer_ID) > 1;


-- Query 58: Company-wise hiring comparison
SELECT
    A.Company_ID,
    COUNT(DISTINCT A.Application_ID) AS Total_Applications,
    COUNT(DISTINCT J.Offer_ID) AS Total_Offers
FROM Applications AS A
LEFT JOIN Job_Offers AS J
    ON A.Application_ID = J.Application_ID
GROUP BY
    A.Company_ID
ORDER BY
    Total_Applications DESC;

-- Query 59: Interview-round performance analysis
SELECT
    Round_Name,
    COUNT(*) AS Total_Students,
    SUM(CASE WHEN Status = 'Cleared' THEN 1 ELSE 0 END) AS Cleared_Count,
    SUM(CASE WHEN Status = 'Failed' THEN 1 ELSE 0 END) AS Failed_Count,
    SUM(CASE WHEN Status = 'Pending' THEN 1 ELSE 0 END) AS Pending_Count
FROM Interview_Rounds
GROUP BY Round_Name
ORDER BY Round_Name;

-- Query 60: Placement eligibility analysis
SELECT
    Student_ID,
    First_Name,
    Last_Name,
    CGPA,
    CASE
        WHEN CGPA >= 7.0 THEN 'Eligible'
        ELSE 'Not Eligible'
    END AS Placement_Eligibility
FROM Students
ORDER BY CGPA DESC;

-- =========================
-- - ADVANCED SQL
-- =========================

-- Query 61: Above-average CGPA using CTE
WITH AverageCGPA AS
(
    SELECT AVG(CGPA) AS Avg_CGPA
    FROM Students
)
SELECT
    S.Student_ID,
    S.First_Name,
    S.Last_Name,
    S.CGPA
FROM Students AS S
CROSS JOIN AverageCGPA AS A
WHERE S.CGPA > A.Avg_CGPA;

-- Query 62: Department-wise above-average CGPA
WITH DepartmentAverage AS
(
    SELECT
        Department_ID,
        AVG(CGPA) AS Avg_CGPA
    FROM Students
    GROUP BY Department_ID
)
SELECT
    S.Student_ID,
    S.First_Name,
    S.Last_Name,
    S.Department_ID,
    S.CGPA,
    D.Avg_CGPA
FROM Students AS S
INNER JOIN DepartmentAverage AS D
    ON S.Department_ID = D.Department_ID
WHERE S.CGPA > D.Avg_CGPA
ORDER BY S.Department_ID, S.CGPA DESC;


-- Query 63: Company-wise application analysis
WITH CompanyApplications AS
(
    SELECT
        Company_ID,
        COUNT(Application_ID) AS Total_Applications
    FROM Applications
    GROUP BY Company_ID
)
SELECT
    Company_ID,
    Total_Applications
FROM CompanyApplications
ORDER BY Total_Applications DESC;


-- Query 64: Company-wise average package
WITH CompanyPackages AS
(
    SELECT
        A.Company_ID,
        AVG(J.Package_Offered) AS Average_Package,
        MAX(J.Package_Offered) AS Highest_Package,
        COUNT(J.Offer_ID) AS Total_Offers
    FROM Applications AS A
    INNER JOIN Job_Offers AS J
        ON A.Application_ID = J.Application_ID
    GROUP BY A.Company_ID
)
SELECT
    Company_ID,
    Average_Package,
    Highest_Package,
    Total_Offers
FROM CompanyPackages
ORDER BY Average_Package DESC;


-- Query 65: Department-wise highest CGPA students
WITH DepartmentTopper AS
(
    SELECT
        Department_ID,
        MAX(CGPA) AS Highest_CGPA
    FROM Students
    GROUP BY Department_ID
)
SELECT
    S.Student_ID,
    S.First_Name,
    S.Last_Name,
    S.Department_ID,
    S.CGPA
FROM Students AS S
INNER JOIN DepartmentTopper AS D
    ON S.Department_ID = D.Department_ID
    AND S.CGPA = D.Highest_CGPA
ORDER BY S.Department_ID;


-- Query 66: Overall placement success rate
WITH PlacementStats AS
(
    SELECT
        COUNT(*) AS Total_Students,
        COUNT(DISTINCT CASE
            WHEN J.Offer_Status = 'Accepted'
            THEN A.Student_ID
        END) AS Placed_Students
    FROM Students AS S
    LEFT JOIN Applications AS A
        ON S.Student_ID = A.Student_ID
    LEFT JOIN Job_Offers AS J
        ON A.Application_ID = J.Application_ID
)
SELECT
    Total_Students,
    Placed_Students,
    CAST(
        Placed_Students * 100.0 / NULLIF(Total_Students, 0)
        AS DECIMAL(5,2)
    ) AS Placement_Success_Rate
FROM PlacementStats;

-- Query 67: Student placement status ranking
WITH StudentPlacement AS
(
    SELECT
        S.Student_ID,
        S.First_Name,
        S.Last_Name,
        COUNT(J.Offer_ID) AS Total_Offers,
        SUM(CASE
            WHEN J.Offer_Status = 'Accepted' THEN 1
            ELSE 0
        END) AS Accepted_Offers,
        SUM(CASE
            WHEN J.Offer_Status = 'Pending' THEN 1
            ELSE 0
        END) AS Pending_Offers,
        SUM(CASE
            WHEN J.Offer_Status = 'Rejected' THEN 1
            ELSE 0
        END) AS Rejected_Offers
    FROM Students AS S
    LEFT JOIN Applications AS A
        ON S.Student_ID = A.Student_ID
    LEFT JOIN Job_Offers AS J
        ON A.Application_ID = J.Application_ID
    GROUP BY
        S.Student_ID,
        S.First_Name,
        S.Last_Name
)
SELECT
    *,
    RANK() OVER (
        ORDER BY Accepted_Offers DESC, Total_Offers DESC
    ) AS Placement_Rank
FROM StudentPlacement
ORDER BY Placement_Rank;

-- Query 68: Department-wise placement summary
WITH DepartmentPlacement AS
(
    SELECT
        S.Department_ID,
        COUNT(DISTINCT S.Student_ID) AS Total_Students,
        COUNT(DISTINCT CASE
            WHEN J.Offer_Status = 'Accepted'
            THEN S.Student_ID
        END) AS Placed_Students
    FROM Students AS S
    LEFT JOIN Applications AS A
        ON S.Student_ID = A.Student_ID
    LEFT JOIN Job_Offers AS J
        ON A.Application_ID = J.Application_ID
    GROUP BY S.Department_ID
)
SELECT
    Department_ID,
    Total_Students,
    Placed_Students,
    CAST(
        Placed_Students * 100.0 / NULLIF(Total_Students, 0)
        AS DECIMAL(5,2)
    ) AS Placement_Percentage
FROM DepartmentPlacement
ORDER BY Placement_Percentage DESC;


--  - ADVANCED SQL

-- Query 69: Create Student Placement Summary View

CREATE OR ALTER VIEW vw_StudentPlacementSummary
AS
SELECT
    S.Student_ID,
    S.First_Name,
    S.Last_Name,
    S.CGPA,
    COUNT(J.Offer_ID) AS Total_Offers,
    SUM(CASE
        WHEN J.Offer_Status = 'Accepted' THEN 1
        ELSE 0
    END) AS Accepted_Offers
FROM Students AS S
LEFT JOIN Applications AS A
    ON S.Student_ID = A.Student_ID
LEFT JOIN Job_Offers AS J
    ON A.Application_ID = J.Application_ID
GROUP BY
    S.Student_ID,
    S.First_Name,
    S.Last_Name,
    S.CGPA;
GO

SELECT *
FROM vw_StudentPlacementSummary;


-- Query 70: Students with accepted offers
SELECT
    Student_ID,
    First_Name,
    Last_Name,
    CGPA,
    Total_Offers,
    Accepted_Offers
FROM vw_StudentPlacementSummary
WHERE Accepted_Offers > 0
ORDER BY Accepted_Offers DESC;

-- Query 71: Company Placement Summary View
CREATE OR ALTER VIEW vw_CompanyPlacementSummary
AS
SELECT
    A.Company_ID,
    COUNT(DISTINCT A.Application_ID) AS Total_Applications,
    COUNT(DISTINCT J.Offer_ID) AS Total_Offers,
    COUNT(DISTINCT CASE
        WHEN J.Offer_Status = 'Accepted'
        THEN J.Offer_ID
    END) AS Accepted_Offers
FROM Applications AS A
LEFT JOIN Job_Offers AS J
    ON A.Application_ID = J.Application_ID
GROUP BY A.Company_ID;
GO

SELECT *
FROM vw_CompanyPlacementSummary
ORDER BY Accepted_Offers DESC;

-- Query 72: Department Placement Summary View
CREATE OR ALTER VIEW vw_DepartmentPlacementSummary
AS
SELECT
    S.Department_ID,
    COUNT(DISTINCT S.Student_ID) AS Total_Students,
    COUNT(DISTINCT CASE
        WHEN J.Offer_Status = 'Accepted'
        THEN S.Student_ID
    END) AS Placed_Students,
    CAST(
        COUNT(DISTINCT CASE
            WHEN J.Offer_Status = 'Accepted'
            THEN S.Student_ID
        END) * 100.0 /
        NULLIF(COUNT(DISTINCT S.Student_ID), 0)
        AS DECIMAL(5,2)
    ) AS Placement_Percentage
FROM Students AS S
LEFT JOIN Applications AS A
    ON S.Student_ID = A.Student_ID
LEFT JOIN Job_Offers AS J
    ON A.Application_ID = J.Application_ID
GROUP BY S.Department_ID;
GO


SELECT *
FROM vw_DepartmentPlacementSummary
ORDER BY Placement_Percentage DESC;

-- Query 73: Interview Performance View
CREATE OR ALTER VIEW vw_InterviewPerformance
AS
SELECT
    Round_Name,
    COUNT(*) AS Total_Interviews,
    SUM(CASE
        WHEN Status = 'Cleared' THEN 1
        ELSE 0
    END) AS Cleared_Count,
    SUM(CASE
        WHEN Status = 'Failed' THEN 1
        ELSE 0
    END) AS Failed_Count,
    SUM(CASE
        WHEN Status = 'Pending' THEN 1
        ELSE 0
    END) AS Pending_Count,
    AVG(CAST(Score AS DECIMAL(10,2))) AS Average_Score
FROM Interview_Rounds
GROUP BY Round_Name;
GO

SELECT *
FROM vw_InterviewPerformance
ORDER BY Round_Name;

-- Query 74: Display all Views in SKILLSYNC
SELECT
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.VIEWS
ORDER BY TABLE_NAME;

-- Query 75: Practice DROP VIEW
CREATE OR ALTER VIEW vw_PracticeView
AS
SELECT
    Student_ID,
    First_Name,
    Last_Name
FROM Students;
GO

-- Remove only the practice View
DROP VIEW IF EXISTS vw_PracticeView;
GO


-- STORED PROCEDURES

-- Query 76: Create Student Details Procedure

CREATE OR ALTER PROCEDURE sp_GetStudentDetails
    @StudentID INT
AS
BEGIN
    SELECT
        Student_ID,
        First_Name,
        Last_Name,
        CGPA,
        Department_ID
    FROM Students
    WHERE Student_ID = @StudentID;
END;
GO

EXEC sp_GetStudentDetails @StudentID = 6;


--  Students by CGPA range

CREATE OR ALTER PROCEDURE sp_GetStudentsByCGPA
    @MinCGPA DECIMAL(4,2),
    @MaxCGPA DECIMAL(4,2)
AS
BEGIN
    SELECT
        Student_ID,
        First_Name,
        Last_Name,
        CGPA,
        Department_ID
    FROM Students
    WHERE CGPA BETWEEN @MinCGPA AND @MaxCGPA
    ORDER BY CGPA DESC;
END;
GO

EXEC sp_GetStudentsByCGPA
    @MinCGPA = 7.00,
    @MaxCGPA = 9.00;


-- Query 78: Accepted Placement Report

CREATE OR ALTER PROCEDURE sp_GetAcceptedPlacements
AS
BEGIN
    SELECT
        S.Student_ID,
        S.First_Name,
        S.Last_Name,
        S.CGPA,
        A.Company_ID,
        J.Package_Offered,
        J.Offer_Status
    FROM Students AS S
    INNER JOIN Applications AS A
        ON S.Student_ID = A.Student_ID
    INNER JOIN Job_Offers AS J
        ON A.Application_ID = J.Application_ID
    WHERE J.Offer_Status = 'Accepted'
    ORDER BY J.Package_Offered DESC;
END;
GO

EXEC sp_GetAcceptedPlacements;


-- Query 79: Count total students using OUTPUT parameter

CREATE OR ALTER PROCEDURE sp_GetTotalStudents
    @TotalStudents INT OUTPUT
AS
BEGIN
    SELECT @TotalStudents = COUNT(*)
    FROM Students;
END;
GO

DECLARE @StudentCount INT;

EXEC sp_GetTotalStudents
    @TotalStudents = @StudentCount OUTPUT;

SELECT @StudentCount AS Total_Students;


-- Query 80: Create function to get student full name
CREATE OR ALTER FUNCTION fn_GetStudentFullName
(
    @StudentID INT
)
RETURNS VARCHAR(101)
AS
BEGIN
    DECLARE @FullName VARCHAR(101);

    SELECT @FullName =
        CONCAT(First_Name, ' ', Last_Name)
    FROM Students
    WHERE Student_ID = @StudentID;

    RETURN @FullName;
END;
GO

SELECT dbo.fn_GetStudentFullName(6) AS Student_Full_Name;

-- Query 81: CGPA Performance Category Function

CREATE OR ALTER FUNCTION fn_GetCGPACategory
(
    @CGPA DECIMAL(4,2)
)
RETURNS VARCHAR(20)
AS
BEGIN
    DECLARE @Category VARCHAR(20);

    SET @Category =
        CASE
            WHEN @CGPA >= 9.0 THEN 'Excellent'
            WHEN @CGPA >= 8.0 THEN 'Very Good'
            WHEN @CGPA >= 7.0 THEN 'Good'
            WHEN @CGPA >= 6.0 THEN 'Average'
            ELSE 'Needs Improvement'
        END;

    RETURN @Category;
END;
GO

SELECT
    Student_ID,
    First_Name,
    Last_Name,
    CGPA,
    dbo.fn_GetCGPACategory(CGPA) AS Performance_Category
FROM Students
ORDER BY CGPA DESC;

SELECT TOP 1 *
FROM Departments;

-- Query 82: Get Student Department Name
CREATE OR ALTER FUNCTION fn_GetStudentDepartment
(
    @StudentID INT
)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @DepartmentName VARCHAR(100);

    SELECT
        @DepartmentName = D.Department_Name
    FROM Students AS S
    INNER JOIN Departments AS D
        ON S.Department_ID = D.Department_ID
    WHERE S.Student_ID = @StudentID;

    RETURN @DepartmentName;
END;
GO

SELECT
    Student_ID,
    First_Name,
    dbo.fn_GetStudentDepartment(Student_ID) AS Department_Name
FROM Students;

-- DAY 26
-- Query 83: Inspect Skills Table

SELECT *
FROM Skills
ORDER BY Skill_ID;


-- Query 84: Check Identity Property
SELECT
    COLUMN_NAME,
    DATA_TYPE,
    COLUMNPROPERTY(
        OBJECT_ID('Skills'),
        COLUMN_NAME,
        'IsIdentity'
    ) AS Is_Identity
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Skills';



-- Query 85: Bulk Insert Skills
INSERT INTO Skills (Skill_Name, Skill_Category)
SELECT V.Skill_Name, V.Skill_Category
FROM (VALUES
    ('Tableau', 'Data Visualization'),
    ('Git', 'Version Control'),
    ('Statistics', 'Analytics'),
    ('Data Cleaning', 'Data Analysis'),
    ('Cloud Computing', 'Technology')
) AS V(Skill_Name, Skill_Category)
WHERE NOT EXISTS
(
    SELECT 1
    FROM Skills AS S
    WHERE S.Skill_Name = V.Skill_Name
);

SELECT *
FROM Skills
ORDER BY Skill_ID;

-- Query 86: Find Duplicate Skills
SELECT
    Skill_Name,
    COUNT(*) AS Duplicate_Count
FROM Skills
GROUP BY Skill_Name
HAVING COUNT(*) > 1;



-- Query 87: Check NULL Values in Skills
SELECT
    Skill_ID,
    Skill_Name,
    Skill_Category
FROM Skills
WHERE Skill_Name IS NULL
   OR Skill_Category IS NULL;


-- Query 88: Find Invalid CGPA Records
SELECT
    Student_ID,
    First_Name,
    Last_Name,
    CGPA
FROM Students
WHERE CGPA < 0
   OR CGPA > 10
   OR CGPA IS NULL;

-- Query 89: Find Orphan Application Records
SELECT
    A.Application_ID,
    A.Student_ID
FROM Applications AS A
LEFT JOIN Students AS S
    ON A.Student_ID = S.Student_ID
WHERE S.Student_ID IS NULL;

-- Query 90: Skills Data Quality Summary
SELECT
    COUNT(*) AS Total_Records,
    COUNT(DISTINCT Skill_Name) AS Unique_Skills,
    SUM(CASE
        WHEN Skill_Name IS NULL THEN 1
        ELSE 0
    END) AS Missing_Skill_Names,
    SUM(CASE
        WHEN Skill_Category IS NULL THEN 1
        ELSE 0
    END) AS Missing_Categories
FROM Skills;



-- DAY 27
-- Query 91: Verify database tables
SELECT
    TABLE_NAME,
    TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;


-- Query 92: Check Primary Keys in SKILLSYNC
SELECT
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE OBJECTPROPERTY(
    OBJECT_ID(CONSTRAINT_SCHEMA + '.' + CONSTRAINT_NAME),
    'IsPrimaryKey'
) = 1
ORDER BY TABLE_NAME;


-- Query 93: Verify Foreign Keys
SELECT
    fk.name AS Foreign_Key_Name,
    tp.name AS Parent_Table,
    cp.name AS Parent_Column,
    tr.name AS Referenced_Table,
    cr.name AS Referenced_Column
FROM sys.foreign_keys AS fk
INNER JOIN sys.foreign_key_columns AS fkc
    ON fk.object_id = fkc.constraint_object_id
INNER JOIN sys.tables AS tp
    ON fkc.parent_object_id = tp.object_id
INNER JOIN sys.columns AS cp
    ON fkc.parent_object_id = cp.object_id
    AND fkc.parent_column_id = cp.column_id
INNER JOIN sys.tables AS tr
    ON fkc.referenced_object_id = tr.object_id
INNER JOIN sys.columns AS cr
    ON fkc.referenced_object_id = cr.object_id
    AND fkc.referenced_column_id = cr.column_id
ORDER BY Parent_Table;


-- Query 94: Verify all SkillSync Views
SELECT
    TABLE_SCHEMA,
    TABLE_NAME
FROM INFORMATION_SCHEMA.VIEWS
ORDER BY TABLE_NAME;

-- Query 95: Check all SkillSync Stored Procedures
SELECT
    ROUTINE_NAME,
    ROUTINE_TYPE
FROM INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_TYPE = 'PROCEDURE'
ORDER BY ROUTINE_NAME;



-- Query 96: Check all SkillSync Functions
SELECT
    ROUTINE_NAME,
    ROUTINE_TYPE
FROM INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_TYPE = 'FUNCTION'
ORDER BY ROUTINE_NAME;


-- Query 97: Final SkillSync Database Audit
SELECT
    (SELECT COUNT(*)
     FROM sys.tables) AS Total_Tables,

    (SELECT COUNT(*)
     FROM sys.views) AS Total_Views,

    (SELECT COUNT(*)
     FROM sys.procedures) AS Total_Procedures,

    (SELECT COUNT(*)
     FROM sys.objects
     WHERE type IN ('FN', 'IF', 'TF')
    ) AS Total_Functions;

