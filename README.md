# PostgreSQL Practice — Food Delivery Dataset

## Setup
1. Open VS Code and connect to your PostgreSQL server
2. Run `00-setup/01_create_tables.sql`
3. Run `00-setup/02_insert_data.sql`
4. You're ready to go

## Dataset
A food delivery app with 6 tables, much larger and more varied:

| Table | Description |
|-------|-------------|
| restaurants | 40 restaurants across 8 cities, 10 cuisines |
| customers | 60 customers |
| delivery_agents | 18 delivery agents |
| orders | 400 orders (delivered/cancelled/pending, with NULL delivery_time on cancelled orders) |
| order_items | ~1000 line items, cuisine-matched menus |
| reviews | ~170 reviews (only on delivered orders, ratings skewed positive but realistic) |

Notes on diversity:
- Spans all of 2024, so monthly/seasonal trend analysis is meaningful
- Cancelled orders have `delivery_time = NULL` — good for practicing `COALESCE` and `IS NULL`
- Review ratings are weighted (more 4s and 5s, fewer 1s and 2s) like real platforms
- Order items are matched to each restaurant's cuisine for realism

## Topics & Question Count

| Folder | Topic | Questions |
|--------|-------|-----------|
| 01-basics | SELECT, ORDER BY, LIMIT, DISTINCT | 10 |
| 02-filtering | WHERE, AND/OR, IN, LIKE, BETWEEN | 12 |

**Total: 22 questions**

## How to Use
- Open `questions.sql` for each topic
- Write your answer before looking at `answers.sql`
- The 10-projects folder has no hints — treat those as interview questions