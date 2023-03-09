create database MobileShopping
go
use MobileShopping
go

--------------------default: insert unrequired--------------------
create table users
(
	id int constraint PK_id_user primary key, 
	role_type varchar(10), --<radio button - checklist>
	email varchar(100), 
	passwords varchar(100), 
	avatar varchar(100)
)

create table discount 
(
	id int identity constraint PK_id_discount primary key, 
	percents int, 
	created_at datetime, 
	customer_type varchar(10) --<radio button - checklist>
)

create table product
(
  id int identity constraint PK_id_product primary key, 
  names varchar(100), 
  images varchar(100), 
  price decimal, 
  display varchar(100), 
  weights varchar(100),  
  water_resistance varchar(100),  
  operating_system varchar(100), 
  processor varchar(100), 
  battery varchar(100), 
  ram varchar(15), 
  rom varchar(10), --<radio button - checklist>
  brand varchar(20), --<radio button - checklist>
  color varchar(20), --<radio button - checklist>
  quantity int, 
  available bit, 
  saleoff_percent int default 0,  
  rate decimal default 0
)

create table cart(
  id_user int constraint PK_id_user_cart primary key constraint FK_id_user_cart references users(id),
  id_product int constraint FK_id_product foreign key references product (id), 
  quantity int 
)

create table orders(
  id int identity constraint PK_id_order primary key, 
  id_user int constraint FK_id_user_order foreign key references users(id), 
  payment_type varchar(50), 
  created_at datetime default getdate(), 
  started_at datetime default getdate() + 1, 
  finished_at datetime, 
  shipping_fee int default 10, 
  total_price decimal default 0, 
  pending bit default 1, 
  inprogess bit default 0, 
  successed bit default 0,  
  canceled bit default 0,  
  completed bit default 0
) 

create table order_item(
  id int identity constraint PK_id_order_item  primary key, 
  id_order int constraint FK_id_order foreign key references orders(id), 
  id_product int constraint FK_id_product_order_item foreign key references product(id), 
  quantity int
)

create table customer
(
	id int identity constraint PK_id_customer primary key, 
	email varchar(100), 
	names varchar(100), 
	phone varchar(10), 
	addresss varchar(100), 
	customer_type varchar(10) --<radio button - checklist>
)

create table chat(
	id int identity constraint PK_id_chat primary key, 
	--id_user int constraint FK_id_user_chat foreign key references users(id), 
	content varchar(500), 
	create_at datetime default getdate(), 
	is_user bit default 1
)

create table feedbacks(
  id_order_item int constraint PK_id_feedback_order_item primary key constraint FK_id_feedback_order_item foreign key references order_item(id), 
  content varchar(500), 
  recommended bit default 0, 
  rate int default 0, 
  created_at datetime default getdate()
)

INSERT INTO  product (names, price, display, weights, water_resistance, operating_system, processor, battery, ram, rom, brand, color, quantity, available, saleoff_percent)
VALUES ('iPhone 14 Pro Max', '1099', '6.7" Super Retina XDR OLED', '240 g', 'IP68', 'iOS 16', 'A16 Bionic chip', '4323 mAh,  16.68 Wh', '6 GB', '128gb', 'Iphone', ' Deep Purple', 20, 1,1), 
('iPhone 14 Pro Max', '1199', '6.7" Super Retina XDR OLED', '240 g', 'IP68', 'iOS 16', 'A16 Bionic chip', '4323 mAh,  16.68 Wh', '6 GB', '256gb', 'Iphone', 'Deep Purple', 20, 1,1), 
('iPhone 14 Pro Max', '1399', '6.7" Super Retina XDR OLED', '240 g', 'IP68', 'iOS 16', 'A16 Bionic chip', '4323 mAh,  16.68 Wh', '6 GB', '512gb', 'Iphone', 'Deep Purple', 20, 1,1), 
('iPhone 14 Pro Max', '1599', '6.7" Super Retina XDR OLED', '240 g', 'IP68', 'iOS 16', 'A16 Bionic chip', '4323 mAh,  16.68 Wh', '6 GB', '1tb', 'Iphone', 'Deep Purple', 20, 1,1), 

('iPhone 14 Pro Max', '1099', '6.7" Super Retina XDR OLED', '240 g', 'IP68', 'iOS 16', 'A16 Bionic chip', '4323 mAh,  16.68 Wh', '6 GB', '128gb', 'Iphone', 'Space Black', 20, 1,1), 
('iPhone 14 Pro Max', '1199', '6.7" Super Retina XDR OLED', '240 g', 'IP68', 'iOS 16', 'A16 Bionic chip', '4323 mAh,  16.68 Wh', '6 GB', '256gb', 'Iphone', 'Space Black', 20, 1,1), 
('iPhone 14 Pro Max', '1399', '6.7" Super Retina XDR OLED', '240 g', 'IP68', 'iOS 16', 'A16 Bionic chip', '4323 mAh,  16.68 Wh', '6 GB', '512gb', 'Iphone', 'Space Black', 20, 1,1), 
('iPhone 14 Pro Max', '1599', '6.7" Super Retina XDR OLED', '240 g', 'IP68', 'iOS 16', 'A16 Bionic chip', '4323 mAh,  16.68 Wh', '6 GB', '1tb', 'Iphone', 'Space Black', 20, 1,1), 

('iPhone 14 Pro Max', '1099', '6.7" Super Retina XDR OLED', '240 g', 'IP68', 'iOS 16', 'A16 Bionic chip', '4323 mAh,  16.68 Wh', '6 GB', '128gb', 'Iphone', 'Silver', 20, 1,1), 
('iPhone 14 Pro Max', '1199', '6.7" Super Retina XDR OLED', '240 g', 'IP68', 'iOS 16', 'A16 Bionic chip', '4323 mAh,  16.68 Wh', '6 GB', '256gb', 'Iphone', 'Silver', 20, 1,1), 
('iPhone 14 Pro Max', '1399', '6.7" Super Retina XDR OLED', '240 g', 'IP68', 'iOS 16', 'A16 Bionic chip', '4323 mAh,  16.68 Wh', '6 GB', '512gb', 'Iphone', 'Silver', 20, 1,1), 
('iPhone 14 Pro Max', '1599', '6.7" Super Retina XDR OLED', '240 g', 'IP68', 'iOS 16', 'A16 Bionic chip', '4323 mAh,  16.68 Wh', '6 GB', '1tb', 'Iphone', 'Silver', 20, 1,1), 

('iPhone 14 Pro Max', '1099', '6.7" Super Retina XDR OLED', '240 g', 'IP68', 'iOS 16', 'A16 Bionic chip', '4323 mAh,  16.68 Wh', '6 GB', '128gb', 'Iphone', 'Gold', 20, 1,1), 
('iPhone 14 Pro Max', '1199', '6.7" Super Retina XDR OLED', '240 g', 'IP68', 'iOS 16', 'A16 Bionic chip', '4323 mAh,  16.68 Wh', '6 GB', '256gb', 'Iphone', 'Gold', 20, 1,1), 
('iPhone 14 Pro Max', '1399', '6.7" Super Retina XDR OLED', '240 g', 'IP68', 'iOS 16', 'A16 Bionic chip', '4323 mAh,  16.68 Wh', '6 GB', '512gb', 'Iphone', 'Gold', 20, 1,1), 
('iPhone 14 Pro Max', '1599', '6.7" Super Retina XDR OLED', '240 g', 'IP68', 'iOS 16', 'A16 Bionic chip', '4323 mAh,  16.68 Wh', '6 GB', '1tb', 'Iphone', 'Gold', 20, 1,1), 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
('iPhone 14 Pro ', '999', '6.1" Super Retina XDR OLED', '206 g', 'IP68', 'iOS 16', 'A16 Bionic chip', '3200 mAh,  12.38 Wh', '6 GB', '128gb', 'Iphone', 'Deep Purple', 20, 1,1), 
('iPhone 14 Pro ', '1099', '6.1" Super Retina XDR OLED', '206 g', 'IP68', 'iOS 16', 'A16 Bionic chip', '3200 mAh,  12.38 Wh', '6 GB', '256gb', 'Iphone', 'Deep Purple', 20, 1,1), 
('iPhone 14 Pro ', '1299', '6.1" Super Retina XDR OLED', '206 g', 'IP68', 'iOS 16', 'A16 Bionic chip', '3200 mAh,  12.38 Wh', '6 GB', '512gb', 'Iphone', 'Deep Purple', 20, 1,1), 
('iPhone 14 Pro ', '1499', '6.1" Super Retina XDR OLED', '206 g', 'IP68', 'iOS 16', 'A16 Bionic chip', '3200 mAh,  12.38 Wh', '6 GB', '1tb', 'Iphone', 'Deep Purple', 20, 1,1), 

('iPhone 14 Pro ', '999', '6.1" Super Retina XDR OLED', '206 g', 'IP68', 'iOS 16', 'A16 Bionic chip', '3200 mAh,  12.38 Wh', '6 GB', '128gb', 'Iphone', 'Space Black', 20, 1,1), 
('iPhone 14 Pro ', '1099', '6.1" Super Retina XDR OLED', '206 g', 'IP68', 'iOS 16', 'A16 Bionic chip', '3200 mAh,  12.38 Wh', '6 GB', '256gb', 'Iphone', 'Space Black', 20, 1,1), 
('iPhone 14 Pro ', '1299', '6.1" Super Retina XDR OLED', '206 g', 'IP68', 'iOS 16', 'A16 Bionic chip', '3200 mAh,  12.38 Wh', '6 GB', '512gb', 'Iphone', 'Space Black', 20, 1,1), 
('iPhone 14 Pro ', '1499', '6.1" Super Retina XDR OLED', '206 g', 'IP68', 'iOS 16', 'A16 Bionic chip', '3200 mAh,  12.38 Wh', '6 GB', '1tb', 'Iphone', 'Space Black', 20, 1,1), 

('iPhone 14 Pro', '999', '6.1" Super Retina XDR OLED', '206 g', 'IP68', 'iOS 16', 'A16 Bionic chip', '3200 mAh,  12.38 Wh', '6 GB', '128gb', 'Iphone', 'Silver', 20, 1,1), 
('iPhone 14 Pro', '1099', '6.1" Super Retina XDR OLED', '206 g', 'IP68', 'iOS 16', 'A16 Bionic chip', '3200 mAh,  12.38 Wh', '6 GB', '256gb', 'Iphone', 'Silver', 20, 1,1), 
('iPhone 14 Pro', '1299', '6.1" Super Retina XDR OLED', '206 g', 'IP68', 'iOS 16', 'A16 Bionic chip', '3200 mAh,  12.38 Wh', '6 GB', '512gb', 'Iphone', 'Silver', 20, 1,1), 
('iPhone 14 Pro', '1499', '6.1" Super Retina XDR OLED', '206 g', 'IP68', 'iOS 16', 'A16 Bionic chip', '3200 mAh,  12.38 Wh', '6 GB', '1tb', 'Iphone', 'Silver', 20, 1,1), 

('iPhone 14 Pro', '999', '6.1" Super Retina XDR OLED', '206 g', 'IP68', 'iOS 16', 'A16 Bionic chip', '3200 mAh,  12.38 Wh', '6 GB', '128gb', 'Iphone', 'Gold', 20, 1,1), 
('iPhone 14 Pro', '1099', '6.1" Super Retina XDR OLED', '206 g', 'IP68', 'iOS 16', 'A16 Bionic chip', '3200 mAh,  12.38 Wh', '6 GB', '256gb', 'Iphone', 'Gold', 20, 1,1), 
('iPhone 14 Pro', '1299', '6.1" Super Retina XDR OLED', '206 g', 'IP68', 'iOS 16', 'A16 Bionic chip', '3200 mAh,  12.38 Wh', '6 GB', '512gb', 'Iphone', 'Gold', 20, 1,1), 
('iPhone 14 Pro', '1499', '6.1" Super Retina XDR OLED', '206 g', 'IP68', 'iOS 16', 'A16 Bionic chip', '3200 mAh,  12.38 Wh', '6 GB', '1tb', 'Iphone', 'Gold', 20, 1,1), 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
('iPhone 14', '799', '6.1" Super Retina XDR OLED', '172 g', 'IP68', 'iOS 16', 'A15 Bionic with 5-core GPU', '3279 mAh,  12.68 Wh', '6 GB', '128gb', 'Iphone', ' Blue', 20, 1,1), 
('iPhone 14', '899', '6.1" Super Retina XDR OLED', '172 g', 'IP68', 'iOS 16', 'A15 Bionic with 5-core GPU', '3279 mAh,  12.68 Wh', '6 GB', '256gb', 'Iphone', 'Blue', 20, 1,1), 
('iPhone 14', '1099', '6.1" Super Retina XDR OLED', '172 g', 'IP68', 'iOS 16', 'A15 Bionic with 5-core GPU', '3279 mAh,  12.68 Wh', '6 GB', '512gb', 'Iphone', 'Blue', 20, 1,1), 

('iPhone 14', '799', '6.1" Super Retina XDR OLED', '172 g', 'IP68', 'iOS 16', 'A15 Bionic with 5-core GPU', '3279 mAh,  12.68 Wh', '6 GB', '128gb', 'Iphone', 'Midnight', 20, 1,1), 
('iPhone 14', '899', '6.1 " Super Retina XDR OLED', '172 g', 'IP68', 'iOS 16', 'A15 Bionic with 5-core GPU', '3279 mAh,  12.68 Wh', '6 GB', '256gb', 'Iphone', 'Midnight', 20, 1,1), 
('iPhone 14', '1099', '6.1" Super Retina XDR OLED', '172 g', 'IP68', 'iOS 16', 'A15 Bionic with 5-core GPU', '3279 mAh,  12.68 Wh', '6 GB', '512gb', 'Iphone', 'Midnight', 20, 1,1), 

('iPhone 14', '799', '6.1" Super Retina XDR OLED', '172 g', 'IP68', 'iOS 16', 'A15 Bionic with 5-core GPU', '3279 mAh,  12.68 Wh', '6 GB', '128gb', 'Iphone', 'Purple', 20, 1,1), 
('iPhone 14', '899', '6.1" Super Retina XDR OLED', '172 g', 'IP68', 'iOS 16', 'A15 Bionic with 5-core GPU', '3279 mAh,  12.68 Wh', '6 GB', '256gb', 'Iphone', 'Purple', 20, 1,1), 
('iPhone 14', '1099', '6.1" Super Retina XDR OLED', '172 g', 'IP68', 'iOS 16', 'A15 Bionic with 5-core GPU', '3279 mAh,  12.68 Wh', '6 GB', '512gb', 'Iphone', 'Purple', 20, 1,1), 

('iPhone 14', '799', '6.1" Super Retina XDR OLED', '172 g', 'IP68', 'iOS 16', 'A15 Bionic with 5-core GPU', '3279 mAh,  12.68 Wh', '6 GB', '128gb', 'Iphone', 'Red', 20, 1,1), 
('iPhone 14', '899', '6.1" Super Retina XDR OLED', '172 g', 'IP68', 'iOS 16', 'A15 Bionic with 5-core GPU', '3279 mAh,  12.68 Wh', '6 GB', '256gb', 'Iphone', 'Red', 20, 1,1), 
('iPhone 14', '1099', '6.1" Super Retina XDR OLED', '172 g', 'IP68', 'iOS 16', 'A15 Bionic with 5-core GPU', '3279 mAh,  12.68 Wh', '6 GB', '512gb', 'Iphone', 'Red', 20, 1,1), 

('iPhone 14', '799', '6.1" Super Retina XDR OLED', '172 g', 'IP68', 'iOS 16', 'A15 Bionic with 5-core GPU', '3279 mAh,  12.68 Wh', '6 GB', '128gb', 'Iphone', 'Starlight', 20, 1,1), 
('iPhone 14', '899', '6.1" Super Retina XDR OLED', '172 g', 'IP68', 'iOS 16', 'A15 Bionic with 5-core GPU', '3279 mAh,  12.68 Wh', '6 GB', '256gb', 'Iphone', 'Starlight', 20, 1,1), 
('iPhone 14', '1099', '6.1" Super Retina XDR OLED', '172 g', 'IP68', 'iOS 16', 'A15 Bionic with 5-core GPU', '3279 mAh,  12.68 Wh', '6 GB', '512gb', 'Iphone', 'Starlight', 20, 1,1), 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
('iPhone 13', '699', '6.1" Super Retina XDR OLED', '172 g', 'IP68', 'iOS 15 or newer', 'A15 Bionic chip with 4-core GPUz', '3227 mAh,  12.41 Wh', '6 GB', '128gb', 'Iphone', 'Midnight', 20, 1,1), 
('iPhone 13', '799', '6.1" Super Retina XDR OLED', '172 g', 'IP68', 'iOS 15 or newer', 'A15 Bionic chip with 4-core GPU', '3227 mAh,  12.41 Wh', '6 GB', '256gb', 'Iphone', 'Midnight', 20, 1,1), 
('iPhone 13', '999', '6.1" Super Retina XDR OLED', '172 g', 'IP68', 'iOS 15 or newer', 'A15 Bionic chip with 4-core GPU', '3227 mAh,  12.41 Wh', '6 GB', '512gb', 'Iphone', 'Midnight', 20, 1,1), 

('iPhone 13', '699', '6.1" Super Retina XDR OLED', '174 g', 'IP68', 'iOS 15 or newer', 'A15 Bionic chip with 4-core GPU', '3227 mAh,  12.41 Wh', '6 GB', '128gb', 'Iphone', 'Blue', 20, 1,1), 
('iPhone 13', '799', '6.1" Super Retina XDR OLED', '174 g', 'IP68', 'iOS 15 or newer', 'A15 Bionic chip with 4-core GPU', '3227 mAh,  12.41 Wh', '6 GB', '256gb', 'Iphone', 'Blue', 20, 1,1), 
('iPhone 13', '999', '6.1" Super Retina XDR OLED', '174 g', 'IP68', 'iOS 15 or newer', 'A15 Bionic chip with 4-core GPU', '3227 mAh,  12.41 Wh', '6 GB', '512gb', 'Iphone', 'Blue', 20, 1,1), 

('iPhone 13', '699', '6.1" Super Retina XDR OLED', '174 g', 'IP68', 'iOS 15 or newer', 'A15 Bionic chip with 4-core GPU', '3227 mAh,  12.41 Wh', '6 GB', '128gb', 'Iphone', 'Green', 20, 1,1), 
('iPhone 13', '799', '6.1" Super Retina XDR OLED', '174 g', 'IP68', 'iOS 15 or newer', 'A15 Bionic chip with 4-core GPU', '3227 mAh,  12.41 Wh', '6 GB', '256gb', 'Iphone', 'Green', 20, 1,1), 
('iPhone 13', '999', '6.1" Super Retina XDR OLED', '174 g', 'IP68', 'iOS 15 or newer', 'A15 Bionic chip with 4-core GPU', '3227 mAh,  12.41 Wh', '6 GB', '512gb', 'Iphone', 'Green', 20, 1,1), 

('iPhone 13', '699', '6.1" Super Retina XDR OLED', '174 g', 'IP68', 'iOS 15 or newer', 'A15 Bionic chip with 4-core GPU', '3227 mAh,  12.41 Wh', '6 GB', '128gb', 'Iphone', 'Pink', 20, 1,1), 
('iPhone 13', '799', '6.1" Super Retina XDR OLED', '174 g', 'IP68', 'iOS 15 or newer', 'A15 Bionic chip with 4-core GPU', '3227 mAh,  12.41 Wh', '6 GB', '256gb', 'Iphone', 'Pink', 20, 1,1), 
('iPhone 13', '999', '6.1" Super Retina XDR OLED', '174 g', 'IP68', 'iOS 15 or newer', 'A15 Bionic chip with 4-core GPU', '3227 mAh,  12.41 Wh', '6 GB', '512gb', 'Iphone', 'Pink', 20, 1,1), 

('iPhone 13', '699', '6.1" Super Retina XDR OLED', '174 g', 'IP68', 'iOS 15 or newer', 'A15 Bionic chip with 4-core GPU', '3227 mAh,  12.41 Wh', '6 GB', '128gb', 'Iphone', 'Red', 20, 1,1), 
('iPhone 13', '799', '6.1" Super Retina XDR OLED', '174 g', 'IP68', 'iOS 15 or newer', 'A15 Bionic chip with 4-core GPU', '3227 mAh,  12.41 Wh', '6 GB', '256gb', 'Iphone', 'Red', 20, 1,1), 
('iPhone 13', '999', '6.1" Super Retina XDR OLED', '174 g', 'IP68', 'iOS 15 or newer', 'A15 Bionic chip with 4-core GPU', '3227 mAh,  12.41 Wh', '6 GB', '512gb', 'Iphone', 'Red', 20, 1,1), 

('iPhone 13', '699', '6.1" Super Retina XDR OLED', '174 g', 'IP68', 'iOS 15 or newer', 'A15 Bionic chip with 4-core GPU', '3227 mAh,  12.41 Wh', '6 GB', '128gb', 'Iphone', 'Starlight', 20, 1,1), 
('iPhone 13', '799', '6.1" Super Retina XDR OLED', '174 g', 'IP68', 'iOS 15 or newer', 'A15 Bionic chip with 4-core GPU', '3227 mAh,  12.41 Wh', '6 GB', '256gb', 'Iphone', 'Starlight', 20, 1,1), 
('iPhone 13', '999', '6.1" Super Retina XDR OLED', '174 g', 'IP68', 'iOS 15 or newer', 'A15 Bionic chip with 4-core GPU', '3227 mAh,  12.41 Wh', '6 GB', '512gb', 'Iphone', 'Starlight', 20, 1,1), 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
('iPhone 13 Mini', '599', '5.4" Super Retina XDR OLED', '141 g', 'IP68', 'iOS 15', 'A15 Bionic chip with 4-core GPU', '2406 mAh', '6 GB', '128gb', 'Iphone', 'Blue', 20, 1,1), 
('iPhone 13 Mini', '699', '5.4" Super Retina XDR OLED', '141 g', 'IP68', 'iOS 15', 'A15 Bionic chip with 4-core GPU', '2406 mAh', '6 GB', '256gb', 'Iphone', 'Blue', 20, 1,1), 
('iPhone 13 Mini', '899', '5.4" Super Retina XDR OLED', '141 g', 'IP68', 'iOS 15', 'A15 Bionic chip with 4-core GPU', '2406 mAh', '6 GB', '512gb', 'Iphone', 'Blue', 20, 1,1), 

('iPhone 13 Mini', '599', '5.4" Super Retina XDR OLED', '141 g', 'IP68', 'iOS 15', 'A15 Bionic chip with 4-core GPU', '2406 mAh', '6 GB', '128gb', 'Iphone', 'Green', 20, 1,1), 
('iPhone 13 Mini', '699', '5.4" Super Retina XDR OLED', '141 g', 'IP68', 'iOS 15', 'A15 Bionic chip with 4-core GPU', '2406 mAh', '6 GB', '256gb', 'Iphone', 'Green', 20, 1,1), 
('iPhone 13 Mini', '899', '5.4" Super Retina XDR OLED', '141 g', 'IP68', 'iOS 15', 'A15 Bionic chip with 4-core GPU', '2406 mAh', '6 GB', '512gb', 'Iphone', 'Green', 20, 1,1), 

('iPhone 13 Mini', '599', '5.4" Super Retina XDR OLED', '141 g', 'IP68', 'iOS 15', 'A15 Bionic chip with 4-core GPU', '2406 mAh', '6 GB', '128gb', 'Iphone', 'Pink', 20, 1,1), 
('iPhone 13 Mini', '699', '5.4" Super Retina XDR OLED', '141 g', 'IP68', 'iOS 15', 'A15 Bionic chip with 4-core GPU', '2406 mAh', '6 GB', '256gb', 'Iphone', 'Pink', 20, 1,1), 
('iPhone 13 Mini', '899', '5.4" Super Retina XDR OLED', '141 g', 'IP68', 'iOS 15', 'A15 Bionic chip with 4-core GPU', '2406 mAh', '6 GB', '512gb', 'Iphone', 'Pink', 20, 1,1), 

('iPhone 13 Mini', '599', '5.4" Super Retina XDR OLED', '141 g', 'IP68', 'iOS 15', 'A15 Bionic chip with 4-core GPU', '2406 mAh', '6 GB', '128gb', 'Iphone', 'Red', 20, 1,1), 
('iPhone 13 Mini', '699', '5.4" Super Retina XDR OLED', '141 g', 'IP68', 'iOS 15', 'A15 Bionic chip with 4-core GPU', '2406 mAh', '6 GB', '256gb', 'Iphone', 'Red', 20, 1,1), 
('iPhone 13 Mini', '899', '5.4" Super Retina XDR OLED', '141 g', 'IP68', 'iOS 15', 'A15 Bionic chip with 4-core GPU', '2406 mAh', '6 GB', '512gb', 'Iphone', 'Red', 20, 1,1), 

('iPhone 13 Mini', '599', '5.4" Super Retina XDR OLED', '141 g', 'IP68', 'iOS 15', 'A15 Bionic chip with 4-core GPU', '2406 mAh', '6 GB', '128gb', 'Iphone', 'Starlight', 20, 1,1), 
('iPhone 13 Mini', '699', '5.4" Super Retina XDR OLED', '141 g', 'IP68', 'iOS 15', 'A15 Bionic chip with 4-core GPU', '2406 mAh', '6 GB', '256gb', 'Iphone', 'Starlight', 20, 1,1), 
('iPhone 13 Mini', '899', '5.4" Super Retina XDR OLED', '141 g', 'IP68', 'iOS 15', 'A15 Bionic chip with 4-core GPU', '2406 mAh', '6 GB', '512gb', 'Iphone', 'Starlight', 20, 1,1), 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
('Galaxy S23 Ultra', '1199.99', '6.8” Dynamic AMOLED 2X Infinity-O', '234 g', 'IP68', 'Android 13', 'Qualcomm Snapdragon 8 Gen 2', '5, 000 mAh', '8/12 GB', '256gb', 'Samsung', 'Black', 20, 1,1), 
('Galaxy S23 Ultra', '1379.99', '6.8” Dynamic AMOLED 2X Infinity-O', '234 g', 'IP68', 'Android 13', 'Qualcomm Snapdragon 8 Gen 2', '5, 000 mAh', '8/12 GB', '512gb', 'Samsung', 'Black', 20, 1,1), 
('Galaxy S23 Ultra', '1619.99', '6.8” Dynamic AMOLED 2X Infinity-O', '234 g', 'IP68', 'Android 13', 'Qualcomm Snapdragon 8 Gen 2', '5, 000 mAh', '8/12 GB', '1tb', 'Samsung', 'Black', 20, 1,1), 

('Galaxy S23 Ultra', '1199.99', '6.8” Dynamic AMOLED 2X Infinity-O', '234 g', 'IP68', 'Android 13', 'Qualcomm Snapdragon 8 Gen 2', '5, 000 mAh', '8/12 GB', '256gb', 'Samsung', 'Cream', 20, 1,1), 
('Galaxy S23 Ultra', '1379.99', '6.8” Dynamic AMOLED 2X Infinity-O', '234 g', 'IP68', 'Android 13', 'Qualcomm Snapdragon 8 Gen 2', '5, 000 mAh', '8/12 GB', '512gb', 'Samsung', 'Cream', 20, 1,1), 
('Galaxy S23 Ultra', '1619.99', '6.8” Dynamic AMOLED 2X Infinity-O', '234 g', 'IP68', 'Android 13', 'Qualcomm Snapdragon 8 Gen 2', '5, 000 mAh', '8/12 GB', '1tb', 'Samsung', 'Cream', 20, 1,1), 

('Galaxy S23 Ultra', '1199.99', '6.8” Dynamic AMOLED 2X Infinity-O', '234 g', 'IP68', 'Android 13', 'Qualcomm Snapdragon 8 Gen 2', '5, 000 mAh', '8/12 GB', '256gb', 'Samsung', 'Green', 20, 1,1), 
('Galaxy S23 Ultra', '1379.99', '6.8” Dynamic AMOLED 2X Infinity-O', '234 g', 'IP68', 'Android 13', 'AQualcomm Snapdragon 8 Gen 2', '5, 000 mAh', '8/12 GB', '512gb', 'Samsung', 'Green', 20, 1,1), 
('Galaxy S23 Ultra', '1619.99', '6.8” Dynamic AMOLED 2X Infinity-O', '234 g', 'IP68', 'Android 13', 'Qualcomm Snapdragon 8 Gen 2', '5, 000 mAh', '8/12 GB', '1tb', 'Samsung', 'Green', 20, 1,1), 

('Galaxy S23 Ultra', '1199.99', '6.8” Dynamic AMOLED 2X Infinity-O', '234 g', 'IP68', 'Android 13', 'Qualcomm Snapdragon 8 Gen 2', '5, 000 mAh', '8/12 GB', '256gb', 'Samsung', 'Lavender', 20, 1,1), 
('Galaxy S23 Ultra', '1379.99', '6.8” Dynamic AMOLED 2X Infinity-O', '234 g', 'IP68', 'Android 13', 'Qualcomm Snapdragon 8 Gen 2', '5, 000 mAh', '8/12 GB', '512gb', 'Samsung', 'Lavender', 20, 1,1), 
('Galaxy S23 Ultra', '1619.99', '6.8” Dynamic AMOLED 2X Infinity-O', '234 g', 'IP68', 'Android 13', 'Qualcomm Snapdragon 8 Gen 2', '5, 000 mAh', '8/12 GB', '1tb', 'Samsung', 'Lavender', 20, 1,1), 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
('Galaxy S23+', '999.99', '6.6” Dynamic AMOLED 2X Infinity-O', '234 g', 'IP68', 'Android 13', 'Qualcomm Snapdragon 8 Gen 2', '4, 700 mAh', '8 GB', '256gb', 'Samsung', 'Black', 20, 1,1), 
('Galaxy S23+', '1119.99', '6.6” Dynamic AMOLED 2X Infinity-O', '234 g', 'IP68', 'Android 13', 'Qualcomm Snapdragon 8 Gen 2', '4, 700 mAh', '8 GB', '512gb', 'Samsung', 'Black', 20, 1,1), 

('Galaxy S23+', '999.99', '6.6” Dynamic AMOLED 2X Infinity-O', '234 g', 'IP68', 'Android 13', 'Qualcomm Snapdragon 8 Gen 2', '4, 700 mAh', '8 GB', '256gb', 'Samsung', 'Cream', 20, 1,1), 
('Galaxy S23+', '1119.99', '6.6” Dynamic AMOLED 2X Infinity-O', '234 g', 'IP68', 'Android 13', 'Qualcomm Snapdragon 8 Gen 2', '4, 700 mAh', '8 GB', '512gb', 'Samsung', 'Cream', 20, 1,1), 

('Galaxy S23+', '999.99', '6.6” Dynamic AMOLED 2X Infinity-O', '234 g', 'IP68', 'Android 13', 'Qualcomm Snapdragon 8 Gen 2', '4, 700 mAh', '8 GB', '256gb', 'Samsung', 'Green', 20, 1,1), 
('Galaxy S23+', '1119.99', '6.6” Dynamic AMOLED 2X Infinity-O', '234 g', 'IP68', 'Android 13', 'AQualcomm Snapdragon 8 Gen 2', '4, 700 mAh', '8 GB', '512gb', 'Samsung', 'Green', 20, 1,1), 

('Galaxy S23+', '999.99', '6.6” Dynamic AMOLED 2X Infinity-O', '234 g', 'IP68', 'Android 13', 'Qualcomm Snapdragon 8 Gen 2', '4, 700 mAh', '8 GB', '256gb', 'Samsung', 'Lavender', 20, 1,1), 
('Galaxy S23+', '1119.99', '6.6” Dynamic AMOLED 2X Infinity-O', '234 g', 'IP68', 'Android 13', 'Qualcomm Snapdragon 8 Gen 2', '4, 700 mAh', '8 GB', '512gb', 'Samsung', 'Lavender', 20, 1,1), 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
('Galaxy S22+', '819.99', '6.6” Infinity-O FHD+ Dynamic AMOLED 2X', '228 g', 'IP68', 'Android 12', 'Snapdragon 8 Gen 1', '4, 500 mAh', '8 GB', '128gb', 'Samsung', 'Phantom black', 20, 1,1), 
('Galaxy S22+ ','869.99', '6.6” Infinity-O FHD+ Dynamic AMOLED 2X', '228 g', 'IP68', 'Android 12', 'Snapdragon 8 Gen 1', '4, 500 mAh', '8 GB', '256gb', 'Samsung', 'Phantom black', 20, 1,1), 

('Galaxy S22+',  '819.99', '6.6” Infinity-O FHD+ Dynamic AMOLED 2X', '228 g', 'IP68', 'Android 12', 'Snapdragon 8 Gen 1', '4, 500 mAh', '8 GB', '128gb', 'Samsung', 'Pink gold', 20, 1,1), 
('Galaxy S22+',  '869.99', '6.6” Infinity-O FHD+ Dynamic AMOLED 2X', '228 g', 'IP68', 'Android 12', 'Snapdragon 8 Gen 1', '4, 500 mAh', '8 GB', '256gb', 'Samsung', 'Pink gold', 20, 1,1), 

('Galaxy S22+', '819.99', '6.6” Infinity-O FHD+ Dynamic AMOLED 2X', '228 g', 'IP68', 'Android 12', 'Snapdragon 8 Gen 1', '4, 500 mAh', '8 GB', '125gb', 'Samsung', 'Green', 20, 1,1), 
('Galaxy S22+', '869.99', '6.6” Infinity-O FHD+ Dynamic AMOLED 2X', '228 g', 'IP68', 'Android 12', 'Snapdragon 8 Gen 1', '4, 500 mAh', '8 GB', '256gb', 'Samsung', 'Green', 20, 1,1), 

('Galaxy S22+',  '819.99', '6.6” Infinity-O FHD+ Dynamic AMOLED 2X', '228 g', 'IP68', 'Android 12', 'Snapdragon 8 Gen 1', '4, 500 mAh', '8 GB', '128gb', 'Samsung', 'Phantom white', 20, 1,1), 
('Galaxy S22+',  '869.99', '6.6” Infinity-O FHD+ Dynamic AMOLED 2X', '228 g', 'IP68', 'Android 12', 'Snapdragon 8 Gen 1', '4, 500 mAh', '8 GB', '256gb', 'Samsung', 'Phantom white', 20, 1,1), 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
('Galaxy Z Flip4',  '839.99', '6.7” FHD + Dynamic AMOLED 2X Infinity Flex', '187 g', 'IP68', 'Android 12', 'Snapdragon 8 + Gen 1', '3, 700 mAh', '8 GB', '128gb', 'Samsung', 'Pink gold', 20, 1,1), 
('Galaxy Z Flip4',  '899.99', '6.7” FHD + Dynamic AMOLED 2X Infinity Flex', '187 g', 'IP68', 'Android 12', 'Snapdragon 8 + Gen 1', '3, 700 mAh', '8 GB', '256gb', 'Samsung', 'Pink gold', 20, 1,1), 
('Galaxy Z Flip4',  '1019.99', '6.7” FHD + Dynamic AMOLED 2X Infinity Flex', '187 g', 'IP68', 'Android 12', 'Snapdragon 8 + Gen 1', '3, 700 mAh', '8 GB', '512gb', 'Samsung', 'Pink gold', 20, 1,1), 

('Galaxy Z Flip4',  '839.99', '6.7” FHD + Dynamic AMOLED 2X Infinity Flex', '187 g', 'IP68', 'Android 12', 'Snapdragon 8 + Gen 1', '3, 700 mAh', '8 GB', '128gb', 'Samsung', 'Graphite', 20, 1,1), 
('Galaxy Z Flip4',  '899.99', '6.7” FHD + Dynamic AMOLED 2X Infinity Flex', '187 g', 'IP68', 'Android 12', 'Snapdragon 8 + Gen 1', '3, 700 mAh', '8 GB', '256gb', 'Samsung', 'Graphite', 20, 1,1), 
('Galaxy Z Flip4',  '1019.99', '6.7” FHD + Dynamic AMOLED 2X Infinity Flex', '187 g', 'IP68', 'Android 12', 'Snapdragon 8 + Gen 1', '3, 700 mAh', '8 GB', '512gb', 'Samsung', 'Graphite', 20, 1,1), 

('Galaxy Z Flip4',  '839.99', '6.7” FHD + Dynamic AMOLED 2X Infinity Flex', '187 g', 'IP68', 'Android 12', 'Snapdragon 8 + Gen 1', '3, 700 mAh', '8 GB', '125gb', 'Samsung', 'Blue', 20, 1,1), 
('Galaxy Z Flip4',  '899.99', '6.7” FHD + Dynamic AMOLED 2X Infinity Flex', '187 g', 'IP68', 'Android 12', 'Snapdragon 8 + Gen 1', '3, 700 mAh', '8 GB', '256gb', 'Samsung', 'Blue', 20, 1,1), 
('Galaxy Z Flip4',  '1019.99', '6.7” FHD + Dynamic AMOLED 2X Infinity Flex', '187 g', 'IP68', 'Android 12', 'Snapdragon 8 + Gen 1', '3, 700 mAh', '8 GB', '512gb', 'Samsung', 'Blue', 20, 1,1), 

('Galaxy Z Flip4',  '839.99', '6.7” FHD + Dynamic AMOLED 2X Infinity Flex', '187 g', 'IP68', 'Android 12', 'Snapdragon 8 + Gen 1', '3, 700 mAh', '8 GB', '128gb', 'Samsung', 'Bora purple', 20, 1,1), 
('Galaxy Z Flip4',  '899.99', '6.7” FHD + Dynamic AMOLED 2X Infinity Flex', '187 g', 'IP68', 'Android 12', 'Snapdragon 8 + Gen 1', '3, 700 mAh', '8 GB', '256gb', 'Samsung', 'Bora purple', 20, 1,1), 
('Galaxy Z Flip4',  '1019.99', '6.7” FHD + Dynamic AMOLED 2X Infinity Flex', '187 g', 'IP68', 'Android 12', 'Snapdragon 8 + Gen 1', '3, 700 mAh', '8 GB', '512gb', 'Samsung', 'Bora purple', 20, 1,1), 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
('Galaxy Z Fold4',  '1464.99', '7.6” QXGA+ Dynamic AMOLED 2X Infinity Flex', '263 g', 'IP68', 'Android 12', 'Snapdragon 8 + Gen 1', '4, 400 mAh', '12 GB', '256gb', 'Samsung', 'Beige', 20, 1,1), 
('Galaxy Z Fold4',  '1584.99', '7.6” QXGA+ Dynamic AMOLED 2X Infinity Flex', '263 g', 'IP68', 'Android 12', 'Snapdragon 8 + Gen 1', '4, 400 mAh', '12 GB', '512gb', 'Samsung', 'Beige', 20, 1,1), 
('Galaxy Z Fold4',  '1824.99', '7.6” QXGA+ Dynamic AMOLED 2X Infinity Flex', '263 g', 'IP68', 'Android 12', 'Snapdragon 8 + Gen 1', '4, 400 mAh', '12 GB', '1tb', 'Samsung', 'Beige', 20, 1,1), 

('Galaxy Z Fold4',  '1464.99', '7.6” QXGA+ Dynamic AMOLED 2X Infinity Flex', '263 g', 'IP68', 'Android 12', 'Snapdragon 8 + Gen 1', '4, 400 mAh', '12 GB', '256gb', 'Samsung', 'Phantom black', 20, 1,1), 
('Galaxy Z Fold4',  '1584.99', '7.6” QXGA+ Dynamic AMOLED 2X Infinity Flex', '263 g', 'IP68', 'Android 12', 'Snapdragon 8 + Gen 1', '4, 400 mAh', '12 GB', '512gb', 'Samsung', 'Phantom black', 20, 1,1), 
('Galaxy Z Fold4',  '1824.99', '7.6” QXGA+ Dynamic AMOLED 2X Infinity Flex', '263 g', 'IP68', 'Android 12', 'Snapdragon 8 + Gen 1', '4, 400 mAh', '12 GB', '1tb', 'Samsung', 'Phantom black', 20, 1,1), 

('Galaxy Z Fold4', '1464.99', '7.6” QXGA+ Dynamic AMOLED 2X Infinity Flex', '263 g', 'IP68', 'Android 12', 'Snapdragon 8 + Gen 1', '4, 400 mAh', '12 GB', '256gb', 'Samsung', 'Graygreen', 20, 1,1), 
('Galaxy Z Fold4', '1584.99', '7.6” QXGA+ Dynamic AMOLED 2X Infinity Flex', '263 g', 'IP68', 'Android 12', 'Snapdragon 8 + Gen 1', '4, 400 mAh', '12 GB', '512gb', 'Samsung', 'Graygreen', 20, 1,1), 
('Galaxy Z Fold4', '1824.99', '7.6” QXGA+ Dynamic AMOLED 2X Infinity Flex', '263 g', 'IP68', 'Android 12', 'Snapdragon 8 + Gen 1', '4, 400 mAh', '12 GB', '1tb', 'Samsung', 'Graygreen', 20, 1,1), 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
('Pixel 7', '599', '6.3" FHD+ OLED at 416 PPI', '197 g', 'IP68', '', 'Google Tensor G2', '4355 mAh', '8 GB LPDDR5', '128gb', 'Google','Lemongrass',  20, 1,1), 
('Pixel 7', '699', '6.3" FHD+ OLED at 416 PPI', '197 g', 'IP68', '', 'Google Tensor G2', '4355 mAh', '8 GB LPDDR5', '256gb', 'Google','Lemongrass' , 20, 1,1), 

('Pixel 7',  '599', '6.3" FHD+ OLED at 416 PPI', '197 g', 'IP68', '', 'Google Tensor G2', '4355 mAh', '8 GB LPDDR5', '128gb', 'Google', 'Obsidian', 20, 1,1), 
('Pixel 7', '699', '6.3" FHD+ OLED at 416 PPI', '197 g', 'IP68', '', 'Google Tensor G2', '4355 mAh', '8 GB LPDDR5', '256gb', 'Google', 'Obsidian', 20, 1,1), 

('Pixel 7','599', '6.3" FHD+ OLED at 416 PPI', '197 g', 'IP68', '', 'Google Tensor G2', '4355 mAh ', '8 GB LPDDR5', '128gb', 'Google', 'Snow', 20, 1,1), 
('Pixel 7','699', '6.3" FHD+ OLED at 416 PPI', '197 g', 'IP68', '', 'Google Tensor G2', '4355 mAh ', '8 GB LPDDR5', '256gb', 'Google', 'Snow', 20, 1,1), 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
('Pixel 7 Pro',  '899', '6.7" QHD+ LTPO OLED at 512 PPI', '212 g', 'IP68', '', 'Google Tensor G2', '5000 mAh', '12 GB LPDDR5', '128gb', 'Google', 'Hazel', 20, 1,1), 
('Pixel 7 Pro',  '999', '6.7" QHD+ LTPO OLED at 512 PPI', '212 g', 'IP68', '', 'Google Tensor G2', '5000 mAh', '12 GB LPDDR5', '256gb', 'Google', 'Hazel', 20, 1,1), 
('Pixel 7 Pro',  '1099', '6.7" QHD+ LTPO OLED at 512 PPI', '212 g', 'IP68', '', 'Google Tensor G2', '5000 mAh', '12 GB LPDDR5', '512gb', 'Google', 'Hazel', 20, 1,1), 

('Pixel 7 Pro',  '899', '6.7" QHD+ LTPO OLED at 512 PPI', '212 g', 'IP68', '', 'Google Tensor G2', '5000 mAh', '12 GB LPDDR5', '128gb', 'Google', 'Obsidian', 20, 1,1), 
('Pixel 7 Pro', '999', '6.7" QHD+ LTPO OLED at 512 PPI', '212 g', 'IP68', '', 'Google Tensor G2', '5000 mAh', '12 GB LPDDR5', '256gb', 'Google', 'Obsidian', 20, 1,1), 
('Pixel 7 Pro',  '1099', '6.7" QHD+ LTPO OLED at 512 PPI', '212 g', 'IP68', '', 'Google Tensor G2', '5000 mAh', '12 GB LPDDR5', '512gb', 'Google', 'Obsidian', 20, 1,1), 

('Pixel 7 Pro','899', '6.7" QHD+ LTPO OLED at 512 PPI', '212 g', 'IP68', '', 'Google Tensor G2', '5000 mAh ', '12 GB LPDDR5', '128gb', 'Google', 'Snow', 20, 1,1), 
('Pixel 7 Pro','999', '6.7" QHD+ LTPO OLED at 512 PPI', '212 g', 'IP68', '', 'Google Tensor G2', '5000 mAh ', '12 GB LPDDR5', '256gb', 'Google', 'Snow', 20, 1,1), 
('Pixel 7 Pro','1099', '6.7" QHD+ LTPO OLED at 512 PPI', '212 g', 'IP68', '', 'Google Tensor G2', '5000 mAh', '12 GB LPDDR5', '512gb', 'Google', 'Snow', 20, 1,1), 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
('Pixel 6A',  '449', '6.1" FHD+ OLED at 429 PPI', '178 g', 'IP67', '', 'Google Tensor ', '4410 mAh', '6 GB LPDDR5', '128gb', 'Google', 'Chalk', 20, 1,1), 
('Pixel 6A',  '449', '6.1" FHD+ OLED at 429 PPI', '178 g', 'IP67', '', 'Google Tensor ', '4410 mAh', '6 GB LPDDR5', '128gb', 'Google', 'Charcoal', 20, 1,1), 
('Pixel 6A','449', '6.1" FHD+ OLED at 429 PPI', '178 g', 'IP67', '', 'Google Tensor ', '4410 mAh ', '6 GB LPDDR5', '128gb', 'Google', 'Sage', 20, 1,1), 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
('Xiaomi 13 Pro',  '1299', '6.73" WQHD+ AMOLED', '229 g', 'IP68', 'MIUI 14,  android 13', 'Snapdragon® 8 Gen 2 4nm chip Up to 3.2GH', '4820 mAh', '12 GB ', '256gb', 'Xiaomi', 'Ceramic black', 20, 1,1), 
('Xiaomi 13 Pro',  '1399', '6.73" WQHD+ AMOLED', '229 g', 'IP68', 'MIUI 14,  android 13', 'Snapdragon® 8 Gen 2 4nm chip Up to 3.2GH', '4820 mAh', '12 GB ', '512gb', 'Xiaomi', 'Ceramic black', 20, 1,1), 

('Xiaomi 13 Pro',  '1299', '6.73" WQHD+ AMOLED', '229 g', 'IP68', 'MIUI 14,  android 13', 'Snapdragon® 8 Gen 2 4nm chip Up to 3.2GH', '4820 mAh ', '12 GB ', '256gb', 'Xiaomi', 'Ceramic white', 20, 1,1), 
('Xiaomi 13 Pro',  '1399', '6.73" WQHD+ AMOLED', '229 g', 'IP68', 'MIUI 14,  android 13', 'Snapdragon® 8 Gen 2 4nm chip Up to 3.2GH', '4820 mAh', '12 GB ', '512gb', 'Xiaomi', 'Ceramic white', 20, 1,1), 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
('Xiaomi 12T',  '395', '6.67” AMOLED', '202 g', '', 'MIUI 13,  Android 12', '6.67” AMOLED', '5000 mAh', '8 GB ', '128gb', 'Xiaomi', ' Black', 20, 1,1), 
('Xiaomi 12T',  '425', '6.67” AMOLED', '202 g', '', 'MIUI 13,  Android 12', '6.67” AMOLED', '5000 mAh', '8 GB ', '256gb', 'Xiaomi', ' Black', 20, 1,1), 

('Xiaomi 12T',  '395', '6.67” AMOLED', '202 g', '', 'MIUI 13,  Android 12', '6.67” AMOLED', '5000 mAh ', '8 GB ', '128gb', 'Xiaomi', 'Silver', 20, 1,1), 
('Xiaomi 12T',  '425', '6.67” AMOLED', '202 g', '', 'MIUI 13,  Android 12', '6.67” AMOLED', '5000 mAh', '8 GB ', '256gb', 'Xiaomi', 'Silver ', 20, 1,1), 

('Xiaomi 12T',  '395', '6.67” AMOLED', '202 g', '', 'MIUI 13,  Android 12', '6.67” AMOLED', '5000 mAh ', '8 GB ', '128gb', 'Xiaomi', 'Blue', 20, 1,1), 
('Xiaomi 12T',  '425', '6.67” AMOLED', '202 g', '', 'MIUI 13,  Android 12', '6.67” AMOLED', '5000 mAh', '8 GB ', '256gb', 'Xiaomi', 'Blue', 20, 1,1), 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
('Oppo Find N2 Flip',  '899.99', '6.8" FHD+', '191 g', '', 'Android 13', '8 cores with a maximum clock rate of 3.2GHz', '3110 mAh', '8 GB ', '256gb', 'Oppo', 'Black ', 20, 1,1), 
('Oppo Find N2 Flip',  '899.99', '6.8" FHD+', '191 g', '', 'Android 13', '8 cores with a maximum clock rate of 3.2GHz', '3110 mAh', '8 GB ', '256gb', 'Oppo', 'While', 20, 1,1), 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
('Oppo Find X5',  '799.99', '6.55" FHD+', '196 g', '', 'Android 12', 'MariSilicon X Imaging NPU', '3110 mAh', '8 GB ', '256gb', 'Oppo', 'Black ', 20, 1,1), 
('Oppo Find X5',  '799.99', '6.55" FHD+', '196 g', '', 'Android 12', 'MariSilicon X Imaging NPU', '3110 mAh', '8 GB ', '256gb', 'Oppo', 'While', 20, 1,1), 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
('Oppo Reno8',  '319.99', '6.4" FHD', '179 g', '', 'Android 12', 'MediaTek Dimensity 1300 8 cores', '4500 mAh', '8 GB ', '256gb', 'Oppo', 'Black ', 20, 1,1), 
('Oppo Reno8',  '319.99', '6.4" FHD', '179 g', '', 'Android 12', 'MediaTek Dimensity 1300 8 cores', '4500 mAh', '8 GB ', '256gb', 'Oppo', 'While', 20, 1,1)

