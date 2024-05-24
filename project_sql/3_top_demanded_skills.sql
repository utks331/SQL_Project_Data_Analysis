/*
Question: What are the most in demand skills for data analysts 
-Join job postings to inner join table similar to query 2.
-Identify the top 5 skills for a data analyst.
-Focus on all job postings.
-Focus on remote jobs as well
Why? Retrieves the top 5 skills with the highest demand in the job market,
providing insights into the most valuable skills for job seekers.
*/

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
