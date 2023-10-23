import psycopg2
import csv

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

# Функция для вставки данных из CSV-файла в таблицу
def insert_data_from_csv(cursor, table_name, csv_file):
    with open(csv_file, 'r') as file:
        reader = csv.reader(file)
        next(reader)  # Пропустить заголовок, если он есть в CSV
        for row in reader:
            # Создайте строку SQL для вставки данных в таблицу
            insert_query = f"INSERT INTO {table_name} VALUES ({','.join(['%s'] * len(row))})"
            cursor.execute(insert_query, row)

# Вставка данных в таблицу employees из CSV-файла employees_data.csv
insert_data_from_csv(cursor, "employees", "north_data/employees_data.csv")

# Вставка данных в таблицу customers из CSV-файла customers_data.csv
insert_data_from_csv(cursor, "customers", "north_data/customers_data.csv")

# Вставка данных в таблицу orders из CSV-файла orders_data.csv
insert_data_from_csv(cursor, "orders", "north_data/orders_data.csv")

# Завершение транзакции и закрытие соединения
conn.commit()
cursor.close()
conn.close()
