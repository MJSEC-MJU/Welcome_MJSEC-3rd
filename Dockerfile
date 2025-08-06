FROM python:3.10-slim

# 작업 디렉토리 설정
WORKDIR /app

# 의존성 설치
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 소스 복사
COPY . .

# gunicorn으로 실행 (포트는 8000)
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:8000", "--limit-request-line", "16384", "--limit-request-field-size", "0", "--limit-request-fields",    "0", "app:app"]