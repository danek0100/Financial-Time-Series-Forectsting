# Используем официальный образ с Python 3.10
FROM python:3.10-slim

# Устанавливаем необходимые системные зависимости
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Устанавливаем Jupyter и базовые библиотеки
RUN pip install --no-cache-dir \
    jupyterlab \
    ipykernel \
    pandas \
    numpy \
    matplotlib

# Создаем рабочую директорию
WORKDIR /workspace

# Добавляем рабочую директорию в PYTHONPATH
ENV PYTHONPATH="${PYTHONPATH}:/workspace"

# Указываем порт для Jupyter
EXPOSE 8888

# Стартовая команда — запуск Jupyter
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
