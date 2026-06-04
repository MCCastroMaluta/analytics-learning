
# Supermarket Data Dictionary

## Dataset Purpose

This dataset was designed to simulate a complete retail and e-commerce environment for practicing:

* SQL Fundamentals
* Data Analysis
* PostgreSQL
* Data Modeling
* Window Functions
* Analytical Query Design
* Analytics Engineering Concepts

The model contains transactional, operational, and analytical entities commonly found in real-world commerce platforms.

---

## Schema Statistics

| Category              | Description                              |
| --------------------- | ---------------------------------------- |
| Customers             | Customer master data and profiles        |
| Orders & Commerce     | Orders, carts, and purchasing activity   |
| Products & Categories | Product catalog and categorization       |
| Marketing             | Promotions and discount tracking         |
| Inventory             | Stock management and inventory movements |
| Customer Support      | Claims and claim lifecycle management    |
| Reviews               | Product and store feedback               |
| Digital Analytics     | User sessions and events                 |
| Deliveries            | Logistics and fulfillment operations     |
| Locations             | Stores, warehouses, and cities           |

---

## Relationship Highlights

### Customer → Orders

One customer can place many orders.

```text
customers
    |
    └── orders
```

Business Impact:

* Customer lifetime value analysis
* Purchase frequency analysis
* Retention and churn analysis

---

### Order → Order Items

One order can contain multiple products.

```text
orders
    |
    └── order_items
```

Business Impact:

* Basket analysis
* Revenue calculations
* Product mix analysis

---

### Product → Order Items

One product can appear in many different orders.

```text
products
    |
    └── order_items
```

Business Impact:

* Product performance analysis
* Revenue contribution analysis
* Product demand tracking

---

### Categories

Products are assigned to categories through:

```text
products.category_id
        ↓
categories.category_id
```

The data model supports hierarchical category structures through:

```text
categories.parent_category_id
```

However, the current dataset only contains root-level categories and does not currently use category hierarchies.

Current dataset categories:

```text
Dairy
Beverages
Snacks
Produce
Household
```

Business Impact:

* Category performance analysis
* Revenue by category
* Product assortment analysis

---

### Inventory Tracking

Inventory is managed across stores and warehouses.

```text
products
    |
    ├── inventory
    │
    └── inventory_movements
```

Inventory movements provide historical tracking of stock transfers and inventory activity.

Business Impact:

* Stock monitoring
* Replenishment analysis
* Inventory optimization

---

### Customer Service Lifecycle

Customer claims are tracked through claim events.

```text
customer_claims
    |
    └── claim_events
```

This structure allows historical tracking of status changes throughout the claim lifecycle.

Business Impact:

* Claim resolution analysis
* Customer satisfaction monitoring
* Service quality metrics

---

### Promotion Lifecycle

Promotions are linked to products and tracked when used in orders.

```text
promotions
    ├── promotion_products
    └── promotion_usage
```

Business Impact:

* Campaign effectiveness analysis
* Promotion adoption tracking
* Discount impact measurement

---

### Digital Analytics Flow

Customer activity is tracked through sessions and events.

```text
customers
    |
    └── sessions
            |
            └── events
```

Business Impact:

* Conversion funnel analysis
* User behavior analysis
* Product interaction tracking

---

### Fulfillment Lifecycle

Orders can generate deliveries that are tracked through delivery events.

```text
orders
    |
    └── deliveries
            |
            └── delivery_events
```

Business Impact:

* Delivery performance analysis
* Fulfillment monitoring
* Logistics KPIs

---

## Key Analytical Grains

| Table               | Grain                                |
| ------------------- | ------------------------------------ |
| customers           | 1 row = 1 customer                   |
| customer_addresses  | 1 row = 1 customer address           |
| payment_methods     | 1 row = 1 payment method             |
| orders              | 1 row = 1 order                      |
| order_items         | 1 row = 1 product within an order    |
| carts               | 1 row = 1 cart                       |
| cart_items          | 1 row = 1 product within a cart      |
| sessions            | 1 row = 1 session                    |
| events              | 1 row = 1 event                      |
| products            | 1 row = 1 product                    |
| categories          | 1 row = 1 category                   |
| product_reviews     | 1 row = 1 review                     |
| store_reviews       | 1 row = 1 review                     |
| customer_claims     | 1 row = 1 claim                      |
| claim_events        | 1 row = 1 claim event                |
| promotions          | 1 row = 1 promotion                  |
| promotion_usage     | 1 row = 1 promotion usage event      |
| inventory           | 1 row = 1 product inventory location |
| inventory_movements | 1 row = 1 inventory movement         |
| deliveries          | 1 row = 1 delivery                   |
| delivery_events     | 1 row = 1 delivery event             |

---

## Notes

This repository is designed to simulate real-world analytical workflows rather than isolated SQL exercises.

The goal is to practice the complete analytical process, including:

* PostgreSQL
* Data Analytics
* Business Intelligence
* Analytics Engineering
* Data Modeling
* Query Optimization
* Window Functions
* CTE Design
* EXISTS / NOT EXISTS Patterns
* Real-world Analytical Problem Solving
