
-- KPI's: 

-- 1. Total Acquisition cost

SELECT SUM(acquisition_cost) AS Total_acquisition_cost
FROM Marketing_Campaign;

-- 2. Average Conversion Rate 

SELECT AVG(conversion_rate) AS Avg_conversion_rate
FROM Marketing_Campaign;

-- 3. Average ROI 

SELECT AVG(ROI) AS Average_ROI
FROM Marketing_Campaign;

-- 4. Total Clicks

SELECT SUM(Clicks) AS Total_Clicks
FROM Marketing_Campaign;

-- 5. Total Impressions

SELECT SUM(Impressions) AS Total_Impressions
FROM Marketing_Campaign;

-- 6. Average Engagement Score 

SELECT AVG(engagement_score) AS Average_engagement_score
FROM Marketing_Campaign;


-- Chart's: 

-- 1. Daily Trends 

 SELECT 
    date,
    AVG(conversion_rate) AS Avg_Conversion_Rate,
    AVG(ROI) AS Avg_ROI,
	SUM(clicks) AS Total_Clicks
FROM 
    marketing_campaign
GROUP BY 
    date
ORDER BY 
    date;

-- 2. Channel Effectiveness: 

SELECT channel_used,
		SUM(clicks) AS Total_Clicks,
		SUM(Impressions) AS Total_Impressions
FROM 
	Marketing_Campaign
GROUP BY 
	Channel_Used
ORDER BY Total_Clicks DESC;


-- 3. Total Acquisition cost by Month

SELECT Month(date) AS Month,
		SUM(acquisition_cost) AS Total_Acquisition_cost
FROM
	Marketing_Campaign
GROUP BY
	Month(date)
ORDER BY Month;

-- 4. Customer Segment Performance

SELECT customer_segment,
		Count(*) * 100 / (SELECT Count(*) FROM Marketing_Campaign) AS Segment_percentage
FROM
	Marketing_Campaign
GROUP BY customer_segment
ORDER BY Segment_percentage DESC;
