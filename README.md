 # Introduction
Dive into the data job market! Focusing on Data Analyst roles, this project explores top paying jobs, in-demand skills and where high demand meets high salary in data analytics.

SQL Queries: check them out here at project_sql folder

# Background
Driven by the quest to navigate the data analyst job market more effectiely, this project was developed to pinpoint top-paid and in-demand skills, streamlining others work to find optimal jobs.

Data hails from Sql Course. It's packed with insights on job titles, salaries, locations and essential skills.

# Tools I used
For my deep dive into the data analyst job market, I harnessed the power of these key tools.

**SQL :** Backbone of the analysis, helped me query the database and unearth critical insights.

**PostgreSQL :** The chosen database management system, ideal for handling the job posting data.

**V.S Code :** My go-to for executing queries and database management.

**Git and Github :** Essential for version control and sharing my sql scripts and analysis, ensuring collaboration and project-tracking.
The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job markets. Here's how I approached each question:

### 1. Top paying Data Analyst Jobs

To identify the highest paying roles. I filtered data analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunities in the field.
```sql
SELECT
    job_id,
    company_dim.name AS company_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title = 'Data Analyst' AND salary_year_avg IS NOT NULL AND job_location = 'Anywhere'
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```
Here's the breakdown of the top data analyst jobs in 2023

#### 1. Top Companies Hiring:

- **Mantys**

- **Get It Recruit (Information Technology and Healthcare divisions)**

- **Plexus Resource Solutions**

- **CyberCoders**

#### 2. Average Salary Range:

Salaries for data analyst positions ranged significantly, with top offers including: 
- **Mantys:** $650,000 per year

- **Get It Recruit (Information Technology) :** $165,000 per year

- **Plexus Resource Solutions :** $165,000 per year

- **Get It Recruit (Healthcare) :** $151,500 per year

- **CyberCoders :** $145,000 per year

**Job Locations and Schedules:**

All listed positions were remote (listed as "Anywhere"). All positions were full-time roles.

Visualization 
[Top paying Jobs](assets/graph.jpg)

*Bar Graph visualizing the top paying data analyst jobs based on the companies and the average salary range.*



### 2. Skills for top paying jobs
To understand what skills are required for the top paying jobs, I joined the job postings with the skills data, providing the skills required for the top paying jobs.
```sql

WITH top_paying_jobs AS(
    SELECT
        job_postings_fact.job_id,
        company_dim.name AS company_name,
        job_title,
        salary_year_avg
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title = 'Data Analyst' 
        AND salary_year_avg IS NOT NULL 
        AND job_location = 'Anywhere'
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT
top_paying_jobs.*,
skills,
type
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;
```
Here's the breakdown of the most demanded skills for the top 10 highest paying data analyst jobs in 2023

- **SQL** with the count of 6.

- **Python** follows closely with a bold count of 7.

- **Excel** with the count of 3.

Visualization
[Top paying skills for data analysts](assets/Top%20paying%20skills%20for%20data%20analysts.png)
*Clustered column chart visualizing the top paying skills for data analyst jobs.*

### 3.Top skills in demand
To find the top 5 in-demand skills in the job market for data analysts, for remote jobs
```sql

SELECT
skills,
COUNT(skills_job_dim.job_id) AS count_demand
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = 'True'
GROUP BY
    skills_dim.skills
ORDER BY
    count_demand DESC
LIMIT 5;
```
Here's the breakdown of the in-demand skills for data analysts (remote jobs)

-**SQL :** Most demanded skill by a significant margin, with a demand count of 7291.

-**Excel :** There is a notable drop from SQL to the second most demanded skill, Excel, which has a count of 4611.

-**Python,tableau and Power Bi :** The demand for Python, Tableau, and Power BI follows, indicating a strong need for data analysis and visualization skills.

*Table of the Top 5 in-demand skills for data analysts*

|Skills |Demand|
|------ |------|
|SQL	|7291  |
|Excel  |4611  |
|Python |4330  |
|Tableau|3745  |
|PowerBI|2609  |
### 4. Top Paying Skills based on average salaries
To find out the top paying skills based on average salary for our preferred role, Data Analyst. Focusing on roles with specified salaries, regardless of location.Why? It reveals how different skills impact salary levels for Data Analysts and help identify the most financially rewarding skills to acquire or improve.
```sql

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
LIMIT 10;
```

Here's the breakdown of the top paying skills based on average salaries for Data Analysts regardless of location.

-**SVN, Kafka, Git, Oracle and Linux :** Belarus stands out with uniformly high salaries (400,000) for Data Analysts across various technical skills such as SVN, Kafka, Git, Oracle and Linux.

-**MATLAB and Airflow :** Austin, TX shows a significant disparity in salaries between MATLAB (375,000) and Airflow (262,500), indicating a higher valuation for MATLAB expertise in this location.

-**Asana, Oracle and SAS :** San Francisco, CA and Sunnyvale, CA offer similar salary ranges for Data Analysts, with slightly higher salaries in San Francisco for skills like Asana (235,000) compared to Sunnyvale (234,000 for Oracle and SAS).

*Table of the top paying skills based on average salaries*

|job location|Skills|Average salary($)|
|------------|------|-----------------|
|Belarus	 | svn	| 4,00,000        |
|Belarus	 |kafka	| 4,00,000        |
|Belarus	 |git	| 4,00,000        |
|Belarus	 |oracle| 4,00,000        |
|Belarus	 |linux	| 4,00,000        |
|Austin,TX	 |matlab| 3,75,000        |
|Austin,TX	 |airflow|	2,62,000      |
|San Francisco,CA|asana|2,35,000      |
|Sunnyvale,CA|oracle|2,34,000         |
|Sunnyvale,CA|	sas |	2,34,000      |
### 5. Top optimal skills to learn
Here we focus on the top optimal skills to learn for data analysts. Optimal means high demand and high paying, concentrating on remote positions with high salaries. The reason behind this analysis is to found out the jobs that offer job security and financial benefits.
```sql

WITH top_demanded_skills AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS count_demand
    FROM 
        job_postings_fact
    INNER JOIN 
        skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN 
        skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_postings_fact.job_title_short = 'Data Analyst' AND
        job_postings_fact.job_work_from_home = 'True' AND 
        job_postings_fact.salary_year_avg IS NOT NULL
    GROUP BY
        skills_dim.skill_id, skills_dim.skills
),

top_paying_skills AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
    FROM 
        job_postings_fact
    INNER JOIN 
        skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN 
        skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_postings_fact.job_title_short = 'Data Analyst' AND 
        job_postings_fact.salary_year_avg IS NOT NULL AND 
        job_postings_fact.job_work_from_home = 'True'
    GROUP BY 
    skills_dim.skill_id,
        skills_dim.skills
)

SELECT
    top_demanded_skills.skill_id,
    top_demanded_skills.skills,
    top_demanded_skills.count_demand,
    top_paying_skills.avg_salary
FROM
    top_demanded_skills
INNER JOIN 
    top_paying_skills ON top_demanded_skills.skill_id = top_paying_skills.skill_id
GROUP BY
    top_demanded_skills.skill_id,
    top_demanded_skills.skills,
     top_demanded_skills.count_demand,
    top_paying_skills.avg_salary
HAVING
    count_demand>10
ORDER BY
    avg_salary DESC,
    count_demand DESC
```
Here's the breakdown of the most optimal skills to learn for data analysts targeting the remote jobs with high salaries.

- **High-demand Programming Languages :** Python and R stand out for their high demand, with demand counts of 236 and 148 respectively. Despite their high demand their average salaries are around 1,01,397$ and 1,00,499$ respectively indicating that proficiency in these languages are highly valued but also widely available.

- **Cloud tools and technologies :** Skills in specialized technologies such as snowflake, azure, bigquery and aws show significant demand with relatively high average salaries, pointing towards the growing importance of cloud platforms and big data technologies in data analysis.

- **Business intelligence and Visualization tools :** Tableau and looker with demand counts of 230 and 49 respectively and average salaries around 99288$ and 1,03,795$ explains to us the value of data visualization and business intelligence in deriving actionable insights from data.

- **Database technologies :** The demand for skills in traditional and NoSQL databases (Oracle, SQL Server, NoSQL ) with average salaries ranging from 97,786$ and 104,534$ reflects the enduring need for data storage, retrieval and management expertise.

*Table of the Top optimal skills to learn for data analysts sorted by salary*

|Skills    |Count_Demand|Average Salary($)|
|----------|------------|-----------------|
|go	       |    27	    |1,15,320         |
|confluence|	11	    |1,14,210         |
|hadoop    |	22	    |1,13,193         |
|snowflake |	37	    |1,12,948         |
|azure	   |    34	    |1,11,225         |
|bigquery  |	13	    |1,09,654         |
|aws	   |    32	    |1,08,317         |
|java	   |    17	    |1,06,906         |
|ssis	   |    12	    |1,06,683         |
|jira	   |    20	    |1,04,918         |

# What I learned
Throughout this adventure, I've turbocharged my SQL toolkit with some serious firepower:

- **Complex Query Crafting:** Mastered the art of advanced SQL, merging tables like a pro and wielding with clauses for ninja-level temp table maneuvers.

- **Data Aggregation :** Got cozy with Group by and turned aggregate functions like COUNT() and AVG() into my data summarizing sidekicks.

- **Analytical Wizardry :** Leveled up my real world puzzle-solving skills, turning questions into actionable, insightful SQL queries.

# Conclusions

### Closing Thoughts
This project enhanced my SQL skills and provided valuable insights into the data analyst job market. The findings from the analysis serve as a guide to prioritizing skill development and job search efforts. Aspiring data analysts can better position themselves in the job market by focusing on high-demand, high-salary skills. This exploration highlights the importance of continuous learning and adaptation to emerging trends in the field of data analytics. 
