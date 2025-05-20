-- Заполнение таблицы питомцев
INSERT INTO pets (pet_type, pet_name, pet_breed)
SELECT DISTINCT customer_pet_type, customer_pet_name, customer_pet_breed
FROM mock_data;

-- Заполнение таблицы покупателей
INSERT INTO customers (first_name, last_name, age, email, country, postal_code, pet_id)
SELECT 
    md.customer_first_name, 
    md.customer_last_name, 
    md.customer_age, 
    md.customer_email, 
    md.customer_country, 
    md.customer_postal_code,
    p.pet_id
FROM mock_data md
JOIN pets p ON md.customer_pet_name = p.pet_name AND md.customer_pet_type = p.pet_type;

-- Заполнение таблицы продавцов
INSERT INTO sellers (first_name, last_name, email, country, postal_code)
SELECT DISTINCT 
    seller_first_name, 
    seller_last_name, 
    seller_email, 
    seller_country, 
    seller_postal_code
FROM mock_data;

-- Заполнение таблицы категорий питомцев
INSERT INTO pet_categories (category_name)
SELECT DISTINCT pet_category FROM mock_data;

-- Заполнение таблицы поставщиков
INSERT INTO suppliers (supplier_name, contact_person, email, phone, address, city, country)
SELECT DISTINCT 
    supplier_name, 
    supplier_contact, 
    supplier_email, 
    supplier_phone, 
    supplier_address, 
    supplier_city, 
    supplier_country
FROM mock_data
WHERE supplier_name IS NOT NULL;

-- Заполнение таблицы продуктов
INSERT INTO products (
    product_name, category, price, quantity, weight, color, size, brand, material, 
    description, rating, reviews, release_date, expiry_date, category_id, supplier_id
)
SELECT DISTINCT 
    md.product_name, 
    md.product_category, 
    md.product_price, 
    md.product_quantity,
    md.product_weight,
    md.product_color,
    md.product_size,
    md.product_brand,
    md.product_material,
    md.product_description,
    md.product_rating,
    md.product_reviews,
    md.product_release_date,
    md.product_expiry_date,
    pc.category_id,
    s.supplier_id
FROM mock_data md
JOIN pet_categories pc ON md.pet_category = pc.category_name
LEFT JOIN suppliers s ON md.supplier_name = s.supplier_name;

-- Заполнение таблицы магазинов
INSERT INTO stores (store_name, location, city, state, country, phone, email)
SELECT DISTINCT 
    store_name, 
    store_location, 
    store_city, 
    store_state, 
    store_country, 
    store_phone, 
    store_email
FROM mock_data;

-- Заполнение таблицы дат
INSERT INTO dates (full_date, day, month, year, quarter)
SELECT DISTINCT 
    sale_date, 
    EXTRACT(DAY FROM sale_date), 
    EXTRACT(MONTH FROM sale_date), 
    EXTRACT(YEAR FROM sale_date), 
    EXTRACT(QUARTER FROM sale_date)
FROM mock_data;

-- Заполнение таблицы фактов
INSERT INTO sales (customer_id, seller_id, product_id, store_id, date_id, quantity, total_price)
SELECT 
    c.customer_id,
    s.seller_id,
    p.product_id,
    st.store_id,
    d.date_id,
    md.sale_quantity,
    md.sale_total_price
FROM mock_data md
JOIN customers c ON md.customer_first_name = c.first_name AND md.customer_last_name = c.last_name
JOIN sellers s ON md.seller_first_name = s.first_name AND md.seller_last_name = s.last_name
JOIN products p ON md.product_name = p.product_name AND md.product_price = p.price
JOIN stores st ON md.store_name = st.store_name
JOIN dates d ON md.sale_date = d.full_date;