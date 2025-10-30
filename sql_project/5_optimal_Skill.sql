/*
        Question- What are the Optimal Skill to have or aquire i.e( High demand and High paying)?
            - Identify skills in high demand and associate with high average salaries for data analyst roles.
            - concentrate on remote roles.
            - Why?
                - Identify skill that give high job security(high demand) and Financial Benefits (high Paying)
                - Offering strategic insight for career development in data analysis.
*/



SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) As demand_count,
        ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE  
        job_postings_fact.job_title_short = 'Data Analyst' AND 
        salary_year_avg IS NOT NULL AND
        job_work_from_home = TRUE 
GROUP BY
        skills_dim.skill_id
HAVING
        COUNT(skills_job_dim.job_id) > 10
ORDER BY
        avg_salary DESC,
        demand_count DESC
LIMIT 25;