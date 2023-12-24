select customer_id, count(order_date) as No_of_visit_days from sales
group by customer_id
order by No_of_visit_days Desc