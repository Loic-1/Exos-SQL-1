/*EXO 1*/
/*
SELECT nom_recette, categorie.nom_categorie, tps_preparation
FROM recette, categorie
JOIN categorie ON recette.id_categorie = categorie.id_categorie
ORDER BY tps_preparation DESC
*/

/*EXO 2*/

/*
SELECT nom_recette, categorie.nom_categorie, tps_preparation, COUNT(composer.id_ingredient) AS nbingredients
FROM recette, categorie, composer
JOIN categorie ON recette.id_categorie = categorie.id_categorie
JOIN composer ON recette.id_recette = composer.id_recette
ORDER BY tps_preparation DESC;
*/

/*EXO 3*/
/*
SELECT nom_recette, tps_preparation
FROM recette
WHERE tps_preparation >= 30
*/

/*EXO 4*/
/*
SELECT nom_recette
FROM recette
WHERE nom_recette LIKE '%Salade%'
*/

/*EXO 5*/
/*
INSERT INTO recette
(id_recette, nom_recette, tps_preparation, instructions, id_categorie)
VALUE
(11, 'Pâtes à la carbonara', 20, 'cuire', 2)
*/

/*EXO 6*/
/*
UPDATE recette
SET nom_recette = 'Tasse d\'eau très chaude'
WHERE id_recette = 3
*/

/*EXO 7*/
/*
DELETE FROM composer
WHERE id_recette = 2
*/
/*
DELETE FROM recette
WHERE id_recette = 2
*/

/*EXO 8*/
/*
SELECT SUM(ingredient.prix)
FROM composer, ingredient
WHERE ingredient.id_ingredient = composer.id_ingredient
AND composer.id_recette = 5
*/

/*EXO 9*/
/*
SELECT ingredient.nom_ingredient, composer.qte, ingredient.unite_mesure, ingredient.prix
FROM ingredient, composer
WHERE ingredient.id_ingredient = composer.id_ingredient
AND composer.id_recette = 5
*/

/*EXO 10*/
/*
INSERT INTO ingredient
(id_ingredient, nom_ingredient, unite_mesure, prix)
VALUE
(13, 'Poivre', 'Cuillère à café', 2.5)
*/

/*EXO 11*/
/*
UPDATE ingredient
SET prix = 25
WHERE id_ingredient = 12
*/

/*EXO 12*/
/*FAUX
SELECT categorie.nom_categorie, nom_recette, tps_preparation
FROM recette, categorie
WHERE recette.id_categorie = categorie.id_categorie
ORDER BY categorie.id_categorie ASC
*/
/*
SELECT categorie.nom_categorie, COUNT(recette.id_recette) AS nbrecettes
FROM recette, categorie
JOIN categorie ON recette.id_categorie = categorie.id_categorie
GROUP BY categorie.nom_categorie;
*/

/*EXO 13*/
/*
SELECT nom_recette
FROM recette, composer, ingredient
WHERE ingredient.nom_ingredient LIKE '%poulet%'
AND ingredient.id_ingredient = composer.id_ingredient
AND composer.id_recette = recette.id_recette
*/

/*EXO 14*/
/*
UPDATE recette
SET tps_preparation = tps_preparation - 5
*/

/*EXO 15*/
/*
SELECT nom_recette, ingredient.prix
FROM recette, composer, ingredient
WHERE ingredient.prix <= 2
AND ingredient.id_ingredient = composer.id_ingredient/*JOIN PLUS LOGIQUE*/
AND composer.id_recette = recette.id_recette
*/

/*EXO 16*/
/*
SELECT nom_recette, tps_preparation
FROM recette
ORDER BY tps_preparation
LIMIT 3
*/

/*EXO 17*/
/*
SELECT DISTINCT nom_recette
FROM recette, composer, ingredient
WHERE composer.qte = 0
AND composer.id_recette = recette.id_recette
*/

/*EXO 18*/
/*
SELECT ingredient.nom_ingredient,COUNT(DISTINCT composer.id_recette) AS nbrecettes
FROM composer, ingredient
JOIN ingredient ON composer.id_ingredient = ingredient.id_ingredient
HAVING COUNT(DISTINCT composer.id_recette) > 2;
*/

/*EXO 19*/
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

/*
REMOVE FROM ingredient
WHERE id_ingredient = 15
*/
/*
REMOVE FROM composer
WHERE id_ingredient = 15
*/