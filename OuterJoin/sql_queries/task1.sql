SELECT 
pc.name AS category, 
pt.title AS product
FROM product_category pc
JOIN product_title AS pt 
ON pc.id = pt.product_category_id
INNER JOIN product AS p 
ON pt.id = p.product_title_id
LEFT JOIN order_details AS od 
ON p.id = od.product_id
WHERE od.id IS NULL
ORDER BY p.id ASC;