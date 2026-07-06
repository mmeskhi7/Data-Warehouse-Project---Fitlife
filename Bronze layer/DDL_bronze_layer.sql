--Data Warehouse Project: Customer churn in a gym
--Bronze layer for source systems

--Database creation
CREATE DATABASE gym;

--Schema creation: Bronze
--Bronze layer will be used for raw data ingestion 
CREATE SCHEMA IF NOT EXISTS bronze;


--DDL for source system 1: membership transactions 
CREATE TABLE IF NOT EXISTS  bronze.src_membership_transactions (
   
payment_id VARCHAR (100),
member_id VARCHAR (100),
first_name VARCHAR (100),
last_name VARCHAR (100),
email VARCHAR (100),
phone VARCHAR (100),
date_of_birth VARCHAR (100),
gender VARCHAR (100),
address VARCHAR (100),
city VARCHAR (100),
signup_date VARCHAR (100),
acquisition_channel VARCHAR (100),
payment_date VARCHAR (100),
membership_tier VARCHAR (100),
membership_price VARCHAR (100),
membership_previous_price VARCHAR (100),
discount_percentage VARCHAR (100),
membership_start_date VARCHAR (100),
membership_expiry_date VARCHAR (100),
preferred_facility_id VARCHAR (100),
preferred_facility_name VARCHAR (100),
preferred_time_slot VARCHAR (100),
preferred_class_category VARCHAR (100),
equipment_quality_rating VARCHAR (100),
equipment_cleanliness_rating VARCHAR (100),
equipment_variety_rating VARCHAR (100),
hygiene_quality_rating VARCHAR (100),
reception_service_quality_rating VARCHAR (100),
trainers_service_quality_rating VARCHAR (100),
price_convenience_rating VARCHAR (100),
willing_to_pay_more VARCHAR (100),
overall_satisfaction_rating VARCHAR (100),
member_likelihood_to_recommend VARCHAR (100)

);




--DDL for source system 2: gym activity 
CREATE TABLE IF NOT EXISTS  bronze.src_gym_activity (
   
check_in_id VARCHAR (100),
member_id VARCHAR (100),
check_in_date VARCHAR (100),
check_in_time VARCHAR (100),
activity_type VARCHAR (100),
facility_id VARCHAR (100),
facility_branch VARCHAR (100),
facility_city VARCHAR (100),
class_id VARCHAR (100),
class_name VARCHAR (100),
class_attended VARCHAR (100),
absence_reason VARCHAR (100)

);