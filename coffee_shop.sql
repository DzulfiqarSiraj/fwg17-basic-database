create table if not exists "products"(
	"product_id" serial primary key,
	"product_name" varchar(50) not null,
	"price" int not null
);

create table if not exists "promo"(
	"promo_id" serial primary key,
	"promo_name" varchar(50) not null,
	"discount" int not null,
	"order_min" int not null,
	"discount_max" int not null
);

create table if not exists "order"(
	"order_id" serial primary key,
	"user_id" int not null,
	"product_id" int not null,
	"qty" int not null,
	"order_date" timestamp default now()
);

create table if not exists "user"(
	"user_id" serial primary key,
	"user_name" varchar(50) not null,
	"user_email" varchar(50) not null,
	"user_role" varchar(50) not null,
	"user_address" varchar(255) not null
);

alter table "products"
	add "supplier_name" varchar(50);

alter table "products" alter column "supplier_name" set not null;

alter table "products"
	add "product_category" varchar(50) not null;

alter table "products"
	drop column "supplier_name";

alter table "promo"
alter column "discount" set data type float

insert into "products" ("product_name", "price","product_category")
values 	('V60 Arabica Gayo',18000,'beverage'),
		('Vietnam Drip Robusta Temanggung', 15000,'beverage'),
		('Merapi Luwak Coffee',25000,'beverage'),
		('Sweet Caramel Coffee Brownies', 25000,'snack');
		
insert into "promo" ("promo_name","discount","order_min","discount_max")
values	('FAZZFOOD50',0.5,50000,50000),
		('DITRAKTIR60',0.6,25000,30000);
	
	
insert into "user" ("user_name","user_email","user_role","user_address")
values	('John Doe','johndoe@fazzmail.com','admin','Kenanga Street No.52, South Jakarta'),
		('Jane Doe','janedoe@fazzmail.com','cashier','Bangka Street No.23, South Tangerang'),
		('Yamada Kawaguchi','kawaguchiyamada@gmail.com','customer','Taniguchi Street No.44, Okinawa Perfecture');
	
insert into "order" ("user_id","product_id","qty")
values (3,1,1);
	
	
	
	
	