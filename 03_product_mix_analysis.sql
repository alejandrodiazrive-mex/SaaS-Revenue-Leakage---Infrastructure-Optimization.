/* BUSINESS CASE: Product Mix & Pareto Analysis.
Identifying our "Star Models" to prioritize marketing efforts.
We need to know which cars drive the most traffic to the workshop.
*/

SELECT 
    car_model,
    COUNT(*) AS total_visits,
    -- Percentage of total workshop volume
    ROUND((COUNT(*)::numeric / (SELECT COUNT(*) FROM citas_honda) * 100), 2) AS volume_contribution_pct,
    -- Ranking them by importance
    RANK() OVER (ORDER BY COUNT(*) DESC) AS market_rank
FROM citas_honda
GROUP BY 1
ORDER BY total_visits DESC
LIMIT 10; -- We only care about the Top 10 for strategic focus