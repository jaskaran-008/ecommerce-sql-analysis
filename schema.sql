CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    email VARCHAR(100),
    signup_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    status VARCHAR(20)
);

CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2)
);

INSERT INTO customers VALUES 
(1,'Arjun Sharma','Chandigarh','arjun@email.com','2023-01-15'),
(2,'Priya Singh','Mohali','priya@email.com','2023-02-20'),
(3,'Rohan Kumar','Delhi','rohan@email.com','2023-03-10'),
(4,'Simran Kaur','Chandigarh','simran@email.com','2023-01-05'),
(5,'Dev Patel','Mumbai','dev@email.com','2023-04-18'),
(6,'Kavya Reddy','Mohali','kavya@email.com','2023-05-22'),
(7,'Manish Gupta','Chandigarh','manish@email.com','2023-06-30'),
(8,'Neha Joshi','Delhi','neha@email.com','2023-07-14');

INSERT INTO products VALUES 
(1,'Laptop','Electronics',55000,30),
(2,'Smartphone','Electronics',18000,80),
(3,'Headphones','Electronics',3500,120),
(4,'T-Shirt','Clothing',800,300),
(5,'Jeans','Clothing',2200,150),
(6,'Python Book','Books',450,200),
(7,'SQL Book','Books',380,180),
(8,'Desk Chair','Furniture',8500,40);

INSERT INTO orders VALUES 
(101,1,'2024-01-10',55000,'delivered'),
(102,2,'2024-01-15',21500,'delivered'),
(103,1,'2024-02-05',4300,'delivered'),
(104,3,'2024-02-18',3000,'pending'),
(105,4,'2024-03-01',8500,'delivered'),
(106,5,'2024-03-10',18800,'cancelled'),
(107,2,'2024-03-22',830,'delivered'),
(108,6,'2024-04-05',2580,'pending'),
(109,7,'2024-04-15',55450,'delivered'),
(110,8,'2024-04-20',6700,'delivered');

INSERT INTO order_items VALUES 
(1,101,1,1,55000),
(2,102,2,1,18000),
(3,102,3,1,3500),
(4,103,3,1,3500),
(5,103,6,2,400),
(6,104,5,1,2200),
(7,104,7,2,380),
(8,105,8,1,8500),
(9,106,2,1,18000),
(10,106,3,1,3500),
(11,107,4,1,800),
(12,108,5,1,2200),
(13,109,1,1,55000),
(14,109,6,1,450),
(15,110,8,1,8500),
(16,110,3,1,3500);