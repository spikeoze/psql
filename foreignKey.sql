CREATE TABLE products (
    product_id BIGSERIAL PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    price INT NOT NULL,
    category_id INT CONSTRAINT fk_category_id REFERENCES category(category_id),
    sub_category_id INT CONSTRAINT fk_sub_category_id REFERENCES sub_category(sub_category_id),
    extra_id INT CONSTRAINT fk_extra_id REFERENCES extras(extra_id)
);

CREATE TABLE order_list (
    order_id BIGSERIAL PRIMARY KEY ,
    order_date DATE NOT NULL DEFAULT CURRENT_DATE,
    order_state VARCHAR(20) NOT NULL,
    product_id INT CONSTRAINT fk_product_id REFERENCES products(product_id),
    customer_id INT CONSTRAINT fk_customer_id REFERENCES customers(customer_id),
    sub_total FLOAT NOT NULL,
    paid BOOLEAN NOT NULL
);

CREATE TABLE customers(
    customer_id BIGSERIAL PRIMARY KEY NOT NULL,
    customer_name VARCHAR(70) NOT NULL,
    email VARCHAR(100)
);

CREATE TABLE category (
    category_id BIGSERIAL PRIMARY KEY NOT NULL,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE sub_category (
    sub_category_id BIGSERIAL PRIMARY KEY NOT NULL,
    sub_category_name VARCHAR(50)
);

CREATE TABLE extras (
    extra_id BIGSERIAL PRIMARY KEY NOT NULL,
    extra_name VARCHAR(200)
);
