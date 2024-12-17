# 🛠 Data Cleaning and Transformation Process for Layoffs Dataset
This project focuses on cleaning, standardizing, and preparing the **layoffs_stagging** dataset for downstream analysis. The data cleaning is achieved through SQL queries that remove duplicates, fix inconsistencies, standardize columns, and handle null values.

**📝 Overview**

The following actions were performed on the raw **layoffs_stagging** table:

1. Identifying and removing duplicate records using **ROW_NUMBER()**.

2. Standardizing data formats for consistency.

3. Addressing null and blank values.

4. Optimizing the table structure by removing unnecessary columns.

# 🔍 Steps and SQL Queries

**1️⃣ Identify Duplicate Records**

- A **Common Table Expression (CTE)** is used with the **ROW_NUMBER()** function to identify duplicate rows based on key fields:

WITH duplicate_data AS (

    SELECT *,
  
           ROW_NUMBER() OVER(PARTITION BY company, location, industry, total_laid_off,
   
                             percentage_laid_off, "date", stage, country, funds_raised_millions) AS row_num
  
    FROM layoffs_stagging
  )

SELECT *
FROM duplicate_data
WHERE row_num > 1;

**2️⃣ Standardize Data**

- Trimming Whitespace: Removes extra spaces in the COMPANY column:

UPDATE layoffs_stagging

SET COMPANY = TRIM(COMPANY);

- **Standardizing Industry Names**: Fixes inconsistent "CRYPTO" values:

UPDATE layoffs_stagging

SET INDUSTRY = "CRYPTO"

WHERE INDUSTRY LIKE "CRYPTO%";

- **Standardizing Country Names**: Corrects variations of "United States":

UPDATE layoffs_stagging

SET country = "United States"

WHERE country = "u";

**3️⃣ Date Format Standardization**

- Converts the DATE column to a proper DATE type:

UPDATE layoffs_stagging

SET date = STR_TO_DATE(DATE, "%m/%d/%Y");

ALTER TABLE layoffs_stagging

MODIFY COLUMN DATE DATE;

**4️⃣ Handle Null and Blank Values**

- Identify rows where industry or other key fields are missing:

SELECT *

FROM layoffs_stagging

WHERE industry IS NULL OR industry = "";

- **Impute Missing Industry Values**: Updates missing industry values based on matching company:

UPDATE layoffs_stagging T1

JOIN layoffs_stagging T2

ON T1.COMPANY = T2.COMPANY
    
SET T1.INDUSTRY = T2.INDUSTRY

WHERE (T1.INDUSTRY IS NULL OR T1.INDUSTRY = "")

AND T2.INDUSTRY IS NOT NULL;

**5️⃣ Remove Unused Columns**

- Drops the ROW_NUM column (no longer required):

ALTER TABLE layoffs_stagging

DROP COLUMN ROW_NUM;

**6️⃣ Delete Irrelevant Rows**

- Deletes records where both **total_laid_off** and **percentage_laid_off** are null:

DELETE FROM layoffs_stagging

WHERE total_laid_off IS NULL 

AND percentage_laid_off IS NULL;

# ✅ Final Dataset

The cleaned **layoffs_stagging** table is free of duplicates, standardized, and ready for analysis. Key improvements include:

- Consistent **company** and **industry** values.

- Correct **date** format.

- Null and blank values appropriately handled.

# 🛠 Technologies Used

**SQL**: Data cleaning, transformation, and optimization.

**Database**: MySQL / Any RDBMS supporting SQL syntax.

# 🚀 How to Use

1. Run the provided SQL queries step by step in your database.

2. Verify each step using the **SELECT** statements.

3. Use the cleaned table for analysis or visualization.

