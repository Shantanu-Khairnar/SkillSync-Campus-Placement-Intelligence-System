use SKILLSYNC;

INSERT INTO Departments
      (Department_Name, HOD_Name)

VALUES
    ('Information Technology','Dr.Amit Sharma'),
    ('Computer Engineering','Dr.Rajesh Patil'),
    ('Electronics Engineering','Dr.Sneha Kulkarni'),
    ('Mechanical Engineering','Dr.Prakash Joshi'), 
    ('Artifical Intelligence & Data Science','Dr.Neha Deshmukh');

INSERT INTO Students
(
      Roll_no,
      First_name,
      Last_name,
      Dob,
      Gender,
      Email,
      Contact_number,
      CGPA,
      Graduation_year,
      Department_ID,
      Current_Status
)
VALUES
('IT001','Shantanu','Khairnar','2006-08-12','Male',
  'shantanu.khairnar@gmail.com','98765432010',7.94,2028,1,'Activate'),

('IT002', 'Rahul', 'Patil', '2005-03-15', 'Male',
 'rahul.patil@gmail.com', '9876543211', 8.20, 2027, 1, 'Active'),

('CE001', 'Priya', 'Sharma', '2005-07-20', 'Female',
 'priya.sharma@gmail.com', '9876543212', 8.65, 2027, 2, 'Active'),

('CE002', 'Amit', 'Jadhav', '2005-11-10', 'Male',
 'amit.jadhav@gmail.com', '9876543213', 7.80, 2027, 2, 'Active'),

('EC001', 'Snehal', 'Pawar', '2005-05-25', 'Female',
 'snehal.pawar@gmail.com', '9876543214', 8.10, 2027, 3, 'Active'),

('ME001', 'Rohan', 'Deshmukh', '2004-09-18', 'Male',
 'rohan.deshmukh@gmail.com', '9876543215', 7.50, 2027, 4, 'Active'),

('AI001', 'Vedika', 'Karpe', '2005-02-14', 'Female',
 'vedika.karpe@gmail.com', '9876543216', 8.40, 2027, 5, 'Active'),

('AI002', 'Aditya', 'More', '2005-12-05', 'Male',
 'aditya.more@gmail.com', '9876543217', 9.10, 2027, 5, 'Active');


 INSERT INTO Skills 
 (Skill_Name, Skill_Category)

VALUES
('SQL', 'Database'),
('Python', 'Programming'),
('Power BI', 'Data Visualization'),
('Excel', 'Data Analysis'),
('Machine Learning', 'Artificial Intelligence'),
('Data Analysis', 'Analytics'),
('Java', 'Programming'),
('C++', 'Programming'),
('Communication', 'Soft Skills'),
('Problem Solving', 'Soft Skills');


SELECT * FROM Student_Skills;

SELECT * FROM Skills;


INSERT INTO Student_Skills
(Student_ID, Skill_ID, Skill_Level, Years_Experience)
VALUES
-- Shantanu (Student_ID = 6)
(6, 1, 'Intermediate', 1.5),
(6, 2, 'Intermediate', 1.0),
(6, 3, 'Beginner', 0.5),
(6, 4, 'Intermediate', 2.0),

-- Rahul (Student_ID = 7)
(7, 1, 'Beginner', 1.0),
(7, 7, 'Intermediate', 2.0),

-- Priya (Student_ID = 8)
(8, 2, 'Advanced', 2.0),
(8, 3, 'Intermediate', 1.5),
(8, 6, 'Advanced', 2.0),

-- Amit (Student_ID = 9)
(9, 7, 'Advanced', 2.5),
(9, 8, 'Intermediate', 2.0),
(9, 10, 'Advanced', 2.0),

-- Snehal (Student_ID = 10)
(10, 1, 'Intermediate', 1.5),
(10, 4, 'Advanced', 2.0),
(10, 6, 'Intermediate', 1.5),

-- Rohan (Student_ID = 11)
(11, 7, 'Advanced', 3.0),
(11, 8, 'Intermediate', 2.5),
(11, 9, 'Intermediate', 2.0),

-- Vedika (Student_ID = 12)
(12, 2, 'Intermediate', 1.5),
(12, 3, 'Advanced', 2.0),
(12, 4, 'Advanced', 2.5),
(12, 9, 'Advanced', 2.0),

-- Aditya (Student_ID = 13)
(13, 5, 'Intermediate', 1.0),
(13, 6, 'Advanced', 2.0),
(13, 10, 'Advanced', 2.0);


INSERT INTO Projects
(Project_Name, Description, Technology_Used, GitHub_Link, Project_Status, Start_Date, End_Date)

VALUES

('SkillSync',
 'Campus placement intelligence system for managing student skills and placement data',
 'SQL Server',
 NULL,
 'Ongoing',
 '2026-07-01',
 NULL),

('Sales Analysis Dashboard',
 'Analysis of sales data and business performance',
 'SQL, Power BI',
 NULL,
 'Completed',
 '2026-05-01',
 '2026-06-15'),

('Student Performance Analysis',
 'Analysis of student academic performance and CGPA',
 'Python, SQL, Excel',
 NULL,
 'Completed',
 '2026-04-10',
 '2026-05-20'),

('E-Commerce Data Analysis',
 'Analysis of customer orders and product sales',
 'SQL, Power BI',
 NULL,
 'Ongoing',
 '2026-08-01',
 NULL),

('Library Management System',
 'Database system for managing books and students',
 'SQL Server',
 NULL,
 'Completed',
 '2026-03-01',
 '2026-04-05'),

('Employee Management System',
 'System for managing employee records and departments',
 'SQL Server',
 NULL,
 'Completed',
 '2026-02-01',
 '2026-03-10'),

('Movie Recommendation System',
 'Recommendation system based on user preferences',
 'Python, Machine Learning',
 NULL,
 'Completed',
 '2026-01-15',
 '2026-03-30'),

('Customer Churn Analysis',
 'Analysis to identify customers likely to leave',
 'Python, SQL, Power BI',
 NULL,
 'Ongoing',
 '2026-07-15',
 NULL);

 INSERT INTO Student_Projects
(Student_ID, Project_ID, Role, Contribution_Percentage)

VALUES

(6, 1, 'Database Developer', 100),

(7, 2, 'Data Analyst', 100),

(8, 3, 'Data Analyst', 100),

(9, 4, 'Data Analyst', 100),

(10, 5, 'Database Developer', 100),

(11, 6, 'Backend Developer', 100),

(12, 7, 'Machine Learning Developer', 100),

(13, 8, 'Data Analyst', 100);


INSERT INTO Companies
(Company_Name, Industry, Location, Package_LPA, Company_Type)

VALUES

('TCS', 'Information Technology', 'Mumbai', 7.0, 'Service'),

('Infosys', 'Information Technology', 'Pune', 6.5, 'Service'),

('Accenture', 'Information Technology', 'Mumbai', 8.0, 'Service'),

('Deloitte', 'Consulting', 'Pune', 9.0, 'Service'),

('Microsoft', 'Technology', 'Hyderabad', 25.0, 'Product'),

('Google', 'Technology', 'Bangalore', 30.0, 'Product'),

('Cognizant', 'Information Technology', 'Pune', 7.5, 'Service'),

('Wipro', 'Information Technology', 'Mumbai', 6.0, 'Service');


INSERT INTO Applications
(Student_ID, Company_ID, Application_Date, Status)
VALUES
(6, 2, '2026-07-01', 'Applied'),
(6, 6, '2026-07-03', 'Shortlisted'),

(7, 3, '2026-07-05', 'Applied'),
(7, 4, '2026-07-07', 'Shortlisted'),

(8, 5, '2026-07-10', 'Rejected'),
(8, 6, '2026-07-11', 'Applied'),

(9, 3, '2026-07-12', 'Shortlisted'),
(9, 7, '2026-07-14', 'Applied'),

(10, 4, '2026-07-15', 'Applied'),
(10, 8, '2026-07-18', 'Shortlisted'),

(11, 5, '2026-07-20', 'Applied'),
(11, 9, '2026-07-22', 'Rejected'),

(12, 6, '2026-07-25', 'Applied'),
(12, 7, '2026-07-27', 'Shortlisted'),

(13, 8, '2026-07-30', 'Applied'),
(13, 9, '2026-08-02', 'Shortlisted');


INSERT INTO Interview_Rounds
(Application_ID, Round_Name, Round_Date, Status, Score)
VALUES
(5, 'Technical', '2026-07-05', 'Cleared', 85),
(6, 'HR', '2026-07-06', 'Cleared', 90),
(7, 'Technical', '2026-07-07', 'Failed', 45),
(8, 'Aptitude', '2026-07-08', 'Cleared', 80),
(9, 'Managerial', '2026-07-10', 'Pending', 75),
(10, 'Technical', '2026-07-12', 'Cleared', 88),
(5, 'HR', '2026-07-13', 'Cleared', 82),
(6, 'Managerial', '2026-07-14', 'Pending', 78);


INSERT INTO Job_Offers
(Application_ID, Offer_Date, Joining_Date, Package_Offered, Offer_Status)
VALUES
(5, '2026-08-01', '2026-09-01', 7.00, 'Accepted'),
(6, '2026-08-03', '2026-09-05', 6.50, 'Accepted'),
(7, '2026-08-05', '2026-09-10', 8.00, 'Pending'),
(8, '2026-08-07', '2026-09-15', 7.50, 'Accepted'),
(9, '2026-08-10', '2026-10-01', 9.00, 'Accepted'),
(10, '2026-08-12', '2026-10-05', 6.00, 'Rejected'),
(11, '2026-08-15', '2026-10-10', 25.00, 'Accepted'),
(12, '2026-08-18', '2026-10-15', 30.00, 'Pending');


