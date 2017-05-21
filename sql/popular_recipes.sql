SELECT

recipe_id,
count(user_id) as favorite_count

FROM favorites
GROUP BY 1
ORDER BY 2 DESC