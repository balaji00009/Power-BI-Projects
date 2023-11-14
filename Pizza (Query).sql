select * from pizza_sales;

select sum(total_price) as total_revenue from pizza_sales;

select sum(total_price)/ count(distinct order_id) as avg_order_value from pizza_sales;

select sum(quantity) as Total_pizza_sold from pizza_sales;

select count(distinct order_id) as Total_orders from pizza_sales;

select cast(cast(sum(quantity) as decimal(10,2))/
cast(count( distinct order_id) as decimal(10,2)) as decimal(10,2)) as Average_pizzas_per_order from pizza_sales;

select DATENAME(DW,order_date) as Day_name,count(distinct order_id) as Total_orders from pizza_sales 
group by DATENAME(DW,order_date);

select DATENAME(MONTH,order_date) as month_name,count(distinct order_id) as Total_orders from pizza_sales
group by DATENAME(MONTH,order_date) order by 2 desc;

select pizza_category,cast(sum(total_price) as decimal(10,2)) as total_sales,
cast(sum(total_price)*100/(select sum(total_price) from pizza_sales) as decimal(10,2)) as PCT from pizza_sales 
group by pizza_category;

select pizza_size,cast(sum(total_price) as decimal(10,2)) as Total_sales,
cast(sum(total_price)*100/(select sum(total_price) from pizza_sales) as decimal(10,2)) as PCT from pizza_sales 
group by pizza_size order by 3 desc;

select top 5 pizza_name,sum(total_price)as Total_sales from pizza_sales  group by pizza_name order by 2 desc;

select top 5 pizza_name, cast(sum(total_price) as decimal(10,2))as Total_sales from pizza_sales  group by pizza_name order by 2 asc;