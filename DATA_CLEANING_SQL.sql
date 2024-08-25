SELECT *
FROM layoffs_stagging;

-- CREATED CTE FOR DUPLICATE RECORD

WITH duplicate_data AS 
(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,"date",stage,country,funds_raised_millions ) AS row_num
FROM layoffs_stagging
)
-- FETCHING DUPLICATE RECORD FROM CTE TABLE 
SELECT *
FROM duplicate_data
WHERE row_num>1;

CREATE TABLE layoffs_stagging2 AS (
SELECT *,
ROW_NUMBER() OVER(PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,"date",stage,country,funds_raised_millions ) AS row_num
FROM layoffs_stagging
);

SELECT COUNT(*)
FROM layoffs_stagging;

-- STANDRADARDIZING DATA

SELECT *
FROM layoffs_stagging;

UPDATE layoffs_stagging
SET COMPANY=TRIM(COMPANY);

SELECT DISTINCT country
FROM layoffs_stagging
ORDER BY 1;

UPDATE  layoffs_stagging
SET INDUSTRY="CRYPTO"
WHERE INDUSTRY LIKE "CRYPTO%";

SELECT DISTINCT country
FROM layoffs_stagging
WHERE country LIKE "UNITED STATES%";

UPDATE layoffs_stagging
SET country="United States"
WHERE country ="u";

SELECT DATE
FROM layoffs_stagging;

update layoffs_stagging
set date=STR_TO_DATE(DATE,"%m/%d/%Y");

ALTER TABLE layoffs_stagging
MODIFY COLUMN DATE DATE;

--- REMOVING NULL AND BLANK VALUES
SELECT *
FROM layoffs_stagging
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL ;


SELECT *
FROM layoffs_stagging
WHERE industry IS NULL OR industry="" ;

UPDATE layoffs_stagging T1
JOIN layoffs_stagging T2
	ON T1.INDUSTRY=T2.INDUSTRY
SET INDUSTRY=NULL;


UPDATE layoffs_stagging T1
JOIN layoffs_stagging T2
	ON T1.COMPANY=T2.COMPANY
SET T1.INDUSTRY=T2.INDUSTRY
WHERE (T1.INDUSTRY IS NULL OR T1.INDUSTRY="") AND T2.INDUSTRY IS NOT NULL;

SELECT T1.COMPANY,
		T1.INDUSTRY,	
        T2.COMPANY,
        T2.INDUSTRY
FROM layoffs_stagging T1
JOIN layoffs_stagging T2
	ON T1.COMPANY=T2.COMPANY
WHERE (T1.INDUSTRY IS NULL OR T1.INDUSTRY="") AND T2.INDUSTRY IS NOT NULL;

SELECT *
FROM layoffs_stagging
WHERE industry IS NULL OR industry ="";

--- REMOVING EXTRA COLUMN WHICH IS NOT IN USE
ALTER TABLE layoffs_stagging
DROP COLUMN ROW_NUM;

SELECT *
FROM layoffs_stagging
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL ;

DELETE FROM layoffs_stagging
WHERE total_laid_off IS NULL 
AND percentage_laid_off IS NULL ;

SELECT *
FROM layoffs_stagging;

















