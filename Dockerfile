FROM apache/airflow:2.7.2-python3.10

USER root

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev && \
    rm -rf /var/lib/apt/lists/*

# Create data directory
RUN mkdir -p /opt/airflow/data/images && \
    chown -R airflow:airflow /opt/airflow/data

USER airflow

# Install Python packages
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

WORKDIR /opt/airflow