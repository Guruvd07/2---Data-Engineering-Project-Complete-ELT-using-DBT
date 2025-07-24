
# 🛒 Ecommerce ELT Project using Docker + Python + dbt + PostgreSQL

This project demonstrates a complete **ELT (Extract → Load → Transform)** data pipeline using:

- 🐳 Docker
- 🐘 PostgreSQL (Source & Destination DBs)
- 🐍 Python (for Extract & Load)
- 📊 dbt (for SQL-based Transformations)

---

## 📁 Project Structure

```
ecommerce-elt-project/
├── docker-compose.yml
├── source_db_init/
│   └── init.sql
├── load_data.py
└── ecommerce_dbt/
    ├── dbt_project.yml
    ├── models/
    │   ├── orders.sql
    │   └── order_summary.sql
```

---

## 🚀 Project Workflow

### 🔹 Step 1: Start Docker Containers

```bash
docker-compose up -d
```

This spins up:

- **source_postgres** on port `5450`
- **destination_postgres** on port `5460`

---

### 🔹 Step 2: Source DB Initialization

On container startup, the script `source_db_init/init.sql` runs automatically and creates a table `orders` with dummy ecommerce data.

---

### 🔹 Step 3: Extract & Load using Python

Run the Python script to extract data from `source_postgres` and load into `destination_postgres`:

```bash
python load_data.py
```

---

### 🔹 Step 4: Verify Data in Destination DB

Use `psql` to confirm:

```bash
docker exec -it destination_postgres psql -U postgres -d destination_db

-- Then inside psql:
\dt
SELECT * FROM orders;
```

---

### 🔹 Step 5: Setup and Run dbt

Initialize dbt inside `ecommerce_dbt/`:

```bash
dbt debug       # verify connection
dbt run         # run models
```

---

### 🔹 Step 6: Transformation Models

#### ✅ `models/orders.sql`

```sql
{{ config(materialized='table') }}
SELECT * FROM orders
```

#### ✅ `models/order_summary.sql`

```sql
{{ config(materialized='table') }}

SELECT
  product,
  COUNT(*) AS total_orders,
  SUM(amount) AS total_sales
FROM {{ ref('orders') }}
GROUP BY product
```

---

### 🔹 Step 7: View Transformed Data

```bash
docker exec -it destination_postgres psql -U postgres -d destination_db

-- Then inside psql:
SELECT * FROM order_summary;
```

---

## 🧠 Technologies Used

| Tool         | Purpose                         |
|--------------|----------------------------------|
| Docker       | Containerized environments       |
| PostgreSQL   | Source & destination databases   |
| Python       | Data Extraction & Loading        |
| dbt          | Data Transformation & Modeling   |

---

## 💡 Future Enhancements

- 📈 Connect to Power BI / Tableau for dashboarding
- ⏱ Schedule Python/dbt jobs using Apache Airflow
- 🌐 Add API layer for real-time sync
- 🧪 Add dbt tests for model validation

--
