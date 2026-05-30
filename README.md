# 🛒 E-Commerce SQL Analysis

SQL analysis of a 4-table e-commerce database answering 10 real business questions
using JOINs, GROUP BY, CTEs, and Window Functions.

---

## 🗄️ Database Schema

4 tables built from scratch:

| Table | Description |
|-------|-------------|
| `customers` | 8 customers with city and signup date |
| `products` | 8 products across 4 categories with price and stock |
| `orders` | 10 orders with status (delivered / pending / cancelled) |
| `order_items` | 16 line items linking orders to products |

---

## 📊 Business Questions Answered

| # | Question | SQL Concepts Used |
|---|----------|-------------------|
| BQ1 | Overall business health — total revenue, orders, avg order value | Aggregates |
| BQ2 | Top 3 customers by total spend | GROUP BY + ORDER BY |
| BQ3 | Revenue by order status + % lost to cancellations | GROUP BY + CASE |
| BQ4 | Best revenue-generating category | JOIN + GROUP BY |
| BQ5 | Customers who haven't ordered yet | LEFT JOIN + IS NULL |
| BQ6 | Month-over-month revenue trend in 2024 | GROUP BY MONTH() |
| BQ7 | Top-selling product per category | CTE + GROUP BY |
| BQ8 | Customer ranking by total spend | Window: DENSE_RANK() |
| BQ9 | Running cumulative revenue from delivered orders | Window: SUM() OVER |
| BQ10 | Full Customer 360 view | CTE + JOIN + Aggregates |

---

## 🛠️ Tools Used

- SQL (SQLite)
- SQLite Online (browser-based IDE)

---

## ▶️ How to Run

1. Go to [sqliteonline.com](https://sqliteonline.com)
2. Paste and run `schema.sql` first — this creates all tables and inserts data
3. Then run any query from `analysis_queries.sql`

---

## 🧠 Concepts Demonstrated

- INNER JOIN, LEFT JOIN across 3–4 tables
- GROUP BY with multiple aggregations
- WHERE vs HAVING distinction
- Subqueries (in WHERE and FROM clause)
- CTEs using `WITH` clause
- Window functions: `DENSE_RANK()`, `SUM() OVER`, `ROW_NUMBER()`

---

*Week 3 of my 12-week Data Science internship preparation roadmap.*
