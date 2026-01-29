/* Question: what are the top-paying data engineer jobs?
    - Identify the top 10 highest paying 'Data Engineer' roles.
    - Include job title, location, average yearly salary, and company name.
    
    Purpose: Highlight opportunities for data engineers in the job market.
*/

SELECT 
    job_id, 
    job_title,
    job_location, 
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
LIMIT 10;



    