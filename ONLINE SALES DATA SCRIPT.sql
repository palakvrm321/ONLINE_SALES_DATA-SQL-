use ecommerce;
select * from online_sales_data;
-- 1.Write a query to calculate total monthly revenue and distinct transaction volume for each month in 2024 using EXTRACT(YEAR/MONTH) on Date
select year(date) as 'year' ,month(date) as 'months',sum(`total revenue`) as 'sales', count(distinct `transaction id`)  as 'monthly volume'from online_sales_data where year(date)=2024 
group by year,months
order by year,months;

-- 2.Write a query to calculate monthly revenue grouped by Product Category, ordered by year and month.
select year(date) as 'year', month(date) as 'month', sum(`total revenue`) as 'revenue', `product category` from online_sales_data  group by `product category`,month,year 
order by year,month;

-- 3.Write a query to find the top 5 products with the highest total revenue in 2024. Use SUM(Total_Revenue) and ORDER BY.
select `product name`, sum(`total revenue`) as 'sales' from online_sales_data  where year(date)=2024  group by `product name` order by sales desc limit 5;

-- 4.Write a query to calculate number of distinct transactions per region per month in 2024.
select year(date) as 'year', month(date) as 'month' , region , count(distinct `transaction id`) as 'distinct_transaction' from online_sales_data where year(date)=2024
 group by year,month,region 
 order by year,month, distinct_transaction desc;

-- 5.Write a query to calculate the average Unit Price for each Product Category per month in 2024.
select `product name` , month(date) as 'months' ,`product category`,avg(`unit price`) as 'average_price' from online_sales_data
where year(date) =2024
group by `product category`,months,`product name`;

-- 6.Write a query to count distinct transactions per Payment Method per month in 2024.
SELECT year(date) AS 'year', month(date) AS 'month', `Payment Method`, COUNT(DISTINCT `Transaction ID`) AS payment_count FROM online_sales_data
WHERE year(date)=2024 GROUP BY year, month, `Payment method` 
ORDER BY year, month, payment_count DESC;

-- 7.Write a query to calculate quarterly revenue totals by extracting the quarter from Date and grouping by year/quarter
select year(date) as 'year',quarter(date) as 'quarter',sum(`total revenue`) as 'revenue' from online_sales_data group by year,quarter ;


