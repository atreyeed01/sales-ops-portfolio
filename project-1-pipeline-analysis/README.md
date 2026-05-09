# Sales Performance & Pipeline Analysis

## About This Project
I built this project to demonstrate a full Sales Operations workflow, from a raw, messy CRM export through to a cleaned dataset, a multi-page Power BI dashboard, and a live Make.com automation. The dataset is a synthetic UK B2B sales pipeline with 650 opportunities, and the goal was to answer the questions a sales leader would actually bring to a Monday morning pipeline review: Where are deals getting stuck? Which reps need support? Where is revenue being lost between close and invoice?

## Dataset
The dataset contains 650 synthetic sales opportunities covering the period January 2024 to March 2025, across 24 fields including pipeline stage, sales rep, deal value, industry, region, product line, lead source, cycle length, win/loss flag, and invoiced value. It was built to reflect a realistic UK mid-market B2B sales pipeline, including the kind of data quality issues that come with a CRM that has been running without governance.

## What I Did

**Data Understanding**
Reviewed all 24 columns to understand field types, expected values, and relationships between fields before touching anything.

**Data Validation**
Identified 8 categories of data quality issues across the 650-row dataset including missing deal values, incorrect industry classifications entered by reps, stale deals with no activity for 30+ days, zombie deals sitting in late stages for 90+ days, and revenue leakage where invoiced amounts fell below the contracted deal value.

**Data Standardisation**
Used VLOOKUP against a Company Master Reference file to identify and correct 84 rows with incorrect industry classifications. Built flag columns for each data quality issue to track what needed fixing.

**Data Cleaning**
Created a separate Clean_Data sheet by removing unreliable rows, deals with missing values, stale deals, and zombie deals. 243 rows were removed, leaving 458 clean records for analysis.

**KPI Analysis**
Calculated 9 headline KPIs including total pipeline value, weighted forecast, win rate, average deal value, average cycle length, and total revenue leakage across the clean dataset.

**Segmented Analysis**
Built analysis across 4 dimensions, pipeline by stage, pipeline by region, pipeline by product, and rep-level performance, covering deal count, total value, weighted forecast, win rate, average cycle length, and percentage of total pipeline.

**Power BI Dashboard**
Built a single-page interactive dashboard with 4 KPI cards, 5 charts, and 3 slicers. Slicers filter the entire dashboard by region, product line, and deal tier. DAX measures were written for win rate, average cycle length, revenue leakage, and total won value.

**Make.com Automation**
Built a live automation that connects to the pipeline Google Sheet, identifies any deal with no activity in more than 14 days, and sends a formatted email alert to the assigned rep with full deal context, company, stage, deal value, region, and days inactive.

**Executive Summary**
Wrote a one-page business summary covering the key findings, prioritised recommendations, and commercial impact estimates, formatted for a sales leadership audience.

## Key Findings
- 37% of the original CRM data had quality issues before any analysis could run
- EMEA deals take an average of 217 days to close versus 117 days for UK deals, an 85% difference that makes regional forecasting unreliable if treated equally
- Analytics Suite has a Discovery stage bottleneck, 184 days average cycle versus 154 days for the fastest product
- Win rates range from 11% to 40% across the 15-rep team, a gap not explained by territory or deal mix alone
- £121,069 in contracted revenue was invoiced below the agreed deal value across 19 closed won deals
- Aisha Okafor leads on both win rate (40%) and total won value (£0.95M). Emma Clarke, Nadia Kowalski and Tom Nguyen are all below 15% win rate and flagged for coaching review

## Tools Used
Microsoft Excel - Data cleaning, validation, standardisation, and analysis
Power BI - Interactive dashboard with DAX measures and slicers
Make.com - Automated stale deal alert workflow
SQL - Analytical queries written to demonstrate how this analysis would run against a live CRM database
Google Sheets - Live data source for the Make.com automation

## Excel Functions Used

**Data Validation & Flags**
- COUNTBLANK - used to identify missing values across key columns
- IF - used to flag rows as Missing or OK for deal value, lead source, and expected close date
- AND / OR - used in combination with IF for multi-condition flags such as zombie deal detection
- SUMPRODUCT - used to calculate revenue leakage across won deals by comparing deal value against invoiced value

**Data Standardisation**
- VLOOKUP - used to pull correct industry classifications from the Company Master Reference file
- IFERROR - used to handle unmatched companies in the VLOOKUP without breaking the formula
- COUNTIF - used to count remaining mismatches after standardisation

**KPI Analysis**
- SUM - total pipeline value and weighted forecast
- COUNTIF - won deals, lost deals, missing values
- AVERAGEIF - average cycle length excluding blank cells for open deals
- IFERROR - used to prevent divide by zero errors in win rate and average deal value calculations

**Segmented Analysis**
- SUMIF - pipeline value and weighted forecast by stage, region, product, and rep
- COUNTIF - deal count by stage, region, product, and rep
- AVERAGEIFS - average cycle length filtered by region, product, and rep simultaneously
- COUNTIFS - win rate numerator filtered by both rep name and won flag at the same time
- IFERROR - applied to all division-based calculations

## DAX Measures Used (Power BI)
- Total Pipeline Value = SUM of Deal_Value_£
- Win Rate % = DIVIDE with COUNTROWS and FILTER on Won_Flag
- Avg Cycle Length = CALCULATE with AVERAGE excluding blank cycle lengths
- Revenue Leakage = SUMX across filtered won deals comparing deal value to invoiced value
- Total Won Value = CALCULATE with SUM filtered to Won_Flag = Yes

## Make.com Automation — How It Works

**What it does**
This automation monitors a Google Sheet that acts as a live sales pipeline. Every time it runs, it searches for any deal where the Days_Since_Last_Activity column shows a value greater than 14. For every deal that meets that condition, it automatically sends a formatted email alert to the assigned rep containing the full deal context — company name, pipeline stage, deal value, region, and how many days it has been inactive — along with a clear call to action.

Without this automation, a Sales Ops Analyst would need to manually check every open deal in the pipeline each day to identify which ones have gone cold. At 458 deals that would take 2 to 3 hours per week. The automation does it in seconds.

**View the live scenario**
You can view the automation blueprint here:
[View Make.com Scenario](https://us2.make.com/public/shared-scenario/32zkznbEZbG/integration-google-sheets-gmail)

**How to use it yourself**
If you want to run this automation with your own data, follow these steps:

1. Click the scenario link above
2. Click **Save a copy** to add it to your own Make.com account — you will need a free Make.com account to do this
3. Open the **Google Sheets** module and reconnect it to your own Google account
4. Point it at your own Google Sheet — the sheet needs a column called **Days_Since_Last_Activity** containing numbers
5. Set the filter condition to **Days_Since_Last_Activity — Greater than — 14** or change 14 to whatever threshold suits your team
6. Open the **Gmail** module and reconnect it to your own Gmail account
7. Update the **To** field with your own email address for testing
8. Click **Run once** to test — check your inbox for the alert email
9. Once confirmed working, set the schedule to run daily at 8am

**How to change the email recipient**
By default the automation sends to a test email address. To send to the actual rep assigned to each deal, the Rep_Name or Rep_Email field from your Google Sheet needs to be mapped to the To field in the Gmail module. If your sheet has a Rep_Email column, drag that field into the To field inside the Gmail module settings.

**Blueprint file**
The full automation blueprint is included in this repository as a JSON file. You can import it directly into Make.com by going to your Make.com dashboard, clicking Create a new scenario, and selecting Import Blueprint.

## Dashboard Preview
![Dashboard](screenshots/powerbi-dashboard.png)

## Automation Preview
![Make.com Workflow](screenshots/make-workflow.png)
![Stale Deal Alert Email](screenshots/stale-deal-email.png)

## Author
Atreyee Deb
[LinkedIn](www.linkedin.com/in/atreyeedeb)
Birmingham, UK
