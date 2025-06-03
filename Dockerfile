# Используем официальный образ Python
FROM python:3.9-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем зависимости
COPY pyproject.toml .

# Устанавливаем зависимости (предполагая, что используется poetry)
RUN pip install poetry && \
    poetry config virtualenvs.create false && \
    poetry install --no-dev

# Копируем исходный код
COPY src/ ./src/

# Открываем порт, на котором работает FastAPI
EXPOSE 8000

# Запускаем приложение
CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8000"]
