## Overview

The Weekly Margin Risk Report started with a simple observation — margin leakage was happening silently every week and nobody was seeing it until month end. In a busy internal sales environment, reps give discounts on the spot to win jobs, products get sold below cost, and customers quietly become unprofitable. By the time the month-end report landed, the invoices had already gone out and the damage was done.

This automation fixes that. Every Monday morning at 8am it runs automatically, reads three data tables from SharePoint covering orders, customers and products, filters for at-risk records across four risk categories, and sends one clean formatted report straight to management. No manual work, no waiting until month end, no margin leakage going unnoticed. Management starts every week already knowing where the risk is.

## Working Sheet

![Working Sheet](https://github.com/atreyeed01/sales-ops-portfolio/blob/ba7b5dd1d2e7daca957c1d226245faedcebc8b4f/Weekly-Margin-Risk-Report/Weekly%20Margin%20Risk%20Report_20260510144718.zip)

Orders were being processed below acceptable margin thresholds with no alerts and no review process. By the time anyone noticed, the revenue impact had already compounded across weeks of unchecked discounting

## The Solution
A scheduled Power Automate flow that runs every Monday morning at 8am without any manual input
Automatically reads order, customer and product data from SharePoint and filters for at-risk records across four categories
Sends a formatted HTML email to management with an executive summary header and four detailed risk tables

## Automated Flow

![Automated Flow](https://github.com/atreyeed01/sales-ops-portfolio/blob/c3ccb8f908c5916fc8e2d63d41cf0eb3bd94beac/Weekly-Margin-Risk-Report/Automation%20Flow.png)

## Tools Used

Microsoft Power Automate
SharePoint
Excel Online
Outlook
Microsoft 365

## How It Works

Flow triggers every Monday at 8am on a scheduled recurrence
Reads all rows from the Orders table in SharePoint Excel workbook
Reads all rows from the Customers table in SharePoint Excel workbook
Reads all rows from the Products table in SharePoint Excel workbook
Compiles all at-risk records across four risk categories
Sends a formatted HTML email to management with three KPI tiles at the top
Full detail tables below covering all four risk areas

## Automated Email

![Automated Email](https://github.com/atreyeed01/sales-ops-portfolio/blob/ba7b5dd1d2e7daca957c1d226245faedcebc8b4f/Weekly-Margin-Risk-Report/Automated%20Email%201.png)
![Automated Email](https://github.com/atreyeed01/sales-ops-portfolio/blob/ba7b5dd1d2e7daca957c1d226245faedcebc8b4f/Weekly-Margin-Risk-Report/Automated%20Email%202.png)
![Automated Email](https://github.com/atreyeed01/sales-ops-portfolio/blob/ba7b5dd1d2e7daca957c1d226245faedcebc8b4f/Weekly-Margin-Risk-Report/Automated%20Email%203.png)
![Automated Email](https://github.com/atreyeed01/sales-ops-portfolio/blob/ba7b5dd1d2e7daca957c1d226245faedcebc8b4f/Weekly-Margin-Risk-Report/Automated%20Email%204.png)

## Full Report

![Full Report](https://github.com/atreyeed01/sales-ops-portfolio/blob/ba7b5dd1d2e7daca957c1d226245faedcebc8b4f/Weekly-Margin-Risk-Report/Weekly%20Margin%20Risk%20Report.pdf)

## The Four Risk Categories

Orders below 18% margin threshold
Orders with discounts above 10%
Customers with a negative month-on-month margin change
Products where current margin is lower than previous month and trend is declining

## Key Metrics

18% This is the margin threshold used for flagging individual orders. Any order processed below 18% margin is automatically included in the low-margin section of the report. The 18% threshold reflects a realistic minimum acceptable margin for a building materials distributor where product costs, delivery and overhead must be covered.

15% The real-time alert flow uses a tighter 15% threshold. This deliberately catches only the most critical breaches, orders so far below acceptable margin that they cannot wait until Monday. The gap between 15% and 18% means the weekly report provides broad visibility while the real-time alert reserves itself for genuinely urgent cases.

0 hours Once the flow is live, no one needs to do anything. No manual data pulls, no report compilation, no chasing. The entire process runs and completes without any human input every single week.

4 risk categories monitored simultaneously across orders, customers and products in a single automated flow.

## How to Use This Flow

**Step 1** - Set up the Excel workbook
Create an Excel workbook in SharePoint called Margin Risk Data. Add three sheets named Orders, Customers and Products. Format each sheet as a named Excel Table using the exact same names - Orders, Customers, Products.

**Step 2 ** - Add the data columns
Orders table: OrderID, CustomerName, RepName, ProductName, MarginPct, Discount, OrderDate, Status
Customers table: CustomerID, CustomerName, Segment, TotalSpend, AvgMargin, MoMMarginChange
Products table: ProductID, ProductName, Category, CurrentMargin, PrevMonthMargin, MarginTrend

**Step 3** - Build the flow in Power Automate
Go to make.powerautomate.com and create a new Scheduled cloud flow. Set the trigger to run every Monday at 8am. Add three List rows present in a table steps - one for each Excel table. Add a Send an email (V2) step with the HTML email template.

**Step 4** - Configure the email body
Switch the email body to HTML mode using the code view icon. Paste the HTML template from this repository. The template includes the executive summary header with three KPI tiles and four colour-coded risk tables below.

**Step 5** - Update the email address
In the Send an email step replace the existing email address with the management email address alerts should be delivered to.

**Step 6 ** - Test and turn on
Click Test, select Manually and run the flow. Check your inbox for the report. Once confirmed working, save the flow and it will run automatically every Monday at 8am.

## Weekly Margin Risk Report

![Weekly Margin Risk Report](https://github.com/atreyeed01/sales-ops-portfolio/blob/ba7b5dd1d2e7daca957c1d226245faedcebc8b4f/Weekly-Margin-Risk-Report/Weekly%20Margin%20Risk%20Report_20260510144718.zip)

## Technical Notes

Excel tables must be formatted as named Tables in Excel Online - plain pasted data is not readable by Power Automate
MarginPct and Discount columns must contain numeric values - text formatting will cause type mismatch errors
MoMMarginChange in the Customers table should be negative for declining customers - the flow reads this field directly
MarginTrend in the Products table should contain the word Declining - the flow filters on this exact text

## GDPR

All data used in this project is entirely synthetic and GDPR compliant - no real customer or business data was used at any point. The dataset was built to mirror realistic order patterns in the UK building materials sector.

Author 
Atreyee Deb 
[LinkedIn](https://www.linkedin.com/in/atreyee-deb) 
Birmingham, UK
