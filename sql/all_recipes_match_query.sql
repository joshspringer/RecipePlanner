SELECT

r.id,
count(p.ingredient_id) as pantry_ingredients,
count(ri.id) as recipe_ingredients,
count(p.ingredient_id)/count(ri.id) as percentage

FROM recipes r 
JOIN recipe_ingredients ri ON r.id = ri.recipe_id 
JOIN ingredients i ON ri.ingredient_id = i.id
LEFT JOIN (SELECT * FROM pantry_items WHERE user_id = 1) p ON i.id = p.ingredient_id

GROUP BY 1
ORDER BY 4 DESC