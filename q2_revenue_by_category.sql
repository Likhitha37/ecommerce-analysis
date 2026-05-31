SELECT 
    product_category_name_english as category,
    COUNT(*) as total_orders,
    ROUND(SUM(price), 2) as total_revenue,
    ROUND(AVG(price), 2) as avg_order_value,
    ROUND(AVG(review_score), 2) as avg_review_score
FROM orders
WHERE product_category_name_english != 'unknown'
GROUP BY category
ORDER BY total_revenue DESC
LIMIT 15