/*EXO 1*/

-- SELECT nom_recette, categorie.nom_categorie, tps_preparation
-- FROM recette r, categorie c
-- INNER JOIN c ON r.id_categorie = c.id_categorie
-- ORDER BY tps_preparation DESC


/*EXO 2*/


-- SELECT nom_recette, categorie.nom_categorie, tps_preparation, COUNT(composer.id_ingredient) AS nbingredients
-- FROM recette r, categorie c, composer co
-- INNER JOIN c ON r.id_categorie = c.id_categorie
-- INNER JOIN co ON r.id_recette = co.id_recette
-- GROUP BY nom_recette, c.nom_categorie, tps_preparation
-- ORDER BY tps_preparation DESC;


/*EXO 3*/

-- SELECT nom_recette, tps_preparation
-- FROM recette
-- WHERE tps_preparation >= 30


/*EXO 4*/

-- SELECT nom_recette
-- FROM recette
-- WHERE nom_recette LIKE '%Salade%'


/*EXO 5*/

-- INSERT INTO recette
-- (id_recette, nom_recette, tps_preparation, instructions, id_categorie)
-- VALUE
-- (1, 'Pâtes à la carbonara', 20, 'cuire', 2)


-- INSERT INTO ingredient
-- (id_ingredient, nom_ingredient, unite_mesure, prix)
-- VALUES
-- (1, 'pâte', 'kg', 11)


-- INSERT INTO composer
-- (qte, id_recette, id_ingredient)
-- VALUES
-- (1, 1, 1)

/*EXO 6*/

-- UPDATE recette
-- SET nom_recette = 'Tasse d\'eau très chaude'
-- WHERE id_recette = 3


/*EXO 7*/

-- DELETE FROM composer
-- WHERE id_recette = 2


-- DELETE FROM recette
-- WHERE id_recette = 2


/*EXO 8*/

-- SELECT r.id_recette, r.nom_recette, SUM(c.qte * i.prix) AS prix_total
-- FROM recette r
-- JOIN composer c ON r.id_recette = c.id_recette
-- JOIN ingredient i ON c.id_ingredient = i.id_ingredient
-- WHERE r.id_recette = 30
-- GROUP BY r.id_recette, r.nom_recette;


/*EXO 9*/

-- SELECT ingredient.nom_ingredient, composer.qte, ingredient.unite_mesure, ingredient.prix
-- FROM ingredient i, composer co
-- WHERE i.id_ingredient = co.id_ingredient
-- AND co.id_recette = 5


/*EXO 10*/

-- INSERT INTO ingredient
-- (id_ingredient, nom_ingredient, unite_mesure, prix)
-- VALUE
-- (13, 'Poivre', 'Cuillère à café', 2.5)


/*EXO 11*/

-- UPDATE ingredient
-- SET prix = 25
-- WHERE id_ingredient = 12


/*EXO 12*/

-- SELECT categorie.nom_categorie, COUNT(recette.id_recette) AS nbrecettes
-- FROM recette r, categorie c
-- INNER JOIN c ON r.id_categorie = c.id_categorie
-- GROUP BY c.nom_categorie;


/*EXO 13*/

-- SELECT nom_recette
-- FROM recette r, composer co, ingredient i
-- WHERE i.nom_ingredient LIKE '%poulet%'
-- AND i.id_ingredient = co.id_ingredient
-- AND co.id_recette = r.id_recette


/*EXO 14*/

-- UPDATE recette
-- SET tps_preparation = tps_preparation - 5


/*EXO 15*/

-- /*OLD*/
-- SELECT nom_recette, ingredient.prix
-- FROM r, co, i
-- WHERE i.prix <= 2
-- AND i.id_ingredient = co.id_ingredient
-- AND co.id_recette = r.id_recette


-- /*CORRECTION*/
-- SELECT r.nom_recette, i.prix
-- FROM recette r, composer co, ingredient i
-- WHERE r.id_recette NOT IN (
--     SELECT co.id_recette
--     FROM composer co, recette r, ingredient i
--     WHERE i.prix <= 2
--     AND i.id_ingredient = co.id_ingredient
--     AND co.id_recette = r.id_recette
-- )


/*EXO 16*/

-- /*OLD*/
-- SELECT nom_recette, tps_preparation
-- FROM recette
-- ORDER BY tps_preparation
-- LIMIT 3

-- /*CORRECTION*/
-- SELECT r.nom_recette, r.tps_preparation
-- FROM recette r
-- WHERE r.tps_preparation IN(
--     SELECT r.tps_preparation
--     FROM recette r
--     ORDER BY r.tps_preparation
--     LIMIT 3
-- )


/*EXO 17*/

/*OLD*/
-- SELECT DISTINCT nom_recette
-- FROM recette r, composer co, ingredient i
-- WHERE co.qte = 0
-- AND co.id_recette = r.id_recette


-- /*correction*/
-- SELECT r.nom_recette
-- FROM recette r
-- WHERE r.id_recette NOT IN (
--     SELECT co.id_recette
--     FROM composer co
--     WHERE co.qte >= 1
-- )


/*EXO 18*/

-- SELECT ingredient.nom_ingredient,COUNT(DISTINCT composer.id_recette) AS nbrecettes
-- FROM composer co, ingredient i
-- INNER JOIN i ON co.id_ingredient = i.id_ingredient
-- HAVING nbrecettes > 2;


/*EXO 19*/

-- INSERT INTO ingredient
-- (id_ingredient, nom_ingredient, unite_mesure, prix)
-- VALUE
-- (16, 'textInsert15', 'Test', 1.5)


-- INSERT INTO composer
-- (qte, id_recette, id_ingredient)
-- VALUE
-- (3, 9, 16)



-- REMOVE FROM ingredient
-- WHERE id_ingredient = 15


-- REMOVE FROM composer
-- WHERE id_ingredient = 15


/*exo 20*/
/*
SELECT r.nom_recette, SUM(i.prix * co.qte)
FROM recette r, composer co, ingredient i
WHERE r.id_recette IN (

)*/

/*index.php*/
SELECT r.nom_recette, c.nom_categorie, r.tps_preparation
FROM recette r
INNER JOIN categorie c ON r.id_categorie = c.id_categorie
GROUP BY r.id_recette
ORDER BY r.nom_recette;

/*detailRecette.php*/
SELECT r.nom_recette, r.instructions, c.nom_categorie, r.tps_preparation
FROM recette r
INNER JOIN categorie c ON r.id_categorie = c.id_categorie
WHERE r.id_recette = 7;

SELECT i.nom_ingredient, co.qte
FROM recette r
INNER JOIN composer co ON r.id_recette = co.id_recette
INNER JOIN ingredient i ON co.id_ingredient = i.id_ingredient
WHERE r.id_recette = 7;