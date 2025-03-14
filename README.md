# SQL Data Warehouse Project
Building a SQL project data warehouse using ETL processes, data modeling and analytics.

Data Warehouse & Analytics Project

Welcome to this Data Warehouse and Analytics Project! This project is intended to demonstrate how to create a full data warehousing and analytics solution from scratch. It adheres to industry best practices in data engineering and analytics, so it's an excellent addition to your portfolio.

---


## Data Architecture

---
The project is organized around the Medallion Architecture, which has three layers:

![Image](https://github.com/user-attachments/assets/eddc25b1-cf83-4175-bc7b-7864c9505f63)



- **Bronze Layer**: Stores raw data in its raw state as received from the source systems. In this case, data is loaded from CSV files to a SQL Server database.

- **Silver Layer**: Cleans, standardizes, and normalizes data so that it becomes more structured and trustworthy for analysis.

- **Gold Layer**: Stores business-ready data, structured in the form of a star schema to facilitate reporting and analytics easily.


---

## Project Overview:

---
### This project Covers:

* ✅ **Data Architecture**: Creating a modern data warehouse through the Medallion Architecture.
* ✅ **ETL Pipelines**: Extracting, transforming, and loading data from diverse sources into the warehouse.
* ✅ **Data Modeling**: Creating fact and dimension tables for maximum performance on analytical queries.
* ✅ **Analytics & Reporting**: Designing reports and dashboards using SQL to deliver meaningful insights.


**This project focuses on diverse topics such as:**

* SQL Development
* Data Architecture
* Data Engineering
* ETL Pipeline Development
* Data Modeling
* Data Analytics

---

## Project Requeriments

---

### Building the Data Warehouse (Data Engineering)

**Objective**

Implement a modern data warehouse in SQL Server to consolidate the sales data in order to enhance analysis and drive valuable insights.

**Key Steps**

* Data Sources: Import the data from two systems (ERP & CRM) using CSV files.
* Data Quality: Clean up and fix bad data before any analysis.
* Integration: Combine the two sets of data into one strong data model queryable easily.
* Scope: Only analyze recent dataset—there is no point tracking history.
* Documentation: Document the data model correctly so that business users and analysts can comprehend it.


---

### BI: Analytics & Reporting (Data Analysis)

**Objective**

* Develop SQL-based analytics that will provide insights on:
* Customer behavior – Who are the priority customers, and how are they purchasing?
* Product performance – Which products are performing well, and which are experiencing problems?
* Sales trends – How are sales trends evolving over time?

These results will guide stakeholders in making decisions on key business metrics.

---
## Repository Structure

---


```plaintext
data-warehouse-project/
│
├── datasets/                           # Raw datasets used for the project (ERP and CRM data)
│
├── docs/                               # Project documentation and architecture details
│   ├── etl.drawio                      # Draw.io file shows all different techniquies and methods of ETL
│   ├── data_architecture.drawio        # Draw.io file shows the project's architecture
│   ├── data_catalog.md                 # Catalog of datasets, including field descriptions and metadata
│   ├── data_flow.drawio                # Draw.io file for the data flow diagram
│   ├── data_models.drawio              # Draw.io file for data models (star schema)
│   ├── naming-conventions.md           # Consistent naming guidelines for tables, columns, and files
│
├── scripts/                            # SQL scripts for ETL and transformations
│   ├── bronze/                         # Scripts for extracting and loading raw data
│   ├── silver/                         # Scripts for cleaning and transforming data
│   ├── gold/                           # Scripts for creating analytical models
│
├── tests/                              # Test scripts and quality files
│
├── README.md                           # Project overview and instructions
├── LICENSE                             # License information for the repository
├── .gitignore                          # Files and directories to be ignored by Git
└── requirements.txt                    # Dependencies and requirements for the project
