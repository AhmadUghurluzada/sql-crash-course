/* Question 4: What are the top 20 skills associated with 
the highest average salaries for Data Engineer positions? 
    - Identify the top 20 skills linked to the highest average salaries for 'Data Engineer' roles.
    - Include skill name and average yearly salary.
    
    Purpose: Provide insights into the skills that can lead to higher-paying data engineer positions.
*/

SELECT 
    s.skills,
    ROUND(AVG(salary_year_avg), 0) AS average_salary
FROM job_postings_fact jp
INNER JOIN skills_job_dim sj on jp.job_id = sj.job_id
INNER JOIN skills_dim s on sj.skill_id = s.skill_id
WHERE jp.job_title_short = 'Data Engineer' AND salary_year_avg is NOT NULL
GROUP BY s.skills
ORDER BY average_salary DESC
LIMIT 20;