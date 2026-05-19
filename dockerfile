FROM python:3.11-slim

WORKDIR /app

# Copy requirements first (better caching)
COPY requirements.txt .

# Improved pip install
RUN pip install --upgrade pip && \
    pip install --no-cache-dir \
    --default-timeout=200 \
    --retries=10 \
    -r requirements.txt

COPY . .

EXPOSE 8501

CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]