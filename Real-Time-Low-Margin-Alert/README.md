## Overview

The Real-Time Low Margin Alert started with a simple observation that, not every order that comes in is a good order. Some are priced too low, some are discounted beyond what the margin can absorb. But without a live signal, there was no way to know until the invoice had already gone out.

In a busy internal sales environment, reps make pricing decisions on the spot to win jobs. By the time management reviewed margin performance, the deals were done, the invoices were raised and the margin was gone. There was no trigger, no threshold and no alert in place.

This automation fixes that. The moment a rep submits a new order, the flow checks the margin instantly. If it falls below 15%, an alert email fires to management with full order details - customer, rep, product, margin and discount, so the conversation can happen before the invoice goes out. If the margin is healthy, the flow ends silently. No noise, no unnecessary alerts, no manual monitoring required.

## Automated Flow

![Automated Flow](https://github.com/atreyeed01/sales-ops-portfolio/blob/7f78ba207efad4b60bf89c36a7f9f184cc4ea29f/Real-Time-Low-Margin-Alert/Automated%20Flow.png)

## The Solution

A Power Automate flow triggered instantly when a rep submits a new order via Microsoft Forms
Checks margin against a 15% threshold automatically on every submission
Fires an alert email to management with full order details if the threshold is breached
Ends silently with no email if the margin is acceptable

## Microsoft Forms

![Microsoft Forms](https://github.com/atreyeed01/sales-ops-portfolio/blob/7f78ba207efad4b60bf89c36a7f9f184cc4ea29f/Real-Time-Low-Margin-Alert/Microsoft%20Form.png)

Automated Eamil

![Automated Email](https://github.com/atreyeed01/sales-ops-portfolio/blob/7f78ba207efad4b60bf89c36a7f9f184cc4ea29f/Real-Time-Low-Margin-Alert/Automated%20Email.png)



## Tools Used

Microsoft Power Automate
Microsoft Forms
SharePoint
Outlook
Microsoft 365

## How It Works

Rep submits a new order via the New Order Submission Microsoft Form
Flow triggers instantly on form submission
Get response details step retrieves all submitted field values
Filter array checks whether Margin % is below 15%
Condition checks whether the filter returned any results
If yes - alert email sent to management immediately with full order details
If no - flow ends silently, no email sent

## The Form Fields

Order ID
Customer Name
Rep Name
Product Name
Margin %
Discount %
Order Date
Status

## Key Metrics

15% This is the margin threshold used to decide whether an alert fires. Any order submitted below 15% margin triggers an immediate email to management. The threshold was deliberately set at 15% rather than 18% to avoid alert fatigue - only genuinely critical orders trigger the notification. The weekly margin risk report covers the broader 18% sweep.

60 seconds From form submission to alert email landing in management inbox. The flow triggers instantly on submission and completes within 60 seconds in testing.

0 hours Manual monitoring required. The flow watches every submission automatically and only speaks up when something needs attention.

27% of orders in the test dataset fell below the 15% threshold. In a live environment where average order values run into thousands of pounds, catching even one below-cost order before invoicing protects meaningful margin every week.


## How to Use This Flow

Step 1 - Create the Microsoft Form
Go to forms.microsoft.com and create a new form called New Order Submission. Add eight questions in this exact order - Order ID, Customer Name, Rep Name, Product Name, Margin %, Discount %, Order Date, Status. Set Order Date as a Date type. Set all others as Text type. Toggle Required on for all eight fields.

Step 2 - Build the flow in Power Automate
Go to make.powerautomate.com and create a new Automated cloud flow. Search for When a new response is submitted and select the Microsoft Forms trigger. Select New Order Submission as the form.

Step 3 - Add Get response details
Add a Get response details step. Set the Form ID to New Order Submission. In the Response ID field select Response ID from the dynamic content panel.

Step 4 - Add Filter array
Add a Filter array step. Set the From field to the body value from Get response details. In advanced mode set the filter expression to check whether the Margin % field is less than 15. Use the exact field ID from your form - visible in the raw outputs of the Get response details step.

Step 5 - Add Condition
Add a Condition step. In the left value box use the Expression tab and type length(body('Filter_array')). Set the middle dropdown to is greater than. Set the right value to 0.

Step 6 - Add alert email in True branch
Inside the True branch add a Send an email (V2) step. Set the recipient to the management email address. Set the subject to URGENT Margin Alert - Order Below 15% Margin. Switch the body to HTML mode and paste the alert email template. Replace the placeholder fields with dynamic content from Get response details.

Step 7 - Test the flow
Submit a test response through the form with a Margin % below 15. Check your inbox for the alert email. Confirm all order details appear correctly. Then submit a second test with Margin % above 15 and confirm no email is received.

Step 8 - Turn the flow on
Once confirmed working save the flow and turn it on. It will now trigger automatically on every form submission.

## Weekly Margin Risk Report Zip File

![Weekly Margin Risk Report Zip File](https://github.com/atreyeed01/sales-ops-portfolio/blob/7f78ba207efad4b60bf89c36a7f9f184cc4ea29f/Real-Time-Low-Margin-Alert/RealTimeLowMarginAlert_20260510161646.zip)

## Full Report

![Full Report](https://github.com/atreyeed01/sales-ops-portfolio/blob/7f78ba207efad4b60bf89c36a7f9f184cc4ea29f/Real-Time-Low-Margin-Alert/Real-Time%20Low%20Margin%20Alert%20Report.pdf)

## Test Run

![Test Run](https://github.com/atreyeed01/sales-ops-portfolio/blob/7f78ba207efad4b60bf89c36a7f9f184cc4ea29f/Real-Time-Low-Margin-Alert/Automated%20flow%20Run%20History.png)


## Technical Notes

Microsoft Forms returns all field values as text strings - use float() or int() conversion in filter expressions to compare against numeric thresholds
The exact field IDs for your form are unique - find them by checking the raw outputs of the Get response details step after a test submission
The Filter array advanced mode expression must reference the exact field ID - ot the display name
The Condition step uses length(body('Filter_array')) to check whether any at-risk records were found - this prevents the flow from sending emails when no threshold is breached


## GDPR

All data used in this project is entirely synthetic and GDPR compliant, no real customer or business data was used at any point. Microsoft Forms was used to replicate the order entry process that would occur in a live ERP environment.

Author 
Atreyee Deb 
[LinkedIn](https://www.linkedin.com/in/atreyee-deb) 
Birmingham, UK
