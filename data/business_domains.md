# Supermarket Database - Business Domains

## Overview

The Supermarket database simulates a modern retail and e-commerce platform. It includes customer behavior, purchasing activity, inventory management, marketing campaigns, deliveries, customer service operations, and product feedback.

The model is organized into the following business domains.

---

# Customer Domain

Manages customer information and customer-related attributes.

## Tables

* customers
* customer_addresses
* payment_methods

## Business Questions

* Who are our customers?
* Where are they located?
* What payment methods do they use?
* How long have they been customers?

---

# Commerce Domain

Represents the purchasing process.

## Tables

* orders
* order_items
* carts
* cart_items
* cart_events

## Business Questions

* How many orders are placed?
* What products are purchased together?
* What is the average order value?
* How often are carts abandoned?

---

# Product Domain

Contains product catalog information and product categorization.

## Tables

* products
* categories

## Business Questions

* Which products generate the most revenue?
* Which categories perform best?
* Which brands sell the most units?
* What products have low performance?

---

# Customer Experience Domain

Tracks customer satisfaction and service quality.

## Tables

* product_reviews
* store_reviews
* customer_claims
* claim_categories
* claim_events

## Business Questions

* What products receive the highest ratings?
* Which stores have the best customer satisfaction?
* What are the most common complaint categories?
* How quickly are customer claims resolved?

---

# Digital Analytics Domain

Tracks user behavior across the platform.

## Tables

* sessions
* events

## Business Questions

* How many sessions occur each day?
* What pages receive the most traffic?
* Which products receive the most views?
* What is the conversion funnel from session to order?

---

# Marketing Domain

Manages promotions and discount usage.

## Tables

* promotions
* promotion_products
* promotion_usage

## Business Questions

* Which promotions drive the most orders?
* Which promotions generate the highest discounts?
* What products are most frequently purchased using promotions?

---

# Inventory Domain

Tracks stock levels and inventory movements.

## Tables

* inventory
* inventory_movements
* warehouses

## Business Context

Inventory can be stored in both warehouses and retail stores.

Inventory movements track transfers and stock adjustments between locations, allowing historical inventory analysis.

## Business Questions

* What is the current inventory level?
* Which products require replenishment?
* How frequently is stock transferred?
* Which warehouses hold the most inventory?

---

# Fulfillment Domain

Represents order delivery operations.

## Tables

* deliveries
* delivery_events
* delivery_drivers

## Business Questions

* How long do deliveries take?
* What is the delivery success rate?
* Which drivers complete the most deliveries?
* What is the average delivery distance?

---

# Location Domain

Stores geographic information.

## Tables

* cities
* stores
* warehouses

## Business Context

Stores and warehouses are linked to cities, enabling geographic, operational, and logistics analysis.

## Business Questions

* Which cities generate the most sales?
* Which stores perform best?
* How is inventory distributed geographically?

---

# Core Analytical Grains

| Table               | Grain                                       |
| ------------------- | ------------------------------------------- |
| customers           | 1 row = 1 customer                          |
| customer_addresses  | 1 row = 1 customer address                  |
| payment_methods     | 1 row = 1 payment method                    |
| orders              | 1 row = 1 order                             |
| order_items         | 1 row = 1 product within an order           |
| carts               | 1 row = 1 cart                              |
| cart_items          | 1 row = 1 product within a cart             |
| sessions            | 1 row = 1 session                           |
| events              | 1 row = 1 event                             |
| products            | 1 row = 1 product                           |
| categories          | 1 row = 1 category                          |
| product_reviews     | 1 row = 1 review                            |
| store_reviews       | 1 row = 1 review                            |
| customer_claims     | 1 row = 1 claim                             |
| claim_events        | 1 row = 1 claim event                       |
| promotions          | 1 row = 1 promotion                         |
| promotion_usage     | 1 row = 1 promotion usage event             |
| inventory           | 1 row = 1 product-location inventory record |
| inventory_movements | 1 row = 1 inventory movement                |
| deliveries          | 1 row = 1 delivery                          |
| delivery_events     | 1 row = 1 delivery event                    |

---

# Main Analytical Fact Tables

The following tables are the primary sources used for analytical SQL exercises:

* orders
* order_items
* customers
* products
* product_reviews
* customer_claims
* sessions
* events
* inventory_movements
* deliveries

Most analytical exercises in this repository are built using these tables and their related dimensions.

---

# Intended Learning Areas

This database is designed to support practical learning and portfolio projects in:

* SQL Fundamentals
* PostgreSQL
* Data Analysis
* Business Intelligence
* Data Modeling
* Analytics Engineering
* Window Functions
* Common Table Expressions (CTEs)
* EXISTS / NOT EXISTS Patterns
* Aggregations and Grouping
* Query Optimization
* Analytical Problem Solving
