SELECT 
    customer_state,
    COUNT(*) as total_orders,
    SUM(CASE WHEN late_delivery = 1 THEN 1 ELSE 0 END) as late_orders,
    ROUND(100.0 * SUM(CASE WHEN late_delivery = 1 THEN 1 ELSE 0 END) / COUNT(*), 1) as late_rate_pct,
    ROUND(AVG(review_score), 2) as avg_review_score,
    ROUND(AVG(delivery_days), 1) as avg_delivery_days
FROM orders
GROUP BY customer_state
HAVING total_orders > 100
ORDER BY late_rate_pct DESC
