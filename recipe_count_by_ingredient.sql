SELECT 

i.name,
count(ri.recipe_id) as recipe_count
from 

ingredients i JOIN recipe_ingredients ri ON i.id = ri.ingredient_id JOIN recipes r ON ri.recipe_id = r.id
where i.name like ('%lamb%')
GROUP BY 1
ORDER BY 2 DESC
