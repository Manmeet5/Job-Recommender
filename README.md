# Job-Recommender
                 
                 
Data Description: The database contains all the employer and candidate information. The candidate table stores basic candidate information like first name, middle name, last name, date of birth, and email. The education table stores candidate educational background like school/university name, degree level, major, start date and end date. The skill table stores candidate skills which include both technical and other skills. The experience table stores candidate previous job experience, this table contains company name, job title, start date, end date and description. The requirement table stores candidate requirements like minimum salary, maximum salary and desired location. The employer table stores basic employer information like name, email and location. The job table stores the job information like job title, minimum salary, maximum salary, skills, description, qualification, date posted and expiration date. The address table store candidate’s and employers address. And application table stores the application ID, candidate ID, job ID, employer ID and applied date. All the tables contain individual primary and foreign key which makes it easy for foreign key values to refer back to corresponding primary key values.

                                                           
Problem Statement: How can companies and people looking for jobs reduce the recruitment time and improve the match between candidates and jobs?
                                                               
                                                                 
Methodology: The strategy is to match the required skills and candidate skills and recommend jobs to the candidates and recommend candidates to the employers. The database and store procedures are implemented in MySQL. In stored procedures a function is created which takes in the candidate skills and required skills and looks for matches and if the skills are matched than the function outputs the candidate ID, job title and employer ID. 
 	
                                                                
Conclusion: In this study a database is created for candidate and employer information. Candidate skills and the required skills served as a basis to recommendation system. The results are based on the skills only. 

                                                                
Future Work: Farther research will implement a complex recommender approach which factors Candidate requirements, qualification, experience and employer’s requirements can improve the matching quality.

  
