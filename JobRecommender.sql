-- Database

CREATE DATABASE jobDB;
USE jobDB;

CREATE TABLE candidate (
   ID INT AUTO_INCREMENT PRIMARY KEY,
   FirstName VARCHAR(50),
   MiddleName VARCHAR(50) NULL,
   LastName VARCHAR(50),
   DOB DATE,
   Email VARCHAR(50) NOT NULL,
   Phone_Number VARCHAR(20) NOT NULL,
   Gender ENUM('Male','Female','Other'),
   LastLogin DATE
);



CREATE TABLE education (
   ID INT AUTO_INCREMENT PRIMARY KEY,
   Candidate_ID INT NOT NULL,
   School_Name VARCHAR(50),
   Degree_Level VARCHAR(20),
   Major  VARCHAR(50),
   GPA DECIMAL(3,2),
   Degree_Start_Date DATE,
   Degree_End_Date DATE,
   FOREIGN KEY(Candidate_ID) REFERENCES candidate(ID)
);

CREATE TABLE skills (
   ID INT AUTO_INCREMENT PRIMARY KEY ,
   Candidate_ID INT NOT NULL,
   candidate_skills  TEXT,
   FOREIGN KEY(Candidate_ID) REFERENCES candidate(ID)
);


CREATE TABLE experience (
   ID INT AUTO_INCREMENT PRIMARY KEY,
   Candidate_ID INT NOT NULL,
   Company_Name VARCHAR(255),
   Job_Title VARCHAR(255),
   Start_Date DATE,
   End_Date DATE NULL,
   Currently_Employed ENUM('Yes', 'No'),
   Description TEXT,
   FOREIGN KEY(Candidate_ID) REFERENCES candidate(ID)
);

CREATE TABLE candidate_requirements (
   ID INT AUTO_INCREMENT PRIMARY KEY,
   Candidate_ID INT NOT NULL,
   Desired_Min_Salary INT,
   Desired_Max_Salary INT,
   Desired_State VARCHAR(20),
   Desired_City VARCHAR(15) NULL,
   FOREIGN KEY(Candidate_ID) REFERENCES candidate(ID)
);

CREATE TABLE employer (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(150),
  Location VARCHAR(255),
  Email VARCHAR(50)
);

CREATE TABLE job  (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  Employer_ID INT NOT NULL,
  Job_Title VARCHAR(150),
  Min_Salary INT,
  Max_Salary INT,
  Location VARCHAR(255),
  job_skills TEXT,
  Description TEXT,
  Qalification TEXT,
  Date_Posted DATE,
  Expiration_Date DATE,
  FOREIGN KEY(Employer_ID) REFERENCES employer(ID)
);

CREATE TABLE application (
   Appication_ID INT AUTO_INCREMENT PRIMARY KEY,
   Candidate_ID INT,
   Job_ID INT,
   Employer_ID INT,
   Date_Applied DATE,
   FOREIGN KEY(Candidate_ID) REFERENCES candidate(ID),
   FOREIGN KEY(Job_ID) REFERENCES job(ID),
   FOREIGN KEY(Employer_ID) REFERENCES employer(ID)
);

CREATE TABLE address (
   ID  INT AUTO_INCREMENT PRIMARY KEY,
   Candidate_ID INT NOT NULL,
   Employer_ID INT NOT NULL,
   Priority ENUM('Primary','Other'),
   Street1 VARCHAR(255),
   Street2 VARCHAR(100),
   State VARCHAR(20),
   City VARCHAR(15),
   ZIP VARCHAR(10),
   FOREIGN KEY(Candidate_ID) REFERENCES candidate(ID),
   FOREIGN KEY(Employer_ID) REFERENCES employer(ID)
);


--- Data

INSERT INTO candidate (FirstName,MiddleName,LastName,DOB,Email,Phone_Number,Gender, LastLogin)
VALUES('Manmeet','Singh','Chawla','1994/08/23','mchawla@stu.edu','7169061679','Male','2019/05/06')
,('Kathryn','','Kaira','1996/01/1','Kaira@gmail.com','9878320743','Female','2019/05/06')
,('Fern', '','nando','1976/11/3','fern@gmail.com','9853023345','Female','2019/05/06')
,('Constance','','Lee','1985/12/4','Constance@gmail.com','9928023345','Male','2019/05/06')
,('Tanya','','Melanie','1969/12/4','Tanya@gmail.com','9928089345','Female','2019/05/06')
,('Mollie','Leila','Kitty','1998/12/4','Leila@gmail.com','9854566857','Male','2019/05/06')
,('Holly','Aysha','Cleo','1985/12/4','Aysha@gmail.com','7986523152','Female','2019/05/06')
,('Kitty','Vanessa','nando','1996/01/1','Vanessa@gmail.com','9854566857','Female','2019/05/06')
,('Rosa','','Rowan','1985/5/13','Rosa@gmail.com','7986523152','Female','2019/05/06')
,('Alexia ','Singh','Lexie','1974/08/23','Lexie@stu.edu','7169061679','Female','2019/05/06')
,('Shane ','random ','Caroline','1995/5/13','Shane@gmail.com','858698547','Male','2019/05/06')
,('Julia  ','random ','Jules','1977/5/13','Julia@gmail.com','858698547','Female','2019/05/06')
,('Kayleigh  ','random ','Kaelyn','1978/5/13','Kayleigh@gmail.com','858698547','Female','2019/05/06')
,('Francesca  ','random ','Livia','1955/5/13','Francesca@gmail.com','858698547','Female','2019/05/06')
,('Hafsah ','random ','Julia','1989/5/13','Hafsah@gmail.com','858698547','Female','2019/05/06')
,('Olive ','random ','Livia','1975/5/13','Livia@gmail.com','858698547','Female','2019/05/06')
,('Millicent  ','random ','Millie','1999/5/13','Millicent @gmail.com','858698547','Female','2019/05/06')
,('Rhea ','random ','Courtney','1994/5/13','Courtney@gmail.com','858698547','Female','2019/05/06')
,('Erica ','random ','Aleena','1995/5/13','Aleena@gmail.com','858698547','Female','2019/05/06')
,('Aoife ','random ','Livia','1988/5/13','Aoife@gmail.com','305698547','Male','2019/05/06')
,('Betty  ','random ','Violet','1947/5/13','Violet@gmail.com','965898547','Female','2019/05/06')
,('Patricia ','random ','Bethany','1985/5/13','Bethany@gmail.com','785678547','Female','2019/05/06');


INSERT INTO experience (Candidate_ID,Company_Name,Job_Title,Start_Date,End_Date,Currently_Employed,Description)
VALUES  (1,'Amazon','Data Analyst', '2017/08/10','','Yes',' Data Analyst interprets data')
,(2,'Walmart','Sales Manager', '2015/07/14','2019/01/05','No','Sales managers lead a sales team by providing guidance')
,(3,'McKesson','Marketing Intern', '2017/07/14','2012/01/05','No','Developing the marketing strategy for the company')
,(4,'Amazon','Sales representative', '2003/07/10','2012/05/25','No',' Business Analyst interprets data')
,(4,'Google','HR', '2019/02/10','','Yes',' HR recruiter')
,(5,'Apple','Web Developer', '2007/08/10','','Yes',' web developer creates web applications')
,(6,'UnitedHealth Group','Web Developer', '2007/08/10','2009/01/23','No',' web developer creates web applications')
,(7,'McKesson','Associate', '2015/08/10','2017/01/23','No',' Associate creates web applications')
,(8,'Walmart','Intern', '2017/08/10','2017/012/23','No','')
,(8,'At&t','Software Developer', '2010/08/10','','Yes',' Software Developer')
,(9,'CVS','Branch Manager', '2019/02/10','','Yes','Looking after accounts and employees')
,(11,'General  Motors','Mechnical Engineer', '2004/08/10','2009/01/23','No','Designing Cars')
,(13,'oracle',' SQL Developer', '2018/08/10','','Yes',' SQL developer creates web applications')
,(17,'Apple Group','Data Intern', '2016/08/10','2016/12/23','No',' Data Intern interprets data')
,(18,'McKesson','Web Developer', '2007/08/10','2009/01/23','No',' web developer creates web applications')
,(19,'Google','HR', '2019/02/10','','Yes',' HR recruiter')
,(22,'At&t','Software Engineer', '2010/08/10','','Yes',' Software Engineer');




INSERT INTO education (Candidate_ID,School_Name,Degree_Level,Major,GPA,Degree_Start_Date,Degree_End_Date)
VALUES(1,"STU","BS","Math",3.25,"2014/08/26","2019/04/25")
,(3,"STU","MS","Math",3.5,"2012/08/26","2019/04/25")
,(2,"MIT","BS","CS",3.8,"2014/08/26","2019/04/25")
,(4,"UM","Big Data Analytics","Data Science",3.25,"2017/08/26","2018/04/25")
,(5,"FIU","BS","Math",3.25,"2014/08/26","2019/04/25")
,(6,"FAU","MS","CS",3.75,"2009/08/26","2015/04/25")
,(6,"STU","BS","CS",3.9,"2011/08/26","2015/04/25")
,(7,"Gateway Technical College","BS","Chemistry",3.8,"2012/08/26","2017/04/25")
,(8,"STU","BS","Math",3.25,"2014/08/26","2019/04/25")
,(9,"STU","BS","CS",3.25,"2014/08/26","2019/04/25")
,(11,"Alaska Methodist University","BA","Arts",3.25,"1996/08/26","2002/04/25")
,(11,"California Western","PHD","CS",3.8,"2003/08/26","2018/04/25")
,(12,"Adams State University","BS","CS",3.5,"2011/08/26","2019/04/25")
,(13,"FIU","MS","Big Data Analytics",3.9,"2015/08/26","2017/04/25")
,(13,"FPU","BS","CS",3.3,"2012/08/26","2015/04/25")
,(14,"STU","BS","Math",3.1,"2006/08/26","2019/04/25")
,(15,"UM","BS","communications",2.9,"2003/08/26","2019/04/25")
,(16,"FAU","BS","Math",2.8,"2009/08/26","2019/04/25")
,(17,"FMU","BS","Physics",3.28,"2014/08/26","2019/04/25")
,(18,"STU","BS","CS",3.85,"2011/08/26","2019/04/25")
,(18,"Adams State University","BS","communications",4.0,"2012/08/26","2019/04/25")
,(19,"UM","BS","Math",3.89,"2014/08/26","2019/04/25")
,(20,"STU","BS","Big Data Analytics",3.58,"2014/08/26","2019/04/25")
,(21,"MIT","BS","Chemistry",3.22,"2014/08/26","2019/04/25")
,(22,"Gateway Technical College","BS","Physics",3.48,"2014/08/26","2019/04/25")
,(19,"FMU","BS","Physics",3.88,"2014/08/26","2019/04/25");

INSERT INTO skills (Candidate_ID,candidate_skills)
VALUES(1,"Java, Ruby, PHP, Python, R, Stats,Data Visualization, Machine Learning")
,(2,"Java, Ruby, PHP, Python, R, Stats,Data Visualization, Machine Learning")
,(3,"Analytics, Graphic Design, Microsoft Office, Spreadsheets, Marketing, Data Visualization")
,(4,"Java, Ruby, PHP, Python, R, Stats, Microsoft Office, Spreadsheets, Data Visualization, Machine Learning")
,(5,"c++, Javascript, Ruby, R, Stats, PHP, Python, Graphic Design, Microsoft Office, Spreadsheets ")
,(6," Fortran, Data Structures, Scala, SQL, c++, Javascript, Ruby, R, Stats, PHP, Python")
,(7,"Microsoft Office, Spreadsheets, Data Visualization, Machine Learning, c++, Javascript, Ruby, R, Stats, PHP, Python")
,(8,"Graphic Design, Microsoft Office, Spreadsheets, Marketing, c++, Javascript, Ruby, R, Stats, PHP, Python")
,(9,"c++, Javascript, Ruby, R, Stats, PHP, Python")
,(10,"c++, Javascript, Ruby, R, Stats, PHP, Python, Microsoft Office, Microsoft Excel, Microsoft PowerPoint, Email Management")
,(11,"c++, Javascript, Ruby, R, Stats, PHP, Python")
,(13,"Java, Ruby, PHP, Python, R, Stats,Data Visualization, Machine Learning")
,(15,"Microsoft Office, Microsoft Excel, Microsoft PowerPoint, Email Management, Information Management, Data Entry, Data Visualization, Machine Learning")
,(16,"Ruby, R, Stats, PHP, Python, Node.js ")
,(18,"c++, Javascript, Ruby, R, Stats, PHP, Python")
,(19,"Content Management Systems (CMS), Cascading Style Sheets (CSS), Automated Marketing, Software Digital Media, Email Marketing, Website Analytics, Search Engine Optimization (SEO), Web Page Design, Social Media Management")
,(20,"Java, Ruby, PHP, Python, R, Stats,Data Visualization, Machine Learning")
,(21,"Microsoft Office, Microsoft Excel, Microsoft PowerPoint, Email Management, Information Management, Data Entry, Data Visualization, Machine Learning, Stats, PHP, Python")
,(22,"Fortran, Data Structures, Scala, SQL, c++, Javascript, Ruby, R, Stats, PHP, Python")
,(8,"Automated Marketing, Software Digital Media, Email Marketing, Website Analytics, Stats, PHP, Python")
,(13,"Analytics, Graphic Design, Microsoft Office, Spreadsheets, Marketing, Data Visualization, Python");


INSERT INTO candidate_requirements (Candidate_ID, Desired_Min_Salary, Desired_Max_Salary, Desired_State, Desired_City )
VALUES(1,50000,75000,"Washington","Seattle")
,(5,80000,100000,"Texas","Huston")
,(15,30000,40000,"California","Sacramento")
,(4,45000,55000,"Florida","Jackson ville")
,(9,120000,150000,"Washington","Seattle")
,(7,65000,100000,"California","Sacramento")
,(12,84000,90000,"California","Sacramento")
,(21,50000,56000,"Carolina","Charleston")
,(13,35000,75000,"Washington","Seattle");



INSERT INTO employer (Name, Location, Email)
VALUES ("Amazon","Seattle","amazon@amazon.com")
,("Google","Sacramento", "google@google.com");


INSERT INTO job (Employer_ID,Job_Title, Min_Salary, Max_Salary, Location, job_skills, Description, Qalification, Date_Posted, Expiration_Date)
VALUES(1,"Data Analyst",50000,75000,"Seattle", "Java, Ruby, PHP, Python, R, Stats,Data Visualization, Machine Learning","A data analyst collects and stores data on sales numbers, market research, logistics, linguistics, or other behaviors. They bring technical expertise to ensure the quality and accuracy of that data, than process, design and present it in ways to help people, businesses, and organizations make better decisions.","MS","2019/05/01","2019/06/01")
,(2,"Software engineer",75000,100000,"Sacramento","c++, Javascript, Ruby, R, Stats, PHP, Python","Software engineer", "MS","2019/05/01","2019/06/01");




INSERT INTO application(Candidate_ID,Job_ID,Employer_ID,Date_Applied) 
VALUES(1,1,1,'2019/05/02')
,(2,1,1,'2019/05/01')
,(2,2,2,'2019/05/01')
,(3,1,1,'2019/05/03')
,(4,1,1,'2019/05/01')
,(4,2,2,'2019/05/01')
,(5,2,2,'2019/05/06')
,(6,2,2,'2019/05/06') 
,(22,2,2,'2019/05/06')
,(14,1,1,'2019/05/06')
,(17,2,2,'2019/05/06')
,(21,1,1,'2019/05/06')
,(18,1,1,'2019/05/06');


--- Store Procedure

 DELIMITER //
 CREATE PROCEDURE getjobs()
   BEGIN
   SELECT Candidate_ID, Job_Title, Employer_ID
FROM job
    Join skills
    ON LOCATE(LOWER(candidate_skills), LOWER(job_skills)) > 0
    Order By Employer_ID;
   END //
 DELIMITER ;