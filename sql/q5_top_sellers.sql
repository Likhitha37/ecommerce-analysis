SELECT 
    seller_id,
    COUNT(DISTINCT order_id) as total_orders,
    ROUND(SUM(price), 2) as total_revenue,
    ROUND(AVG(price), 2) as avg_order_value,
    ROUND(AVG(review_score), 2) as avg_review_score
FROM orders
GROUP BY seller_id
ORDER BY total_revenue DESC
LIMIT 15
