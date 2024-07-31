create table ecom_all (
	order_line int,
	order_id varchar,
	order_date date,
	ship_date date,
	ship_mode varchar,
	customer_id varchar,
	product_id varchar,
	sales double precision,
	quantity int,
	discount double precision,
	profit double precision,
	customer_name varchar,
	segment	varchar,
	age	int,
	country	varchar,
	city varchar,
	state varchar,	
	postal_code	int,
	region varchar,
	category varchar,
	sub_category varchar,
	product_name varchar
)

copy  ecom_all from 'D:\DA7\PowerBI\ecom_all.csv' DELIMITER ',' csv header

select * from ecom_all

select distinct order_line, order_id, order_date, ship_date, ship_mode, customer_id,
	product_id,sales,quantity, discount, profit from ecom_all

create table sales as
select distinct order_line, order_id, order_date, ship_date, ship_mode, customer_id,
	product_id,sales,quantity, discount, profit from ecom_all


select * from sales

select * from ecom_all

select distinct customer_id, customer_name,segment,age,country,city,state,postal_code, region from ecom_all

--customer table

create table customer as
select distinct customer_id, customer_name,segment,age,country,city,state,postal_code, region from ecom_all


select * from customer

ALTER TABLE customer
  ADD CONSTRAINT customer_pk PRIMARY KEY (customer_id);

select distinct country from customer;
select distinct city from customer;
select distinct state from customer;
select distinct region from customer;
	
ALTER TABLE customer
  ADD CONSTRAINT constraint_name CHECK (country IN ('United States')); 

ALTER TABLE customer
  ADD CONSTRAINT constraint_uniqueregion CHECK (region IN ('South','West','East','Central')); 

select max(age) from customer
	
ALTER TABLE customer
ADD CONSTRAINT constraint_Check CHECK (age >= 71);

select distinct segment from customer

ALTER TABLE customer
 ADD CONSTRAINT constraint_checkSegment CHECK (segment IN ('Consumer','Corporate','Home Office')); 

select * from sales as s
inner join customer as c
on s.customer_id = c.customer_id


select * from customer

select distinct postal_code, city,state,region, country from customer

create table sub_dim_region as 
select distinct postal_code, city,state,region, country from customer

select * from sales

select * from ecom_all

--Product table
create table product as
select distinct product_id,category,sub_category,product_name from ecom_all

select * from product

select distinct category from product


ALTER TABLE product
ADD CONSTRAINT check_Products_category CHECK (category IN('Furniture','Office Supplies','Technology'));

ALTER TABLE product
  ADD CONSTRAINT product_pk PRIMARY KEY (product_id);

ALTER TABLE product
add constraint NOT NULL;

--sales table

select * from sales

ALTER TABLE Sales
ADD PRIMARY KEY (order_line);

ALTER TABLE Sales
ADD CONSTRAINT FK_Sales_Customers FOREIGN KEY (customer_id) REFERENCES Customer(customer_id);

ALTER TABLE Sales
ADD CONSTRAINT FK_Sales_products FOREIGN KEY (product_id) REFERENCES product(product_id);




