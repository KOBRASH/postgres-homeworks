-- SQL-команды для создания таблиц
-- Создание таблицы employees с указанием первичного ключа employee_id
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY, -- Первичный ключ
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT
);

-- Создание таблицы customers с указанием первичного ключа customer_id
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY, -- Первичный ключ
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

-- Создание таблицы orders с указанием первичного ключа order_id
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY, -- Первичный ключ
    order_date DATE,
    customer_id INT,
    employee_id INT,

    -- Добавление внешнего ключа customer_id, который ссылается на таблицу customers
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),

    -- Добавление внешнего ключа employee_id, который ссылается на таблицу employees
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
