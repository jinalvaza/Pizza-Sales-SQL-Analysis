create table pizza(
       pizza_id varchar(20),
       pizza_type_id varchar(30),
       size varchar(5),
       price numeric(5,2)
);

select * from pizza;

create table pizza_type(
       pizza_type_id varchar(20),
       name varchar(50),
       category varchar(10),
       ingrediants varchar(100)
);

select * from pizza_type;

create table orders(
       order_id int,
       date date,
       time time
);

select * from orders;

create table order_details(
       order_details_id int,
       order_id int,
       pizza_id int,
       quantity int
);

alter table order_details
alter column pizza_id type varchar(20);

select * from order_details;
