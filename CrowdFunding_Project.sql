create database crowdfunding;
use crowdfunding;
CREATE TABLE IF NOT EXISTS crowdfunding_raw (
  id VARCHAR(50),
  state VARCHAR(50),
  name VARCHAR(500),
  country VARCHAR(10),
  creator_id VARCHAR(50),
  location_id VARCHAR(50),
  category_id VARCHAR(50),
  created_date VARCHAR(50),
  updated_date VARCHAR(50),
  deadline_date VARCHAR(50),
  state_changed_date VARCHAR(50),
  successful_date VARCHAR(50),
  launched_date VARCHAR(50),
  goal VARCHAR(50),
  pledged VARCHAR(50),
  currency VARCHAR(10),
  currency_symbol VARCHAR(5),
  usd_pledged VARCHAR(50),
  static_usd_rate VARCHAR(50),
  backers_count VARCHAR(50)
);


load data infile 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\Crowdfunding.csv'
into table crowdfunding_projects
fields terminated by ','
LINES TERMINATED BY '\n'
ignore 1 rows;

SHOW VARIABLES LIKE 'secure_file_priv';
SHOW TABLES;
CREATE TABLE crowdfunding_projects (
  id VARCHAR(50),
  state VARCHAR(50),
  name VARCHAR(500),
  country VARCHAR(10),
  creator_id VARCHAR(50),
  location_id VARCHAR(50),
  category_id VARCHAR(50),
  created_date VARCHAR(50),
  updated_date VARCHAR(50),
  deadline_date VARCHAR(50),
  state_changed_date VARCHAR(50),
  successful_date VARCHAR(50),
  launched_date VARCHAR(50),
  goal VARCHAR(50),
  pledged VARCHAR(50),
  currency VARCHAR(10),
  currency_symbol VARCHAR(5),
  usd_pledged VARCHAR(50),
  static_usd_rate VARCHAR(50),
  backers_count VARCHAR(50)
);

TRUNCATE TABLE crowdfunding_projects;

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/crowdfunding_projects.csv'
INTO TABLE crowdfunding_projects
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
  @id,
  @state,
  @name,
  @country,
  @creator_id,
  @location_id,
  @category_id,
  @created_date,
  @updated_date,
  @deadline_date,
  @state_changed_date,
  @successful_date,
  @launched_date,
  @goal,
  @pledged,
  @currency,
  @currency_symbol,
  @usd_pledged,
  @static_usd_rate,
  @backers_count
)
SET
  id = NULLIF(@id,''),
  state = NULLIF(@state,''),
  name = NULLIF(@name,''),
  country = NULLIF(@country,''),
  creator_id = NULLIF(@creator_id,''),
  location_id = NULLIF(@location_id,''),
  category_id = NULLIF(@category_id,''),
  created_date = NULLIF(@created_date,''),
  updated_date = NULLIF(@updated_date,''),
  deadline_date = NULLIF(@deadline_date,''),
  state_changed_date = NULLIF(@state_changed_date,''),
  successful_date = NULLIF(@successful_date,''),
  launched_date = NULLIF(@launched_date,''),
  goal = NULLIF(@goal,''),
  pledged = NULLIF(@pledged,''),
  currency = NULLIF(@currency,''),
  currency_symbol = NULLIF(@currency_symbol,''),
  usd_pledged = NULLIF(@usd_pledged,''),
  static_usd_rate = NULLIF(@static_usd_rate,''),
  backers_count = NULLIF(@backers_count,'');
  
SELECT COUNT(*) FROM crowdfunding_projects;

SELECT id, state, country, creator_id FROM crowdfunding_projects LIMIT 5;

show tables;

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Projects.csv'
INTO TABLE crowdfunding_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
  @id,@state,@name,@country,@creator_id,@location_id,@category_id,
  @created_date,@updated_date,@deadline_date,@state_changed_date,
  @successful_date,@launched_date,@goal,@pledged,@currency,
  @currency_symbol,@usd_pledged,@static_usd_rate,@backers_count
)
SET
  id = NULLIF(@id,''),
  state = NULLIF(@state,''),
  name = NULLIF(@name,''),
  country = NULLIF(@country,''),
  creator_id = NULLIF(@creator_id,''),
  location_id = NULLIF(@location_id,''),
  category_id = NULLIF(@category_id,''),
  created_date = NULLIF(@created_date,''),
  updated_date = NULLIF(@updated_date,''),
  deadline_date = NULLIF(@deadline_date,''),
  state_changed_date = NULLIF(@state_changed_date,''),
  successful_date = NULLIF(@successful_date,''),
  launched_date = NULLIF(@launched_date,''),
  goal = NULLIF(@goal,''),
  pledged = NULLIF(@pledged,''),
  currency = NULLIF(@currency,''),
  currency_symbol = NULLIF(@currency_symbol,''),
  usd_pledged = NULLIF(@usd_pledged,''),
  static_usd_rate = NULLIF(@static_usd_rate,''),
  backers_count = NULLIF(@backers_count,'');

SELECT COUNT(*) FROM crowdfunding_raw;
SELECT id, state, country, creator_id FROM crowdfunding_raw LIMIT 5;

TRUNCATE TABLE crowdfunding_projects;

DROP TABLE IF EXISTS crowdfunding_projects;

CREATE TABLE crowdfunding_projects (
  id INT,
  state VARCHAR(50),
  name VARCHAR(500),
  country VARCHAR(10),
  creator_id BIGINT,
  location_id BIGINT,
  category_id INT,
  created_date DATETIME,
  updated_date DATETIME,
  deadline_date DATETIME,
  state_changed_date DATETIME,
  successful_date DATETIME,
  launched_date DATETIME,
  goal DECIMAL(15,2),
  pledged DECIMAL(15,2),
  currency VARCHAR(10),
  currency_symbol VARCHAR(5),
  usd_pledged DECIMAL(15,2),
  static_usd_rate DECIMAL(10,4),
  backers_count INT
);

SET sql_mode = '';


INSERT INTO crowdfunding_projects (
  id,
  state,
  name,
  country,
  creator_id,
  location_id,
  category_id,
  created_date,
  updated_date,
  deadline_date,
  state_changed_date,
  successful_date,
  launched_date,
  goal,
  pledged,
  currency,
  currency_symbol,
  usd_pledged,
  static_usd_rate,
  backers_count
)
SELECT
  CAST(NULLIF(TRIM(id),'') AS UNSIGNED),
  state,
  name,
  country,
  CAST(NULLIF(TRIM(creator_id),'') AS UNSIGNED),
  CAST(NULLIF(TRIM(location_id),'') AS UNSIGNED),
  CAST(NULLIF(TRIM(category_id),'') AS UNSIGNED),

  STR_TO_DATE(NULLIF(TRIM(created_date),''), '%d/%m/%Y %H:%i'),
  STR_TO_DATE(NULLIF(TRIM(updated_date),''), '%d/%m/%Y %H:%i'),
  STR_TO_DATE(NULLIF(TRIM(deadline_date),''), '%d/%m/%Y %H:%i'),
  STR_TO_DATE(NULLIF(TRIM(state_changed_date),''), '%d/%m/%Y %H:%i'),
  STR_TO_DATE(NULLIF(TRIM(successful_date),''), '%d/%m/%Y %H:%i'),
  STR_TO_DATE(NULLIF(TRIM(launched_date),''), '%d/%m/%Y %H:%i'),

  CAST(NULLIF(REPLACE(TRIM(goal), ',', ''),'') AS DECIMAL(15,2)),
  CAST(NULLIF(REPLACE(TRIM(pledged), ',', ''),'') AS DECIMAL(15,2)),
  currency,
  currency_symbol,
  CAST(NULLIF(REPLACE(TRIM(usd_pledged), ',', ''),'') AS DECIMAL(15,2)),
  CAST(NULLIF(REPLACE(TRIM(static_usd_rate), ',', ''),'') AS DECIMAL(10,4)),
  CAST(NULLIF(TRIM(backers_count),'') AS UNSIGNED)
FROM crowdfunding_raw;

SELECT COUNT(*) 
FROM crowdfunding_projects;

--  Total Number of Projects based on outcome 

SELECT 
    state AS outcome,
    COUNT(*) AS total_projects
FROM crowdfunding_projects
GROUP BY state
ORDER BY total_projects DESC;

-- 	Total Number of Projects based on Locations

SELECT 
    country AS location,
    COUNT(*) AS total_projects
FROM crowdfunding_projects
GROUP BY country
ORDER BY total_projects DESC;

--	Total Number of Projects based on Category

SELECT 
    category_id AS category,
    COUNT(*) AS total_projects
FROM crowdfunding_projects
WHERE category_id IS NOT NULL
GROUP BY category_id
ORDER BY total_projects DESC;

-- Total Number of Projects created by Year, Quarter, Month

-- Projects created by Year

SELECT 
    YEAR(launched_date) AS year,
    COUNT(*) AS total_projects
FROM crowdfunding_projects
WHERE launched_date IS NOT NULL
GROUP BY YEAR(launched_date)
ORDER BY year;

-- Projects created by Year & Quarter

SELECT 
    YEAR(launched_date) AS year,
    CONCAT('Q', QUARTER(launched_date)) AS quarter,
    COUNT(*) AS total_projects
FROM crowdfunding_projects
WHERE launched_date IS NOT NULL
GROUP BY YEAR(launched_date), QUARTER(launched_date)
ORDER BY year, quarter;

-- Projects created by Year & Month

SELECT 
    YEAR(launched_date) AS year,
    MONTH(launched_date) AS month_number,
    MONTHNAME(launched_date) AS month_name,
    COUNT(*) AS total_projects
FROM crowdfunding_projects
WHERE launched_date IS NOT NULL
GROUP BY 
    YEAR(launched_date),
    MONTH(launched_date),
    MONTHNAME(launched_date)
ORDER BY year, month_number;

--	Successful Projects:

SELECT 
    SUM(usd_pledged) AS total_amount_raised
FROM crowdfunding_projects
WHERE state = 'successful';

SELECT 
    SUM(backers_count) AS total_backers
FROM crowdfunding_projects
WHERE state = 'successful';

SELECT 
    ROUND(AVG(DATEDIFF(successful_date, launched_date)), 2) 
    AS avg_days_to_success
FROM crowdfunding_projects
WHERE state = 'successful'
  AND successful_date IS NOT NULL
  AND launched_date IS NOT NULL;

SELECT 
    SUM(usd_pledged) AS total_amount_raised,
    SUM(backers_count) AS total_backers,
    ROUND(AVG(DATEDIFF(successful_date, launched_date)), 2) 
        AS avg_days_to_success
FROM crowdfunding_projects
WHERE state = 'successful';

-- Top Successful Projects

-- Top Successful Projects Based on Number of Backers

SELECT 
    id,
    name,
    backers_count,
    usd_pledged,
    launched_date
FROM crowdfunding_projects
WHERE state = 'successful'
ORDER BY backers_count DESC
LIMIT 10;

-- Top Successful Projects Based on Number of Backers

SELECT 
    id,
    name,
    usd_pledged,
    backers_count,
    launched_date
FROM crowdfunding_projects
WHERE state = 'successful'
ORDER BY usd_pledged DESC
LIMIT 10;

SELECT 
    id,
    name,
    backers_count,
    usd_pledged
FROM crowdfunding_projects
WHERE state = 'successful'
ORDER BY backers_count DESC, usd_pledged DESC
LIMIT 10;

--	Percentage of Successful Projects overall

-- Category

SELECT
    category_id,
    COUNT(*) AS total_projects,
    SUM(CASE WHEN state = 'successful' THEN 1 ELSE 0 END) AS successful_projects,
    ROUND(
        SUM(CASE WHEN state = 'successful' THEN 1 ELSE 0 END)
        / COUNT(*) * 100, 2
    ) AS success_percentage
FROM crowdfunding_projects
WHERE category_id IS NOT NULL
GROUP BY category_id
ORDER BY success_percentage DESC;


-- Year, Quarter, Month

SELECT
    YEAR(launched_date) AS year,
    COUNT(*) AS total_projects,
    SUM(CASE WHEN state = 'successful' THEN 1 ELSE 0 END) AS successful_projects,
    ROUND(
        SUM(CASE WHEN state = 'successful' THEN 1 ELSE 0 END)
        / COUNT(*) * 100, 2
    ) AS success_percentage
FROM crowdfunding_projects
WHERE launched_date IS NOT NULL
GROUP BY YEAR(launched_date)
ORDER BY year;

SELECT
    YEAR(launched_date) AS year,
    CONCAT('Q', QUARTER(launched_date)) AS quarter,
    COUNT(*) AS total_projects,
    ROUND(
        SUM(CASE WHEN state = 'successful' THEN 1 ELSE 0 END)
        / COUNT(*) * 100, 2
    ) AS success_percentage
FROM crowdfunding_projects
WHERE launched_date IS NOT NULL
GROUP BY YEAR(launched_date), QUARTER(launched_date)
ORDER BY year, quarter;

SELECT 
    DATE_FORMAT(launched_date, '%Y-%m'),
    COUNT(*),
    SUM(state = 'successful') * 100 / COUNT(*)
FROM crowdfunding_projects
WHERE launched_date IS NOT NULL
GROUP BY DATE_FORMAT(launched_date, '%Y-%m');

SELECT 
    ym,
    COUNT(*) AS total_projects,
    SUM(success_flag) * 100 / COUNT(*) AS success_percentage
FROM (
    SELECT 
        DATE_FORMAT(launched_date, '%Y-%m') AS ym,
        CASE 
            WHEN state = 'successful' THEN 1 
            ELSE 0 
        END AS success_flag
    FROM crowdfunding_projects
    WHERE launched_date IS NOT NULL
) t
GROUP BY ym
ORDER BY ym;

-- Goal Range

SELECT
    goal_range,
    COUNT(*) AS total_projects,
    SUM(success_flag) * 100 / COUNT(*) AS success_percentage
FROM (
    SELECT
        CASE
            WHEN goal < 1000 THEN '< 1K'
            WHEN goal >= 1000 AND goal < 5000 THEN '1K–5K'
            WHEN goal >= 5000 AND goal < 10000 THEN '5K–10K'
            WHEN goal >= 10000 AND goal < 50000 THEN '10K–50K'
            ELSE '> 50K'
        END AS goal_range,
        CASE
            WHEN state = 'successful' THEN 1
            ELSE 0
        END AS success_flag
    FROM crowdfunding_projects
    WHERE goal IS NOT NULL
) t
GROUP BY goal_range
ORDER BY goal_range;
