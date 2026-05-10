## Lost Revenue Alerts
Weekly automated churn detection and rep alerting system built with Microsoft Power Automate, SharePoint, and Outlook Tasks.

## The Problem
Customer accounts were going quiet for weeks with no alerts and no process to catch it. By the time a rep noticed, the revenue was already gone.

## sharepoint_customer_list

![sharepoint_customer_list](https://github.com/atreyeed01/sales-ops-portfolio/blob/b58987d344ccb088d7247981a5861ce0c6aa1db7/Automation/Lost-Revenue-Alerts/SharePoint%20Customer%20Sheet.png)

## The Solution
A scheduled Power Automate flow that runs every Monday morning without any manual input
Automatically flags any customer inactive for 30 or more days, updates their risk status, and emails the sales rep
Creates a high importance follow-up task in Outlook for every at-risk account

## power_automate_full

![power_automate_full](https://github.com/atreyeed01/sales-ops-portfolio/blob/b58987d344ccb088d7247981a5861ce0c6aa1db7/Automation/Lost-Revenue-Alerts/Power%20Automate%20lost%20revenus%20flow.png)

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

## Key Metrics
30 days - inactivity threshold before an alert triggers
10 accounts - flagged and actioned every Monday
0 hours - manual effort required per week

## Technical Challenges
SharePoint encodes column names internally  diagnosed using the REST API and fixed the filter query accordingly
DaysSinceLastOrder was returned as text rather than a number,  resolved using an int() conversion in the condition step
The date calculation expression required the correct internal loop name from Power Automate - identified via the flow code view

## What I Would Build Next
Route alerts to each individual rep so they only receive their own accounts
Connect LastOrderDate directly to the ERP so the list updates automatically when a new order is placed

## GDPR
All data is entirely synthetic and GDPR compliant, no real customer or business data was used at any point.
