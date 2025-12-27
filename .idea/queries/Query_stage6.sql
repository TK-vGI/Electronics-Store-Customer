/*
START STAGE 6 Query
*/
WITH RankedPCs AS (
  SELECT
    pc_code,
    model,
    speed,
    ram,
    hd,
    cd,
    price,
    ROW_NUMBER() OVER (PARTITION BY ram ORDER BY price DESC, pc_code) AS rn
  FROM PC
)
SELECT
  pc_code,
  model,
  speed,
  ram,
  hd,
  cd,
  price
FROM RankedPCs
WHERE rn = 2
ORDER BY ram, price DESC;


/*
END STAGE 6 Query
*/


/*
Other Solution:
--
WITH ranked AS (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY ram ORDER BY price DESC) AS ranking
    FROM PC
)
SELECT pc_code, model, speed, ram, hd, cd, price
FROM ranked
WHERE ranking = 2;
 */

/*
Other Solution:
--

 */