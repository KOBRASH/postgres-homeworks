-- 1. Добавить ограничение на поле unit_price таблицы products (цена должна быть больше 0)
ALTER TABLE products
ADD CONSTRAINT check_unit_price_positive CHECK (unit_price > 0);

-- 2. Добавить ограничение, что поле discontinued таблицы products может содержать только значения 0 или 1
ALTER TABLE products
ADD CONSTRAINT check_discontinued_values CHECK (discontinued IN (0, 1));

-- 3. Создать новую таблицу, содержащую все продукты, снятые с продажи (discontinued = 1)
CREATE TABLE discontinued_products AS
SELECT *
FROM products
WHERE discontinued = 1;

-- 4. Удалить из products товары, снятые с продажи (discontinued = 1)
DELETE FROM products
WHERE discontinued = 1;
-- Перенос ограничения foreign_key на временную таблицу
-- Затем удаление товаров с таблицы products
-- Например, если есть ограничение foreign key с именем fk_order_details_product_id,
-- то сначала выполняем: ALTER TABLE order_details DROP CONSTRAINT fk_order_details_product_id;
-- После удаления товаров возвращаем ограничение: ALTER TABLE order_details ADD CONSTRAINT fk_order_details_product_id FOREIGN KEY (product_id) REFERENCES products (product_id);
