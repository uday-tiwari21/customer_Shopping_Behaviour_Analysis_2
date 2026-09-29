select * from  customer;

--1
select sum(purchase_amount) as total_purchase from customer
--2
SELECT ROUND(AVG(purchase_amount), 2) AS avg_purchase_value
FROM customer;

SELECT ROUND(
    SUM(purchase_amount) / COUNT(DISTINCT customer_id),
    2
) AS avg_purchase_per_customer
FROM customer;

--3
select category ,sum(purchase_amount) as total_purchase from customer
group by category order by total_purchase desc

select item_purchased  ,sum(purchase_amount) as total_purchase from customer
group by item_purchased order by total_purchase desc 

select location ,sum(purchase_amount) as total_purchase from customer
group by location order by total_purchase desc
--4
select item_purchased,count(item_purchased) as number_of_items ,sum(purchase_amount) as total_purchase from customer
group by item_purchased order by total_purchase desc

select category ,count(category) as total_items ,sum(purchase_amount) as total_purchase from customer
group by category order by total_purchase desc

--2 customer segment & investment

--1
select age_group , sum(purchase_amount) as total_purchase from customer
group by age_group order by total_purchase



--2
select age_group,count(age_group) as total_customer,sum(purchase_amount) as total_spend_amount, avg(purchase_amount) as avg_amount from customer
group by age_group

--3

select gender,sum(purchase_amount) as total_purchase from customer
group by gender;
--4
select subscription_status,sum(purchase_amount) as total_purchase from customer group by subscription_status
select subscription_status,sum(previous_purchases) as total_previous_purchases from customer group by subscription_status

--5
--6

--3 how can the company increase sales

--1
--2
--3 already done
--4
select location,count(customer_id) as total_customer, ROUND(AVG(purchase_amount), 2) AS avg_purchase_value from customer
group by location order by total_customer desc,avg_purchase_value ASC
--5
select location,count(customer_id) as total_customer, ROUND(AVG(purchase_amount), 2) AS avg_purchase_value from customer
group by location order by avg_purchase_value desc,total_customer asc
--6 use gpt 

4-- product and category
1--
select item_purchased, sum(purchase_amount) as total_amount from customer
group by item_purchased order by total_amount desc

2--
select category ,round(avg(purchase_amount),2) as avg_purchase_amount from customer
group by category
order by avg_purchase_amount desc

3--
SELECT item_purchased,
       SUM(purchase_amount) AS total_sales
FROM customer
GROUP BY item_purchased having avg(review_rating)>=3.5 and
 SUM(purchase_amount) > (
    SELECT AVG(total_sales)
    FROM (
        SELECT SUM(purchase_amount) AS total_sales
        FROM customer
        GROUP BY item_purchased
    ) AS t
);
--5

select  color, size,count(item_purchased) as total_item from customer 
group by size,color order by count(item_purchased ) desc


--5. discount and promotion

1--
select discount_applied,round(avg(purchase_amount),2) as avg_purchase from customer
group by discount_applied

2--
select discount_applied,count(item_purchased) as total_item from customer
group by discount_applied

3--
select age_group,  count(age_group ) as total_customer from customer
 where  discount_applied='Yes' group by age_group order by total_customer desc
 
4--
5--



select customer_id,purchase_amount,discount_applied from customer
where discount_applied='Yes' and 
purchase_amount>(select avg(purchase_amount) as average_amount from customer)

select avg(review_rating),item_purchased   from customer 
group by item_purchased  order by avg(review_rating) desc limit 5


select shipping_type,avg(purchase_amount) from customer
where shipping_type = 'Express' or shipping_type='Standard'
group by shipping_type ;

select subscription_statu

select item_purchased,
round(100* sum(case when discount_app))


SELECT session_user;

