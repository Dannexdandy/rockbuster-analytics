# 🎬 Rockbuster Analytics

[![CI](https://github.com/Dannexdandy/rockbuster-analytics/actions/workflows/ci.yml/badge.svg)](https://github.com/Dannexdandy/rockbuster-analytics/actions/workflows/ci.yml)

An end-to-end SQL analytics project on a DVD-rental business: reproducible Postgres via Docker, layered SQL models, automated data-quality checks in CI, and a findings report with recommendations.

## Key findings
- **$61.3K revenue** from 599 customers; April revenue up **19.6%** on March
- **RFM segmentation:** 147 Champions and 57 At Risk customers to target for retention
- **43 of 1,000 films** never rented, so they are candidates to discount or remove
- **29% of rentals** are kept 7+ days, a late-fee / extended-rental opportunity

## Project docs
- **Full analysis:** [reports/figures/FINDINGS.md](reports/figures/FINDINGS.md)
- **Data model:** [docs/erd.md](docs/erd.md)

## Run it yourself
**Prerequisite:** Docker.

```bash
docker compose up -d   # starts Postgres and loads the data
make analyze           # builds views + runs all 8 analyses
make test              # runs the data-quality checks
```

## How it's built
```
raw tables → 01_staging (clean views) → 02_marts (aggregates) → 03_analysis (business questions)
```
The **04_quality** checks run in CI on every push.

## The business questions
| # | Question | Technique |
|---|---|---|
| 1 | Monthly revenue trend | `LAG()` window |
| 2 | Top 3 films per category | `RANK() OVER (PARTITION BY)` + CTE |
| 3 | Customer segmentation (RFM) | `NTILE(4)` + `CASE` |
| 4 | Above-average customers | two-step CTE |
| 5 | Dead inventory | `LEFT JOIN ... IS NULL` |
| 6 | Revenue by country | 4-table join chain |
| 7 | Store & staff performance | share-of-total window |
| 8 | Rental duration bands | `CASE` bucketing |

## Tools
PostgreSQL 16 · Docker · GitHub Actions · SQL (CTEs, window functions, DDL)

## License
MIT
