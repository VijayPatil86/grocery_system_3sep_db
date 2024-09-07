insert into CATEGORY (CATEGORY_NAME) values ('Dairy');
insert into CATEGORY (CATEGORY_NAME) values ('Bakery');

insert into DAIRY_PRODUCT(DAIRY_PRODUCT_NAME, CATEGORY_ID) values ('Milk', 1);
insert into DAIRY_PRODUCT(DAIRY_PRODUCT_NAME, CATEGORY_ID) values ('Buttermilk', 1);
insert into DAIRY_PRODUCT(DAIRY_PRODUCT_NAME, CATEGORY_ID) values ('Curd', 1);

insert into BAKERY_PRODUCT(BAKERY_PRODUCT_NAME, CATEGORY_ID) values ('Biscuit', 2);
insert into BAKERY_PRODUCT(BAKERY_PRODUCT_NAME, CATEGORY_ID) values ('Cake', 2);
insert into BAKERY_PRODUCT(BAKERY_PRODUCT_NAME, CATEGORY_ID) values ('Bread', 2);

insert into MILK_BRAND(MILK_BRAND_NAME, PACKAGING, DAIRY_PRODUCT_ID) values ('Warana', '250 ML', 1);
insert into MILK_BRAND(MILK_BRAND_NAME, PACKAGING, DAIRY_PRODUCT_ID) values ('Warana', '500 ML', 1);
insert into MILK_BRAND(MILK_BRAND_NAME, PACKAGING, DAIRY_PRODUCT_ID) values ('Warana', '1000 ML', 1);
insert into MILK_BRAND(MILK_BRAND_NAME, PACKAGING, DAIRY_PRODUCT_ID) values ('Hutatma', '250 ML', 1);
insert into MILK_BRAND(MILK_BRAND_NAME, PACKAGING, DAIRY_PRODUCT_ID) values ('Hutatma', '500 ML', 1);
insert into MILK_BRAND(MILK_BRAND_NAME, PACKAGING, DAIRY_PRODUCT_ID) values ('Hutatma', '1000 ML', 1);
