/*
START STAGE 4 Query
*/
SELECT
  p.maker,
  SUM(CASE WHEN p.type = 'PC' THEN 1 END) AS pc_count,
  SUM(CASE WHEN p.type = 'Laptop' THEN 1 END) AS laptop_count
FROM Product p
GROUP BY p.maker
HAVING pc_count > 0
   AND laptop_count > 0;

/*
END STAGE 4 Query
*/

/*
Other Solution:
--
SELECT
	maker,
	SUM(CASE WHEN type = 'pc' THEN 1 ELSE 0 END) AS pc_count,
    SUM(CASE WHEN type = 'laptop' THEN 1 ELSE 0 END) AS laptop_count
FROM
    Product
GROUP BY
    maker
HAVING
    SUM(CASE WHEN type = 'pc' THEN 1 ELSE 0 END) > 0 AND
    SUM(CASE WHEN type = 'laptop' THEN 1 ELSE 0 END) > 0;
 */

/*
Other Solution with SUM():
--
SELECT
  p.maker,
  SUM(CASE WHEN p.type = 'PC' THEN 1 ELSE 0 END) AS pc_count,
  SUM(CASE WHEN p.type = 'Laptop' THEN 1 ELSE 0 END) AS laptop_count
FROM Product p
GROUP BY p.maker
ORDER BY p.maker;
 */