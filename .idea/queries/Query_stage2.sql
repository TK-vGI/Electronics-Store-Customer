/*
START STAGE 2 Query
*/
SELECT
    ROUND(AVG(price),2) AS average_price
FROM Printer
WHERE
    color = 'C' AND
    type = 'Inkjet';

/*
END STAGE 2 Query
*/

/*
Other Solution:
--
 */