# Folosim imaginea oficială Python ca bază
FROM python:3.9-slim

# Setăm directorul de lucru în container
WORKDIR /app

# Copiem fișierele requirements.txt în container
COPY requirements.txt requirements.txt

# Instalăm dependențele specificate în requirements.txt
RUN pip install -r requirements.txt

# Copiem restul fișierelor aplicației în container
COPY . .

# Setăm variabilele de mediu
ENV FLASK_APP=app.py

# Expunem portul pe care rulează aplicația Flask
EXPOSE 8080

# Comanda de start pentru aplicație
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]
