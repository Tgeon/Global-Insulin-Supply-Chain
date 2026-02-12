# Global-Insulin-Supply-Chain

# Description
This is a Data Visualization project that was completed in R. The purpose of this project is to analyze the global data of insulin and interpret it with research. This project aims to answer the essential question: How do international insulin trade patterns and pricing structures contribute to the affordability crisis facing American diabetes patients?
To better understand this issue, we looked at insulin not only as a medical product, but as a traded global commodity. Insulin doesn’t magically appear in local pharmacies. It is produced in just a handful of countries and shipped all over the world. 

# Research Questions
1. What is the scope of diabetes in the United States, and what proportion of patients depend on insulin therapy for disease management?
2. Which countries dominate U.S. and World insulin imports, and how do their pricing strategies differ in terms of volume versus value?
3. How do current U.S. insulin import expenditures compare to what costs would be if the country shifted toward lower-cost suppliers?

# Sources
This project utilized datasets made available from WITS (World Integrated Trade Solution), Visual Capitalist, HCCI (Health Care Cost Institute), and took analysis inspiration from the CDC. 

# Results
Each individual result and discussion of analysis is made available through the repository R code, complete with multiple interactive visualizations. Overall, this analysis demonstrates that insulin affordability challenges in the United States are driven by a combination of high and geographically concentrated demand alongside structurally inefficient sourcing strategies. Approximately 30–35% of individuals diagnosed with diabetes rely on insulin therapy, representing an estimated 12–14 million insulin-dependent Americans. Export pricing data show that the U.S. imports a substantial share of its insulin from Germany, a supplier with consistently higher prices per kilogram than the global average. Meanwhile, other high-income countries source a greater proportion of insulin from lower-priced, high-volume exporters such as France. As a result, the U.S. pays meaningfully higher prices for the same medication than economic peers, indicating that trade structure not clinical need is a major contributor to national insulin expenditures.

# Appendix
Data Dictionary - Visual Capitalist Insulin Pricing Data
Year - Calendar year of the price observation
10mL Humalog Price ($) - List price in U.S. dollars for 10 mL vial

Data Dictionary - WITS Insulin Import Data
Reporter - Country reporting the trade data
TradeFlow - Direction of trade
ProductCode - HS classification code
Product Description - Description of traded good
Year - Year of trade data
Partner - Country of origin for imports
Trade Value 1000USD - Import value in thousands of US dollars
Quantity - Volume of imports in kilograms
Quantity Unit - Unit of measurement (Kg)

Data Dictionary - HCCI Insulin Pricing Data
Year - Calendar year of price observation (2012-2021)
Price Per 30-day Supply ($) - Average price in U.S. dollars for a 30-day supply of insulin across all insulin types



