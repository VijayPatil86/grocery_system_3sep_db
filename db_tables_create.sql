create table CATEGORY (
	CATEGORY_ID smallserial primary key,
	CATEGORY_NAME varchar(50) not null unique,
	CATEGORY_AVAILABLE char(1) not null check (CATEGORY_AVAILABLE in ('Y', 'N')) default 'Y'
);

create table DAIRY_PRODUCT (
	DAIRY_PRODUCT_ID smallserial primary key,
	DAIRY_PRODUCT_NAME varchar(50) not null unique,
	DAIRY_PRODUCT_AVAILABLE char(1) check (DAIRY_PRODUCT_AVAILABLE in ('Y', 'N')) default 'Y',
	CATEGORY_ID int not null,
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

create table MILK_BRAND_BUY_DETAILS(
	DETAIL_ID smallserial primary key,
	MILK_BRAND_ID int not null,
	MILK_BRAND_BUY_PRICE numeric(5, 2) not null,
	MILK_BRAND_BUY_QUANTITY int not null,
	MILK_BRAND_TOTAL_BUY_PRICE numeric(6, 2),
	BUY_TIMESTAMP timestamp,
	constraint "fk_MILK_BRAND_ID" foreign key(MILK_BRAND_ID) references MILK_BRAND(MILK_BRAND_ID) on delete cascade
);

create table MILK_BRAND_SELL_DETAILS(
	DETAIL_ID smallserial primary key,
	MILK_BRAND_ID int not null,
	MILK_BRAND_SELL_PRICE numeric(5, 2) not null,
	MILK_BRAND_SELL_QUANTITY int not null,
	MILK_BRAND_TOTAL_SELL_PRICE numeric(6, 2),
	SELL_TIMESTAMP timestamp,
	constraint "fk_MILK_BRAND_ID" foreign key(MILK_BRAND_ID) references MILK_BRAND(MILK_BRAND_ID) on delete cascade
);

alter table MILK_BRAND_SELL_DETAILS add column ORDER_NUMBER varchar(30);
alter table MILK_BRAND_SELL_DETAILS alter column ORDER_NUMBER set not null;

create table UPI_DETAILS (
	UPI_RECORD_ID smallserial primary key,
	UPI_ID varchar(30) not null unique
);

create table MILK_BRAND_INVENTORY (
	INVENTORY_ID smallserial primary key,
	MILK_BRAND_ID int not null,
	CURRENT_QUANTITY int not null,
	MINIMUM_QUANTITY int not null,
	CURRENT_BUY_PRICE numeric(5, 2) not null,
	CURRENT_SELL_PRICE numeric(5, 2) not null,
	OUT_OF_STOCK char(1) not null default 'N' check (OUT_OF_STOCK in ('Y', 'N')),
	constraint "fk_MILK_BRAND_ID" foreign key(MILK_BRAND_ID) references MILK_BRAND(MILK_BRAND_ID) on delete cascade
);

create table BANK_ACCOUNT_INFO (
	ACCOUNT_ID smallserial primary key,
	BUSINESS_NAME varchar(50) not null,
	BANK_NAME varchar(50) not null,
	BRANCH_NAME varchar(50) not null,
	ACCOUNT_NUMBER varchar(50) not null unique,
	IFSC_CODE varchar(15) not null,
	BALANCE numeric(10, 2)
);

create table PAYMENT_TRANSACTION(
	TRANSACTION_ID smallserial primary key,
	ORDER_NUMBER varchar(30) not null,
	PAYMENT_METHOD varchar(30) not null,
	PAYMENT_STATUS varchar(30) not null,
	CUSTOMER_BANK_TXN_ID varchar(30),
	CREATED_AT timestamp
);

alter table PAYMENT_TRANSACTION add column UPI_ADDRESS varchar(30) not null;
alter table PAYMENT_TRANSACTION add column REMARK varchar(30);
alter table PAYMENT_TRANSACTION add column PAYMENT_AMOUNT decimal(8, 2) not null;

/*create table BAKERY_PRODUCT (
	BAKERY_PRODUCT_ID smallserial primary key,
	BAKERY_PRODUCT_NAME varchar(50) not null unique,
	BAKERY_PRODUCT_AVAILABLE char(1) check (BAKERY_PRODUCT_AVAILABLE in ('Y', 'N')) default 'Y',
	CATEGORY_ID int,
	constraint "fk_CATEGORY_ID" foreign key (CATEGORY_ID) references CATEGORY(CATEGORY_ID) on delete cascade
);*/

CREATE DATABASE UPI_NPCL
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_India.1252'
    LC_CTYPE = 'English_India.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

create table UPI_NPCL_TRANSACTIONS(
	TRANSACTION_ID smallserial primary key,
	UPI_ADDRESS varchar(30) not null,
	AMOUNT decimal(8, 2) not null,
	PAYER_TRANSACTION_ID int not null,
	PAYER_TRANSACTION_TIMESTAMP timestamp not null
);

CREATE DATABASE BANK_ICICI
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_India.1252'
    LC_CTYPE = 'English_India.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
