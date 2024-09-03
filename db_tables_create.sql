create table CATEGORY(
	CATEGORY_ID  smallserial primary key,
	CATEGORY_NAME varchar(50) not null,
	CATEGORY_VISIBILE  varchar(1) check (CATEGORY_VISIBILE in ('Y', 'N')) default 'Y'
);