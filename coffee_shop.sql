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

delete from "products" where "product_id" between 1 and 4;
alter table "products" add column "product_desc" text;

insert into "products" ("product_name","price","product_desc")
values  ('(Single Origin) Kopi Arabika Temanggung', 19500.00, 'Kopi Arabika pilihan terbaik dari daerah Temanggung.'),
    ('Espresso Single Shot', 22000.00, 'Espresso klasik dengan rasa yang kuat.'),
    ('Cappuccino', 23500.00, 'Minuman kopi dengan kombinasi espresso, susu, dan busa susu.'),
    ('Caffe Latte', 21500.00, 'Kopi dengan susu panas dan sedikit foam.'),
    ('(Single Origin) Kopi Robusta Lampung', 17500.00, 'Kopi Robusta berkualitas dari daerah Lampung.'),
    ('Mocha', 24500.00, 'Perpaduan antara espresso, susu, dan cokelat.'),
    ('Cold Brew', 19000.00, 'Kopi dingin dengan rasa yang lembut dan kaya.'),
    ('(Single Origin) Kopi Gayo Aceh', 20000.00, 'Kopi Arabika organik terbaik dari Aceh.'),
    ('Americano', 18500.00, 'Espresso dengan air panas, sederhana dan kuat.'),
    ('Iced Latte', 22500.00, 'Minuman kopi dingin dengan susu.'),
    ('(Single Origin) Kopi Flores', 21000.00, 'Kopi khas dari Pulau Flores dengan cita rasa khas.'),
    ('Flat White', 23000.00, 'Kopi Australia yang lembut dengan rasa susu yang kaya.'),
    ('(Single Origin) Kopi Toraja', 24000.00, 'Kopi Toraja premium dari Sulawesi.'),
    ('Affogato', 25000.00, 'Espresso yang disiramkan ke atas es krim vanila.'),
    ('(Single Origin) Kopi Luwak', 24500.00, 'Kopi khas Indonesia yang unik, dikumpulkan dari fermentasi di dalam kotoran musang.');

insert into "products" ("product_name","price","product_desc")
values ('Wasabi Almonds', 16000.00, 'Kacang almond dengan rasa wasabi yang pedas dan gurih.'),
    ('Seaweed Popcorn', 17000.00, 'Popcorn dengan rasa rumput laut yang unik.'),
    ('Sriracha Rice Crisps', 18000.00, 'Keripik beras dengan rasa pedas Sriracha.'),
    ('Matcha Green Tea Cookies', 19000.00, 'Kue kering dengan rasa matcha yang lezat.'),
    ('Salted Caramel Pecans', 20000.00, 'Kenari dengan karamel garam yang manis dan gurih.');

insert into "categories" ("category_name","description")
values ('snack','makanan ringan sebagai teman minum kopi'),
	('beverage','minuman barbasis kopi dan lainnya');


alter table "promo" rename column "promo_kode" to "promo_code";

alter table "products" add column "category_id" int;

insert into "productCategories" ("product_id","category_id")
values (5,2),
	(6,2),
	(7,2),
	(8,2),
	(9,2),
	(10,2),
	(11,2),
	(12,2),
	(13,2),
	(14,2),
	(15,2),
	(16,2),
	(17,2),
	(18,2),
	(19,2),
	(20,1),
	(21,1),
	(22,1),
	(23,1),
	(24,1);

delete from "productCategories" where "id" between 1 and 7;

insert into "categories" ("category_name","description")
values ('main course','makanan utama yang padat komposisinya');

select "p"."product_name", "p"."price", "c"."category_name" as "category"
from "products" "p"
join "productCategories" "pc" on "pc"."product_id" = "p"."product_id"
right join "categories" "c" on "c"."category_id" = "pc"."category_id";

delete from "orders" where "product_id" = 1;
alter table "orders" add foreign key ("product_id") references "products" ("product_id");
	