SELECT 
    product_category_name_english as category,
    COUNT(*) as total_orders,
    ROUND(SUM(price), 2) as total_revenue,
    ROUND(AVG(review_score), 2) as avg_review_score,
    ROUND(AVG(delivery_days), 1) as avg_delivery_days,
    ROUND(AVG(CASE WHEN late_delivery = 1 THEN 1.0 ELSE 0 END) * 100, 1) as late_rate_pct
FROM orders
WHERE product_category_name_english != 'unknown'
GROUP BY category
ORDER BY late_rate_pct DESC
LIMIT 15
