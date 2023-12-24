 with rank as(select *,
 row_number() over(partition by customer_id order by order_date) as order_rank
 from sales)
 
 select r.customer_id, m.product_name from rank as r
 inner join menu as m
 on r.product_id= m.product_id
 where order_rank = 1