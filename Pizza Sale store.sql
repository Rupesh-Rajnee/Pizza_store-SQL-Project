Create database PizzaStore;

use pizzaStore;

select * from pizza_sales;

update Pizza_sales
set order_date = Case
when order_date like '%-%' Then date_format(str_to_date(order_date,'%d-%m-%Y'),'%Y-%m-%d')
else null
end;

alter table pizza_sales
modify column order_date date;

update Pizza_sales
set order_time = str_to_date(order_time,'%H:%i:%s');

alter table pizza_sales
modify column order_time time;


select sum(total_price) as Total_revenue from pizza_sales;

select sum(total_price) /Count(distinct order_id) as Avg_Order_value from pizza_sales; 

select sum(quantity) as Total_pizza_sold from Pizza_sales;

Select count(distinct order_id) as Total_orders from pizza_sales;

select sum(quantity) / count(distinct order_id) as AVG_pizza_perOrder from pizza_sales; 

select dayname(order_date) As Day_name,Count(distinct order_id) as Total_orders
from pizza_sales
group by 1 ;


select hour(order_time) as 'Time', count(distinct order_id) as Total_orders
from pizza_Sales
group by 1
order by 1;

select * from pizza_sales;

select Pizza_category, round(sum(total_price),2) as Total_sales
from pizza_sales
group by 1;

select Pizza_size, round(sum(total_price),2) as Total_sales
from pizza_sales
group by 1;

select pizza_category,sum(quantity) as Pizza_sold
from pizza_sales
group by 1;

select Pizza_name, count(pizza_name) as Pizza_sold
from pizza_sales
group by 1
order by 2 desc
limit 5;


Select Pizza_name, count(pizza_name) as Pizza_sold
from pizza_sales
group by 1
order by 2 
limit 5;