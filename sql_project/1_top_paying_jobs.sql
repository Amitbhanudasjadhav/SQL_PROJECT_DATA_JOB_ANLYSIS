/*  
    Question- What are the top paying Data Analyst jobs?
        -Identify the top 10 data analyst jobs that are remote.
        -Focus on job posting that have salary details available (remove null).
        -Why? Highlight the top paying opurtunities of Data Analyst, offering insight on Job market
*/

SELECT
    Job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
Order BY
    salary_year_avg DESC
LIMIT 10; 
