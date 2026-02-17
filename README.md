# Airbnb Data Engineering Pipeline (Snowflake + dbt)

## Overview

This project implements an end-to-end data engineering pipeline that ingests raw Airbnb data and transforms it into analytics-ready datasets using Snowflake and dbt.

The goal is to demonstrate practical warehouse modeling patterns:

* layered transformations (bronze → silver → gold)
* incremental processing
* slowly changing dimensions (SCD Type 2)
* reusable SQL logic with macros
* testing and documentation

---

## Architecture

Source CSV → Snowflake staging → dbt transformations → analytics tables

**Layers**

**Bronze**
Raw ingestion with minimal changes

**Silver**
Cleaned and standardized data

**Gold**
Business-ready fact and dimensional models

---

## Data Modeling

### Core Models

* listings
* hosts
* bookings

### Gold Layer

* fact table
* denormalized analytics table (OBT)

### Historical Tracking

Snapshots maintain historical changes for listings, hosts, and bookings using SCD Type 2 logic.

---

## Key dbt Features Used

* incremental models
* snapshots
* macros
* tests
* Jinja templating
* layered schemas

---
Configure Snowflake credentials in `~/.dbt/profiles.yml`

## What This Demonstrates

* warehouse transformation workflow
* dimensional modeling in Snowflake
* handling evolving records (SCD2)
* maintainable SQL using dbt
* reproducible data pipelines

<img width="1557" height="773" alt="image" src="https://github.com/user-attachments/assets/372a83c5-fd22-4643-95df-30a264a90bab" />

---

## Notes

Credentials and local configuration files are excluded from version control.
This repository is intended as a learning and portfolio project.

