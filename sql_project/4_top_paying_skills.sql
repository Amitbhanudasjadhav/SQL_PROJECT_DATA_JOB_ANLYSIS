/*
    Questions - What are the top paying Skills?
        - look at average salary associated with each skills, analysis for Data Analyst roles
        - Focus on roles with specified salaary
        - Why? 
            - Helps analyse how different sklills affect salary levels for Data Anlyst.
            - helps job finders to identify most financially rewarding skills
*/



SELECT 
    skills,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_postings_fact.job_title_short = 'Data Analyst' and salary_year_avg IS NOT NULL
GROUP BY Skills
ORDER BY avg_salary DESC
LIMIT 25;


/*
💡 AI + Automation Integration Drives Pay — Analysts skilled in machine learning tools (TensorFlow, PyTorch, Datarobot, Hugging Face) or automation platforms earn the highest salaries, showing that roles blending analytics with AI and automation are the new premium tier.

☁️ DataOps & Cloud Engineering Are the New Core — High-paying roles increasingly require big data and infrastructure expertise (Kafka, Airflow, Terraform, Couchbase, Scala), signaling a shift from traditional analysis to pipeline management and scalable data systems.

🧩 Hybrid “Analyst–Engineer” Profiles Win — Skills like Golang, GitLab, Atlassian, Puppet highlight that employers now prize analysts who can code, collaborate, and deploy, not just analyze — bridging data, engineering, and business operations.
*/