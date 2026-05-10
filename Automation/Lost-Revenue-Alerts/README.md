## Overview

Lost Revenue Alerts started with a simple observation - customer accounts were going quiet and nobody was doing anything about it, not because reps did not care, but because there was no system telling them it was happening. In a busy internal sales environment, managing a large account base while handling daily enquiries and orders leaves very little time to manually check who has stopped ordering. By the time someone noticed a customer had gone quiet, it was usually too late to recover them. 

This automation fixes that. Every Monday morning it runs automatically, checks every customer account, works out how long each one has been inactive, updates their risk status in SharePoint, and for anyone who has not ordered in 30 or more days it sends the sales rep an email and creates a follow-up task in Outlook. No manual work, no accounts missed, no revenue slipping away unnoticed. The rep starts every week already knowing who needs a call.

## The Problem
Customer accounts were going quiet for weeks with no alerts and no process to catch it. By the time a rep noticed, the revenue was already gone.

## sharepoint_customer_list

![sharepoint_customer_list](https://github.com/atreyeed01/sales-ops-portfolio/blob/b58987d344ccb088d7247981a5861ce0c6aa1db7/Automation/Lost-Revenue-Alerts/SharePoint%20Customer%20Sheet.png)

## The Solution
A scheduled Power Automate flow that runs every Monday morning without any manual input
Automatically flags any customer inactive for 30 or more days, updates their risk status, and emails the sales rep
Creates a high importance follow-up task in Outlook for every at-risk account

## power automate

![power_automate](https://github.com/atreyeed01/sales-ops-portfolio/blob/b58987d344ccb088d7247981a5861ce0c6aa1db7/Automation/Lost-Revenue-Alerts/Power%20Automate%20lost%20revenus%20flow.png)

## Tools Used
Microsoft Power Automate
SharePoint (used as a stand-in CRM)
Outlook Tasks
Microsoft 365

## How It Works
Flow triggers every Monday morning on a scheduled recurrence
Retrieves all customer records from the SharePoint list
Recalculates DaysSinceLastOrder from the LastOrderDate field for every account
Updates Status to At Risk or Active automatically in SharePoint
Checks whether DaysSinceLastOrder exceeds 30 days
Sends an email alert to the sales rep for every at-risk account
Creates a follow-up task in Outlook marked as high importance

## To do tasks Flow

![To do tasks Flow](https://github.com/atreyeed01/sales-ops-portfolio/blob/c4299791c63c44a4d025a8fe84632a94e84f2b5a/Automation/Lost-Revenue-Alerts/To%20do%20tasks%20flow.png)

## Automated Email Alert

![Automate Email Alert](https://github.com/atreyeed01/sales-ops-portfolio/blob/c4299791c63c44a4d025a8fe84632a94e84f2b5a/Automation/Lost-Revenue-Alerts/Automaed%20Email.png)


## Key Metrics

**30 days**
This is the threshold the automation uses to decide whether a customer is at risk. Any account that has not placed an order in more than 30 days is automatically flagged. The 30 day window was chosen to reflect realistic repeat order cycles in the building materials sector, where customers typically reorder every two to six weeks depending on their project pipeline.

**10 accounts**
Based on the synthetic dataset of 20 customers, 10 accounts fall into the at-risk category every Monday. This represents 50 percent of the account base being monitored and actioned automatically each week.

**0 hours**
Once the flow is live, no one needs to do anything. No manual reviews, no checking spreadsheets, no remembering who to chase. The entire process runs and completes without any human input.

## How to Use This Flow

The exported Power Automate package is included in this repository as a zip file. Follow these steps to get it running in your own environment.
**Step 1** — Download the zip file
Download the Power Automate package zip file from this repository.

**Step 2** — Import into Power Automate
Go to flow.microsoft.com and sign in with your Microsoft 365 account. Click My Flows in the left menu, then click Import and select Import Package. Upload the zip file and click Upload.

**Step 3** — Connect your accounts
During the import process you will be asked to connect your SharePoint and Outlook accounts. Click Select during import next to each one and sign in with your Microsoft 365 credentials.

**Step 4** — Create your SharePoint list
Create a SharePoint list with these eight columns exactly as named — CustomerID, CustomerName, RepName, LastOrderDate, DaysSinceLastOrder, Segment, TotalSpend, Status. Make sure DaysSinceLastOrder is set to Number type and LastOrderDate is set to Date type.

**Step 5** — Update the flow connections
Once imported, open the flow and edit the Get Items and Update Item steps to point to your own SharePoint site and list name.

**Step 6** — Update the email address
In the Send an Email step, replace the existing email address with your own so alerts are delivered to the right person.

**Step 7** — Test and turn on
Click Test, select Manually, and run the flow to check everything is working. Once confirmed, save and turn the flow on.

## Lost-Revenue-Alerts-Flow.zip

![Lost Revenue Alerts Flow.zip](https://github.com/atreyeed01/sales-ops-portfolio/blob/348d20e4af0634d1eb4ca45752ac32fcfa036eb7/Automation/Lost-Revenue-Alerts/Loss_Revenue_Alert_20260510000435.zip)

## Full Report

![Full Report](https://github.com/atreyeed01/sales-ops-portfolio/blob/5cefc3cf57d0ef0a7e69d26093fe3dee08228ec5/Automation/Lost-Revenue-Alerts/Lost%20Revenue%20Alerts%20Report.pdf)


## Technical Challenges
SharePoint encodes column names internally  diagnosed using the REST API and fixed the filter query accordingly
DaysSinceLastOrder was returned as text rather than a number,  resolved using an int() conversion in the condition step
The date calculation expression required the correct internal loop name from Power Automate - identified via the flow code view

## GDPR
All data is entirely synthetic and GDPR compliant, no real customer or business data was used at any point.
