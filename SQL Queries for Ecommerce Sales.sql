

SELECT SUM(sales_per_order) AS YTD_Sales
	FROM ecommerce_data
	WHERE YEAR(order_date) = 2022;

SELECT SUM(profit_per_order) AS YTD_Profit
	FROM ecommerce_data
	WHERE YEAR(order_date) = 2022;

SELECT SUM(order_quantity) AS YTD_Quantity
	FROM ecommerce_data
	WHERE YEAR(order_date) = 2022;

SELECT (SUM(profit_per_order) / SUM(sales_per_order)) * 100 AS YTD_Profit_Margin
	FROM ecommerce_data
	WHERE YEAR(order_date) = 2022;


SELECT  category_name, 
    SUM(CASE WHEN YEAR(order_date) = 2022 THEN sales_per_order ELSE 0 END) AS YTD_Sales, 
    SUM(CASE WHEN YEAR(order_date) = 2021 THEN sales_per_order ELSE 0 END) AS PYTD_Sales, 
    ((SUM(CASE WHEN YEAR(order_date) = 2022 THEN sales_per_order ELSE 0 END) - SUM(CASE WHEN YEAR(order_date) = 2021 THEN sales_per_order ELSE 0 END)) * 100.0 / NULLIF(SUM(CASE WHEN YEAR(order_date) = 2021 THEN sales_per_order ELSE 0 END), 0)) AS YoY_Sales_Change
FROM ecommerce_data
GROUP BY category_name;

SELECT customer_region, SUM(sales_per_order) AS YTD_Sales
	FROM ecommerce_data
	WHERE YEAR(order_date) = 2022
	GROUP BY customer_region;

SELECT TOP 5 product_name, SUM(sales_per_order) AS YTD_Sales
	FROM ecommerce_data
	WHERE YEAR(order_date) = 2022
	GROUP BY product_name
	ORDER BY YTD_Sales DESC;

SELECT TOP 5 product_name, SUM(sales_per_order) AS YTD_Sales
	FROM ecommerce_data
	WHERE YEAR(order_date) = 2022
	GROUP BY product_name
	ORDER BY YTD_Sales ASC;

SELECT customer_region, (SUM(sales_per_order) / (SELECT SUM(sales_per_order) FROM ecommerce_data WHERE YEAR(order_date) = 2022)) * 100 AS Percentage_Share
	FROM ecommerce_data
	WHERE YEAR(order_date) = 2022
	GROUP BY customer_region;

SELECT shipping_type, (SUM(sales_per_order) / (SELECT SUM(sales_per_order) FROM ecommerce_data WHERE YEAR(order_date) = 2022)) * 100 AS Percentage_Share
	FROM ecommerce_data
	WHERE YEAR(order_date) = 2022
	GROUP BY shipping_type;













