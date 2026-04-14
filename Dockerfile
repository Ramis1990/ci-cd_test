# 1. Базовый образ: лёгкий Python 3.11
FROM python:3.11-slim

# 2. Рабочая директория внутри контейнера
WORKDIR /app

# 3. Копируем только requirements.txt сначала (кэширование слоёв)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. Копируем весь остальной код
COPY . .

# 5. Открываем порт (Flask будет слушать здесь)
EXPOSE 5000

# 6. Команда запуска (используем Gunicorn для продакшена)
CMD ["gunicorn", "main:app", "--bind", "0.0.0.0:5000", "--workers", "2"]