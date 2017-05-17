UPDATE ingredients
SET name = replace(name, 'Ã´','ô');
UPDATE ingredients
SET name = replace(name, 'Ã¢','â');
UPDATE ingredients
SET name = replace(name, 'Ã¹','ù');
UPDATE ingredients
SET name = replace(name, 'Ã©','é');
UPDATE ingredients
SET name = replace(name, 'Ã¨','è');
UPDATE ingredients
SET name = replace(name, 'Ã»','û');
UPDATE ingredients
SET name = replace(name, 'Ãª','ê');
UPDATE ingredients
SET name = replace(name, 'Ã®','î');
UPDATE ingredients
SET name = replace(name, 'Ã¯','ï');
UPDATE ingredients
SET name = replace(name, 'Ã¶','ö');
UPDATE ingredients
SET name = replace(name, 'Ã§','ç');
UPDATE ingredients
SET name = replace(name, 'Ã ','à');
UPDATE ingredients
SET name = replace(name, 'Ã³','ó');
UPDATE ingredients
SET name = replace(name, 'Ã ','à');
UPDATE ingredients
SET name = replace(name, 'Ãª','ê');
UPDATE ingredients
SET name = replace(name, 'Ã¥','å');
UPDATE ingredients
SET name = replace(name, 'Ã¤','ä');
UPDATE ingredients
SET name = replace(name, 'Ã±','ñ');


UPDATE recipes
SET name = replace(name, 'Ã´','ô');
UPDATE recipes
SET name = replace(name, 'Ã¢', 'â');
UPDATE recipes
SET name = replace(name, 'Ã¹','ù');
UPDATE recipes
SET name = replace(name, 'Ã©','é');
UPDATE recipes
SET name = replace(name, 'Ã¨','è');
UPDATE recipes
SET name = replace(name, 'Ã»','û');
UPDATE recipes
SET name = replace(name, 'Ãª','ê');
UPDATE recipes
SET name = replace(name, 'Ã®','î');
UPDATE recipes
SET name = replace(name, 'Ã¯','ï');
UPDATE recipes
SET name = replace(name, 'Ã¶','ö');
UPDATE recipes
SET name = replace(name, 'Ã§','ç');
UPDATE recipes
SET name = replace(name, 'Ã ','à');
UPDATE recipes
SET name = replace(name, 'Ã³','ó');
UPDATE recipes
SET name = replace(name, 'Ã ','à');
UPDATE recipes
SET name = replace(name, 'Ãª','ê');
UPDATE recipes
SET name = replace(name, 'Ã¥','å');
UPDATE recipes
SET name = replace(name, 'Ã¤','ä');
UPDATE recipes
SET name = replace(name, 'Ã±','ñ');

UPDATE recipe_ingredients
SET ingredient_text = replace(ingredient_text, 'Â½','½');
UPDATE recipe_ingredients
SET ingredient_text = replace(ingredient_text, 'Â¾','¾');
UPDATE recipe_ingredients
SET ingredient_text = replace(ingredient_text, 'Â¼','¼');