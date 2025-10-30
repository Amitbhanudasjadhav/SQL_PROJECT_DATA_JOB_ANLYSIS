/*
    Question: What are the most in demand skills for data analyst?
        - Join job posting to skills using INNER JOIN as in Quesry 2
        - identify top 5 skills in demand for data analyst
        - Focus on all job posting rather than top paying
        - Why? 
        -- We can retrive top 5 skills in demand for data analyst throughout the market.
            Providing insights for jobs seeker regarding top skills in demand.
*/


SELECT 
    skills,
    COUNT(skills_job_dim.job_id) As Demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_postings_fact.job_title_short = 'Data Analyst'
GROUP BY Skills
ORDER BY Demand_count DESC
LIMIT 5;

/*
Most In-Demand Skills for Data Analysts (2023)

SQL leads by a large margin with over 92,000 job mentions, making it the most essential skill for data analysts.

Excel remains highly relevant, ranking second — showing that foundational analytical tools are still widely used in business environments.

Python continues to grow in demand, reflecting the industry’s shift toward automation, data processing, and advanced analytics.

Tableau and Power BI highlight the importance of data visualization and storytelling, crucial for communicating insights effectively.
*/