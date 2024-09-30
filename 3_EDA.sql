-------------Generic questions

--How many unique cities does the data have?
SELECT 
        DISTINCT city
FROM sales;
/*
There are 3 unique cities: Yangon, Naypyitaw, and Mandalay.
*/

--In which city is each branch?
SELECT 
    DISTINCT city,
    branch
FROM sales;
/*
Branch A is in Yangon, Branch C is in Naypaitaw and Branch B is in Mandalay.
*/

------------Product questions
--How many unique product lines does the data have?

SELECT 
    DISTINCT product_line
FROM sales;
/*
There are 6 unique product lines: food and beverages, health and beauty, sports and travel, fashion accessories, home and lifestyle, and electronic accessories.
*/

--What is the most common payment method?
SELECT payment_method,
        COUNT(payment_method) AS cnt
FROM sales
GROUP BY payment_method
ORDER BY cnt DESC;
/*
Cash is the leading payment method with a count of 344, followed by Ewallet at 342 ad finally credit card with a count of 309
*/

--What is the most selling product line?
SELECT product_line,
        COUNT(product_line) AS cnt
FROM sales
GROUP BY product_line
ORDER BY cnt DESC;
/*
The most selling product line is Fashion accessories with 178 sales, followed closely by Food and Beverages with 174 sales, Electronic acessories with 169 sales, Sports and Travel with 163 sales, Home an lifestyle with 160 sales and finally heath and beauty with 151 sales.
*/

--What is the total revenue by month?
SELECT 
        month_name AS month,
        SUM(total) AS total_revenue
FROM sales
GROUP BY month_name
ORDER BY total_revenue DESC;
/*
January was leading with a total revenue of 116291.87
Followed closely by March with a revenue of 108867.15
Finally, February with a total revenue of 95727.38
*/

--What month had the largest COGS?
SELECT 
        month_name AS month,
        SUM(cogs) AS total_cogs
FROM sales
GROUP BY month_name
ORDER BY total_cogs DESC;
/*
Janury had the largest COGS of 110754.16
March 103683
Feb 91168.93
*/

--What product line had the largest revenue?
SELECT 
        product_line,
        SUM(total) AS total_revenue
FROM sales
GROUP BY product_line
ORDER BY total_revenue DESC;
/*
Food & Beverages had the leading total revenue of $56144.84
Fashion accessories $54305.895
Sports & travel $53936.127
Home & Lifestyle $53861.913
Electronic accessories $53783.2365
Health & Beauty $48854.379
*/

--What is the city with the largest revenue?
SELECT 
        city,
        SUM(total) AS total_revenue
FROM sales
GROUP BY city
ORDER BY total_revenue DESC;
/*
Naypyitaw has the largest total revenue of $110490.78
Yangon $105861.01
Mandalay $104534.61
*/

--What product line had the largest VAT?
SELECT 
        product_line,
        AVG(VAT) AS avg_tax
FROM sales
GROUP BY product_line
ORDER BY avg_tax DESC;
/*
Home & Lifestyle had the largest VAT of 16.03
Sports & travel 15.76
Health & Beauty 15.41
Food & Beverages 15.37
Electronic accessories 15.15
Fashion accessories 14.53
*/
--Which branch sold more products than AVG product sold?
SELECT 
        branch,
        SUM(quantity) AS qty 
FROM sales
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM sales);
/*
Branch A 1849
Branch C 1828
Branch B 1795
*/

--What is the most common product line by gender?
SELECT 
        gender,
        product_line,
        COUNT(gender) AS total_gender_cnt
FROM sales
GROUP BY gender, product_line
ORDER BY total_gender_cnt DESC;
/*
The most common product line by gender is Female Fashion Accessories
Followed closely by Female, Food & Beverages at 90
Male, Health & Beauty at 88
Female, Sports & Travel at 86
Male, electronic accessories at 86
*/

--What is the average rating of each product_line?
SELECT 
        product_line,
        ROUND(AVG(rating), 2) avg_rating
FROM sales
GROUP BY product_line
ORDER BY avg_rating DESC;
/*
Food & Beverages with avg rating of 7.11
Fashion accessories 7.03
Health & Beauty 6.98
Electronic accessories 6.91
Sports & Travel 6.86
Home & Lifestyle 6.84
*/

------------------------------------Sales Questions
--Number of sales made in each time of the day per weekday
SELECT
        time_of_day,
        COUNT(*) AS total_sales
FROM Sales
WHERE day_name = "Monday"
GROUP BY time_of_day
ORDER BY total_sales DESC;
/*
Evening had 56 sales
Afternoon 48 sales
Morning 20 sales
*/

-- Which of the customer types brings the most revenue?
SELECT
        customer_type,
        SUM(total) AS total_revenue
FROM sales
GROUP BY customer_type
ORDER BY total_revenue DESC;
/*
Members customers brought the highest revenue of $163625.102
Normal customers had a total revenue of $157261.293
*/

--Which city has the largest tax percent/VAT (Value Added Tax)?
SELECT
    city,
    AVG(VAT) AS VAT
FROM sales
GROUP BY city
ORDER BY VAT DESC;
/*
Naypyitaw had the largest tax percent of 16.09 %
Mandalay 15.13 %
Yangon 14.87 %
*/

-- Which customer type pays the most in VAT?
SELECT
    customer_type,
    AVG(VAT) AS VAT
FROM sales
GROUP BY customer_type
ORDER BY VAT DESC;
/*
MMember customers pays the most VAT at 15.61 %
Normal customers follows closely at 15.098 %
*/
----------------------------------Customer questions
-- How many unique customer types does the data have?
SELECT
    COUNT(DISTINCT customer_type)
FROM sales;
/*
There are 2 unique customer types.
*/

--How many unique payment method does the data have?
SELECT
    COUNT(DISTINCT payment_method)
FROM sales;
/*
There are 3 unique paymment method.
*/

-- Which customer type buys the most?
SELECT
    customer_type,
    COUNT(*) AS customer_cnt
FROM sales
GROUP BY customer_type
ORDER BY customer_cnt DESC;
/*
Members buys the most at 499
Normal customers are at 496
*/

-- What is the gender of most of the customers?
SELECT
    gender,
    COUNT(*) AS gender_cnt
FROM sales
GROUP BY gender
ORDER BY gender_cnt DESC;
/*
Most customers are male (498)
The female are 497
*/

-- What is the gender distribution per branch?
SELECT
    branch,
    gender,
    COUNT(*) AS gender_cnt
FROM sales
GROUP BY branch, gender;
/*
Gender distribution include:
Branch A has 179 males and 160 females
Branch B 169 males and 160 females
Branch C 177 males and 150 females
*/

-- What time of the day do customers give most ratings?
SELECT
    time_of_day,
    AVG(rating) AS avg_rating
FROM sales
GROUP BY time_of_day
ORDER BY avg_rating DESC;
/*
Afternoon has the best avg rating of 7.0234
Morning avg rating of 6.94474
Evening avg rating of 6.90536
*/ 

-- Which time of the day do customers give most ratings per branch?
SELECT
    time_of_day,
    AVG(rating) AS avg_rating
FROM sales
WHERE branch = "C"
GROUP BY time_of_day
ORDER BY avg_rating DESC;

-- Which day of the week has the best avg ratings?
SELECT
    day_name,
    AVG(rating) AS avg_rating
FROM sales
GROUP BY day_name
ORDER BY avg_rating DESC;
/*
Monday has the best avg rating of 7.13065
Followed by Friday with avg rating of 7.05507
Tuesday 7.00316
Sunday 6.98864
Saturday 6.90183
Thursday 6.88986
Wednesday 6.76028
*/

-- Which day of the week has the best avg ratings per branch?
SELECT
    day_name,
    AVG(rating) AS avg_rating
FROM sales
WHERE branch = "A"
GROUP BY day_name
ORDER BY avg_rating DESC;
/*
Branch A had the following avg rating:
Friday 7.312
Monday 7.09792
Sunday 7.07885
Tuesday 7.05882
Thursday 6.9587
Wednesday 6.84286
Saturday 6.746
*/


