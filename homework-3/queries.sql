-- 1. Название компании заказчика и ФИО сотрудника, работающего над заказом этой компании,
-- когда и заказчик и сотрудник зарегистрированы в городе London, а доставку заказа ведет компания United Package
SELECT c.company_name, CONCAT(e.first_name, ' ', e.last_name) AS employee_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN employees e ON o.employee_id = e.employee_id
JOIN shippers s ON o.shipper_id = s.shipper_id
WHERE c.city = 'London' AND e.city = 'London' AND s.company_name = 'United Package';

-- 2. Наименование продукта, количество товара, имя поставщика и его телефон для определенных продуктов
SELECT p.product_name, p.units_in_stock, s.contact_name, s.phone
FROM products p
JOIN suppliers s ON p.supplier_id = s.supplier_id
JOIN categories c ON p.category_id = c.category_id
WHERE p.discontinued = false 
  AND p.units_in_stock < 25 
  AND (c.category_name = 'Dairy Products' OR c.category_name = 'Condiments')
ORDER BY p.units_in_stock ASC;

-- 3. Список компаний заказчиков, не сделавших ни одного заказа
SELECT c.company_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- 4. Уникальные названия продуктов, которых заказано ровно 10 единиц
SELECT DISTINCT p.product_name
FROM products p
JOIN order_details od ON p.product_id = od.product_id
WHERE od.quantity = 10;

