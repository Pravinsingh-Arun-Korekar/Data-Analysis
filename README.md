
# Data-Analysis

A robust, end-to-end data pipeline built in Python to scrape, clean, and analyze product information from [Books to Scrape](https://books.toscrape.com/). The project dynamically crawls across multiple categories, processes extracted text data into clean numerical metrics, and provides insightful data visualizations.

---

## 🚀 Features

* **Automated Multi-Category Crawling:** Dynamic link discovery that targets all 50 separate store categories and parses their unique layout.
* **Pagination Handling:** Sequentially follows the `Next` page button controls until entire collections are successfully scraped.
* **Data Transformation:** Converts textual star-ratings ("One" to "Five") into numeric integers (`1-5`) and cleans currency text markers into accurate floating-point numbers.
* **High Scale Processing:** Capable of scraping and assembling up to 2,000 distinct entries into a structured `pandas` DataFrame.
* **Exploratory Data Analysis (EDA):** Leverages `matplotlib` and `seaborn` to chart price distribution curves and correlate rating benchmarks against book valuations.

---

## 📊 Data Insights

The scraped dataset tracks five core attributes for every item:
* **Title:** The full descriptive title of the book.
* **Price:** Formatted as numeric values in Great British Pounds (£).
* **Rating:** Numeric scale mapping from `1` (lowest) to `5` (highest).
* **Availability:** Stock distribution status.
* **URL:** Absolute links mapping directly back to the individual book pages.

---

## 🛠️ Technology Stack

* **Language:** Python 3
* **Scraping Libraries:** `requests`, `BeautifulSoup` (bs4), `re` (Regular Expressions)
* **Data Processing:** `pandas`, `numpy`
* **Data Visualization:** `matplotlib.pyplot`, `seaborn`

---

## 📈 Analysis Previews

The project generates several visual plots to identify marketplace trends:
1. **Distribution of Book Prices:** A histogram overlayed with a Kernel Density Estimate (KDE) curve.
2. **Distribution of Book Ratings:** A count plot tracking the frequency of each star tier.
3. **Book Prices by Rating:** A box plot used to check if higher-rated books command premium prices.


# Repository Branch Map

Based on your active development files, here is how your repository structure maps out between your codebase and your data flow:

```text
📁 Data-Analysis (main branch)
│
├── 📄 README.md                 # Project overview, features, stack, and analysis previews
│
└── 📁 Source Code & Logic (Data Flow Mapping)
    │
    ├── 🔹 Step 1: Link Extraction
    │   └── 🛠️ get_category_links() ──► 📦 extracted_links = [] (Collects 50 category URLs)
    │
    ├── 🔹 Step 2: Core Scraping Pipeline
    │   └── 🛠️ scrape_all_books()
    │       ├── 📦 all_books = []       # Holds individual raw book data dictionaries
    │       ├── 📦 rating_map = {}      # Dictionary converting "Three" ──► 3
    │       └── 🔄 while loop           # Uses next_button controls to handle pagination
    │
    └── 🔹 Step 3: Data Analysis (EDA)
        └── 📊 books_df (Pandas DataFrame)
            ├── 🔲 books_df['Price_Numeric']  # Cleaned float values for histograms/box plots
            └── 🔲 books_df['Rating']         # Parsed integers for rating count plots
