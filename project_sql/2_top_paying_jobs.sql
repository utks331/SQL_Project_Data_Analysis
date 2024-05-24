/*
Question: What skills are required for the top-paying data analyst jobs?
-Use the top 10 highest paying data analyst jobs from the first query.
-Add the specific skills required for these roles,
-Why? It provides a detailed look at which high paying jobs demand certain skills.
*/

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
    salary_year_avg DESC

/*
From the analysis of the skills required for the top data analyst roles in 2023, we can see the following distribution:
SQL: 6 occurrences
Python: 2 occurrences
Excel: 1 occurrence
This indicates that SQL is the most frequently required skill among the top data analyst roles, followed by Python and Excel. ​

[
  {
    "job_id": 712473,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 712473,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 712473,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "r",
    "type": "programming"
  },
  {
    "job_id": 712473,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "sas",
    "type": "programming"
  },
  {
    "job_id": 712473,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "matlab",
    "type": "programming"
  },
  {
    "job_id": 712473,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "pandas",
    "type": "libraries"
  },
  {
    "job_id": 712473,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "tableau",
    "type": "analyst_tools"
  },
  {
    "job_id": 712473,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "looker",
    "type": "analyst_tools"
  },
  {
    "job_id": 712473,
    "company_name": "Get It Recruit - Information Technology",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "sas",
    "type": "analyst_tools"
  },
  {
    "job_id": 1246069,
    "company_name": "Plexus Resource Solutions",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 1246069,
    "company_name": "Plexus Resource Solutions",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "mysql",
    "type": "databases"
  },
  {
    "job_id": 1246069,
    "company_name": "Plexus Resource Solutions",
    "job_title": "Data Analyst",
    "salary_year_avg": "165000.0",
    "skills": "aws",
    "type": "cloud"
  },
  {
    "job_id": 456042,
    "company_name": "Get It Recruit - Healthcare",
    "job_title": "Data Analyst",
    "salary_year_avg": "151500.0",
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 456042,
    "company_name": "Get It Recruit - Healthcare",
    "job_title": "Data Analyst",
    "salary_year_avg": "151500.0",
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 456042,
    "company_name": "Get It Recruit - Healthcare",
    "job_title": "Data Analyst",
    "salary_year_avg": "151500.0",
    "skills": "r",
    "type": "programming"
  },
  {
    "job_id": 405581,
    "company_name": "CyberCoders",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 405581,
    "company_name": "CyberCoders",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "java",
    "type": "programming"
  },
  {
    "job_id": 405581,
    "company_name": "CyberCoders",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "r",
    "type": "programming"
  },
  {
    "job_id": 405581,
    "company_name": "CyberCoders",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "javascript",
    "type": "programming"
  },
  {
    "job_id": 405581,
    "company_name": "CyberCoders",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "c++",
    "type": "programming"
  },
  {
    "job_id": 405581,
    "company_name": "CyberCoders",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "tableau",
    "type": "analyst_tools"
  },
  {
    "job_id": 405581,
    "company_name": "CyberCoders",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "power bi",
    "type": "analyst_tools"
  },
  {
    "job_id": 405581,
    "company_name": "CyberCoders",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "qlik",
    "type": "analyst_tools"
  },
  {
    "job_id": 479485,
    "company_name": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 479485,
    "company_name": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 479485,
    "company_name": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "r",
    "type": "programming"
  },
  {
    "job_id": 479485,
    "company_name": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "golang",
    "type": "programming"
  },
  {
    "job_id": 479485,
    "company_name": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "elasticsearch",
    "type": "databases"
  },
  {
    "job_id": 479485,
    "company_name": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "aws",
    "type": "cloud"
  },
  {
    "job_id": 479485,
    "company_name": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "bigquery",
    "type": "cloud"
  },
  {
    "job_id": 479485,
    "company_name": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "gcp",
    "type": "cloud"
  },
  {
    "job_id": 479485,
    "company_name": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "pandas",
    "type": "libraries"
  },
  {
    "job_id": 479485,
    "company_name": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "scikit-learn",
    "type": "libraries"
  },
  {
    "job_id": 479485,
    "company_name": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "looker",
    "type": "analyst_tools"
  },
  {
    "job_id": 479485,
    "company_name": "Level",
    "job_title": "Data Analyst",
    "salary_year_avg": "145000.0",
    "skills": "kubernetes",
    "type": "other"
  },
  {
    "job_id": 1090975,
    "company_name": "Uber",
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 1090975,
    "company_name": "Uber",
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 1090975,
    "company_name": "Uber",
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "skills": "r",
    "type": "programming"
  },
  {
    "job_id": 1090975,
    "company_name": "Uber",
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "skills": "swift",
    "type": "programming"
  },
  {
    "job_id": 1090975,
    "company_name": "Uber",
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "skills": "excel",
    "type": "analyst_tools"
  },
  {
    "job_id": 1090975,
    "company_name": "Uber",
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "skills": "tableau",
    "type": "analyst_tools"
  },
  {
    "job_id": 1090975,
    "company_name": "Uber",
    "job_title": "Data Analyst",
    "salary_year_avg": "140500.0",
    "skills": "looker",
    "type": "analyst_tools"
  },
  {
    "job_id": 1482852,
    "company_name": "Overmind",
    "job_title": "Data Analyst",
    "salary_year_avg": "138500.0",
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 1482852,
    "company_name": "Overmind",
    "job_title": "Data Analyst",
    "salary_year_avg": "138500.0",
    "skills": "python",
    "type": "programming"
  },
  {
    "job_id": 479965,
    "company_name": "InvestM Technology LLC",
    "job_title": "Data Analyst",
    "salary_year_avg": "135000.0",
    "skills": "sql",
    "type": "programming"
  },
  {
    "job_id": 479965,
    "company_name": "InvestM Technology LLC",
    "job_title": "Data Analyst",
    "salary_year_avg": "135000.0",
    "skills": "excel",
    "type": "analyst_tools"
  },
  {
    "job_id": 479965,
    "company_name": "InvestM Technology LLC",
    "job_title": "Data Analyst",
    "salary_year_avg": "135000.0",
    "skills": "power bi",
    "type": "analyst_tools"
  },
  {
    "job_id": 1326467,
    "company_name": "EPIC Brokers",
    "job_title": "Data Analyst",
    "salary_year_avg": "135000.0",
    "skills": "excel",
    "type": "analyst_tools"
  }
]
*/



