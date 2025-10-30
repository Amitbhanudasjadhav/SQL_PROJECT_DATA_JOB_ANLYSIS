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
    salary_year_avg,
    name AS company_name
FROM
    job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
Order BY
    salary_year_avg DESC
LIMIT 10; 


/*
Highest salaries reached up to $650,000, with the top-paying role offered by Mantys for a remote “Data Analyst” position — highlighting the strong demand for remote analytical expertise.
Citigroup, Inc. and Illuminate Mission Solutions appeared among the top-paying employers, indicating that finance and defense sectors continue to value high-level data analysis skills.
Most top-paying roles are senior or specialized positions, such as Head of Infrastructure Management & Data Analytics or Senior Data Analyst, emphasizing the premium on experience and leadership in data roles.
A mix of remote and U.S.-based locations suggests that geographical flexibility doesn’t significantly limit earning potential for skilled data professionals.

*/