create database aht

use aht


create TABLE products(
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_code VARCHAR(255),
    product_name VARCHAR(255),
    product_price INT,
    product_amount INT,
    product_description VARCHAR(255),
    product_status INT
)

CREATE INDEX PRODUCT_INDEX ON products(ID)

INSERT INTO products (product_code, product_name, product_price, product_amount, product_description, product_status)
VALUES
('P001', 'Sản phẩm A', 100000, 10, 'Mô tả sản phẩm A', 1),
('P002', 'Sản phẩm B', 200000, 5, 'Mô tả sản phẩm B', 1),
('P003', 'Sản phẩm C', 150000, 20, 'Mô tả sản phẩm C', 1),
('P004', 'Sản phẩm D', 250000, 15, 'Mô tả sản phẩm D', 1),
('P005', 'Sản phẩm E', 300000, 30, 'Mô tả sản phẩm E', 1),
('P006', 'Sản phẩm F', 350000, 25, 'Mô tả sản phẩm F', 1),
('P007', 'Sản phẩm G', 400000, 40, 'Mô tả sản phẩm G', 1),
('P008', 'Sản phẩm H', 450000, 35, 'Mô tả sản phẩm H', 1),
('P009', 'Sản phẩm I', 500000, 50, 'Mô tả sản phẩm I', 1),
('P010', 'Sản phẩm J', 550000, 60, 'Mô tả sản phẩm J', 1);


select * FROM products

CREATE VIEW product_view AS
SELECT product_code, product_name
FROM products
WHERE product_price > 100000

SELECT * FROM product_view

DROP VIEW product_view


CREATE PROCEDURE GET_BY_ID(IN ID_PRODUCT INT)
BEGIN
    SELECT * FROM products
    WHERE id = ID_PRODUCT;
END

Call GET_BY_ID(1)