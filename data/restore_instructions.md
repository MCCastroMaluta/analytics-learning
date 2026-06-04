# Restore Instructions

This repository includes a PostgreSQL database schema and sample data for SQL practice, analytics projects, and analytics engineering exercises.

---

# Prerequisites

Required software:

- PostgreSQL 14+ (or compatible version)
- psql command line tool

Verify installation:

```bash
psql --version
```

---

# Step 1: Create a Database

Create a new database.

Example:

```sql
CREATE DATABASE supermarket;
```

Connect to the database:

```bash
psql -U postgres -d supermarket
```

---

# Step 2: Restore the Schema

Run the schema file:

```bash
psql -U postgres -d supermarket -f schema.sql
```

This will create:

- Schema: supermarket
- Tables
- Primary Keys
- Foreign Keys
- Constraints

---

# Step 3: Load Sample Data

Run:

```bash
psql -U postgres -d supermarket -f seed.sql
```

This will populate all tables with sample records.

---

# Step 4: Verify Installation

List schemas:

```sql
\dn
```

Expected result:

```text
supermarket
```

List tables:

```sql
\dt supermarket.*
```

You should see all dataset tables.

---

# Example Validation Queries

Count customers:

```sql
SELECT COUNT(*)
FROM supermarket.customers;
```

Count orders:

```sql
SELECT COUNT(*)
FROM supermarket.orders;
```

Count products:

```sql
SELECT COUNT(*)
FROM supermarket.products;
```

If the queries return records successfully, the database has been restored correctly.

---

# Repository Structure

```text
database/
├── schema.sql
├── seed.sql
├── data_dictionary.md
├── business_domains.md
└── restore_instructions.md
```

---

# Intended Usage

This dataset is designed for:

- SQL Practice
- PostgreSQL Learning
- Data Analysis
- Business Intelligence
- Analytics Engineering
- Data Modeling
- Portfolio Projects

The data model simulates a complete retail and e-commerce business environment.