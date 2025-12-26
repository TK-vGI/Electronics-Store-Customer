/*
START STAGE 1 Query
*/
SELECT
    pc_code,
    model,
    speed,
    ram
FROM
    PC
WHERE
    ram >= 16
ORDER BY
    ram,
    speed DESC;
/*
END STAGE 1 Query
*/

/*
Other Solution:
--
SELECT pc_code, model, speed, ram
FROM PC
WHERE ram >= 16
ORDER BY ram ASC, speed DESC;
 */