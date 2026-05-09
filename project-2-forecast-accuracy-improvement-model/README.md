## Forecast Accuracy Improvement Model

## Overview
A UK B2B technology company was missing its quarterly sales forecast by 15 to 25 percent every quarter and leadership had lost confidence in the numbers. I took 12 months of messy weekly forecast data from 20 sales reps, cleaned and standardised it, and built a stage-based weighted pipeline model to replace unreliable manual submissions. The project covers the full Sales Operations workflow - data cleaning, analysis, SQL validation, Power BI dashboard, and an automated weekly email via Power Automate.

## Dashboard Preview

![Power BI Dashboard](https://github.com/atreyeed01/sales-ops-portfolio/blob/766a79f2fc5924d332809470837fbe1e5f930873/project-2-forecast-accuracy-improvement-model/Forecase%20Accuracy%20Dashboard.png)

## Automation Preview

![Power Automate Flow](https://github.com/atreyeed01/sales-ops-portfolio/blob/766a79f2fc5924d332809470837fbe1e5f930873/project-2-forecast-accuracy-improvement-model/Automtion%20.png)

![Automated Email](https://github.com/atreyeed01/sales-ops-portfolio/blob/766a79f2fc5924d332809470837fbe1e5f930873/project-2-forecast-accuracy-improvement-model/Automated%20Email%20.png)
![Automated Email](https://github.com/atreyeed01/sales-ops-portfolio/blob/766a79f2fc5924d332809470837fbe1e5f930873/project-2-forecast-accuracy-improvement-model/Automated%20Email.png)


## Project Objectives

Prove that manual rep forecasting is consistently inaccurate and systematically biased
Identify which reps chronically over-forecast and under-forecast and quantify the impact
Build a weighted pipeline model using historical close rates that outperforms manual submissions
Present findings in an interactive Power BI dashboard with rep, segment, and quarter drill down
Automate a weekly forecast summary email to leadership pulling live metrics from Excel on OneDrive

## Dataset
969 rows of weekly forecast data covering January to December 2024, submitted by 20 sales reps across Enterprise, Mid-Market, and SMB segments. 14 fields including Forecasted_Revenue, Actual_Revenue_Closed, Pipeline_Value, Weighted_Pipeline, and Forecast_Submitted_On_Time.

## Process

## Data Validation
Identified 8 data quality issues before touching anything - inconsistent segment names, mixed date formats, text in numeric columns, blank Q4 actuals, and unsupported forecast rows. Quantified every issue using COUNTBLANK, COUNTIF, SUMPRODUCT, and ROWS formulas and logged all findings before cleaning began.

## Data Cleaning
Used nested IF, OR, SUBSTITUTE, and VALUE formulas to standardise segment names, quarter labels, revenue values, and submission flags. Used Power Query for date standardisation. All original columns were preserved, clean versions added alongside them so raw data remained intact as evidence.

## Analysis
Built a six section analysis sheet covering rep accuracy, segment accuracy, quarterly accuracy, pipeline support, weighted model comparison, and key findings. Used SUMIFS, COUNTIFS, ABS, and IFERROR throughout and classified every rep as Over-Forecaster or Under-Forecaster based on their full year pattern.

## Dashboard
Four KPI cards, five charts, and three slicers built in Power BI with six DAX measures powering all visuals dynamically. Charts cover rep accuracy, quarterly trend, segment comparison, and model versus rep benchmarking.

## Automation
A Power Automate scheduled flow runs every Monday at 08:00, retrieves five live metrics from Excel on OneDrive using Get a row actions, and sends a formatted HTML forecast summary email to leadership with dynamic figures that update automatically each week.

## Key Findings
Forecast accuracy was only 40.94% across Q1 to Q3 2024 against an 80% target - total miss of £27.37M
Q3 2024 missed by £16.6M due to a market slowdown - James Whitfield, Helena Forsythe, and Tom Baxter drove the majority of that miss
Tom Baxter, Ben Hartley, and Steven Bowman over-forecast by 30 to 40% every single week across the full year
Sarah Thornton and Daniel Ashworth consistently close more than they forecast, hidden revenue excluded from the company number every week
SMB accuracy was 27.8% with a 72.2% error rate. Enterprise was the strongest segment at 83.5%
71 rows show pipeline that cannot support the forecast submitted, reps predicting revenue with no deals to back it up

## Recommendations
Replace manual rep submissions with the weighted pipeline model as the primary forecast input, reduces forecast error from 59% to an estimated 8%
Enforce pipeline minimums before a forecast is accepted, flag any submission where forecast exceeds three times current pipeline value
Put Tom Baxter, Ben Hartley, and Steven Bowman on a forecast accuracy improvement plan with weekly manager review
Investigate Sarah Thornton and Daniel Ashworth, consistent under-forecasting suggests either low confidence or sandbagging, both of which hide true pipeline strength from leadership

Mandate weekly submissions with a hard deadline - 157 late or missing submissions in this dataset create compounding visibility gaps
Run quarterly forecast calibration sessions using the weighted model as the baseline, reps justify deviations rather than submit unchallenged gut-feel numbers

Power Automate - How It Works
Every Monday at 08:00 this flow sends a formatted forecast summary email to sales leadership. It connects to an Excel file on OneDrive, retrieves five live metrics from a summary table using Get a row actions, and inserts them dynamically into a professionally designed HTML email, no manual effort required each week.
The email includes four KPI boxes with live revenue figures, a segment performance table, rep behaviour flags identifying over and under forecasters, and a direct link to the Power BI dashboard. In a production environment this would connect to a live CRM with the full leadership team on the distribution list.

Full flow documentation: 

Tools Used
Microsoft Excel - Data cleaning, validation, standardisation, analysis, and weighted pipeline model
Power BI Desktop - Interactive dashboard with DAX measures and slicers
MySQL Workbench - SQL queries for targeted business question analysis
Power Automate - Scheduled weekly forecast summary email connected to OneDrive

Files in This Repository
Data - RAW_Forecast_Data.xlsx and WORKING_Forecast_Data.xlsx
SQL - Project2_SQL_Queries.sql
Screenshots - Power BI dashboard, Power Automate flow, automated email, SQL results
Power_Automate - Power_Automate_Flow.md and flow export package zip file

Author 
Atreyee Deb 
[LinkedIn](https://www.linkedin.com/in/atreyee-deb) 
Birmingham, UK
