use project;
SELECT * FROM project.hr_analytics;
#Question 1: For different departments find the mean age of the employees who have left the company.

select Department ,
round(avg(age),2) Average_age 
from hr_analytics where attrition="Yes" 
group by 1 order by 1;

#Question 2: For different departments find the distance from home which is covered by the maximum number of employees to get to the company.
Select Department, Attrition, avg(distancefromhome) Average_distance_from_home 
from hr_analytics 
group by 1,2 order by 1;

#Question 3:The company wants to compare the average salary of employees who have left the job and those who haven’t. 
#Do the analysis for different Departments. 

Select Department, Attrition,avg(Monthlyincome) as Salary 
from hr_analytics group by 1,2 order by 1;

# Question 4:The company wants to analyze the median of job satisfaction ratings for different marital status.

Select Department, MaritalStatus, Attrition, 
avg(JobSatisfaction) Rating_of_Satisfaction 
from hr_analytics group by 1,2,3 order by 1;

#Question 5: Find the mean of environment satisfaction rating for the employees with different Education Field.
SELECT * FROM project.hr_analytics;
Select EducationField, Attrition, Avg(EnvironmentSatisfaction) as Enviroment_satisfaction_rating 
from hr_analytics group by 1,2 order by 1;

# #Question 6: The company wants to know if the employees who have spent good number of years in their company are leaving the company 
# or not They want to know the average year spent in the company by the employees in different departments.
select Department ,
attrition,avg(YearsAtCompany) as Years_at_company,
count(EmpID) as Count_of_employees
from hr_analytics group by 1,2
order by 1;

#Question 7: Relation between the attrition, gender and the  work-life balance ratings for the employees across jobrole 

Select Jobrole, attrition, Gender, avg(Worklifebalance) as Work_life_balance_rating ,
count(Empid) as Count_of_employees
from hr_analytics group by 1,2,3
order by 1;

# Question 8: Create three different categories depending on the employee’s age. If the employee’s age 
-- is below 25 then the category would be “Fresher”. If the employee’s age is between 25 and 50 then 
-- “Intermediate” and if it is above 50 then “Expert”

select Department, case when age<25 then "Fresher" 
when age>50 then "Expert"
else "Intermediate"
end as "Category", count(empID) as Count_of_employees
from hr_analytics
group by 1,2 order by 1;
