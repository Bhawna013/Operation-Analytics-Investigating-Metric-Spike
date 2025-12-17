CREATE DATABASE job; 
use job;

CREATE TABLE job_data ( 
ds DATE,     
job_id INT NOT NULL,     
actor_id INT NOT NULL,     
event VARCHAR(15) NOT NULL,     
language VARCHAR(15) NOT NULL,     
time_spent INT NOT NULL,     
org CHAR(2) ); 

INSERT INTO job_data (ds, job_id, actor_id, event, language, time_spent, org) VALUES 
('2020-11-30', 21, 1001, 'skip', 'English', 15, 'A'),     
('2020-11-30', 22, 1006, 'transfer', 'Arabic', 25, 'B'),     
('2020-11-29', 23, 1003, 'decision', 'Persian', 20, 'C'),     
('2020-11-28', 23, 1005,'transfer', 'Persian', 22, 'D'),     
('2020-11-28', 25, 1002, 'decision', 'Hindi', 11, 'B'),     
('2020-11-27', 11, 1007, 'decision', 'French', 104, 'D'),     
('2020-11-26', 23, 1004, 'skip', 'Persian', 56, 'A'),     
('2020-11-25', 20, 1003, 'transfer', 'Italian', 45, 'C');

SELECT * FROM job_data;
use job;

SELECT
  ds,
 round((COUNT(job_id) / sum(time_spent) )* 3600) AS jobs_per_hour
FROM job_data
WHERE ds between '2020-11-01'
  AND  '2020-12-01'
GROUP BY ds
ORDER BY ds;


WITH daily AS (
  SELECT ds,
    COUNT(job_id) AS daily_throughput
  FROM job_data
  GROUP BY ds
)
SELECT ds,
  AVG(daily_throughput) OVER (
    ORDER BY ds
    ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
  ) AS rolling_7d_avg
FROM daily
ORDER BY ds;


SELECT AVG(daily_throughput) AS avg_daily_throughput
FROM (
  SELECT ds, COUNT(job_id) AS daily_throughput
  FROM job_data
  GROUP BY ds
) t;

select `language` , count(job_id) as no_of_jobs,
count(job_id)*100 / sum(count(*)) over() as percentage
from job_data
where ds between '2020-11-01' and '2020-11-30'
group by `language`;


select * from 
( select *, row_number() over(partition by job_id) as row_num
from job_data) a
where row_num > 1;

select * from email_events;
select * from users;
select * from events;
select * from job_data;

select 
extract(week from occurred_at) as 'week',
count(distinct user_id) as 'weekly_user_engagement'
from events
group by extract(week from occurred_at);



SELECT
  DATE(created_at) AS date,
  COUNT(*) AS daily_new_users,
  SUM(COUNT(*)) OVER (ORDER BY DATE(created_at)) AS total_users
FROM users
GROUP BY DATE(created_at)
ORDER BY date;

select week(occurred_at) as weeks,
device,
count(distinct user_id) as user_engagement 
from events
group by device, week(occurred_at)
order by week(occurred_at);


select
	week(occurred_at) as weeks,
    count(distinct ( case 
    when action = 'sent_weekly_digest' then user_id
    end)) as weekly_digest,
    count(distinct ( case 
    when action = 'sent_reengagement_email' then user_id
    end)) as reengagement_mail,
    count( distinct (case 
    when action = 'email_open' then user_id
    end)) as opened_email,
    count( distinct ( case 
    when action = 'email_clickthrough' then user_id
    end)) as email_clickthrough
    from email_events
    group by week(occurred_at)
    order by week(occurred_at);

select distinct(action) from email_events; 