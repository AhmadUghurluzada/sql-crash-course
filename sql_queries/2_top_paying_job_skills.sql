/* Question: What skills are required for the top-paying data engineer jobs?
    - Identify the top skills associated with the highest paying 'Data Engineer' roles.
    - Include skill name, job title, average yearly salary, and company name.
    
    Purpose: Provide insights into the key skills needed for high-paying data engineer positions.
*/


WITH top_paying_jobs AS (
    SELECT 
        job_id, 
        job_title,
        salary_year_avg,
        name as company_name
    FROM
        job_postings_fact jp
    LEFT JOIN company_dim c ON jp.company_id = c.company_id
    WHERE
        jp.job_title_short = 'Data Engineer' AND
        jp.salary_year_avg IS NOT NULL
    ORDER BY
        jp.salary_year_avg DESC
    LIMIT 10
)


SELECT 
    tp.*,
    s.skills
FROM top_paying_jobs tp
INNER JOIN skills_job_dim sj on tp.job_id = sj.job_id
INNER JOIN skills_dim s on sj.skill_id = s.skill_id
ORDER BY
    tp.salary_year_avg DESC;
