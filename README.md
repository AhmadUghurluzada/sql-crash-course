# 📊 Data Engineer Job Market Analysis (SQL Project)

## 📌 Overview

This project analyzes the job market for **Data Engineer** roles using SQL.  
The goal is to explore salary trends, skill demand, and the relationship between skills and compensation.

The analysis is based on a relational database built from real-world job posting datasets.

---

## 🗂️ Database Schema

The database is designed using fact and dimension tables.

### Tables

#### 1. `company_dim`
Stores company information.

| Column       | Type | Description |
|-------------|------|------------|
| company_id  | INT (PK) | Unique company ID |
| name        | TEXT | Company name |
| link        | TEXT | Company website |
| link_google | TEXT | Google link |
| thumbnail   | TEXT | Company logo |

---

#### 2. `skills_dim`
Stores skills data.

| Column   | Type | Description |
|---------|------|------------|
| skill_id | INT (PK) | Unique skill ID |
| skills   | TEXT | Skill name |
| type     | TEXT | Skill category |

---

#### 3. `job_postings_fact`
Stores job posting information.

| Column | Type | Description |
|--------|------|------------|
| job_id | INT (PK) | Unique job ID |
| company_id | INT (FK) | Reference to company_dim |
| job_title_short | VARCHAR | Short job title |
| job_title | TEXT | Full job title |
| job_location | TEXT | Job location |
| job_work_from_home | BOOLEAN | Remote status |
| job_posted_date | TIMESTAMP | Posting date |
| salary_year_avg | NUMERIC | Average yearly salary |
| salary_hour_avg | NUMERIC | Average hourly salary |

---

#### 4. `skills_job_dim`
Bridge table between jobs and skills (many-to-many).

| Column | Type |
|--------|------|
| job_id | INT (FK) |
| skill_id | INT (FK) |

Composite Primary Key: `(job_id, skill_id)`

---

## ⚙️ Setup Instructions

### 1️⃣ Create Database
Run the SQL script in `create_database.sql`.

### 2️⃣ Create Tables
Execute the table creation script in `create_tables.sql`.

### 3️⃣ Load Data
Import CSV files using PostgreSQL `COPY` command:

```sql
COPY company_dim
FROM 'C:\Program Files\PostgreSQL\16\data\Datasets\sql_course\company_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
```


