CREATE DATABASE DIABETIC_DATASET;

USE DIABETIC_DATASET;
CREATE TABLE INFO(encounter_id BIGINT, patient_nbr BIGINT, race	TEXT,gender TEXT, age VARCHAR(20), weight INT,admission_type_id INT,discharge_disposition_id INT,
admission_source_id	INT,time_in_hospital INT,	payer_code VARCHAR(20),medical_specialty VARCHAR(50), num_lab_procedures INT,num_procedures INT, num_medications INT,
number_outpatient INT, number_emergency INT, number_inpatient INT,	diag_1 VARCHAR(50),	diag_2 VARCHAR(50), diag_3 VARCHAR(50), number_diagnoses INT, max_glu_serum	VARCHAR(50),
A1Cresult VARCHAR(50), metformin VARCHAR(50), repaglinide VARCHAR(50), nateglinide VARCHAR(50), chlorpropamide VARCHAR(50), glimepiride	VARCHAR(50), acetohexamide VARCHAR(50),
glipizide VARCHAR(50), glyburide VARCHAR(50), tolbutamide VARCHAR(50), pioglitazone VARCHAR(50), rosiglitazone VARCHAR(50), acarbose VARCHAR(50), miglitol VARCHAR(50),
troglitazone VARCHAR(50), tolazamide VARCHAR(50), examide VARCHAR(50), citoglipton VARCHAR(50), insulin	VARCHAR(50), glyburide_metformin VARCHAR(50), glipizide_metformin VARCHAR(50),
glimepiride_pioglitazone VARCHAR(50), metformin_rosiglitazone VARCHAR(50), metformin_pioglitazone VARCHAR(50),`change` VARCHAR(50),	diabetesMed VARCHAR(50), readmitted VARCHAR(50)
);

SELECT COUNT(*) FROM INFO;

-- ALTER WEIGHT TO VARCHAR FROM INT COS WHILE IMPORTING DATASET GOT ISSUE
ALTER TABLE INFO 
MODIFY weight VARCHAR(50);

-- Replaced '?' placeholders with blank values before SQL import.
-- LOADING ALL FILE IN TABLE INFO
SHOW VARIABLES LIKE "secure_file_priv";
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/diabetic_data_initial.CSV'
INTO TABLE INFO
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(encounter_id,patient_nbr,race,gender,age,weight,@vadmission_type_id,@vdischarge_disposition_id,@vadmission_source_id,@vtime_in_hospital,payer_code,medical_specialty,
@vnum_lab_procedures,@vnum_procedures,@vnum_medications,@vnumber_outpatient,@vnumber_emergency,@vnumber_inpatient,diag_1,diag_2,diag_3,@vnumber_diagnoses,max_glu_serum,
A1Cresult,metformin,repaglinide,nateglinide,chlorpropamide,glimepiride,acetohexamide,glipizide,glyburide,tolbutamide,pioglitazone,rosiglitazone,acarbose,miglitol,troglitazone,
tolazamide,examide,citoglipton,insulin,glyburide_metformin,glipizide_metformin,glimepiride_pioglitazone,metformin_rosiglitazone,metformin_pioglitazone,`change`,diabetesMed,
readmitted
)
SET
admission_type_id=IF(@vadmission_type_id='' OR @vadmission_type_id=0 ,NULL, @vadmission_type_id),
discharge_disposition_id=IF(@vdischarge_disposition_id='' OR @vdischarge_disposition_id=0 , NULL,@vdischarge_disposition_id),
admission_source_id=IF(@vadmission_source_id=''OR @vadmission_source_id=0 ,NULL,@vadmission_source_id),
time_in_hospital=IF(@vtime_in_hospital='' OR @vtime_in_hospital=0 ,NULL,@vtime_in_hospital),
num_lab_procedures=IF(@vnum_lab_procedures='' OR @vnum_lab_procedures=0 ,NULL,@vnum_lab_procedures),
num_procedures=IF(@vnum_procedures='' OR @vnum_procedures=0 ,NULL,@vnum_procedures),
num_medications=IF(@vnum_medications='' OR @vnum_medications=0 ,NULL,@vnum_medications),
number_outpatient=IF(@vnumber_outpatient='' OR @vnumber_outpatient=0 ,NULL,@vnumber_outpatient),
number_emergency=IF(@vnumber_emergency='' OR @vnumber_emergency=0 ,NULL,@vnumber_emergency),
number_inpatient=IF(@vnumber_inpatient='' OR @vnumber_inpatient=0 ,NULL,@vnumber_inpatient),
number_diagnoses=IF(@vnumber_diagnoses='' OR @vnumber_diagnoses=0 ,NULL,@vnumber_diagnoses)
;
SELECT COUNT(*) FROM INFO;


-- CHECK NULL COUNT FOR ALL COL
SELECT 
COUNT(CASE WHEN encounter_id = '' OR encounter_id IS NULL THEN 1 END ) AS encounter_id_NULL,
SUM(CASE WHEN patient_nbr = '' OR patient_nbr IS NULL THEN 1 ELSE 0 END) AS patient_nbr_NULL,
SUM(CASE WHEN race = '' OR race IS NULL THEN 1 ELSE 0 END) AS race_NULL,
SUM(CASE WHEN gender = '' OR gender IS NULL THEN 1 ELSE 0 END) AS gender_NULL,
SUM(CASE WHEN age = '' OR age IS NULL THEN 1 ELSE 0 END) AS age_NULL,
SUM(CASE WHEN weight = '' OR weight IS NULL THEN 1 ELSE 0 END) AS weight_NULL,
SUM(CASE WHEN admission_type_id = '' OR admission_type_id IS NULL THEN 1 ELSE 0 END) AS admission_type_id_NULL,
SUM(CASE WHEN discharge_disposition_id = '' OR discharge_disposition_id IS NULL THEN 1 ELSE 0 END) AS discharge_disposition_id_NULL,
SUM(CASE WHEN admission_source_id = '' OR admission_source_id IS NULL THEN 1 ELSE 0 END) AS admission_source_id_NULL,
SUM(CASE WHEN time_in_hospital = '' OR time_in_hospital IS NULL THEN 1 ELSE 0 END) AS time_in_hospital_NULL,
SUM(CASE WHEN payer_code = '' OR payer_code IS NULL THEN 1 ELSE 0 END) AS payer_code_NULL,
SUM(CASE WHEN medical_specialty = '' OR medical_specialty IS NULL THEN 1 ELSE 0 END) AS medical_specialty_NULL,
SUM(CASE WHEN num_lab_procedures = '' OR num_lab_procedures IS NULL THEN 1 ELSE 0 END) AS num_lab_procedures_NULL,
SUM(CASE WHEN num_procedures = '' OR num_procedures IS NULL THEN 1 ELSE 0 END) AS num_procedures_NULL,
SUM(CASE WHEN num_medications = '' OR num_medications IS NULL THEN 1 ELSE 0 END) AS num_medications_NULL,
SUM(CASE WHEN number_outpatient = '' OR number_outpatient IS NULL THEN 1 ELSE 0 END) AS number_outpatient_NULL,
SUM(CASE WHEN number_emergency = '' OR number_emergency IS NULL THEN 1 ELSE 0 END) AS number_emergency_NULL,
SUM(CASE WHEN number_inpatient = '' OR number_inpatient IS NULL THEN 1 ELSE 0 END) AS number_inpatient_NULL,
SUM(CASE WHEN diag_1 = '' OR diag_1 IS NULL THEN 1 ELSE 0 END) AS diag_1_NULL,
SUM(CASE WHEN diag_2 = '' OR diag_2 IS NULL THEN 1 ELSE 0 END) AS diag_2_NULL,
SUM(CASE WHEN diag_3 = '' OR diag_3 IS NULL THEN 1 ELSE 0 END) AS diag_3_NULL,
SUM(CASE WHEN number_diagnoses = '' OR number_diagnoses IS NULL THEN 1 ELSE 0 END) AS number_diagnoses_NULL,
SUM(CASE WHEN max_glu_serum = '' OR max_glu_serum IS NULL THEN 1 ELSE 0 END) AS max_glu_serum_NULL,
SUM(CASE WHEN A1Cresult = '' OR A1Cresult IS NULL THEN 1 ELSE 0 END) AS A1Cresult_NULL,
SUM(CASE WHEN metformin = '' OR metformin IS NULL THEN 1 ELSE 0 END) AS metformin_NULL,
SUM(CASE WHEN repaglinide = '' OR repaglinide IS NULL THEN 1 ELSE 0 END) AS repaglinide_NULL,
SUM(CASE WHEN nateglinide = '' OR nateglinide IS NULL THEN 1 ELSE 0 END) AS nateglinide_NULL,
SUM(CASE WHEN chlorpropamide = '' OR chlorpropamide IS NULL THEN 1 ELSE 0 END) AS chlorpropamide_NULL,
SUM(CASE WHEN glimepiride = '' OR glimepiride IS NULL THEN 1 ELSE 0 END) AS glimepiride_NULL,
SUM(CASE WHEN acetohexamide = '' OR acetohexamide IS NULL THEN 1 ELSE 0 END) AS acetohexamide_NULL,
SUM(CASE WHEN glipizide = '' OR glipizide IS NULL THEN 1 ELSE 0 END) AS glipizide_NULL,
SUM(CASE WHEN glyburide = '' OR glyburide IS NULL THEN 1 ELSE 0 END) AS glyburide_NULL,
SUM(CASE WHEN tolbutamide = '' OR tolbutamide IS NULL THEN 1 ELSE 0 END) AS tolbutamide_NULL,
SUM(CASE WHEN pioglitazone = '' OR pioglitazone IS NULL THEN 1 ELSE 0 END) AS pioglitazone_NULL,
SUM(CASE WHEN rosiglitazone = '' OR rosiglitazone IS NULL THEN 1 ELSE 0 END) AS rosiglitazone_NULL,
SUM(CASE WHEN acarbose = '' OR acarbose IS NULL THEN 1 ELSE 0 END) AS acarbose_NULL,
SUM(CASE WHEN miglitol = '' OR miglitol IS NULL THEN 1 ELSE 0 END) AS miglitol_NULL,
SUM(CASE WHEN troglitazone = '' OR troglitazone IS NULL THEN 1 ELSE 0 END) AS troglitazone_NULL,
SUM(CASE WHEN tolazamide = '' OR tolazamide IS NULL THEN 1 ELSE 0 END) AS tolazamide_NULL,
SUM(CASE WHEN examide = '' OR examide IS NULL THEN 1 ELSE 0 END) AS examide_NULL,
SUM(CASE WHEN citoglipton = '' OR citoglipton IS NULL THEN 1 ELSE 0 END) AS citoglipton_NULL,
SUM(CASE WHEN insulin = '' OR insulin IS NULL THEN 1 ELSE 0 END) AS insulin_NULL,
SUM(CASE WHEN glyburide_metformin = '' OR glyburide_metformin IS NULL THEN 1 ELSE 0 END) AS glyburide_metformin_NULL,
SUM(CASE WHEN glipizide_metformin = '' OR glipizide_metformin IS NULL THEN 1 ELSE 0 END) AS glipizide_metformin_NULL,
SUM(CASE WHEN glimepiride_pioglitazone = '' OR glimepiride_pioglitazone IS NULL THEN 1 ELSE 0 END) AS glimepiride_pioglitazone_NULL,
SUM(CASE WHEN metformin_rosiglitazone = '' OR metformin_rosiglitazone IS NULL THEN 1 ELSE 0 END) AS metformin_rosiglitazone_NULL,
SUM(CASE WHEN metformin_pioglitazone = '' OR metformin_pioglitazone IS NULL THEN 1 ELSE 0 END) AS metformin_pioglitazone_NULL,
SUM(CASE WHEN `change` = '' OR `change` IS NULL THEN 1 ELSE 0 END) AS change_NULL,
SUM(CASE WHEN diabetesMed = '' OR diabetesMed IS NULL THEN 1 ELSE 0 END) AS diabetesMed_NULL,
SUM(CASE WHEN readmitted = '' OR readmitted IS NULL THEN 1 ELSE 0 END) AS readmitted_NULL
FROM INFO;

#CHECKING PERCENTAGE OF NULL VALUES IN NULL COLUMNS
SELECT 
SUM(CASE WHEN race= '' OR race IS NULL THEN 1 ELSE 0 END) * 100.00/COUNT(*) AS race_NULL_PERCENT,
-- SUM(CASE WHEN weight = '' OR weight IS NULL THEN 1 ELSE 0 END) * 100.00/COUNT(*) AS weight_NULL_PERCENT,
SUM(CASE WHEN payer_code = '' OR payer_code IS NULL THEN 1 ELSE 0 END) * 100.0/COUNT(*) AS payer_code_NULL_PERCENT,
SUM(CASE WHEN medical_specialty = '' OR medical_specialty IS NULL THEN 1 ELSE 0 END) * 100.00/COUNT(*) AS medical_specialty_NULL_PERCENT,
SUM(CASE WHEN num_procedures = '' OR num_procedures IS NULL THEN 1 ELSE 0 END) * 100.00/COUNT(*) AS num_procedures_NULL_PERCENT,
SUM(CASE WHEN number_outpatient = '' THEN 1 ELSE 0 END) * 100.00/COUNT(*) AS number_outpatient_NULL_PERCENT,
SUM(CASE WHEN number_emergency = '' OR number_emergency IS NULL THEN 1 ELSE 0 END) * 100.00/COUNT(*) AS number_emergency_NULL_PERCENT,
SUM(CASE WHEN number_inpatient = '' OR number_inpatient IS NULL THEN 1 ELSE 0 END) * 100.00/COUNT(*) AS number_inpatient_NULL_PERCENT,
SUM(CASE WHEN diag_1 = '' OR diag_1 IS NULL THEN 1 ELSE 0 END) * 100.00/COUNT(*) AS diag_1_NULL_PERCENT,
SUM(CASE WHEN diag_2 = '' OR diag_2 IS NULL THEN 1 ELSE 0 END) * 100.00/COUNT(*) AS diag_2_NULL_PERCENT,
SUM(CASE WHEN diag_3 = '' OR diag_3 IS NULL THEN 1 ELSE 0 END) * 100.00/COUNT(*) AS diag_3_NULL_PERCENT
FROM INFO;

-- droping weight col cos of high missing values and not providing valuable insight
ALTER TABLE INFO
DROP weight;

SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='DIABETIC_DATASET'
AND
TABLE_NAME='INFO';


#BEFORE DROPPING CHECK THE check whether values are actually blank because:no visits happened OR data missing
SELECT DISTINCT number_outpatient,COUNT(*) FROM INFO
GROUP BY number_outpatient
ORDER BY number_outpatient ASC;

SHOW COLUMNS FROM INFO;
-- FINDING DISTINCT VALUE FOR COLUMNS
SELECT 
COUNT(DISTINCT max_glu_serum) AS DISTINCT_max_glu_serum_COUNT,
COUNT(DISTINCT A1Cresult) AS DISTINCT_A1Cresult_COUNT,
COUNT(DISTINCT metformin) AS DISTINCT_metformin_COUNT,
COUNT(DISTINCT repaglinide) AS DISTINCT_repaglinide_COUNT,
COUNT(DISTINCT nateglinide) AS DISTINCT_nateglinide_COUNT,
COUNT(DISTINCT chlorpropamide) AS DISTINCT_chlorpropamide_COUNT,
COUNT(DISTINCT glimepiride) AS DISTINCT_glimepiride_COUNT,
COUNT(DISTINCT acetohexamide) AS DISTINCT_acetohexamide_COUNT,
COUNT(DISTINCT glipizide) AS DISTINCT_glipizide_COUNT,
COUNT(DISTINCT glyburide) AS DISTINCT_glyburide_COUNT,
COUNT(DISTINCT tolbutamide) AS DISTINCT_tolbutamide_COUNT,
COUNT(DISTINCT pioglitazone) AS DISTINCT_pioglitazone_COUNT,
COUNT(DISTINCT rosiglitazone) AS DISTINCT_rosiglitazone_COUNT,
COUNT(DISTINCT acarbose) AS DISTINCT_acarbose_COUNT,
COUNT(DISTINCT miglitol) AS DISTINCT_miglitol_COUNT,
COUNT(DISTINCT troglitazone) AS DISTINCT_troglitazone_COUNT,
COUNT(DISTINCT examide) AS DISTINCT_examide_COUNT,
COUNT(DISTINCT citoglipton) AS DISTINCT_citoglipton_COUNT,
COUNT(DISTINCT glyburide_metformin) AS DISTINCT_glyburide_metformin_COUNT,
COUNT(DISTINCT glipizide_metformin) AS DISTINCT_glipizide_metformin_COUNT,
COUNT(DISTINCT glimepiride_pioglitazone) AS DISTINCT_glimepiride_pioglitazone_COUNT,
COUNT(DISTINCT metformin_rosiglitazone) AS DISTINCT_metformin_rosiglitazone_COUNT,
COUNT(DISTINCT metformin_pioglitazone) AS DISTINCT_metformin_pioglitazone_COUNT

FROM INFO;

-- DROPING examide AND citoglipton COS THESE HAS UNIQUE 'NO' VALUE
ALTER TABLE INFO
DROP COLUMN examide,
DROP COLUMN citoglipton;

SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='DIABETIC_DATASET' AND
TABLE_NAME='INFO'





