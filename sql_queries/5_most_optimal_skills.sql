/* Question 5: What are the most optimal skills to learn?
    - Identify skills in high demand and associated with the high average salariesn  for Data Engineer roles. 
    - Include skill name, average yearly salary, and demand count.
    
    Purpose: Guide data engineers on which skills to prioritize for career growth.
*/


WITH skills_demand AS (
    SELECT
        s.skill_id,
        s.skills,
        COUNT(sj.job_id) AS demand_count
    FROM job_postings_fact jp
    INNER JOIN skills_job_dim sj on jp.job_id = sj.job_id
    INNER JOIN skills_dim s on sj.skill_id = s.skill_id
    WHERE jp.job_title_short = 'Data Engineer' AND salary_year_avg is NOT NULL
    GROUP BY s.skill_id
), average_salary AS (
SELECT 
    sj.skill_id,
    ROUND(AVG(jp.salary_year_avg), 0)
FROM job_postings_fact jp
INNER JOIN skills_job_dim sj on jp.job_id = sj.job_id
INNER JOIN skills_dim s on sj.skill_id = s.skill_id
WHERE jp.job_title_short = 'Data Engineer' AND salary_year_avg is NOT NULL
GROUP BY sj.skill_id
)


SELECT 
    skills_demand.skill_id, 
    skills_demand.skills,
    demand_count,
    average_salary
FROM skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
ORDER BY 
    demand_count DESC,
    average_salary DESC
LIMIT 25;