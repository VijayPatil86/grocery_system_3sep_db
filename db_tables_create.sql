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
