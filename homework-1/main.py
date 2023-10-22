"""Скрипт для заполнения данными таблиц в БД Postgres."""
import psycopg2

# Параметры подключения к базе данных PostgreSQL
db_params = {
    "host": "localhost",
    "database": "north",
    "user": "postgres",
    "password": "12345"
}

# Подключение к базе данных
conn = psycopg2.connect(**db_params)
cursor = conn.cursor()

# Вставка данных в таблицу employees
cursor.execute("INSERT INTO employees (first_name, last_name, department_id) VALUES ('John', 'Doe', 1)")
cursor.execute("INSERT INTO employees (first_name, last_name, department_id) VALUES ('Jane', 'Smith', 2)")

# Вставка данных в таблицу customers
cursor.execute("INSERT INTO customers (first_name, last_name, email) VALUES ('Alice', 'Johnson', 'alice@example.com')")
cursor.execute("INSERT INTO customers (first_name, last_name, email) VALUES ('Bob', 'Smith', 'bob@example.com')")

# Вставка данных в таблицу orders
cursor.execute("INSERT INTO orders (order_date, customer_id, employee_id) VALUES ('2023-01-15', 1, 1)")
cursor.execute("INSERT INTO orders (order_date, customer_id, employee_id) VALUES ('2023-02-20', 2, 2)")

# Завершение транзакции и закрытие соединения
conn.commit()
cursor.close()
conn.close()
