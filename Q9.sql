WITH CTE AS(
SELECT S.CUSTOMER_ID, M.PRODUCT_NAME, M.PRICE FROM SALES AS s
INNER JOIN MENU AS M
ON M.PRODUCT_ID =S.PRODUCT_ID),

cte2 as(select customer_id,product_name,
sum(price) over(partition by product_name order by customer_id desc) as TOTAL_PRICE
from cte
group by customer_id,product_name,price
order by customer_id)

SELECT *,
CASE
WHEN PRODUCT_NAME = 'SUSHI' THEN TOTAL_PRICE*20
ELSE TOTAL_PRICE*10
END AS POINTS
FROM CTE2





