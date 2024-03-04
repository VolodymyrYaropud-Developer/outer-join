SELECT 
p.surname,
p.name,
p.birth_date
FROM person AS p
JOIN customer AS c
ON  p.id = c.person_id
LEFT JOIN customer_order as co
ON c.person_id = co.customer_id
WHERE co.customer_id IS NULL
order by p.surname;