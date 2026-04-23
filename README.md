# 💳 CreditPulse Analytics

**CreditPulse Analytics** is a robust financial intelligence platform designed to transform raw transaction records, customer data, and credit card metadata into actionable strategic foresight. By utilizing a **Star Schema** architecture, this project delivers high-performance insights for risk mitigation, fraud detection, and targeted financial growth strategies.

---

## 🌟 Key Insights

Our analysis identifies critical benchmarks for data-driven financial management:

* **📊 Diverse Credit Health:**
    * **Good (670-740):** 937 users
    * **Very Good (740-800):** 468 users
    * **Fair (580-670):** 350 users
    * **Exceptional (>800):** 163 users
    * **Poor (300-580):** 82 users
* **💳 Responsible Card Usage:** A significant cohort maintains a **Credit Utilization Ratio (CUR) below 5%**, well within the optimal "Safe Zone" (0-10%). For example, User 825 exhibits a highly favorable CUR of **2.77%**.
* **💰 Strong Financial Footing:** The analysis isolates high-value clients by cross-referencing **Credit Scores (>700)** with **Debt-to-Income (DTI) ratios (<0.4)**, identifying prime candidates for premium financial products.

---

## 🛠️ Key SQL Analyses

This repository contains optimized SQL scripts to extract the following intelligence:

* **👥 User Segmentation:** Granular categorization of the customer base by credit score bands.
* **⚠️ Inactive Account Detection:** Targeted identification of dormant accounts for retention strategies.
* **⚖️ Credit Utilization (CUR):** Automated calculation of spending-to-limit ratios to map risk zones (Safe, Warning, Stress).
* **💸 Debt-to-Income (DTI):** Long-term financial health assessment to identify low-risk, high-potential individuals.

---

## 📁 Data Source & Modeling

* **Source:** Financial dataset sourced from [Kaggle](https://www.kaggle.com/), covering data spanning the 2010s.
* **Scope:** Includes user demographics, detailed credit card specifics, and comprehensive transaction histories.
* **Model:** Employs a **Star Schema** to organize data into `Dim_User`, `Dim_Cards`, and `Fact_Transactions` tables, ensuring optimal performance for complex analytical queries.

---

## 🚀 Getting Started

1.  **Environment Setup:** Ensure you have a standard SQL-compatible database (e.g., MySQL, PostgreSQL) installed.
2.  **Data Import:** Load the provided dataset tables (`users_data`, `cards_data`, `transactions_data`) into your database.
3.  **Analysis:** Execute the SQL scripts located in this repository to generate reports and visualize customer credit health.

---

*✨ Project maintained by **Pravinsingh Korekar***
