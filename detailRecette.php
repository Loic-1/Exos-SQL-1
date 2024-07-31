<html>

<body>

    <h2>Détails pour la recette "<?php echo $_GET["nom"]; ?>": </h2><br><br>

</body>

</html>




<?php
try {
    $mysqlClient = new PDO('mysql:host=localhost;dbname=exo_recettes;charset=utf8', 'root', '');
} catch (Exception $e) {
    die('Erreur : ' . $e->getMessage());
}

$sqlQuery = 'SELECT r.nom_recette, r.instructions, c.nom_categorie, r.tps_preparation, r.image_recette
FROM recette r
INNER JOIN categorie c ON r.id_categorie = c.id_categorie
WHERE r.id_recette = ' . $_GET["id"] . '';
$recipesStatement = $mysqlClient->prepare($sqlQuery);
$recipesStatement->execute();
$recipes = $recipesStatement->fetchAll();


echo '<table>';
echo '<tr><th>Recette</th> <th>Instructions</th> <th>Catégorie</th> <th>Temps de préparation</th></tr>';
foreach ($recipes as $recipe) {
?>
    <tr>
        <td><?php echo $recipe['nom_recette']; ?></a></td>
        <td><?php echo $recipe['instructions']; ?></a></td>
        <td><?php echo $recipe['nom_categorie']; ?></td>
        <td><?php echo $recipe['tps_preparation']; ?> minutes</td>
        <td><img src="<?php echo $recipe['image_recette'] ?>" alt=""></td>
    </tr>
<?php
}
echo '</table>';




$sqlQuery = 'SELECT i.nom_ingredient, co.qte
FROM recette r
INNER JOIN composer co ON r.id_recette = co.id_recette
INNER JOIN ingredient i ON co.id_ingredient = i.id_ingredient
WHERE r.id_recette = ' . $_GET["id"] . '';
$ingredientsStatement = $mysqlClient->prepare($sqlQuery);
$ingredientsStatement->execute();
$ingredients = $ingredientsStatement->fetchAll();


echo '<table>';
echo '<tr><th>Ingrédient</th> <th>Quantité</th></tr>';
foreach ($ingredients as $ingredient) {
?>
    <tr>
        <td><?php echo $ingredient['nom_ingredient']; ?></a></td>
        <td><?php echo $ingredient['qte']; ?></a></td>
    </tr>
<?php
}
echo '</table>';

require_once('style.php')
?>



<!-- 
/*detailRecette.php*/
SELECT r.nom_recette, r.instructions, c.nom_categorie, r.tps_preparation
FROM recette r
INNER JOIN categorie c ON r.id_categorie = c.id_categorie
WHERE r.id_recette = 7;

SELECT i.nom_ingredient, co.qte
FROM recette r
INNER JOIN composer co ON r.id_recette = co.id_recette
INNER JOIN ingredient i ON co.id_ingredient = i.id_ingredient
WHERE r.id_recette = 7 -->