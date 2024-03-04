SELECT  p.surname, p.name,
IFNULL(ROUND (SUM(od.price_with_discount * od.product_amount),2),0) as sum
FROM person p
INNER JOIN customer c 
ON p.id = c.person_id
LEFT JOIN customer_order co 
ON c.person_id = co.customer_id
LEFT JOIN order_details AS od
ON od.customer_order_id = co.id
WHERE c.person_id IS NOT NULL
GROUP BY p.surname, p.name

UNION

SELECT p.surname, p.name,   
IFNULL(ROUND (SUM(od.price_with_discount * od.product_amount),2),0) AS sum
FROM order_details AS od
INNER JOIN customer_order AS co
ON od.customer_order_id = co.id
LEFT JOIN customer AS c
ON co.customer_id = c.person_id
LEFT JOIN person AS p
ON c.person_id = p.id
GROUP BY co.customer_id
ORDER BY sum