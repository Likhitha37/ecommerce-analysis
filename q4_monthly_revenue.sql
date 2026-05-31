SELECT 
    order_month,
    COUNT(DISTINCT order_id) as total_orders,
    ROUND(SUM(price), 2) as total_revenue,
    ROUND(AVG(price), 2) as avg_order_value
FROM orders
GROUP BY order_month
ORDER BY order_month