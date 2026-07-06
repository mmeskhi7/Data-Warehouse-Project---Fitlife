CREATE EXTENSION file_fdw;
--Stored procedure to load data using COPY command into bronze.src_membership_transactions 
CREATE OR REPLACE PROCEDURE bronze.load_src_membership_transactions ()

LANGUAGE SQL

AS $$


COPY src_membership_transactions (

payment_id ,
member_id ,
first_name ,
last_name ,
email ,
phone ,
date_of_birth ,
gender ,
address ,
city ,
signup_date ,
acquisition_channel ,
payment_date ,
membership_tier ,
membership_price ,
membership_previous_price ,
discount_percentage ,
membership_start_date ,
membership_expiry_date ,
preferred_facility_id ,
preferred_facility_name ,
preferred_time_slot ,
preferred_class_category ,
equipment_quality_rating ,
equipment_cleanliness_rating ,
equipment_variety_rating ,
hygiene_quality_rating ,
reception_service_quality_rating ,
trainers_service_quality_rating ,
price_convenience_rating ,
willing_to_pay_more ,
overall_satisfaction_rating ,
member_likelihood_to_recommend 
)

FROM
'C:\Users\MichaelMeskhi\Documents\gym_members_payments.csv'
WITH (
FORMAT CSV
, HEADER TRUE);


$$;

CALL bronze.load_src_membership_transactions ();


--Stored procedure to load data using COPY command into bronze.src_member_activity
CREATE OR REPLACE PROCEDURE bronze.load_src_gym_activity ()

LANGUAGE SQL

AS $$

COPY src_gym_activity (

check_in_id ,
member_id ,
check_in_date ,
check_in_time ,
activity_type ,
facility_id ,
facility_branch ,
facility_city ,
class_id ,
class_name ,
class_attended ,
absence_reason 

)

FROM
'C:\Users\MichaelMeskhi\Documents\gym_checkins.csv'
WITH (
FORMAT CSV
, HEADER TRUE );

$$;

CALL bronze.load_src_gym_activity ();


