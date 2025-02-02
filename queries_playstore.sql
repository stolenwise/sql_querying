-- Comments in SQL Start with dash-dash --

-- Query 1: Find the app with an ID of 1880
SELECT * FROM analytics 
WHERE id = 1880;

-- Query 2: Find the ID and app name for all apps that were last updated on August 01, 2018
SELECT id, app_name FROM analytics 
WHERE last_updated = '2018-08-01';

-- Query 3: Count the number of apps in each category
SELECT category, COUNT(*) AS total_apps FROM analytics 
GROUP BY category;

-- Query 4: Find the top 5 most-reviewed apps and the number of reviews for each
SELECT app_name, reviews FROM analytics 
ORDER BY reviews DESC LIMIT 5;

-- Query 5: Find the app that has the most reviews with a rating greater than or equal to 4.8
SELECT app_name, reviews, rating FROM analytics 
WHERE rating >= 4.8 ORDER BY reviews DESC LIMIT 1;

-- Query 6: Find the average rating for each category ordered by the highest rated to lowest rated
SELECT category, AVG(rating) AS average_rating 
FROM analytics GROUP BY category 
ORDER BY average_rating DESC;

-- Query 7: Find the name, price, and rating of the most expensive app with a rating that’s less than 3
SELECT app_name, price, rating FROM analytics 
WHERE rating < 3 ORDER BY price DESC LIMIT 1;

-- Query 8: Find all apps with a min install not exceeding 50 that have a rating. Order your results by highest rated first
SELECT app_name, min_installs, rating FROM analytics 
WHERE min_installs <= 50 AND rating IS NOT NULL ORDER BY rating 
DESC;

-- Query 9: Find the names of all apps that are rated less than 3 with at least 10,000 reviews
SELECT app_name FROM analytics 
WHERE rating < 3 AND reviews >= 10000;

-- Query 10: Find the top 10 most-reviewed apps that cost between 10 cents and a dollar
SELECT app_name, reviews, price FROM analytics 
WHERE price BETWEEN 0.10 AND 1.00 ORDER BY reviews DESC LIMIT 10;

-- Query 11: Find the most out-of-date app
SELECT app_name, last_updated FROM analytics
WHERE last_updated = (SELECT MIN(last_updated) FROM analytics);

-- Query 12: Find the most expensive app
SELECT app_name, price FROM analytics 
ORDER BY price DESC LIMIT 1;

-- Query 13: Count all the reviews in the Google Play Store
SELECT SUM(reviews) AS total_reviews FROM analytics;

-- Query 14: Find all the categories that have more than 300 apps in them
SELECT category FROM analytics 
GROUP BY category HAVING COUNT(*) > 300;

-- Query 15: Find the app that has the highest proportion of min_installs to reviews, among apps that have been installed at least 100,000 times
SELECT app_name, reviews, min_installs, (min_installs::float / reviews) AS proportion 
FROM analytics 
WHERE min_installs >= 100000 
ORDER BY proportion DESC LIMIT 1;