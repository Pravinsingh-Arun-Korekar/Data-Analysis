# Nayara Logistic Service: Delivery Metrics Hub 🚚

![Project Status](https://img.shields.io/badge/Status-Completed-success)
![Data Analysis](https://img.shields.io/badge/Analysis-Univariate%20%7C%20Bivariate%20%7C%20Multivariate-blue)

## 📌 Project Overview
The **Nayara Logistic Service Dashboard** is designed to optimize delivery performance and protect profit margins. By analyzing factors such as weather conditions, vehicle types, and delivery partner performance, this project identifies the root causes of delays and cost inefficiencies.

### Key Objectives:
* **Cost Optimization:** Identify high-cost delivery routes and partners.
* **Margin Protection:** Balance shipping speed with affordable logistics to maintain profitability.
* **Performance Tracking:** Monitor delivery speeds and delay triggers (e.g., stormy weather or transport issues).

---

## 📊 Dashboard Highlights
The analysis was performed on a dataset of **24,750 total orders**. 

### Metrics Captured:
| Metric | Description |
| :--- | :--- |
| **Average Cost** | ₹ 868.47 |
| **Regional Focus** | Analysis across Central, East, North, South, and West regions. |
| **Delivery Partners** | Delhivery, FedEx, Blue Dart, Shadowfax, Amazon Logistics, etc. |
| **Vehicle Types** | Bike, EV Bike, EV Van, Scooter, Truck, Van. |

---

## 📂 Data Dictionary
The project utilizes several key features to drive insights:
* `delivery_id`: Unique identifier for each shipment.
* `weather_condition`: Impact of Clear, Rainy, Foggy, or Stormy weather on delivery time.
* `delayed`: Binary flag (Yes/No) indicating missed targets.
* `delivery_cost`: The final calculated cost, used to determine profit margins.
* `package_type`: Categories include Electronics, Fragile, Groceries, Cosmetics, etc.

---

## 🔬 Analysis Methodology
This project implements three layers of data science techniques:

1.  **Univariate Analysis:** Describing single variables (e.g., Distribution of package weights).
2.  **Bivariate Analysis:** Examining relationships between two variables (e.g., Weather vs. Delay Status).
3.  **Multivariate Analysis:** Understanding complex interactions (e.g., Vehicle Type + Region + Weather vs. Delivery Cost).

---

## 💡 Key Insights & Findings
* **Delay Triggers:** High correlation between "Stormy/Rainy" weather and "Delayed" status.
* **Profitability:** The dashboard tracks "Estimated Cost" vs. "Actual Cost" to visualize profit per order (e.g., Order #5343 showed a profit of ₹518.86).
* **Vehicle Efficiency:** Comparison of order counts across different vehicle types to determine the most utilized transport mode.

---

## 🛠️ Tools Used
* **Data Visualization:** Excel / Power BI (Dashboarding)
* **Analysis:** Descriptive Statistics and Multivariate Regression
* **Presentation:** PowerPoint

---
**Presented By:** Pravinsingh Korekar  
