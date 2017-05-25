SELECT

pantry_recipes.id,
pantry_ingredients,
recipe_ingredients,
percentage,
COUNT(f.user_id) AS total_favorites,
SUM(CASE f.user_id WHEN 4 THEN 1 ELSE 0 END) AS user_favorites

FROM
(SELECT

r.id,
COUNT(p.ingredient_id) AS pantry_ingredients,
COUNT(ri.id) AS recipe_ingredients,
(COUNT(p.ingredient_id)+0.0)/(COUNT(ri.id)+0.0) AS percentage

FROM
  (SELECT _r.id
  FROM recipes _r JOIN recipe_ingredients _ri ON _r.id = _ri.recipe_id
  GROUP BY 1
  ) r
JOIN recipe_ingredients ri ON r.id = ri.recipe_id
JOIN ingredients i ON ri.ingredient_id = i.id
LEFT JOIN (SELECT * FROM pantry_items WHERE user_id = 4) p ON i.id = p.ingredient_id

GROUP BY 1) pantry_recipes
LEFT JOIN favorites f ON pantry_recipes.id = f.recipe_id
GROUP BY 1,2,3,4

ORDER BY 4 DESC, 6 DESC, 5 DESC