# ====== FRONTEND (React build) ======
FROM node:20 AS frontend

WORKDIR /app/frontend
COPY frontend/package*.json ./
RUN npm install
COPY frontend/ .
RUN npm run build

# ====== BACKEND (Django app) ======
FROM python:3.10

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Install Python dependencies
COPY backend/requirements.txt .
RUN pip install -r requirements.txt

# Copy Django app
COPY . ./

# Copy built React frontend
COPY --from=frontend /app/frontend/dist ./frontend_build/

# Collect static files (optional if using whitenoise or nginx)
# RUN python backend/manage.py collectstatic --noinput

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

