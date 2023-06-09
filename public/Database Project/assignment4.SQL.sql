CREATE TABLE comm_categories
(category_id NUMBER PRIMARY KEY, 
category_name VARCHAR2(50) NOT NULL);

CREATE TABLE comm_products 
(product_id NUMBER PRIMARY KEY, 
category_id NUMBER NOT NULL,
product_name VARCHAR2(50) NOT NULL,
price NUMBER NOT NULL,
product_description VARCHAR2(50),
color VARCHAR2(50), 
product_size VARCHAR2(50),
FOREIGN KEY (category_id) REFERENCES comm_categories(category_id));

CREATE TABLE comm_customers 
(customer_id NUMBER PRIMARY KEY, 
last_name VARCHAR2(50) NOT NULL,
first_name VARCHAR2(50) NOT NULL,
email_address VARCHAR2(50) NOT NULL, 
phone_number VARCHAR2(50),gender VARCHAR2 (50));

CREATE TABLE comm_employee 
(employee_id NUMBER PRIMARY KEY, 
last_name VARCHAR2(50) NOT NULL, 
first_name VARCHAR2(50) NOT NULL, 
position VARCHAR2(50) NOT NULL, 
salary VARCHAR2(50) NOT NULL );

CREATE TABLE comm_orders 
(order_id NUMBER PRIMARY KEY, 
customer_id NUMBER NOT NULL, 
employee_id NUMBER, 
order_date DATE NOT NULL, 
FOREIGN KEY (customer_id) REFERENCES comm_customers(customer_id),
FOREIGN KEY (employee_id) REFERENCES comm_employee(employee_id));

CREATE TABLE comm_shipping 
(shipment_id NUMBER PRIMARY KEY, 
order_id NUMBER NOT NULL, 
address VARCHAR2(50) NOT NULL,
status VARCHAR2(50) NOT NULL,shipment_date Date, 
FOREIGN KEY (order_id) REFERENCES comm_orders(order_id));


CREATE TABLE comm_product_reviews 
(review_id NUMBER PRIMARY KEY, 
product_id NUMBER NOT NULL, 
customer_id NUMBER NOT NULL, 
review_message VARCHAR2(1000), 
rating_scale NUMBER NOT NULL,
customer_name char(50) NOT NULL, 
FOREIGN KEY (product_id) REFERENCES comm_products(product_id),
FOREIGN KEY (customer_id) REFERENCES comm_customers(customer_id) );

CREATE TABLE comm_shopping_cart 
(cart_id NUMBER PRIMARY KEY,  
status VARCHAR2(50) NOT NULL, 
product_id NUMBER NOT NULL, 
total_quantity NUMBER NOT NULL,
total_price NUMBER NOT NULL, 
FOREIGN KEY (product_id) REFERENCES comm_products(product_id) );

CREATE TABLE comm_discounts 
(discount_id NUMBER PRIMARY KEY, 
order_id NUMBER NOT NULL, 
discount_amount NUMBER NOT NULL,
start_date Date,
end_date Date, FOREIGN KEY (order_id) REFERENCES comm_orders(order_id) );

CREATE TABLE comm_factory 
(factory_id NUMBER PRIMARY KEY, 
employee_id NUMBER, 
country_name VARCHAR2(50) NOT NULL,
factory_name VARCHAR2(50) NOT NULL,
phone_number VARCHAR2(50) NOT NULL, 
FOREIGN KEY (employee_id) REFERENCES comm_employee(employee_id));

CREATE TABLE Comm_order_items 
(order_id NUMBER NOT NULL, product_id NUMBER NOT NULL, 
order_item_id NUMBER NOT NULL, 
PRIMARY KEY (order_id, product_id), 
FOREIGN KEY (order_id) REFERENCES Comm_orders(order_id),
FOREIGN KEY (product_id) REFERENCES Comm_products(product_id));

CREATE TABLE comm_products_shopping_items 
(product_id NUMBER NOT NULL, 
cart_id NUMBER NOT NULL, 
item_id NUMBER NOT NULL, 
PRIMARY KEY (product_id, cart_id), 
FOREIGN KEY (product_id) REFERENCES comm_products(product_id), 
FOREIGN KEY (cart_id) REFERENCES comm_shopping_cart(cart_id));

INSERT INTO comm_categories (category_id, category_name) VALUES (1, 'Desktops');
INSERT INTO comm_categories (category_id, category_name) VALUES (2, 'Laptops');
INSERT INTO comm_categories (category_id, category_name) VALUES (3, 'Keyboards');
INSERT INTO comm_categories (category_id, category_name) VALUES (4, 'Mouse');
INSERT INTO comm_categories (category_id, category_name) VALUES (5, 'Webcamera');

INSERT INTO comm_products (product_id, category_id, product_name, price, product_description, color, product_size) VALUES (1, 1, 'Kol X 17', 1500, 'High-power desktop', 'Black', '17-inch');
INSERT INTO comm_products (product_id, category_id, product_name, price, product_description, color, product_size) VALUES (2, 1, 'Kol X 13', 1199, 'High-performance desktop', 'Silver', '13-inch');
INSERT INTO comm_products (product_id, category_id, product_name, price, product_description, color, product_size) VALUES (3, 2, 'Kol Inspire', 699, 'Affordable laptop', 'Black', 'Small');
INSERT INTO comm_products (product_id, category_id, product_name, price, product_description, color, product_size) VALUES (4, 3, 'Kol KK', 199, 'High-speed keyboard', 'Black', 'standard');
INSERT INTO comm_products (product_id, category_id, product_name, price, product_description, color, product_size) VALUES (5, 4, 'Kol Mouse', 40, 'Comfortable moving', 'Black', 'Small');

INSERT INTO comm_customers (customer_id, last_name, first_name, email_address, phone_number, gender) VALUES (1, 'Smith', 'Lena', 'Smith@centennialcollege.ca', '111-1234', 'Female');
INSERT INTO comm_customers (customer_id, last_name, first_name, email_address, phone_number, gender) VALUES (2, 'Green', 'Nicol', 'Green@centennialcollege.ca', '222-5678', 'Female');
INSERT INTO comm_customers (customer_id, last_name, first_name, email_address, phone_number, gender) VALUES (3, 'Hart', 'John', 'Hart@centennialcollege.ca', '333-9101', 'Male');
INSERT INTO comm_customers (customer_id, last_name, first_name, email_address, phone_number, gender) VALUES (4, 'Iveerson', 'Anna', 'Iveerson@centennialcollege.ca', '444-1121', 'Female');
INSERT INTO comm_customers (customer_id, last_name, first_name, email_address, phone_number, gender) VALUES (5, 'Jack', 'Kevin', 'Jack@centennialcollege.ca', '555-1314', 'Male');

INSERT INTO comm_employee (employee_id, last_name, first_name, position, salary) VALUES (1, 'Koji', 'Abe', 'CEO', '1000000');
INSERT INTO comm_employee (employee_id, last_name, first_name, position, salary) VALUES (2, 'Ling', 'Lin', 'COO', '1000000');
INSERT INTO comm_employee (employee_id, last_name, first_name, position, salary) VALUES (3, 'Sukpal', 'Ghuman', 'Branch manager', '100000');
INSERT INTO comm_employee (employee_id, last_name, first_name, position, salary) VALUES (4, 'Wang', 'Hong', 'Sales manager', '45000');
INSERT INTO comm_employee (employee_id, last_name, first_name, position, salary) VALUES (5, 'Haibo', 'Eva', 'Developer', '55000');

INSERT INTO comm_orders (order_id, customer_id, employee_id, order_date) VALUES (1, 1, 2, TO_DATE('2020-04-01', 'YYYY-MM-DD'));
INSERT INTO comm_orders (order_id, customer_id, employee_id, order_date) VALUES (2, 2, 3, TO_DATE('2020-04-02', 'YYYY-MM-DD'));
INSERT INTO comm_orders (order_id, customer_id, employee_id, order_date) VALUES (3, 3, 4, TO_DATE('2020-04-03', 'YYYY-MM-DD'));
INSERT INTO comm_orders (order_id, customer_id, employee_id, order_date) VALUES (4, 4, 5, TO_DATE('2020-04-04', 'YYYY-MM-DD'));
INSERT INTO comm_orders (order_id, customer_id, employee_id, order_date) VALUES (5, 5, 1, TO_DATE('2020-04-05', 'YYYY-MM-DD'));

INSERT INTO comm_shipping (shipment_id, order_id, address, status, shipment_date) VALUES (1, 1, '111 Kel St', 'Shipped', TO_DATE('2020-04-02', 'YYYY-MM-DD'));
INSERT INTO comm_shipping (shipment_id, order_id, address, status, shipment_date) VALUES (2, 2, '222 Kao St', 'Shipped', TO_DATE('2020-04-03', 'YYYY-MM-DD'));
INSERT INTO comm_shipping (shipment_id, order_id, address, status, shipment_date) VALUES (3, 3, '333 Tne St', 'Shipped', TO_DATE('2020-04-04', 'YYYY-MM-DD'));
INSERT INTO comm_shipping (shipment_id, order_id, address, status, shipment_date) VALUES (4, 4, '444 M St', 'Shipped', TO_DATE('2020-04-05', 'YYYY-MM-DD'));
INSERT INTO comm_shipping (shipment_id, order_id, address, status, shipment_date) VALUES (5, 5, '555 Ce St', 'Shipped', TO_DATE('2020-04-06', 'YYYY-MM-DD'));

INSERT INTO comm_product_reviews (review_id, product_id, customer_id, review_message, rating_scale, customer_name) VALUES (1, 1, 1, 'Amazing Desktop!', 5, 'Smith Lena'); 
INSERT INTO comm_product_reviews (review_id, product_id, customer_id, review_message, rating_scale, customer_name) VALUES (2, 2, 2, 'Great screen size.', 5, 'Green Nicol');
INSERT INTO comm_product_reviews (review_id, product_id, customer_id, review_message, rating_scale, customer_name) VALUES (3, 3, 3, 'Powerful.', 5, 'Hart John');
INSERT INTO comm_product_reviews (review_id, product_id, customer_id, review_message, rating_scale, customer_name) VALUES (4, 4, 4, 'Nice display.', 4, 'Iveerson Anna');
INSERT INTO comm_product_reviews (review_id, product_id, customer_id, review_message, rating_scale, customer_name) VALUES (5, 5, 5, 'Easy to use.', 5, 'Jack Kelvin');

INSERT INTO comm_shopping_cart (cart_id, status, product_id, total_quantity, total_price) VALUES (1, 'Active', 1, 1, 777);
INSERT INTO comm_shopping_cart (cart_id, status, product_id, total_quantity, total_price) VALUES (2, 'Active', 2, 1, 2299);
INSERT INTO comm_shopping_cart (cart_id, status, product_id, total_quantity, total_price) VALUES (3, 'Active', 3, 1, 669);
INSERT INTO comm_shopping_cart (cart_id, status, product_id, total_quantity, total_price) VALUES (4, 'Active', 4, 1, 50);
INSERT INTO comm_shopping_cart (cart_id, status, product_id, total_quantity, total_price) VALUES (5, 'Active', 5, 1, 700);

INSERT INTO comm_discounts (discount_id, order_id, discount_amount, start_date, end_date) VALUES (1, 1, 150, TO_DATE('2020-04-01', 'YYYY-MM-DD'), TO_DATE('2020-04-30', 'YYYY-MM-DD'));
INSERT INTO comm_discounts (discount_id, order_id, discount_amount, start_date, end_date) VALUES (2, 2, 200, TO_DATE('2020-04-01', 'YYYY-MM-DD'), TO_DATE('2020-04-30', 'YYYY-MM-DD'));
INSERT INTO comm_discounts (discount_id, order_id, discount_amount, start_date, end_date) VALUES (3, 3, 50, TO_DATE('2020-04-01', 'YYYY-MM-DD'), TO_DATE('2020-04-30', 'YYYY-MM-DD'));
INSERT INTO comm_discounts (discount_id, order_id, discount_amount, start_date, end_date) VALUES (4, 4, 30, TO_DATE('2020-04-01', 'YYYY-MM-DD'), TO_DATE('2020-04-30', 'YYYY-MM-DD'));
INSERT INTO comm_discounts (discount_id, order_id, discount_amount, start_date, end_date) VALUES (5, 5, 10, TO_DATE('2020-04-01', 'YYYY-MM-DD'), TO_DATE('2020-04-30', 'YYYY-MM-DD'));

INSERT INTO comm_factory (factory_id, employee_id, country_name, factory_name, phone_number) VALUES (1, 1, 'Japan', 'Factory A', '111-1234');
INSERT INTO comm_factory (factory_id, employee_id, country_name, factory_name, phone_number) VALUES (2, 2, 'China', 'Factory B', '111-5678');
INSERT INTO comm_factory (factory_id, employee_id, country_name, factory_name, phone_number) VALUES (3, 3, 'Finland', 'Factory C', '111-9101');
INSERT INTO comm_factory (factory_id, employee_id, country_name, factory_name, phone_number) VALUES (4, 4, 'CANADA', 'Factory D', '111-1121');
INSERT INTO comm_factory (factory_id, employee_id, country_name, factory_name, phone_number) VALUES (5, 5, 'USA', 'Factory E','111-1314');

INSERT INTO Comm_order_items (order_id, product_id, order_item_id) VALUES (1, 1, 1);
INSERT INTO Comm_order_items (order_id, product_id, order_item_id) VALUES (2, 2, 2);
INSERT INTO Comm_order_items (order_id, product_id, order_item_id) VALUES (3, 3, 3);
INSERT INTO Comm_order_items (order_id, product_id, order_item_id) VALUES (4, 4, 4);
INSERT INTO Comm_order_items (order_id, product_id, order_item_id) VALUES (5, 5, 5);

INSERT INTO comm_products_shopping_items (product_id, cart_id, item_id) VALUES (1, 1, 1);
INSERT INTO comm_products_shopping_items (product_id, cart_id, item_id) VALUES (2, 2, 2);
INSERT INTO comm_products_shopping_items (product_id, cart_id, item_id) VALUES (3, 3, 3);
INSERT INTO comm_products_shopping_items (product_id, cart_id, item_id) VALUES (4, 4, 4);
INSERT INTO comm_products_shopping_items (product_id, cart_id, item_id) VALUES (5, 5, 5);


