# Retail Sales Data Agent Project

## Project Objective
The objective of this project is to build a Retail Sales Data Agent using Databricks. The agent is designed to help business users such as store managers and business owners ask questions about sales performance and receive clear, data-driven insights in plain language.

---

## Tools Used
- Databricks (SQL + Data Agent)
- SQL for data analysis and validation
- GitHub for version control and project submission
- Microsoft Word for report documentation

---

## Dataset Overview
The dataset used in this project is **retail.sales.dataset**, which contains transaction-level retail data.

### Key columns include:
- Transaction ID  
- Date  
- Customer ID  
- Gender  
- Age  
- Product Category  
- Quantity  
- Price per Unit  
- Total Amount  

This dataset allows analysis of sales performance, customer behaviour, and product trends.

---

## Steps Followed
1. Loaded and explored the dataset in Databricks  
2. Cleaned and reviewed the table structure  
3. Added descriptions to table and columns  
4. Built the Retail Sales Data Agent  
5. Wrote custom agent instructions  
6. Tested the agent using 10 business questions  
7. Validated selected answers using SQL queries  
8. Generated insights and recommendations  

---

## Agent Instructions
The agent follows structured instructions based on role, objective, tasks, and constraints.

- Acts as a Retail Sales Data Analyst  
- Uses only the dataset: **retail.sales.dataset**  
- Provides clear, data-driven insights  
- Avoids assumptions or generated data  
- Explains answers using numbers and simple language  

---

## Sample Questions Tested
- What is the total sales revenue?  
- Which product category performs best?  
- Which category performs the worst?  
- How do sales differ between customer groups?  
- Which category is popular among younger customers?  
- What trends are visible over time?  
- What is the average transaction value?  
- How does price affect quantity purchased?  
- Which category has high revenue but lower quantity?  
- Which customers are most valuable?  

---

## Key Insights
- Revenue is fairly balanced across product categories  
- Electronics generates the highest total revenue  
- Female customers contribute slightly more revenue  
- Sales vary significantly across months  
- Customer purchasing patterns are consistent across price levels  
- High-value transactions contribute a large portion of total sales  

---

## Conclusion
This project demonstrates how a data agent can be used to analyze retail sales data and generate useful business insights. While the agent performs well for structured queries, validation showed that some responses may include assumptions. This highlights the importance of verifying results and using data responsibly.

---
