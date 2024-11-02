-- Mobile Device Usage and User Behavior Dataset
/* 
About Dataset
This dataset provides a comprehensive analysis of mobile device usage patterns and user behavior classification.
It contains 700 samples of user data, including metrics such as app usage time, screen-on time, battery drain, and data consumption.
Each entry is categorized into one of five user behavior classes, ranging from light to extreme usage, allowing for insightful analysis and modeling.

Key Features:

* User ID: Unique identifier for each user.
* Device Model: Model of the user's smartphone.
* Operating System: The OS of the device (iOS or Android).
* App Usage Time: Daily time spent on mobile applications, measured in minutes.
* Screen On Time: Average hours per day the screen is active.
* Battery Drain: Daily battery consumption in mAh.
* Number of Apps Installed: Total apps available on the device.
* Data Usage: Daily mobile data consumption in megabytes.
* Age: Age of the user.
* Gender: Gender of the user (Male or Female).
* User Behavior Class: Classification of user behavior based on usage patterns (1 to 5).

This dataset is ideal for researchers, data scientists, and analysts interested in understanding mobile user behavior and developing predictive models in the realm of mobile technology and applications.
This Dataset was primarily designed to implement machine learning algorithms and is not a reliable source for a paper or article.

*/

create database mobile;
use mobile;
show tables;
select * from user_behavior_dataset;
alter table user_behavior_dataset rename to user_behavior;
select * from user_behavior;

-- 1.What is the total number of users in the user behavior dataset?
SELECT COUNT(User_ID) AS total_users from user_behavior;
-- 2.What are the average app usage time, screen-on time, battery drain, data usage, number of apps installed, and age of users in the dataset?
SELECT AVG(App_Usage_Time) AS avg_app_usage_time,
    AVG(Screen_On_Time) AS avg_screen_on_time,
    AVG(Battery_Drain) AS avg_battery_drain,
    AVG(Data_Usage) AS avg_data_usage,
    AVG(Number_of_Apps_Installed) AS avg_apps_installed,
    AVG(Age) AS avg_age
FROM user_behavior;
    
-- 3.How many users fall into each behavior class?
SELECT User_Behavior_Class,
COUNT(User_ID) AS user_count
FROM user_behavior
GROUP BY User_Behavior_Class
ORDER BY User_Behavior_Class;

-- 4. What are the top 5 device models with the highest average daily app usage time?
SELECT Device_Model,AVG(App_Usage_Time) AS AVG_APP_USAGE
FROM user_behavior
GROUP BY Device_Model
ORDER BY AVG_APP_USAGE DESC
LIMIT 5;

SELECT MIN(AGE)FROM user_behavior;
SELECT MAX(AGE)FROM user_behavior;

-- 5.How do average mobile usage patterns vary across different age groups?
SELECT 
CASE
WHEN Age < 18 THEN 'UNDER 18'
WHEN Age BETWEEN 18 AND 35 THEN 'YOUNG'
WHEN Age BETWEEN 36 AND 50 THEN 'MIDDLE'
ELSE 'OLD'
END AS AGE_GROUP,
	AVG(App_Usage_Time) AS avg_app_usage_time,
    AVG(Screen_On_Time) AS avg_screen_on_time,
    AVG(Battery_Drain) AS avg_battery_drain,
    AVG(Data_Usage) AS avg_data_usage,
    AVG(Number_of_Apps_Installed) AS avg_apps_installed   
FROM user_behavior
GROUP BY AGE_GROUP;
    
-- 6.Which device models have the highest number of users in the dataset?
SELECT Device_Model,COUNT(User_ID) AS NO_OF_USERS
FROM user_behavior
GROUP BY Device_Model
ORDER BY NO_OF_USERS DESC;

-- 7.How does the average app usage time and data usage vary by gender among users?
SELECT gender,AVG(app_usage_time) AS avg_app_usage_time,AVG(data_usage) AS avg_data_usage
FROM user_behavior
GROUP BY gender;
    
-- 8.How does the average data usage vary by user behavior class across different operating systems?
SELECT Operating_System,User_Behavior_Class,AVG(Data_Usage) AS avg_data_usage
FROM user_behavior
GROUP BY Operating_System, User_Behavior_Class;

-- 9.What is the percentage distribution of male and female users across user behavior classes?
SELECT Gender,User_Behavior_Class,
COUNT(User_ID) * 100 / (SELECT COUNT(*) FROM user_behavior) AS percentage
FROM user_behavior
GROUP BY Gender, User_Behavior_Class;

-- 10.Which device model has the highest average screen-on time?
SELECT Device_Model,AVG(Screen_On_Time) AS avg_screen_on_time
FROM user_behavior
GROUP BY Device_Model
ORDER BY avg_screen_on_time DESC
LIMIT 1;

-- 11.How does the average app usage time vary among different user behavior classes?
SELECT User_Behavior_Class,AVG(App_Usage_Time) AS avg_app_usage_time
FROM user_behavior
GROUP BY User_Behavior_Class;

-- 12.What are the top 3 device models in terms of the highest number of installed apps?
SELECT Device_Model,AVG(Number_of_Apps_Installed) AS avg_apps_installed
FROM user_behavior
GROUP BY Device_Model
ORDER BY avg_apps_installed DESC
LIMIT 3;

-- 13.How does the average battery drain differ across different age groups?
SELECT 
CASE
WHEN Age < 18 THEN 'UNDER 18'
WHEN Age BETWEEN 18 AND 35 THEN 'YOUNG'
WHEN Age BETWEEN 36 AND 50 THEN 'MIDDLE'
ELSE 'OLD'     
END AS age_group, AVG(Battery_Drain) AS avg_battery_drain
FROM user_behavior
GROUP BY age_group;

-- 14.What is the distribution of users based on the operating system and user behavior class?
SELECT Operating_System,User_Behavior_Class,COUNT(User_ID) AS user_count
FROM user_behavior
GROUP BY Operating_System, User_Behavior_Class;

-- 15.Which age group has the highest number of installed apps on average?
SELECT 
CASE
WHEN Age < 18 THEN 'UNDER 18'
WHEN Age BETWEEN 18 AND 35 THEN 'YOUNG'
WHEN Age BETWEEN 36 AND 50 THEN 'MIDDLE'
ELSE 'OLD'     
END AS age_group,
AVG(Number_of_Apps_Installed) AS avg_apps_installed
FROM user_behavior
GROUP BY age_group
ORDER BY avg_apps_installed DESC
LIMIT 1;

-- 16.What is the average app usage time and screen-on time for male vs. female users?
SELECT Gender,AVG(App_Usage_Time) AS avg_app_usage_time,AVG(Screen_On_Time) AS avg_screen_on_time
FROM user_behavior
GROUP BY Gender;

-- 17.What are the top 3 operating systems in terms of average battery drain?
SELECT Operating_System,AVG(Battery_Drain) AS avg_battery_drain
FROM user_behavior
GROUP BY Operating_System
ORDER BY avg_battery_drain DESC
LIMIT 3;