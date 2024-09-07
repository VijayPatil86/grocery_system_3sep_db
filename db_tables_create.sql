create table CATEGORY (
	CATEGORY_ID smallserial primary key,
	CATEGORY_NAME varchar(50) not null unique,
	CATEGORY_AVAILABLE char(1) not null check (CATEGORY_AVAILABLE in ('Y', 'N')) default 'Y'
);

create table DAIRY_PRODUCT (
	DAIRY_PRODUCT_ID smallserial primary key,
	DAIRY_PRODUCT_NAME varchar(50) not null unique,
	DAIRY_PRODUCT_AVAILABLE char(1) check (DAIRY_PRODUCT_AVAILABLE in ('Y', 'N')) default 'Y',
	CATEGORY_ID int,
	constraint "fk_CATEGORY_ID" foreign key (CATEGORY_ID) references CATEGORY(CATEGORY_ID) on delete cascade
);

create table BAKERY_PRODUCT (
	BAKERY_PRODUCT_ID smallserial primary key,
	BAKERY_PRODUCT_NAME varchar(50) not null unique,
	BAKERY_PRODUCT_AVAILABLE char(1) check (BAKERY_PRODUCT_AVAILABLE in ('Y', 'N')) default 'Y',
	CATEGORY_ID int,
	constraint "fk_CATEGORY_ID" foreign key (CATEGORY_ID) references CATEGORY(CATEGORY_ID) on delete cascade
);

create table MILK_BRAND(
	MILK_BRAND_ID smallserial primary key,
	MILK_BRAND_NAME varchar(50) not null,
	PACKAGING varchar(50) not null,
	MILK_BRAND_AVAILABLE char(1) not null check(MILK_BRAND_AVAILABLE in ('Y', 'N')) default 'Y',
	DAIRY_PRODUCT_ID int not null,
	constraint "fk_DAIRY_PRODUCT_ID" FOREIGN KEY (DAIRY_PRODUCT_ID) REFERENCES DAIRY_PRODUCT(DAIRY_PRODUCT_ID) on delete cascade
);
