with tb as(SELECT m.customer_id, s.order_date, s.product_id FROM MEMBERS as m	
INNER JOIN SALES as s
ON m.customer_id= s.customer_id
where m.join_date > s.order_date),
cte as(select tb.customer_id,mn.product_name, tb.order_date,
row_number() over(partition by customer_id order by order_date desc) as rk
from tb
inner join menu as mn
on mn.product_id = tb.product_id)

select * from cte
where rk = 1




