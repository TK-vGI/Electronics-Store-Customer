/*
START STAGE 3 Query
*/
SELECT
    p.maker,
    SUM(l.price) AS total_price
FROM Product p
JOIN Laptop l ON p.model = l.model
WHERE p.type = 'Laptop'
GROUP BY p.maker
ORDER BY total_price ASC;

/*
END STAGE 3 Query
*/

/*
Other Solution:
--
SELECT maker,
	   SUM(Laptop.price) AS total_price
FROM Product
INNER JOIN Laptop
		ON Product.model = Laptop.model
GROUP BY maker
ORDER BY total_price;
 */