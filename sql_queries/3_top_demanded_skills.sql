/* Question 3: What are the top demanded skills in job postings?
    - Identify the 5 most frequently listed skills in job postings.
    - Include skill name and the number of job postings requiring each skill.
    
    Purpose: Highlight the skills that are in high demand in the job market.
*/

SELECT 
    s.skills,
    COUNT(sj.job_id) AS demand_count
FROM job_postings_fact jp
INNER JOIN skills_job_dim sj on jp.job_id = sj.job_id
INNER JOIN skills_dim s on sj.skill_id = s.skill_id
WHERE jp.job_title_short = 'Data Engineer'
GROUP BY s.skills
ORDER BY demand_count DESC
LIMIT 5;