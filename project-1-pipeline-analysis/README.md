# Sales Performance & Pipeline Analysis

## Overview
This project walks through a full Sales Operations workflow using a synthetic UK B2B sales pipeline. Starting from a raw CRM export with 650 opportunities, the work covers everything from data cleaning and validation through to an interactive Power BI dashboard and a live automated alert system built in Make.com. The goal was straightforward - take messy, unreliable data and turn it into something a sales leader could actually use to make decisions.

## Dashboard Preview

![Sales Pipeline Dashboard](https://github.com/atreyeed01/sales-ops-portfolio/blob/8ebc7a8164507ffb9546df588173208f11640a5d/project-1-pipeline-analysis/Powerbi%20dashboard.png)

## Automation Preview

![Make.com Workflow](https://github.com/atreyeed01/sales-ops-portfolio/blob/9aea75682c4971aa646bb890c4bb14ed96290776/project-1-pipeline-analysis/Automated_Email_Stale_Deal_Alert.png)


## Project Objectives

- Clean and validate a raw CRM export of 650 opportunities before any analysis could run.
- Identify and document every data quality issue with its commercial impact.
- Build a segmented analysis covering pipeline stage, region, product, and rep performance.
- Create an interactive Power BI dashboard that sales leadership could use in a Monday morning review.
- Automate stale deal monitoring so reps get alerted automatically, without a manual check needed.

## Dataset
The dataset contains 650 synthetic sales opportunities from January 2024 to March 2025, across 24 fields including pipeline stage, sales rep, deal value, industry, region, product line, lead source, cycle length, win/loss flag, and invoiced value. It was built to reflect a realistic UK mid-market B2B pipeline -including the kind of data quality problems that build up in a CRM that has been running without proper governance.

## PROCESS

## Data Validation
Before touching anything, all 24 columns were reviewed to understand what each field contained and what a clean record should look like. Eight categories of data quality issues were identified across the dataset - from missing deal values and incorrect industry labels entered by reps, to stale deals with no activity for 30 days or more and revenue gaps where invoiced amounts fell below the contracted value.

## Data Cleaning
A Company Master Reference file was used with VLOOKUP to identify and correct 84 rows where reps had entered the wrong industry classification. Flag columns were built for every issue found. A separate Clean_Data sheet was created by removing unreliable records - 243 rows in total - leaving 458 clean opportunities for analysis.

## Analysis
Nine headline KPIs were calculated including total pipeline value, weighted forecast, win rate, average deal value, average cycle length, and total revenue leakage. The analysis was then broken down across four dimensions - pipeline by stage, pipeline by region, pipeline by product, and rep-level performance, to surface the patterns behind the numbers.

## Dashboard
A single-page interactive Power BI dashboard was built with four KPI cards, five charts, and three slicers filtering by region, product line, and deal tier. DAX measures were written for win rate, average cycle length, revenue leakage, and total won value per rep.

[View Interactive Dashboard](https://app.powerbi.com/groups/me/reports/09c5413f-d5bd-4b32-a074-25a04409f4a6/d4e92190d8e87003a8a9?experience=power-bi)

## Automation
A Make.com workflow was built connecting a Google Sheet pipeline tracker to Gmail. Every time it runs, it searches for deals with no activity in more than 14 days and sends a formatted alert email to the assigned rep with full deal context - company, stage, value, region, and days inactive, along with a clear prompt to take action.

## Key Findings
37% of the original CRM data had quality issues before any analysis could run
EMEA deals take an average of 217 days to close versus 117 days for UK deals, an 85% difference that makes regional forecasting unreliable when treated equally
Analytics Suite has a Discovery stage bottleneck, averaging 184 days to close versus 154 days for the fastest product in the portfolio
Win rates range from 11% to 40% across the 15-rep team, a gap that territory and deal mix alone do not explain
£121,069 in contracted revenue was invoiced below the agreed deal value across 19 closed won deals
Aisha Okafor leads on both win rate at 40% and total won value at £0.95M. Emma Clarke, Nadia Kowalski, and Tom Nguyen are all below 15% win rate and flagged for coaching review

## Recommendations
Stop forecasting EMEA and UK on the same timeline as EMEA deals take nearly twice as long and treating them equally overstates near-term revenue
Pull the 19 leakage deals and check them against original contracts up to £121K in contracted revenue is sitting there uncollected
The 24 zombie deals need a decision this week as either a rep picks up the phone or the deal gets marked Closed Lost
Initiate a coaching review for Emma Clarke, Nadia Kowalski, and Tom Nguyen based on win rate data, closing the gap to team average could add £300K to £500K in annual revenue
Investigate the Analytics Suite Discovery bottleneck - scoping templates or deal desk support could take 30 days off the cycle and accelerate over £1M in pipeline
Make Lead Source and Deal Value mandatory fields in Salesforce at Qualified stage, this project took over 2 hours of cleaning time just to fix what should have been entered correctly from day one

## Make.com Automation
The automation monitors the sales pipeline Google Sheet daily. Any deal where no activity has been logged in more than 14 days triggers an automatic email alert to the assigned rep. The email includes the full deal context - company name, stage, deal value, region, and days inactive, so the rep has everything they need to act without opening the CRM.
Without this, a Sales Ops Analyst would need to manually check every open deal each day to find which ones have gone cold. At 458 deals that is 2 to 3 hours of work per week. The automation does it in seconds.

[View Live Scenario](https://us2.make.com/public/shared-scenario/32zkznbEZbG/integration-google-sheets-gmail)

## How to use it yourself
1. Click the scenario link above
2. Click Save a copy to add it to your own Make.com account
3. Connect the Google Sheets module to your own Google account
4. Point it at your own Google Sheet - it needs a column called Days_Since_Last_Activity containing numbers
5. Set the filter to Days_Since_Last_Activity greater than 14
6. Connect the Gmail module to your own Gmail account
7. Update the To field with your email address for testing
8. Click Run once to test - check your inbox for the alert email
9. Once confirmed working set the schedule to run daily at 8am

## Blueprint file
The full automation blueprint is included in this repository as a 
JSON file. Import it into Make.com by going to your dashboard, 
clicking Create a new scenario and selecting Import Blueprint.

## Tools Used

- **Microsoft Excel** - data cleaning, validation, standardisation and analysis
- **Power BI** - interactive dashboard with DAX measures and slicers
- **Make.com** - automated stale deal alert workflow
- **SQL** - analytical queries written against CRM-style data
- **Google Sheets** - live data source for the Make.com automation

## Files in This Repository

- `data/` - raw CRM export and cleaned dataset in Excel
- `dashboard/` - Power BI .pbix dashboard file
- `summary/` - Executive Summary Word document
- `screenshots/` - dashboard and automation screenshots
- `Integration_Google_Sheets__Gmail_blueprint.json` -  Make.com automation blueprint, import this into Make.com to clone the workflow

Author 
Atreyee Deb 
[LinkedIn](https://www.linkedin.com/in/atreyee-deb) 
Birmingham, UK
