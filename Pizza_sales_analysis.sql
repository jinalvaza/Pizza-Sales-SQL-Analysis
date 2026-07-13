--Pizza Sales Analysis
--Basic:
--Retrieve the total number of orders placed.
select count(order_id) as total_orders
from orders;


--Calculate the total revenue generated from pizza sales.
select * from pizza;
select * from order_details;

select sum(od.quantity * p.price) as total_revenue
from pizza p
join order_details od on p.pizza_id = od.pizza_id;


--Identify the highest-priced pizza.
--1st method
select max(price) as max_price from pizza;

--2nd method
select * from pizza order by price desc limit 1;

--3rd method
select * from pizza 
where price = (
      select max(price) from pizza
);

--4th method
select pt.name, p.price
from pizza_type pt 
join pizza p on pt.pizza_type_id = p.pizza_type_id 
order by p.price desc limit 1;


--Identify the most common pizza size ordered.
select p.size, sum(od.quantity) as total_pizza_sold
from pizza p
join order_details od on p.pizza_id = od.pizza_id
group by p.size
order by total_pizza_sold desc limit 1;


--List the top 5 most ordered pizza types along with their quantities.
--if we join pizza table and order_details table then we get only pizza_type_id
select p.pizza_type_id, sum(od.quantity) as total_pizza_sold
from pizza p
join order_details od on p.pizza_id = od.pizza_id
group by p.pizza_type_id
order by total_pizza_sold desc limit 5;


--if we join pizza table and order_details table and pizza_type table then we get pizza name
select pt.name, sum(od.quantity) as total_pizza_sold
from pizza p
join pizza_type pt on p.pizza_type_id = pt.pizza_type_id 
join order_details od on p.pizza_id = od.pizza_id
group by pt.name
order by total_pizza_sold desc limit 5;




--Intermediate:
--Join the necessary tables to find the total quantity of each pizza category ordered.
select * from pizza;
select * from pizza_type;
select * from order_details;
select * from orders;

select pt.category, sum(od.quantity) as total_quantity
from pizza p
join pizza_type pt on p.pizza_type_id = pt.pizza_type_id 
join order_details od on p.pizza_id = od.pizza_id 
group by pt.category;


--Determine the distribution of orders by hour of the day.
select extract(hour from time) as order_hour , count(order_id) as order_hour
from orders
group by extract(hour from time) 
order by  extract(hour from time)  desc;

--Join relevant tables to find the category-wise distribution of pizzas.
select category, count(pizza_type_id) from pizza_type 
group by category;


--Group the orders by date and calculate the average number of pizzas ordered per day.
select round(avg(total_pizzas_sold),2) as avg_pizzas_sold_per_day 
from (
     select o.date, sum(od.quantity) as total_pizzas_sold
     from orders o
     join order_details od on o.order_id = od.order_id 
     group by o.date
     order by o.date asc
) as daily_sales;

--Determine the top 3 most ordered pizza types based on revenue.
select pt.name, sum(p.price * od.quantity) as revenue
from pizza p
join order_details od on p.pizza_id = od.pizza_id
join pizza_type pt on p.pizza_type_id = pt.pizza_type_id
group by pt.name 
order by revenue desc limit 3;



--Advanced:
--Calculate the percentage contribution of each pizza type to total revenue.

select pt.category, round(sum(p.price * od.quantity)/(select sum(p.price * od.quantity) as revenue
from pizza p
join order_details od on p.pizza_id = od.pizza_id) * 100,2)  as percentage_contri_by_each_category
from pizza p
join order_details od on p.pizza_id = od.pizza_id 
join pizza_type pt on p.pizza_type_id = pt.pizza_type_id 
group by pt.category
order by percentage_contri_by_each_category desc;

--total revenue 
select sum(p.price * od.quantity) as revenue
from pizza p
join order_details od on p.pizza_id = od.pizza_id;


--Analyze the cumulative revenue generated over time.
select date, sum(revenue) over(order by date) as cumulative_revenue from
(select o.date, sum(p.price * od.quantity) as revenue
from pizza p
join order_details od on p.pizza_id = od.pizza_id 
join orders o on o.order_id = od.order_id 
group by o.date) as sales;


--Determine the top 3 most ordered pizza types based on revenue for each pizza category.
select category, name, revenue, rank from 
(select category, name, revenue, rank() over(partition by category order by revenue desc ) as rank from
(select pt.category, pt.name, sum(p.price * od.quantity) as revenue
from pizza p
join order_details od on p.pizza_id = od.pizza_id 
join pizza_type pt on p.pizza_type_id = pt.pizza_type_id 
group by pt.category, pt.name) as revenu_category) as rn
where rank <= 3;



