/*
START STAGE 5 Query
*/
SELECT
  l.model,
  p.maker,
  l.price,
  (l.price - (SELECT MAX(price) FROM PC)) AS price_difference_max_pc,
  (l.price - (SELECT AVG(price) FROM Laptop)) AS price_difference_avg_laptop
FROM Laptop l
JOIN Product p ON p.model = l.model
WHERE
    l.price > (SELECT MAX(price) FROM PC)
ORDER BY l.price DESC;

/*
END STAGE 5 Query
*/


/*
Other Solution:
--
WITH higher_pc_price AS (
	SELECT MAX(price)
	FROM PC
)

SELECT Laptop.model,
	   Product.maker,
	   price,
	   price - (SELECT * FROM higher_pc_price) AS price_difference_max_pc,
	   price - (SELECT ROUND(AVG(price), 2) FROM Laptop) AS price_difference_avg_laptop
FROM Laptop
INNER JOIN Product
		ON Laptop.model = Product.model
WHERE price > (SELECT * FROM higher_pc_price);
 */

/*
Other Solution:
--
WITH pc_stats AS (
  SELECT
    MAX(price) AS max_pc_price,
    AVG(price) AS avg_pc_price
  FROM PC
)
SELECT
  p.model,
  p.maker,
  l.price,
  l.price - pc_stats.max_pc_price AS price_difference_max_pc,
  l.price - pc_stats.avg_pc_price AS price_difference_avg_laptop
FROM Product AS p
JOIN Laptop AS l
  ON l.model = p.model
CROSS JOIN pc_stats
WHERE
  l.price > pc_stats.max_pc_price;
 */

/*
Other Solution:
--
SELECT
    Product.model,
    Product.maker,
    Laptop.price,
    Laptop.price - (SELECT MAX(price) FROM PC) AS price_difference_max_pc,
    Laptop.price - (SELECT AVG(price) FROM Laptop) AS price_difference_avg_laptop
FROM Product
JOIN Laptop
ON Product.model = Laptop.model
WHERE price > (
    SELECT MAX(PC.price) FROM PC);
 */