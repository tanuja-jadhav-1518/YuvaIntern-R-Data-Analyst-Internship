# YuvaIntern – R Data Analyst Internship

## Project Title
**Data Cleaning, Preprocessing and Exploratory Data Analysis using R**

## 1. Project Overview
This project was completed as part of the YuvaIntern Virtual R Data Analyst Internship. The main objective is to perform data cleaning, preprocessing, outlier detection, normalization, categorical encoding, and exploratory data analysis using R programming.

The project uses the publicly available Titanic dataset to understand passenger information and identify patterns related to survival.

## 2. Dataset Description
The Titanic dataset contains 891 passenger records and 12 original variables.

**Important variables include:**
- PassengerId
- Survived
- Pclass
- Name
- Sex
- Age
- SibSp
- Parch
- Ticket
- Fare
- Cabin
- Embarked

## 3. Technologies Used
- R Programming
- RStudio
- CSV Dataset
- Data Visualization
- Statistical Analysis

## 4. Project Tasks

### Task 1: Data Inspection and Missing Value Analysis
- Imported the Titanic dataset.
- Inspected the dataset using `head()`, `dim()`, `str()`, and `summary()`.
- Identified missing values.
- Calculated missing-value percentages.
- Checked duplicate records.

### Task 2: Data Cleaning
- Created a copy of the original dataset.
- Converted blank strings into NA values.
- Handled missing Age values using grouped median values.
- Handled missing Embarked values using mode.
- Created a Cabin availability variable.

### Task 3: Outlier Detection
- Selected numerical variables: Age, Fare, SibSp, and Parch.
- Applied the Interquartile Range (IQR) method.
- Generated boxplots to identify outliers.
- Prepared an outlier summary.

### Task 4: Normalization and Encoding
- Applied normalization to selected numerical variables.
- Encoded categorical variables.
- Created a processed dataset for further analysis.

### Task 5: Exploratory Data Analysis
- Generated descriptive statistics.
- Analyzed survival by gender and passenger class.
- Created data visualizations.
- Generated a correlation matrix.
- Identified preliminary insights from the dataset.

## 5. Project Results
The analysis identified 177 missing values in the Age variable, representing approximately 19.87% of the dataset.

The original dataset contained 891 observations and 12 variables. After preprocessing, the dataset contained 891 observations and 23 variables.

The analysis also generated outlier summaries, survival analysis tables, correlation results, and visualizations.

## 6. Repository Contents
- `01_Data_Inspection_and_Missing_Values.R` – Initial dataset inspection.
- `02_Data_Cleaning.R` – Missing-value handling and data cleaning.
- `03_Outlier_Detection.R` – Outlier identification and boxplots.
- `04_Normalization_and_Encoding.R` – Data transformation and encoding.
- `05_Exploratory_Data_Analysis.R` – Statistical analysis and visualizations.
- `trainn.csv` – Original Titanic dataset.
- `Titanic_Processed.csv` – Processed dataset.
- CSV files – Analysis results and summaries.
- PNG files – Data visualization outputs.

## 7. Conclusion
This project provided practical experience in data cleaning, preprocessing, statistical analysis, outlier detection, normalization, encoding, and exploratory data analysis using R.

It helped develop an understanding of how raw datasets can be transformed into structured and meaningful information for further analysis.

## 8. Internship
**Organization:** YuvaIntern  
**Internship:** Virtual R Data Analyst Internship  
**Task:** Week 1 – Data Cleaning and Preliminary Analysis with R

## 9. Author
**GitHub:** tanuja-jadhav-1518
