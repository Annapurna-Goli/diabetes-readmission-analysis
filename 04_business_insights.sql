SHOW COLUMNS FROM INFO;

-- gender_distribution W.R.T readmitted
# IS FEMALE readmitted RATIO MORE
SELECT gender,readmitted, COUNT(*),ROUND(COUNT(*)*100.00/SUM(COUNT(*)) OVER(),2)AS gender_WRT_readmitted_RATIO FROM INFO
GROUP BY gender,readmitted
ORDER BY COUNT(*) DESC; 
# Female patients show slightly higher readmission ratio
# compared to male patients, but the difference is small

-- AGE_distribution W.R.T readmitted
# HOW THE AGE SHOWS readmission RATION WHICH AGE GROUP IN HIGHER RISK
SELECT age,readmitted,COUNT(*),ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER(),2) AS age_WRT_readmitted_RATIO FROM INFO
GROUP BY age,readmitted
ORDER BY COUNT(*) DESC;  
# Patients aged 70-80 show comparatively higher
# readmission frequency across both categories

-- admission_type_id_distribution W.R.T readmitted
# WHICH ADMITION TYPE IS REASON FOR HIGHER readmission RATE
SELECT admission_type_id,readmitted_status,COUNT(*),ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER(),2) AS admission_type_id_readmitted_RATIO FROM INFO
WHERE readmitted_status='readmitted_BEFORE_30_DAYS' OR readmitted_status='readmitted_AFTER_30_DAYS'
GROUP BY admission_type_id,readmitted_status
ORDER BY COUNT(*) DESC; 
# 1 SUCH AS EMERGENCY AND 2- SUCH AS URGENT admission_type_id ARE HIGHER IN readmission RATE

-- discharge_disposition_id_WRT_readmitted_RATIO  
# DOES IT DIRECTLY AFFECTING TO readmission
SELECT discharge_disposition_id,readmitted_status,COUNT(*),ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER(),2) AS discharge_disposition_id_WRT_readmitted_RATIO FROM INFO
GROUP BY discharge_disposition_id,readmitted_status
ORDER BY COUNT(*) DESC;   
# discharge_disposition_id HAS HIGHER RATE FOR DISCHARGE TO HOME AND TRANSFER TO ANOTHER SHORT TER HOSPITAL. ALTHOUGH SINGLE discharge_disposition_id IS NOT STRONG ENOUGH TO PROVIDE IMPACT OF readmission RATE

-- time_in_hospital W.R.T readmitted
SELECT time_in_hospital,readmitted,COUNT(*),ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER(),2) AS time_in_hospital_WRT_readmitted_RATIO FROM INFO
GROUP BY time_in_hospital,readmitted
ORDER BY COUNT(*) DESC;

-- num_procedures_distribution W.R.T readmitted
SELECT num_procedures,readmitted,COUNT(*), ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER(),2) AS num_procedures_WRT_readmitted_RATIO FROM INFO
WHERE num_procedures > 3
GROUP BY num_procedures,readmitted
ORDER BY COUNT(*) DESC; 
# num_procedures FROM 4 ONWARDS SHOWS INCREASING IN THE readmission RATE

-- num_medications_distribution W.R.T readmitted
SELECT num_medications,readmitted,COUNT(*),ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER(),2) AS num_medications_WRT_readmitted_RATIO FROM INFO
GROUP BY num_medications,readmitted
ORDER BY COUNT(*) DESC; 
# Higher medication counts are associated with
# increased readmission frequency


-- number_outpatient_distribution W.R.T readmitted
SELECT number_outpatient,readmitted,COUNT(*),ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER(),2) AS number_outpatient_WRT_readmitted_RATIO FROM INFO
GROUP BY number_outpatient,readmitted
ORDER BY COUNT(*) DESC; 

-- number_emergency_distribution W.R.T readmitted
SELECT number_emergency,readmitted,COUNT(*),ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER(),2) AS number_emergency_WRT_readmitted_RATIO FROM INFO
GROUP BY number_emergency,readmitted
ORDER BY COUNT(*) DESC;  

-- number_inpatient_distribution W.R.T readmitted
SELECT number_inpatient,readmitted,COUNT(*),ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER(),2) AS number_inpatient_readmitted_RATIO FROM INFO
GROUP BY number_inpatient,readmitted
ORDER BY COUNT(*) DESC;  

-- number_diagnoses_distribution W.R.T readmitted
SELECT number_diagnoses,readmitted,COUNT(*),ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER(),2) AS number_diagnoses_readmitted_RATIO FROM INFO
GROUP BY number_diagnoses,readmitted
ORDER BY COUNT(*) DESC;  

-- A1Cresult_distribution W.R.T readmitted
SELECT A1Cresult,readmitted,COUNT(*),ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER(),2) AS A1Cresult_readmitted_RATIO FROM INFO
GROUP BY A1Cresult,readmitted
ORDER BY COUNT(*) DESC;  
# A1Cresult >8 HAS HIGHER readmission RISK

-- change_distribution W.R.T readmitted
SELECT `change`,readmitted,COUNT(*),ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER(),2) AS change_readmitted_RATIO FROM INFO
GROUP BY `change`,readmitted
ORDER BY COUNT(*) DESC;  

-- diabetesMed_distribution W.R.T readmitted
SELECT diabetesMed,readmitted,COUNT(*),ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER(),2) AS diabetesMed_readmitted_RATIO FROM INFO
GROUP BY diabetesMed,readmitted
ORDER BY COUNT(*) DESC;  
# PATIENT WITH diabetesMed YES THEY HAVE HIGHER RATE OF CHANCES TO readmission









