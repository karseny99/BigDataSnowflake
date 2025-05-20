-- Таблица питомцев
CREATE TABLE pets (
    pet_id SERIAL PRIMARY KEY,
    pet_type VARCHAR(50) NOT NULL,
    pet_name VARCHAR(100),
    pet_breed VARCHAR(100)
);

-- Таблица покупателей
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    age INT,
    email VARCHAR(100),
    country VARCHAR(100),
    postal_code VARCHAR(20),
    pet_id INT REFERENCES pets(pet_id)
);

-- Таблица продавцов
CREATE TABLE sellers (
    seller_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    country VARCHAR(100),
    postal_code VARCHAR(20)
);

-- Таблица категорий питомцев
CREATE TABLE pet_categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

-- Таблица поставщиков
CREATE TABLE suppliers (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(200),
    city VARCHAR(100),
    country VARCHAR(100)
);

-- Таблица продуктов
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(100),
    price DECIMAL(10,2) NOT NULL,
    quantity INT,
    weight DECIMAL(10,2),
    color VARCHAR(50),
    size VARCHAR(20),
    brand VARCHAR(100),
    material VARCHAR(100),
    description TEXT,
    rating DECIMAL(3,1),
    reviews INT,
    release_date DATE,
    expiry_date DATE,
    category_id INT REFERENCES pet_categories(category_id),
    supplier_id INT REFERENCES suppliers(supplier_id)
);

-- Таблица магазинов
CREATE TABLE stores (
    store_id SERIAL PRIMARY KEY,
    store_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(20),
    country VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100)
);

-- Таблица дат (дополнительное измерение)
CREATE TABLE dates (
    date_id SERIAL PRIMARY KEY,
    full_date DATE NOT NULL,
    day INT NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL,
    quarter INT NOT NULL
);

-- Фактовая таблица продаж
CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    seller_id INT REFERENCES sellers(seller_id),
    product_id INT REFERENCES products(product_id),
    store_id INT REFERENCES stores(store_id),
    date_id INT REFERENCES dates(date_id),
    quantity INT NOT NULL,
    total_price DECIMAL(10,2) NOT NULL
);