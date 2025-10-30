# Introduction
## 📊 SQL Project: Data Analyst Job Market Analysis (2023)

This project explores a dataset provided by Luke Barousse, containing job postings from 2023. Using SQL, I analyzed the dataset to uncover insights specific to Data Analyst roles — including salary trends, top-paying positions, and the most in-demand and high-value skills.

The key objectives of this project were to:

- Identify the top-paying Data Analyst jobs across various companies.
- Determine the most required skills for data analyst roles in 2023.
- Analyze which skills offer the highest average salary, revealing where technical expertise drives pay growth.

This project demonstrates practical SQL applications in data exploration, aggregation, and insight generation, providing a clear snapshot of how skillsets and technologies shape pay and demand in the data analytics job market.

Check out the SQL queries here: [sql_project](/sql_project/)

# Background

The demand for data professionals has grown rapidly in recent years, and 2023 continued to highlight the vital role of data analysts in modern organizations. As businesses increasingly depend on data-driven insights, knowing which skills are most sought after — and which lead to higher salaries — has become more important than ever.

This project is based on a dataset shared by Luke Barousse, containing job postings from 2023. The analysis focuses on Data Analyst positions, exploring the top-paying roles, the most in-demand skills, and the skills that command the highest pay.

The goal of this project is to gain a clearer understanding of the evolving data analyst job market and identify the technical skills that drive both demand and earning potential.
### Through this project, I’m using SQL queries to find answers to the following questions:
1. Question- What are the top paying Data Analyst jobs?
2.  Question- What skills are required for top paying Data Analyst jobs?
3. Question: What are the most in demand skills for data analyst?
4. Questions - What are the top paying Skills?
5. Question- What are the Optimal Skill to have or aquire i.e( High demand and High paying)?


# Tools Used

### To carry out this analysis effectively, I used a combination of tools that supported data handling, query execution, and project management.

- **SQL** – Used to clean, filter, and analyze the dataset efficiently. It helped uncover insights such as top-paying data analyst roles, high-demand skills, and salary trends based on different criteria.

- **PostgreSQL** – Served as the primary database management system, allowing structured storage and execution of complex SQL queries for deeper data exploration.

- **Visual Studio Code** – Used as the main coding environment for writing, testing, and organizing SQL scripts. Its extensions for database connections made workflow smooth and productive.

- **Git & GitHub** – Utilized for version control, project documentation, and showcasing the project publicly. Helped maintain transparency and track changes throughout development.

**Disclaimer:**
This project is for educational and portfolio purposes only. The dataset belongs to Luke Barousse.
# The Analysis
This section presents a series of SQL-based analyses designed to explore key trends in the 2023 data analyst job market. Each query focuses on a specific question — from identifying top-paying roles to uncovering the most valuable and in-demand skills — providing a data-driven overview of the factors that shape pay and opportunities in this field.

### **1. Top 10 Paying Data Analyst Jobs**
- **Highest salaries** reached up to **$650,000**, with the top-paying role offered by **Mantys** for a remote “Data Analyst” position — highlighting the strong demand for remote analytical expertise.
- **Citigroup, Inc.** and **Illuminate Mission Solutions** appeared among the top-paying employers, indicating that finance and defense sectors continue to value high-level data analysis skills.
- Most top-paying roles are **senior or specialized positions**, such as Head of Infrastructure Management & Data Analytics or Senior Data Analyst, emphasizing the premium on experience and leadership in data roles.
- A mix of **remote and U.S.-based locations** suggests that geographical flexibility doesn’t significantly limit earning potential for skilled data professionals.

```sql
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
```
### **2. Skill Required for Top Paying Data Analyst Jobs**


- SQL and Python are the most common skills, appearing in nearly every top-paying data analyst role — confirming their status as the core technical foundation in analytics.
- Tableau remains a leading tool for data visualization, reflecting the growing need for analysts who can communicate insights effectively.
- R, Snowflake, and Pandas also appear frequently, suggesting that data modeling and statistical programming are valuable complements to general analytics skills.
- Cloud and collaboration tools like Azure and Bitbucket indicate a shift toward data infrastructure and version-controlled environments in high-paying roles.

![2 skill for top paying day jobs][def]
*Bar graph visualization for top skills in 10 highest paying Data Analyst jobs. This bar graph is generated using ChatGpt*

```sql
WITH top_paying_jobs AS (
    SELECT
        Job_id,
        job_title,
        salary_year_avg,
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
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills  
 FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id;
```

### **3. Most In-Demand Skills For Data Analyst Jobs**



- SQL leads by a large margin with over 92,000 job mentions, making it the most essential skill for data analysts.

- Excel remains highly relevant, ranking second — showing that foundational analytical tools are still widely used in business environments.

- Python continues to grow in demand, reflecting the industry’s shift toward automation, data processing, and advanced analytics.

- Tableau and Power BI highlight the importance of data visualization and storytelling, crucial for communicating insights effectively.


![3top demanded skills][def1]
*Bar graph visualization for top 5 skills in-demand for Data Analyst jobs. This bar graph is generated using ChatGpt*

| Skill     | Demand Count |
|------------|---------------|
| SQL        | 92,628 |
| Excel      | 67,031 |
| Python     | 57,326 |
| Tableau    | 46,554 |
| Power BI   | 39,468 |

*Table for top 5 skills in-demand for Data Analyst jobs.*

```sql
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
```
### **4. Top Paying Skills For Data Analyst Jobs**
- Skills linked to software engineering and system development, like SVN ($400,000) and Solidity ($179,000), offer the highest average salaries — showing that data roles blending with development expertise are extremely valuable.
- Tools such as Couchbase, DataRobot, and Golang stand out for their AI, automation, and backend integration capabilities, which drive strong salary premiums.
- Machine learning frameworks like MXNet, TensorFlow, and PyTorch appear among top-paying skills, confirming the growing impact of AI and deep learning on analytics compensation.
- Overall, the data suggests that hybrid skill sets — combining analytics, ML, and engineering knowledge — lead to significantly higher average pay for data analysts in 2023.

| Skills       |   Average Salary |
|:-------------|-------------:|
| svn          |       400000 |
| solidity     |       179000 |
| couchbase    |       160515 |
| datarobot    |       155486 |
| golang       |       155000 |
| mxnet        |       149000 |
| dplyr        |       147633 |
| vmware       |       147500 |
| terraform    |       146734 |
| twilio       |       138500 |
| gitlab       |       134126 |
| kafka        |       129999 |
| puppet       |       129820 |
| keras        |       127013 |
| pytorch      |       125226 |
| perl         |       124686 |
| ansible      |       124370 |
| hugging face |       123950 |
| tensorflow   |       120647 |
| cassandra    |       118407 |
| notion       |       118092 |
| atlassian    |       117966 |
| bitbucket    |       116712 |
| airflow      |       116387 |
| scala        |       115480 |

*Table for Top 10 Paying Skills for Data Analyst Jobs.*

```sql
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
```

### **5. Optimal Skills For Data Analyst Jobs**

- Skills such as Snowflake, Azure, and Hadoop stand out for offering both high salaries and frequent demand — ideal for long-term career stability.
- Emerging technologies like Go and Confluence offer niche but high-paying roles, signaling premium opportunities for specialized expertise.
- Skills combining data infrastructure (Hadoop, Azure) and workflow tools (Confluence) show that hybrid technical–collaboration skills are increasingly valued.
- The trend indicates that analysts who bridge data engineering and business collaboration will enjoy stronger job security and financial rewards.

|   Skill Id | Skills     |   Demand Count |   Average Salary |
|-----------:|:-----------|---------------:|-------------:|
|          8 | go         |             27 |       115320 |
|        234 | confluence |             11 |       114210 |
|         97 | hadoop     |             22 |       113193 |
|         80 | snowflake  |             37 |       112948 |
|         74 | azure      |             34 |       111225 |
|         77 | bigquery   |             13 |       109654 |
|         76 | aws        |             32 |       108317 |
|          4 | java       |             17 |       106906 |
|        194 | ssis       |             12 |       106683 |
|        233 | jira       |             20 |       104918 |
|         79 | oracle     |             37 |       104534 |
|        185 | looker     |             49 |       103795 |
|          2 | nosql      |             13 |       101414 |
|          1 | python     |            236 |       101397 |
|          5 | r          |            148 |       100499 |
|         78 | redshift   |             16 |        99936 |
|        187 | qlik       |             13 |        99631 |
|        182 | tableau    |            230 |        99288 |
|        197 | ssrs       |             14 |        99171 |
|         92 | spark      |             13 |        99077 |
|         13 | c++        |             11 |        98958 |
|        186 | sas        |             63 |        98902 |
|          7 | sas        |             63 |        98902 |
|         61 | sql server |             35 |        97786 |
|          9 | javascript |             20 |        97587 |

*Table for Top 25 Optimal Skills for Data Analyst Jobs.*
```sql
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
```

# Learnings
- Strengthened my ability to write complex SQL queries for real-world data exploration and analysis.

- Learned how to use PostgreSQL and Visual Studio Code together for structured querying and visualization.

- Understood how to identify top-paying and high-demand roles and skills through data-driven insights.

- Discovered how SQL can help uncover career optimization patterns — such as which skills offer both financial growth and job stability.

- Gained hands-on experience in cleaning, analyzing, and presenting data effectively for a professional GitHub project.
# Conclusiion
Through this project, I was able to apply SQL to explore real-world job market data and extract meaningful insights about Data Analyst roles in 2023.
The analysis revealed how certain skills not only drive higher salaries but also ensure long-term job security through strong market demand.

### Key takeaways include:

- Cloud-based and data engineering skills like Snowflake, Azure, and Hadoop consistently offer the best career value.

- Core analytical tools such as SQL, Python, and Tableau remain foundational and in high demand.

- The most “optimal” skills are those that balance technical specialization with broad industry relevance.

Overall, this project demonstrates how data analysis using SQL can inform smarter career decisions — bridging data insights with professional growth.

[def]: assets/2_Skill_for_top_paying_DA_jobs.png
[def1]: assets/3_top_demanded_skills.PNG