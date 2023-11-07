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

alter table "order"
	add "promo_id" int;

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

alter table "order" rename to "orders";
alter table "user" rename to "users";

alter table "products" add column "createdAt" timestamp default now();
alter table "products" add column "updatedAt" timestamp;

alter table "products" drop column "product_category";

alter table "products" alter column "price" set data type numeric(10,2);


create table if not exists "categories"(
	"category_id" serial primary key,
	"category_name" varchar(30) not null,
	"description" text,
	"createdAt" timestamp default now(),
	"updatedAt" timestamp
);

create table if not exists "productCategories"(
	"id" serial primary key,
	"product_id" int,
	"category_id" int,
	"createdAt" timestamp default now(),
	"updatedAt" timestamp
);

alter table "categories" add column "promo_id" int references "promo" ("promo_id");
alter table "productCategories" add foreign key ("product_id") references "products" ("product_id");
alter table "productCategories" add foreign key ("category_id") references "categories" ("category_id");

alter table "promo" rename column "promo_name" to "promo_kode";
alter table "promo" add column "createdAt" timestamp default now(), add column "updatedAt" timestamp;

alter table "promo" rename column "discount" to "percentage";

update "promo" set "percentage" = 0.5 where "promo_id" = 1;
update "promo" set "percentage" = 0.6 where "promo_id" = 2;
alter table "promo" alter column "order_min" set data type numeric(10,2);
alter table "promo" alter column "discount_max" set data type numeric(10,2);
alter table "promo" alter column "order_min" set not null;
alter table "promo" alter column "discount_max" set not null;
	