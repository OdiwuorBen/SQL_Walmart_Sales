--add a new column named time_of_day to give insights of sales in the morning, Afternoon and Evening.
SELECT time,
        (CASE
            WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
            WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
            ELSE "Evening"
            END
        ) AS time_of_day
FROM
    sales;

ALTER TABLE sales ADD COLUMN time_of_day VARCHAR (20);
UPDATE sales
SET time_of_day = (
    CASE
        WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END
        );

/*add a column named day_name that contain the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri)*/

SELECT date,
        DAYNAME(date) AS day_name
FROM sales;

ALTER TABLE sales ADD COLUMN day_name VARCHAR (10);
UPDATE sales
SET day_name = DAYNAME(date);

--Add a new column named month_name that contains the extracted months of the year on which the given transaction took place (Jan, Fen, Mar)*/

SELECT date,
        MONTHNAME(date) AS month_name
FROM sales;

ALTER TABLE sales ADD COLUMN month_name VARCHAR (10);
UPDATE sales
SET month_name = MONTHNAME(date);





SELECT *
FROM sales
LIMIT 5;