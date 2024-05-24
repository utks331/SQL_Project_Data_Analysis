/*
Question: Top skills based on salary for my role ?
-Look at the average salary associated with each skill for data analyst positions.
-Focuses on roles with specified salaries, regardless of location.
-Why? It reveals how different skills impact salary levels for Data Analysts and help identify the most financially rewarding skills to acquire or improve.
*/

SELECT
job_postings_fact.job_title_short,
job_postings_fact.job_location,
skills,
ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM 
job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
GROUP BY
job_postings_fact.job_title_short,
job_postings_fact.job_location,
skills
ORDER BY
    avg_salary DESC
LIMIT 10


/*
Here is the breakdown of the top skills based on salary for our desired role, Data Analyst.
-Technical Proficiency Drives High Salaries: Advanced technical skills, particularly in database management (e.g., Oracle), statistical analysis tools (e.g., MATLAB, SAS), and workflow automation (e.g., Kafka, Airflow), are highly compensated. These skills are crucial for managing, analyzing, and processing large datasets efficiently.
-Regional Salary Variability: There is notable salary variation based on location. For example, Belarus shows unusually high salaries for data analysts compared to typical global standards, potentially due to currency differences or specific industry demands. In contrast, major US tech hubs like Austin, TX, and Sunnyvale, CA, also offer competitive salaries, particularly for specialized technical skills.
-Importance of Project Management and Organizational Skills:Beyond technical expertise, skills in project management tools (e.g., Asana) are well-compensated, especially in tech-centric regions like San Francisco. This reflects the growing importance of organizational and project management capabilities in data-driven roles.

Overall, data analysts with a strong mix of technical skills, particularly in database management, statistical analysis, and workflow automation, are well-compensated across various locations. Additionally, project management and organizational skills are also highly valued in certain regions.

[
  {
    "job_title_short": "Data Analyst",
    "job_location": "Belarus",
    "skills": "svn",
    "avg_salary": "400000"
  },
  {
    "job_title_short": "Data Analyst",
    "job_location": "Belarus",
    "skills": "kafka",
    "avg_salary": "400000"
  },
  {
    "job_title_short": "Data Analyst",
    "job_location": "Belarus",
    "skills": "git",
    "avg_salary": "400000"
  },
  {
    "job_title_short": "Data Analyst",
    "job_location": "Belarus",
    "skills": "oracle",
    "avg_salary": "400000"
  },
  {
    "job_title_short": "Data Analyst",
    "job_location": "Belarus",
    "skills": "linux",
    "avg_salary": "400000"
  },
  {
    "job_title_short": "Data Analyst",
    "job_location": "Austin, TX",
    "skills": "matlab",
    "avg_salary": "375000"
  },
  {
    "job_title_short": "Data Analyst",
    "job_location": "Austin, TX",
    "skills": "airflow",
    "avg_salary": "262500"
  },
  {
    "job_title_short": "Data Analyst",
    "job_location": "San Francisco, CA",
    "skills": "asana",
    "avg_salary": "235000"
  },
  {
    "job_title_short": "Data Analyst",
    "job_location": "Sunnyvale, CA",
    "skills": "oracle",
    "avg_salary": "234000"
  },
  {
    "job_title_short": "Data Analyst",
    "job_location": "Sunnyvale, CA",
    "skills": "sas",
    "avg_salary": "234000"
  }
]
*/







