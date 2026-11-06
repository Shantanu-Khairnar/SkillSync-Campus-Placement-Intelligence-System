USE SKILLSYNC ;


CREATE TABLE Departments (
    Department_ID INT IDENTITY(1,1) PRIMARY KEY,
    Department_Name VARCHAR(100) NOT NULL UNIQUE,
    HOD_Name VARCHAR(100) NOT NULL
    );
   


   CREATE TABLE Students (
    Student_ID INT IDENTITY(1,1) PRIMARY KEY,
    Roll_No VARCHAR(20) NOT NULL UNIQUE,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Contact_Number VARCHAR(15) NOT NULL UNIQUE,
    CGPA DECIMAL(4,2) NOT NULL CHECK (CGPA >= 0 AND CGPA <= 10),
    Graduation_Year INT NOT NULL,
    Department_ID INT NOT NULL,
    Current_Status VARCHAR(20) DEFAULT 'Active',

    FOREIGN KEY (Department_ID)
        REFERENCES Departments(Department_ID)
);


   CREATE TABLE Skills(

    Skill_ID INT IDENTITY(1,1) PRIMARY KEY,
    Skill_Name VARCHAR(100) NOT NULL UNIQUE,
    Skill_Category VARCHAR(50) NOT NULL
);


CREATE TABLE Student_Skills (
    Student_Skill_ID INT IDENTITY(1,1) PRIMARY KEY,
    Student_ID INT NOT NULL,
    Skill_ID INT NOT NULL,
    Skill_Level VARCHAR(20) NOT NULL,
    Years_Experience DECIMAL(3,1) DEFAULT 0,

    CONSTRAINT FK_StudentSkills_Student
        FOREIGN KEY (Student_ID)
        REFERENCES Students(Student_ID),

    CONSTRAINT FK_StudentSkills_Skill
        FOREIGN KEY (Skill_ID)
        REFERENCES Skills(Skill_ID),

    CONSTRAINT UQ_Student_Skill
        UNIQUE (Student_ID, Skill_ID)
);

CREATE TABLE Projects (
    Project_ID INT IDENTITY(1,1) PRIMARY KEY,
    Project_Name VARCHAR(100) NOT NULL,
    Description VARCHAR(500),
    Technology_Used VARCHAR(200),
    GitHub_Link VARCHAR(255),
    Project_Status VARCHAR(20)
        CHECK (Project_Status IN ('Completed','Ongoing','On Hold')),
    Start_Date DATE,
    End_Date DATE
);

CREATE TABLE Student_Projects (

    Student_Project_ID INT IDENTITY(1,1) PRIMARY KEY,

    Student_ID INT NOT NULL,
    Project_ID INT NOT NULL,

    Role VARCHAR(50) NOT NULL,
    Contribution_Percentage DECIMAL(5,2),

    CONSTRAINT FK_StudentProjects_Student
        FOREIGN KEY (Student_ID)
        REFERENCES Students(Student_ID),

    CONSTRAINT FK_StudentProjects_Project
        FOREIGN KEY (Project_ID)
        REFERENCES Projects(Project_ID),

    CONSTRAINT UQ_Student_Project
        UNIQUE (Student_ID, Project_ID)
);

CREATE TABLE Companies (

    Company_ID INT IDENTITY(1,1) PRIMARY KEY,

    Company_Name VARCHAR(100) NOT NULL,

    Industry VARCHAR(50) NOT NULL,

    Location VARCHAR(100) NOT NULL,

    Package_LPA DECIMAL(5,2) NOT NULL
        CHECK (Package_LPA > 0),

    Company_Type VARCHAR(30)
        CHECK (Company_Type IN ('Startup','MNC','Product','Service'))

);


CREATE TABLE Applications (

    Application_ID INT IDENTITY(1,1) PRIMARY KEY,

    Student_ID INT NOT NULL,

    Company_ID INT NOT NULL,

    Application_Date DATE NOT NULL,

    Status VARCHAR(20) NOT NULL
        CHECK (Status IN ('Applied','Shortlisted','Rejected','Selected')),

    CONSTRAINT FK_Applications_Student
        FOREIGN KEY (Student_ID)
        REFERENCES Students(Student_ID),

    CONSTRAINT FK_Applications_Company
        FOREIGN KEY (Company_ID)
        REFERENCES Companies(Company_ID),

    CONSTRAINT UQ_Student_Company
        UNIQUE (Student_ID, Company_ID)

);

CREATE TABLE Interview_Rounds (

    Interview_ID INT IDENTITY(1,1) PRIMARY KEY,

    Application_ID INT NOT NULL,

    Round_Name VARCHAR(50) NOT NULL
        CHECK (Round_Name IN ('Aptitude','Technical','HR','Managerial')),

    Round_Date DATE,

    Status VARCHAR(20) NOT NULL
        CHECK (Status IN ('Pending','Cleared','Failed')),

    Score DECIMAL(5,2),

    CONSTRAINT FK_InterviewRounds_Application
        FOREIGN KEY (Application_ID)
        REFERENCES Applications(Application_ID)

);


CREATE TABLE Job_Offers (

    Offer_ID INT IDENTITY(1,1) PRIMARY KEY,

    Application_ID INT NOT NULL,

    Offer_Date DATE NOT NULL,

    Joining_Date DATE,

    Package_Offered DECIMAL(5,2)
        CHECK (Package_Offered > 0),

    Offer_Status VARCHAR(20) NOT NULL
        CHECK (Offer_Status IN ('Accepted','Rejected','Pending')),

    CONSTRAINT FK_JobOffers_Application
        FOREIGN KEY (Application_ID)
        REFERENCES Applications(Application_ID)

);
