SELECT 
    review_score,
    COUNT(*) as total_orders,
    ROUND(AVG(delivery_days), 1) as avg_delivery_days,
    ROUND(AVG(CASE WHEN late_delivery = 1 THEN 1.0 ELSE 0 END) * 100, 1) as late_rate_pct
FROM orders
WHERE review_score IS NOT NULL
GROUP BY review_score
ORDER BY review_score DESC