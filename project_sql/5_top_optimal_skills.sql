/*
-Question: Most optimal skills to learn?
-Optimal: High Demand and High Paying.
-Concentrates on remote positions with specified salaries
-Why? Targets jobs that offers job security and financial benefits.
*/

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
