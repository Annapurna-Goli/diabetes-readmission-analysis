SHOW COLUMNS FROM INFO;
SELECT readmitted FROM INFO;
-- CREATING COLUMNS 

-- MAKING OUTPUT COLUMN TO CATEGORY FOR BETTER UNDERSTANDING
SELECT 
CASE 
WHEN readmitted LIKE '%NO%' THEN 'NOT_readmitted'
WHEN readmitted LIKE '%>30%' THEN 'readmitted_AFTER_30_DAYS'
ELSE 'readmitted_BEFORE_30_DAYS'
END AS readmitted_status
FROM INFO;

ALTER TABLE INFO
ADD COLUMN readmitted_status TEXT;

SET SQL_SAFE_UPDATES=0;

UPDATE INFO SET readmitted_status = CASE
WHEN readmitted LIKE '%NO%' THEN 'NOT_readmitted'
WHEN readmitted LIKE '%>30%' THEN 'readmitted_AFTER_30_DAYS'
ELSE 'readmitted_BEFORE_30_DAYS'
END ;

SELECT readmitted,readmitted_status,COUNT(*) FROM INFO
GROUP BY readmitted,readmitted_status;

