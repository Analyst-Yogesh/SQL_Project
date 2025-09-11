# 🌍 Global Layoffs Analysis (SQL Project)

This project explores worldwide layoffs data using **SQL**. It is divided into two parts:
1. **Data Cleaning** – preparing raw data for analysis.
2. **Exploratory Data Analysis (EDA)** – uncovering insights and trends.

---

## 📂 Files in Repository
- **DATA_CLEANING_SQL.sql**
  - Removes duplicates using `ROW_NUMBER()`.
  - Standardizes text fields (company, industry, country).
  - Converts string dates into proper `DATE` format.
  - Handles missing values in layoffs and industry fields.
  - Deletes rows with no useful information.
  - Ensures clean, analysis-ready dataset.

- **WORLD_LAYOFFS_EDA_SQL.sql**
  - Analyzes layoffs across **companies, industries, and countries**.
  - Identifies **yearly trends** and **COVID-19 impact (2022 peak)**.
  - Highlights **top companies with highest layoffs each year**.
  - Tracks **monthly layoffs with cumulative totals**.
  - Explores funding data vs. layoffs.

---

## 📊 Key Insights
- **2022** recorded the highest layoffs (pandemic effect).
- **United States** and **India** were the most impacted countries.
- **Consumer industry** saw maximum layoffs.
- Certain companies consistently ranked among the top 5 for layoffs across years.
- Funding levels (raised capital) did not always prevent large-scale layoffs.

---

## 🛠️ Tech Stack
- **SQL** (MySQL-compatible syntax)
- Window Functions (`ROW_NUMBER`, `DENSE_RANK`, `SUM OVER`)
- Data Cleaning & Transformation
- Exploratory Data Analysis (EDA)

---

## 🚀 How to Use
1. Run `DATA_CLEANING_SQL.sql` to clean and prepare the dataset.
2. Run `WORLD_LAYOFFS_EDA_SQL.sql` for analysis and insights.
3. Connect results with BI tools (Power BI, Tableau) for visualization.

---

## 📌 Author
👤 **Yogesh Jaiswar**  
Data Analysis | SQL | BI Tools
