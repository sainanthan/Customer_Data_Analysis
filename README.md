# Customer Data Analysis
![Image]

## 📘 Project Overview:
This analysis is based on real customer transactional data containing shopping behavior across various categories, age groups, genders, and payment methods.
**The project covers:**
- Gender-based shopping behavior
- Age-wise customer performance
- Category-level sales & revenue insights
- Payment method usage patterns
- Monthly/seasonal revenue trends
- KPI tracking through Power BI

---

## 🛠️ Tools & Artifacts:
- **MySQL** — Data exploration, queries, aggregations
- **Power BI Desktop** - Dashboard creation & business reporting
- **CSV** — `customer_DA_cleaned.csv` (final cleaned dataset exported from MySQL).
- **Presentation** — `Customer_Data_Analysis_PPT.pptx`.

---

## 🔄 Data Workflow
- SQL Database Connection
- Data Exploration using SQL Queries
- Data Export to Excel/CSV
- Load & Clean Data in Power BI (Power Query)
- Create Measures using DAX
- Interactive Dashboard & Business Insights

---

## 🧮 Business Problems:
1. How is the shopping distribution according to gender? 
```sql
select gender, count(*) As total_transactions
From customer
group by gender;
```

2. Which gender did we sell more products to? 
```sql
SELECT 
    gender,
    SUM(quantity) AS total_items_sold
FROM customer
GROUP BY gender
ORDER BY total_items_sold DESC;
```

3. Which gender generated more revenue? 
```sql
Select gender, sum(quantity * price) as total_revenue 
from customer 
group by gender
order by total_revenue desc;
```

4.Distribution of purchase categories relative to other columns? 
```sql
SELECT 
    category,
    COUNT(*) AS transactions,
    SUM(quantity) AS total_items,
    SUM(quantity * price) AS revenue
FROM customer
GROUP BY category
ORDER BY revenue DESC;
```

5. How is the shopping distribution according to age? 
```sql
SELECT
    CASE
        WHEN age BETWEEN 0 AND 17 THEN '0-17'
        WHEN age BETWEEN 18 AND 24 THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        WHEN age BETWEEN 55 AND 64 THEN '55-64'
        ELSE '65+'
    END AS age_cat,
    COUNT(*) AS total_transactions
FROM customer
GROUP BY age_cat
ORDER BY total_transactions DESC;
```

6. Which age cat did we sell more products to? 
```sql
SELECT
    CASE
        WHEN age BETWEEN 0 AND 17 THEN '0-17'
        WHEN age BETWEEN 18 AND 24 THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        WHEN age BETWEEN 55 AND 64 THEN '55-64'
        ELSE '65+'
    END AS age_cat,
    SUM(quantity) AS total_items
FROM customer
GROUP BY age_cat
ORDER BY total_items DESC;
```

7. Which age cat generated more revenue? 
```sql
SELECT
    CASE
        WHEN age BETWEEN 0 AND 17 THEN '0-17'
        WHEN age BETWEEN 18 AND 24 THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        WHEN age BETWEEN 55 AND 64 THEN '55-64'
        ELSE '65+'
    END AS age_cat,
    SUM(quantity * price) AS total_revenue
FROM customer
GROUP BY age_cat
ORDER BY total_revenue DESC;
```

8. Distribution of purchase categories relative to other columns? 
```sql
SELECT
    CASE
        WHEN age BETWEEN 0 AND 17 THEN '0-17'
        WHEN age BETWEEN 18 AND 24 THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        WHEN age BETWEEN 55 AND 64 THEN '55-64'
        ELSE '65+'
    END AS age_cat,
    category,
    COUNT(*) AS transactions,
    SUM(quantity) AS total_items,
    SUM(quantity * price) AS revenue
FROM customer
GROUP BY age_cat, category
ORDER BY age_cat, revenue DESC;
```

9. Does the payment method have a relation with other columns? 
```sql
SELECT
    payment_method,
    gender,
    COUNT(*) AS transactions,
    SUM(quantity * price) AS revenue
FROM customer
GROUP BY payment_method, gender
ORDER BY payment_method, revenue DESC;
```

10. How is the distribution of the payment method? 
```sql
SELECT
    payment_method,
    COUNT(*) AS transactions,
    SUM(quantity * price) AS revenue
FROM customer
GROUP BY payment_method
ORDER BY transactions DESC;
```
---

## 📈 Insights & Visualizations:
**Page 1**
![image]

**Page 2**
![image]

**Page 3**
![image]

---

## 💡 Key Business Recommendations:
- ✔️ **1. Target High-Value Age Segments:**
  Focus marketing and retention strategies on 25–34 and 35–44 age groups.
- ✔️ **2. Optimize Inventory for High-Demand Categories:**
  Ensure stock availability for top-performing categories, especially during peak months.
- ✔️ **3. Strengthen Female-Focused Campaigns:**
  Launch offers, bundles, and customized promotions for female shoppers.
- ✔️ **4. Encourage Digital Payment Adoption:**
  Introduce cashback, discounts, and promotional benefits for cash & Card payments.
- ✔️ **5. Enable Personalized Recommendations:**
  Use demographic and category trends to personalize product suggestions.

  ---

  
