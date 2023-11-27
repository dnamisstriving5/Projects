-- Function used: JOIN, DISTINCT, GROUPBY, ORDERBY, HAVING, CASE, CONVERT, PARTITION BY, CTEs and SUBQUERIES

SELECT *
FROM men_bags

-- 1,

-- Total sales of bag

SELECT SUM(Total_quantity_sold) AS Total_bags_quantity_sold
FROM (
	SELECT SUM(quantity_sold) AS Total_quantity_sold
	FROM men_bags
	UNION ALL
	SELECT SUM(quantity_sold) AS Total_quantity_sold
	FROM women_bags
) AS CombinedResults;

-- Total sales of shoe 

SELECT SUM(Total_quantity_sold) AS Total_shoes_quantity_sold
FROM (
	SELECT SUM(quantity_sold) AS Total_quantity_sold
	FROM men_shoes
	UNION ALL
	SELECT SUM(quantity_sold) AS Total_quantity_sold
	FROM women_shoes
) AS CombinedResults;

-- 2,

-- Top 10 bag brands and their product names with total sales based on product popularity

SELECT TOP 10 brand, name,
CASE
	WHEN quantity_sold > 1000 THEN 'Popular'
	ELSE 'Not Popular'
END 
AS popularity_status, quantity_sold
FROM men_bags
ORDER BY quantity_sold DESC


SELECT TOP 10 brand, name,
CASE
	WHEN quantity_sold > 1000 THEN 'Popular'
	ELSE 'Not Popular'
END 
AS popularity_status, quantity_sold
FROM women_bags
ORDER BY quantity_sold DESC

-- Top 10 shoe brands and their product names with total sales based on product popularity

SELECT TOP 10 brand, name,
CASE
	WHEN quantity_sold > 1000 THEN 'Popular'
	ELSE 'Not Popular'
END 
AS popularity_status, quantity_sold
FROM men_shoes
ORDER BY quantity_sold DESC


SELECT TOP 10 brand, name,
CASE
	WHEN quantity_sold > 1000 THEN 'Popular'
	ELSE 'Not Popular'
END 
AS popularity_status, quantity_sold
FROM women_shoes
ORDER BY quantity_sold DESC

-- 3, 

-- The average price of bag products based on category 

SELECT category, AVG(Avg_price) AS Overall_Avg_price
FROM (
    SELECT category, AVG(price) AS Avg_price
    FROM men_bags
    GROUP BY category
    UNION ALL
    SELECT category, AVG(price) AS Avg_price
    FROM women_bags
    GROUP BY category
) AS CombinedResults
GROUP BY category;

--  The average price of shoe products based on category 

SELECT category, AVG(Avg_price) AS Overall_Avg_Price
FROM (
	SELECT category, AVG(price) AS Avg_price
	FROM men_shoes
	GROUP BY category
	UNION ALL
	SELECT category, AVG(price) AS Avg_price
	FROM women_shoes
	GROUP BY category
) AS CombinedResults
GROUP BY category;

-- 4, 

-- Rating average of bag categories 

SELECT category, AVG(CONVERT(float, Avg_rating)) AS Overall_Rating_Average
FROM (
	SELECT category, AVG(CONVERT(float, rating_average)) AS Avg_rating
	FROM men_bags
	GROUP BY category
	UNION ALL
	SELECT category, AVG(CONVERT(float, rating_average)) AS Avg_rating
	FROM women_bags
	GROUP BY category
) AS CombinedResults
GROUP BY category
ORDER BY Overall_Rating_Average DESC

-- Rating average of shoe categories  

DELETE FROM women_shoes
WHERE category LIKE N'%Cây cảnh%' OR category LIKE N'%Bàn ghế các loại%';

SELECT category, AVG(CONVERT(float, Avg_rating)) AS Overall_Rating_Average
FROM (
    SELECT category, AVG(CONVERT(float, rating_average)) AS Avg_rating
    FROM men_shoes
    GROUP BY category
    UNION ALL
    SELECT category, AVG(CONVERT(float, rating_average)) AS Avg_rating
    FROM women_shoes
    GROUP BY category
) AS CombinedResults
WHERE category NOT LIKE 'Cây cảnh' AND category NOT LIKE 'Bàn ghế các loại'
GROUP BY category
ORDER BY Overall_Rating_Average DESC

-- 5, 

--Top 10 bag brands


SELECT TOP 10 brand, COUNT(*) AS product_count
FROM men_bags
GROUP BY brand
ORDER BY product_count DESC

SELECT TOP 10 brand, COUNT(*) AS product_count
FROM women_bags
GROUP BY brand
ORDER BY product_count DESC

-- Top 10 shoe brands

SELECT TOP 10 brand, COUNT(*) AS product_count
FROM men_shoes
GROUP BY brand
ORDER BY product_count DESC

SELECT TOP 10 brand, COUNT(*) AS product_count
FROM women_shoes
GROUP BY brand
ORDER BY product_count DESC

-- 6,

-- Total bag sales by brand 

SELECT brand, SUM(quantity_sold) AS total_quantity_sold
FROM men_bags
GROUP BY brand
ORDER BY total_quantity_sold DESC

SELECT brand, SUM(quantity_sold) AS total_quantity_sold
FROM women_bags
GROUP BY brand
ORDER BY total_quantity_sold DESC

-- Total shoe sales by brand 

SELECT brand, SUM(quantity_sold) AS total_quantity_sold
FROM men_shoes
GROUP BY brand
ORDER BY total_quantity_sold DESC

SELECT brand, SUM(quantity_sold) AS total_quantity_sold
FROM women_bags
GROUP BY brand
ORDER BY total_quantity_sold DESC

-- 7, 

--Number of bag sales by brand and reviews

SELECT brand, rating_average, COUNT(*) product_count
FROM men_bags
GROUP BY brand, rating_average
ORDER BY product_count DESC

SELECT brand, rating_average, COUNT(*) product_count
FROM women_bags
GROUP BY brand, rating_average
ORDER BY product_count DESC

-- Number of shoe sales by brand and reviews

SELECT brand, rating_average, COUNT(*) product_count
FROM men_shoes
GROUP BY brand, rating_average
ORDER BY product_count DESC

SELECT brand, rating_average, COUNT(*) product_count
FROM women_shoes
GROUP BY brand, rating_average
ORDER BY product_count DESC

-- 8, 

-- Total cashback amount paid by bag categories

SELECT category, SUM(vnd_cashback) AS total_cashback
FROM men_bags
GROUP BY category
ORDER BY total_cashback DESC

SELECT category, SUM(vnd_cashback) AS total_cashback
FROM women_bags
GROUP BY category
ORDER BY total_cashback DESC
 
 -- Total cashback amount paid by shoe categories

SELECT category, SUM(vnd_cashback) AS total_cashback
FROM men_shoes
GROUP BY category
ORDER BY total_cashback DESC

SELECT category, SUM(vnd_cashback) AS total_cashback
FROM women_shoes
GROUP BY category
ORDER BY total_cashback DESC

-- 9, 

-- Total number of bag products sold in the form of pay-later

SELECT pay_later, COUNT(*) AS product_count
FROM men_bags
WHERE pay_later = 'TRUE'
GROUP BY pay_later

SELECT pay_later, COUNT(*) AS product_count
FROM women_bags
WHERE pay_later = 'TRUE'
GROUP BY pay_later

-- Total number of shoe products sold in the form of pay-later

SELECT pay_later, COUNT(*) AS product_count
FROM men_shoes
WHERE pay_later = 'TRUE'
GROUP BY pay_later

SELECT pay_later, COUNT(*) AS product_count
FROM women_shoes
WHERE pay_later = 'TRUE'
GROUP BY pay_later

-- 10, 

-- Bag rating based on review count

SELECT rating_average, COUNT(*) AS review_count
FROM men_bags
GROUP BY rating_average
ORDER BY review_count DESC

SELECT rating_average, COUNT(*) AS review_count
FROM women_bags
GROUP BY rating_average
ORDER BY review_count DESC

-- Shoe rating based on review count

SELECT rating_average, COUNT(*) AS review_count
FROM men_shoes
GROUP BY rating_average
ORDER BY review_count DESC

SELECT rating_average, COUNT(*) AS review_count
FROM women_bags
GROUP BY rating_average
ORDER BY review_count DESC

-- 11, 

-- Total bag sales volume by category and fulfillment type

SELECT category, fulfillment_type, SUM(quantity_sold) AS total_quantity_sold
FROM men_bags
GROUP BY category, fulfillment_type
ORDER BY total_quantity_sold DESC

SELECT category, fulfillment_type, SUM(quantity_sold) AS total_quantity_sold
FROM women_bags
GROUP BY category, fulfillment_type
ORDER BY total_quantity_sold DESC

-- Total bag sales volume by category and fulfillment type

SELECT category, fulfillment_type, SUM(quantity_sold) AS total_quantity_sold
FROM men_shoes
GROUP BY category, fulfillment_type
ORDER BY total_quantity_sold DESC

SELECT category, fulfillment_type, SUM(quantity_sold) AS total_quantity_sold
FROM women_shoes
GROUP BY category, fulfillment_type
ORDER BY total_quantity_sold DESC

-- 12,

-- Average selling price of bag categories in men and women 

SELECT category, ROUND(AVG(price), 2) AS avg_price
FROM men_bags
GROUP BY category
ORDER BY avg_price DESC

SELECT category, ROUND(AVG(price), 2) AS avg_price
FROM women_bags
GROUP BY category
ORDER BY avg_price DESC

-- Average selling price of shoe categories in men and women 

SELECT category, ROUND(AVG(price), 2) AS avg_price
FROM men_shoes
GROUP BY category
ORDER BY avg_price DESC

SELECT category, ROUND(AVG(price), 2) AS avg_price
FROM women_shoes
GROUP BY category
ORDER BY avg_price DESC

-- 13,

-- Total number of bag sold for both men and women by brand

SELECT TOP 10 a.brand, 
		SUM(a.quantity_sold) AS total_quantity_sold_men,
		SUM(b.quantity_sold) AS total_quantity_sold_women
FROM men_bags a
JOIN women_bags b
ON a.brand = b.brand
GROUP BY a.brand
ORDER BY SUM(a.quantity_sold) + SUM(b.quantity_sold) DESC

-- -- Total number of shoe sold for both men and women by brand

SELECT TOP 10 a.brand, 
		SUM(a.quantity_sold) AS total_quantity_sold_men,
		SUM(b.quantity_sold) AS total_quantity_sold_women
FROM men_shoes a
JOIN women_shoes b
ON a.brand = b.brand
GROUP BY a.brand
ORDER BY SUM(a.quantity_sold) + SUM(b.quantity_sold) DESC

-- 14,

-- Total bag sales volume and total cashback by brand and category

SELECT brand, category, 
	   SUM(quantity_sold) AS total_quantity_sold, 
	   SUM(vnd_cashback) AS total_vnd_cashback
FROM men_bags
GROUP BY brand, category
ORDER BY SUM(quantity_sold) + SUM(vnd_cashback) DESC

SELECT brand, category, 
	   SUM(quantity_sold) AS total_quantity_sold, 
	   SUM(vnd_cashback) AS total_vnd_cashback
FROM women_bags
GROUP BY brand, category
ORDER BY SUM(quantity_sold) + SUM(vnd_cashback) DESC

-- Total shoe sales volume and total cashback by brand and category

SELECT brand, category, 
	   SUM(quantity_sold) AS total_quantity_sold, 
	   SUM(vnd_cashback) AS total_vnd_cashback
FROM men_shoes
GROUP BY brand, category
ORDER BY SUM(quantity_sold) + SUM(vnd_cashback) DESC

SELECT brand, category, 
	   SUM(quantity_sold) AS total_quantity_sold, 
	   SUM(vnd_cashback) AS total_vnd_cashback
FROM women_shoes
GROUP BY brand, category
ORDER BY SUM(quantity_sold) + SUM(vnd_cashback) DESC

-- 15,

-- Number of bag products with and without video:

SELECT has_video, COUNT(*) AS men_bag_video_count
FROM men_bags
GROUP BY has_video

SELECT has_video, COUNT(*) AS women_bag_video_count
FROM women_bags
GROUP BY has_video

-- Number of shoes products with and without video:

SELECT has_video, COUNT(*) AS men_shoes_video_count
FROM men_shoes
GROUP BY has_video

SELECT has_video, COUNT(*) AS women_shoes_video_count
FROM women_shoes
GROUP BY has_video

-- 16,

-- Average rating ratio between men's bags and women's shoes

SELECT category, AVG(CONVERT(float, rating_average)) as avg_bag_rating
FROM men_bags
GROUP BY category 

SELECT category, AVG(CONVERT(float, rating_average)) as avg_shoe_rating
FROM men_shoes
GROUP BY category 

-- Average rating ratio between women's bags and women's shoes

SELECT category, AVG(CONVERT(float, rating_average)) as avg_bag_rating
FROM women_bags
GROUP BY category 

SELECT category, AVG(CONVERT(float, rating_average)) as avg_shoe_rating
FROM women_shoes
GROUP BY category 

-- 17,

-- The number of bag sales based on brand popularity and fulfillment type

SELECT DISTINCT brand, fulfillment_type, 
CASE
	WHEN SUM(quantity_sold) OVER (PARTITION BY brand, fulfillment_type) > 100 THEN 'Popular'
	ELSE 'Not Popular' 
	END AS popularity_status,
SUM(quantity_sold) OVER (PARTITION BY brand, fulfillment_type) as total_quantity_sold
FROM men_bags
ORDER BY total_quantity_sold DESC

SELECT DISTINCT brand, fulfillment_type, 
CASE
	WHEN SUM(quantity_sold) OVER (PARTITION BY brand, fulfillment_type) > 100 THEN 'Popular'
	ELSE 'Not Popular' 
	END AS popularity_status,
SUM(quantity_sold) OVER (PARTITION BY brand, fulfillment_type) as total_quantity_sold
FROM women_bags
ORDER BY total_quantity_sold DESC

-- The number of bag sales based on brand popularity and fulfillment type

SELECT DISTINCT brand, fulfillment_type, 
CASE
	WHEN SUM(quantity_sold) OVER (PARTITION BY brand, fulfillment_type) > 100 THEN 'Popular'
	ELSE 'Not Popular' 
	END AS popularity_status,
SUM(quantity_sold) OVER (PARTITION BY brand, fulfillment_type) as total_quantity_sold
FROM men_shoes
ORDER BY total_quantity_sold DESC

SELECT DISTINCT brand, fulfillment_type, 
CASE
	WHEN SUM(quantity_sold) OVER (PARTITION BY brand, fulfillment_type) > 100 THEN 'Popular'
	ELSE 'Not Popular' 
	END AS popularity_status,
SUM(quantity_sold) OVER (PARTITION BY brand, fulfillment_type) as total_quantity_sold
FROM women_shoes
ORDER BY total_quantity_sold DESC

-- 18,

-- The number of bag sales according to brand popularity

WITH PopularityCTE AS (
    SELECT brand, SUM(review_count) AS popularity_score
    FROM men_bags
    GROUP BY brand
)
SELECT men_bags.brand, 
       COUNT(*) AS product_count, 
       SUM(quantity_sold) AS total_quantity_sold,
       CASE
           WHEN PopularityCTE.popularity_score > 100 THEN 'High Popularity'
           WHEN PopularityCTE.popularity_score > 50 THEN 'Moderate Popularity'
           ELSE 'Low Popularity'
       END AS popularity_level	
FROM men_bags
JOIN PopularityCTE ON men_bags.brand = PopularityCTE.brand
GROUP BY men_bags.brand, PopularityCTE.popularity_score
ORDER BY total_quantity_sold DESC

--

WITH PopularityCTE AS (
    SELECT brand, SUM(review_count) AS popularity_score
    FROM women_bags
    GROUP BY brand
)
SELECT women_bags.brand, 
       COUNT(*) AS product_count, 
       SUM(quantity_sold) AS total_quantity_sold,
       CASE
           WHEN PopularityCTE.popularity_score > 100 THEN 'High Popularity'
           WHEN PopularityCTE.popularity_score > 50 THEN 'Moderate Popularity'
           ELSE 'Low Popularity'
       END AS popularity_level	
FROM women_bags
JOIN PopularityCTE ON women_bags.brand = PopularityCTE.brand
GROUP BY women_bags.brand, PopularityCTE.popularity_score
ORDER BY total_quantity_sold DESC

-- The number of shoe sales according to brand popularity

WITH PopularityCTE AS (
    SELECT brand, SUM(review_count) AS popularity_score
    FROM men_shoes
    GROUP BY brand
)
SELECT men_shoes.brand, 
       COUNT(*) AS product_count, 
       SUM(quantity_sold) AS total_quantity_sold,
       CASE
           WHEN PopularityCTE.popularity_score > 100 THEN 'High Popularity'
           WHEN PopularityCTE.popularity_score > 50 THEN 'Moderate Popularity'
           ELSE 'Low Popularity'
       END AS popularity_level	
FROM men_shoes
JOIN PopularityCTE ON men_shoes.brand = PopularityCTE.brand
GROUP BY men_shoes.brand, PopularityCTE.popularity_score
ORDER BY total_quantity_sold DESC

-- 

WITH PopularityCTE AS (
    SELECT brand, SUM(review_count) AS popularity_score
    FROM women_shoes
    GROUP BY brand
)
SELECT women_shoes.brand, 
       COUNT(*) AS product_count, 
       SUM(quantity_sold) AS total_quantity_sold,
       CASE
           WHEN PopularityCTE.popularity_score > 100 THEN 'High Popularity'
           WHEN PopularityCTE.popularity_score > 50 THEN 'Moderate Popularity'
           ELSE 'Low Popularity'
       END AS popularity_level	
FROM women_shoes
JOIN PopularityCTE ON women_shoes.brand = PopularityCTE.brand
GROUP BY women_shoes.brand, PopularityCTE.popularity_score
ORDER BY total_quantity_sold DESC

-- 19,

-- Total number of images per bag product in each category and reliability rating

WITH TotalImageCTE AS (
	SELECT category, COUNT(number_of_images) AS total_images_per_product
	FROM men_bags
	GROUP BY category
)
SELECT category, total_images_per_product,
CASE
	WHEN total_images_per_product > 500 THEN 'High Reliability'
	WHEN total_images_per_product > 100 THEN 'Moderate Reliability'
	ELSE 'Low Reliability'
END AS reliability
FROM TotalImageCTE
ORDER BY total_images_per_product DESC


WITH TotalImageCTE AS (
	SELECT category, COUNT(number_of_images) AS total_images_per_product
	FROM women_bags
	GROUP BY category
)
SELECT category, total_images_per_product,
CASE
	WHEN total_images_per_product > 500 THEN 'High Reliability'
	WHEN total_images_per_product > 100 THEN 'Moderate Reliability'
	ELSE 'Low Reliability'
END AS reliability
FROM TotalImageCTE
ORDER BY total_images_per_product DESC

-- Total number of images per bag product in each category and reliability rating

WITH TotalImageCTE AS (
	SELECT category, COUNT(number_of_images) AS total_images_per_product
	FROM men_shoes
	GROUP BY category
)
SELECT category, total_images_per_product,
CASE
	WHEN total_images_per_product > 500 THEN 'High Reliability'
	WHEN total_images_per_product > 100 THEN 'Moderate Reliability'
	ELSE 'Low Reliability'
END AS reliability
FROM TotalImageCTE
ORDER BY total_images_per_product DESC


WITH TotalImageCTE AS (
	SELECT category, COUNT(number_of_images) AS total_images_per_product
	FROM women_shoes
	GROUP BY category
)
SELECT category, total_images_per_product,
CASE
	WHEN total_images_per_product > 500 THEN 'High Reliability'
	WHEN total_images_per_product > 100 THEN 'Moderate Reliability'
	ELSE 'Low Reliability'
END AS reliability
FROM TotalImageCTE
ORDER BY total_images_per_product DESC

-- 20, 

-- Number of bag products of only brands with a larger number of products than the average of the entire table

SELECT brand, 
       COUNT(*) AS product_count
FROM men_bags
GROUP BY brand
HAVING COUNT(*) > (SELECT AVG(quantity_sold) FROM men_bags)
ORDER BY product_count DESC

SELECT brand, 
       COUNT(*) AS product_count
FROM women_bags
GROUP BY brand
HAVING COUNT(*) > (SELECT AVG(quantity_sold) FROM women_bags)
ORDER BY product_count DESC

-- Number of shoe products of only brands with a larger number of products than the average of the entire table

SELECT brand, 
       COUNT(*) AS product_count
FROM men_shoes
GROUP BY brand
HAVING COUNT(*) > (SELECT AVG(quantity_sold) FROM men_shoes)
ORDER BY product_count DESC

SELECT brand, 
       COUNT(*) AS product_count
FROM women_shoes
GROUP BY brand
HAVING COUNT(*) > (SELECT AVG(quantity_sold) FROM women_shoes)
ORDER BY product_count DESC





