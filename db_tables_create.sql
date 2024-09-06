create table CATEGORY (
	CATEGORY_ID smallserial primary key,
	CATEGORY_NAME varchar(50) not null unique,
	CATEGORY_AVAILABLE char(1) not null check (CATEGORY_AVAILABLE in ('Y', 'N')) default 'Y'
);
