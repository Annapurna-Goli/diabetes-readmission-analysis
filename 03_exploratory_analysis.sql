-- DISTRIBUTION ANALYSIS

DESCRIBE INFO;

-- TARGET RATIO
SELECT readmitted,readmitted_status,COUNT(*), COUNT(*)*100.00/SUM(COUNT(*)) OVER() AS readmitted_RATIO  FROM INFO
GROUP BY readmitted,readmitted_status;

-- gender_distribution
SELECT gender,COUNT(*),ROUND(COUNT(*)*100.00/SUM(COUNT(*)) OVER(),2)AS gender_RATIO FROM INFO
GROUP BY gender
ORDER BY COUNT(*) DESC; 


-- AGE_distribution
SELECT age,COUNT(*),COUNT(*)*100/SUM(COUNT(*)) OVER() AS age_RATIO FROM INFO
GROUP BY age
ORDER BY COUNT(*) DESC; 


-- admission_type_id_distribution
SELECT admission_type_id, COUNT(*),ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER(),2) AS admission_type_id_RATIO FROM INFO
GROUP BY admission_type_id
ORDER BY COUNT(*) DESC;   


-- discharge_disposition_id_distribution 
SELECT discharge_disposition_id, COUNT(*),ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER(),2) AS discharge_disposition_id_RATIO FROM INFO
GROUP BY discharge_disposition_id
ORDER BY COUNT(*) DESC; 


-- admission_source_id_distribution 
SELECT admission_source_id, COUNT(*),ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER(),2) AS admission_source_id_RATIO  FROM INFO
GROUP BY admission_source_id
ORDER BY COUNT(*) DESC;  

-- time_in_hospital_distribution
SELECT time_in_hospital, COUNT(*),ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER(),2) AS time_in_hospital_RATIO FROM INFO
GROUP BY time_in_hospital
ORDER BY COUNT(*) DESC;     


-- num_procedures_distribution 
SELECT num_procedures, COUNT(*), ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER(),2) AS num_procedures_RATIO FROM INFO
GROUP BY num_procedures
ORDER BY COUNT(*) DESC;  

-- num_medications_distribution 
SELECT num_medications, COUNT(*), ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER(),2) AS num_medications_RATIO FROM INFO
GROUP BY num_medications
ORDER BY COUNT(*) DESC;  


-- number_outpatient_distribution 
SELECT number_outpatient, COUNT(*),ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER(),2) AS number_outpatient_RATIO FROM INFO
GROUP BY number_outpatient
ORDER BY COUNT(*) DESC;   

-- number_emergency_distribution
SELECT number_emergency, COUNT(*),ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER(),2) AS number_emergency_RATIO FROM INFO
GROUP BY number_emergency
ORDER BY COUNT(*) DESC;   

-- number_inpatient_distribution 
SELECT number_inpatient, COUNT(*),ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER(),2) AS number_inpatient_RATIO FROM INFO
GROUP BY number_inpatient
ORDER BY COUNT(*) DESC;  


-- diag_1_distribution
SELECT diag_1, COUNT(*), ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER(),2) AS diag_1_RATIO FROM INFO
GROUP BY diag_1
ORDER BY COUNT(*) DESC;   

-- diag_2_distribution
SELECT diag_2, COUNT(*), ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER(),2) AS diag_2_RATIO FROM INFO
GROUP BY diag_2
ORDER BY COUNT(*) DESC;   

-- diag_3_distribution 
SELECT diag_3, COUNT(*),ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER(),2) AS diag_3_RATIO FROM INFO
GROUP BY diag_3
ORDER BY COUNT(*) DESC;  

-- number_diagnoses_distribution 
SELECT number_diagnoses, COUNT(*),ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER(),2) AS number_diagnoses_RATIO FROM INFO
GROUP BY number_diagnoses
ORDER BY COUNT(*) DESC;  


-- A1Cresult_distribution 
SELECT A1Cresult, COUNT(*),ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER(),2) AS A1Cresult_RATIO FROM INFO
GROUP BY A1Cresult
ORDER BY COUNT(*) DESC;  


-- change_distribution 
SELECT `change`, COUNT(*),ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER(),2) AS change_RATIO FROM INFO
GROUP BY `change`
ORDER BY COUNT(*) DESC;  


-- diabetesMed_distribution 
SELECT diabetesMed, COUNT(*),ROUND(COUNT(*)*100/SUM(COUNT(*)) OVER(),2) AS diabetesMed_RATIO FROM INFO
GROUP BY diabetesMed
ORDER BY COUNT(*) DESC;  













































