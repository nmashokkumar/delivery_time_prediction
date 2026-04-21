# Delivery Time Estimation | Predictive Analytics in Quick Commerce

# EXECUTIVE SUMMARY
Built a machine learning model to improve delivery time (ETA) prediction for a quick commerce platform (Zepto use case), focusing on operational efficiency and customer experience. The project simulates real-world last-mile delivery constraints such as traffic, rider batching, and demand spikes.

- **Business Problem:** Inaccurate ETAs lead to cancellations, poor customer trust, and inefficient rider allocation  
- **Approach:** Feature engineering + tree-based models (LightGBM) with interaction effects  
- **Impact:** Reduced MAE from **4.18 → 0.75 minutes (~82% improvement)**  

---

# BUSINESS PROBLEM
In quick commerce, delivery speed is the core value proposition. Incorrect ETA predictions result in missed expectations, leading to order cancellations and reduced customer retention.  

The goal is to build a system that can **accurately predict delivery time under real-world operational constraints**, enabling better rider allocation and improving SLA adherence.

---

# METHODOLOGY

- **Data Extraction (SQL):**
  - Joins across orders, deliveries, riders, stores
  - Aggregations and CTEs for structured dataset creation  

- **Data Processing (Python):**
  - Data cleaning and validation
  - Feature engineering (interaction features, time-based features)

- **Segmentation & Analysis:**
  - Distance buckets (short / medium / long)
  - Traffic levels (low / medium / high)
  - Peak vs non-peak demand  

- **Modeling:**
  - Baseline (mean prediction)
  - Random Forest
  - XGBoost
  - **LightGBM (final model with tuning)**  

---

# SKILLS

**SQL:**
- CTEs  
- Joins  
- Aggregations  
- Data preparation for modeling  

**Python:**
- Pandas  
- NumPy  
- Feature Engineering  
- Model Training (Scikit-learn, LightGBM)  
- Error Analysis  

**BI Tools:**
- Power BI (conceptual KPI design and visualization thinking)

**Analytics Concepts:**
- Feature Engineering  
- Interaction Effects  
- Model Evaluation (MAE, RMSE)  
- Error Analysis  
- Operational Analytics  

---

# RESULTS & BUSINESS RECOMMENDATIONS

Model performance improved significantly, with feature engineering driving the majority of gains. Interaction effects played a critical role in capturing real-world delivery dynamics.

### Key Insights
- Delivery time increases **non-linearly with rider batching (~45% increase from 1 → 3 orders)**
- **High traffic + high batching** creates worst-case delays
- Model **overestimates long-distance deliveries under low traffic**
- Errors are higher in **multi-factor interaction scenarios**

### Behavioral Findings
- Distance is the primary driver of delivery time
- Batching impact is stronger than expected
- Traffic effects are amplified when combined with operational load

### Recommendations
- Limit rider batching during high traffic periods  
- Dynamically increase rider supply during peak hours  
- Implement **smart batching (only for short-distance orders)**  
- Introduce correction layer to adjust bias in edge cases  

---

# NEXT STEPS

- Integrate **real-time traffic data** for dynamic predictions  
- Incorporate **rider-level behavior and performance metrics**  
- Build **correction layer to handle systematic prediction bias**  
- Deploy model with monitoring for **live error tracking**  
- Explore **segment-based models (short vs long distance deliveries)**  
