/*
SELECT nom_recette, categorie.nom_categorie, tps_preparation
FROM recette, categorie
WHERE recette.id_categorie = categorie.id_categorie
ORDER BY tps_preparation DESC
*/
/*
SELECT nom_recette, categorie.nom_categorie, tps_preparation, composer.qte
FROM recette, categorie, composer
WHERE recette.id_categorie = categorie.id_categorie
AND recette.id_recette = composer.id_ingredient
ORDER BY tps_preparation DESC
*/
/*
SELECT nom_recette, tps_preparation
FROM recette
WHERE tps_preparation >= 30
*/
/*
SELECT nom_recette
FROM recette
WHERE nom_recette LIKE '%Salade%'
*/
/*
INSERT INTO recette
(id_recette, nom_recette, tps_preparation, instructions, id_categorie)
VALUE
(11, 'Pâtes à la carbonara', 20, 'cuire', 2)
*/
/*
UPDATE recette
SET nom_recette = 'Tasse d\'eau très chaude'
WHERE id_recette = 3
*/
/*
DELETE FROM composer
WHERE id_recette = 2
*/
/*
DELETE FROM recette
WHERE id_recette = 2
*/
/*
SELECT SUM(ingredient.prix)
FROM composer, ingredient
WHERE ingredient.id_ingredient = composer.id_ingredient
AND composer.id_recette = 5
*/
/*
SELECT ingredient.nom_ingredient, composer.qte, ingredient.unite_mesure, ingredient.prix
FROM ingredient, composer
WHERE ingredient.id_ingredient = composer.id_ingredient
AND composer.id_recette = 5
*/
/*
INSERT INTO ingredient
(id_ingredient, nom_ingredient, unite_mesure, prix)
VALUE
(13, 'Poivre', 'Cuillère à café', 2.5)
*/
/*
UPDATE ingredient
SET prix = 25
WHERE id_ingredient = 12
*/
/*
SELECT categorie.nom_categorie, nom_recette, tps_preparation
FROM recette, categorie
WHERE recette.id_categorie = categorie.id_categorie
ORDER BY categorie.id_categorie ASC
*/
/*
SELECT nom_recette
FROM recette, composer, ingredient
WHERE ingredient.nom_ingredient LIKE '%poulet%'
AND ingredient.id_ingredient = composer.id_ingredient
AND composer.id_recette = recette.id_recette
*/
/*
UPDATE recette
SET tps_preparation = tps_preparation - 5
*/
/*
SELECT nom_recette, ingredient.prix
FROM recette, composer, ingredient
WHERE ingredient.prix <= 2
AND ingredient.id_ingredient = composer.id_ingredient
AND composer.id_recette = recette.id_recette
*/
/*
SELECT nom_recette, tps_preparation
FROM recette
ORDER BY tps_preparation
LIMIT 3
*/
/*
SELECT DISTINCT nom_recette
FROM recette, composer, ingredient
WHERE composer.qte = 0
AND composer.id_recette = recette.id_recette
*/

/*
EXO 18
*/
/*
REMOVE FROM ingredient
WHERE id_ingredient = 15
*/
/*
REMOVE FROM recette
WHERE id_recette = 15
*/
/*
INSERT INTO ingredient
(id_ingredient, nom_ingredient, unite_mesure, prix)
VALUE
(16, 'textInsert15', 'Test', 1.5)
*/
/*
INSERT INTO composer
(qte, id_recette, id_ingredient)
VALUE
(3, 9, 16)
*/

/*INSERT INTO ingredient, composer*/









/*SELECT nom_recette
FROM recette
WHERE tps_preparation >= 30
ORDER BY tps_preparation DESC*/

/*SELECT nom_recette
FROM recette
WHERE nom_recette LIKE '%Salade%'*/

/*INSERT INTO recette
(id_recette, nom_recette, tps_preparation, instructions, id_categorie)
VALUES
(11, 'Pâtes à la carbonara', 20, 'cuisiner', 2)*/

/*UPDATE recette
SET nom_recette = 'Salades'
WHERE id_recette = 3*/

/*DELETE FROM composer
WHERE id_recette = 2*/

/*DELETE FROM recette
WHERE id_recette = 2*/

/*
EXO 8
*/

/*SELECT ingredient.nom_ingredient, composer.qte, ingredient.prix
FROM ingredient, composer, recette
WHERE id_recette = */

/*INSERT INTO ingredient
(id_ingredient, nom_ingredient, unite_mesure, prix)
VALUES
(10, 'Poivre', 'Cuillère à café', 2.5)*/

/*UPDATE ingredient
SET prix = 22
WHERE id_ingredient = 12*/

/*SELECT DISTINCT COUNT(nom_categorie)
FROM recette, categorie*/