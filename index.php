<?php
try {
    $mysqlClient = new PDO('mysql:host=localhost;dbname=exo_recettes;charset=utf8', 'root', '');
} catch (Exception $e) {
    die('Erreur : ' . $e->getMessage());
}

$sqlQuery = 'SELECT r.nom_recette, c.nom_categorie, r.tps_preparation, r.id_recette
FROM recette r
INNER JOIN categorie c ON r.id_categorie = c.id_categorie
GROUP BY r.id_recette
ORDER BY r.nom_recette';
$recipesStatement = $mysqlClient->prepare($sqlQuery);
$recipesStatement->execute();
$recipes = $recipesStatement->fetchAll();


echo '<table>';
echo '<tr><th>Recette</th> <th>Catégorie</th> <th>Temps de préparation</th></tr>';
foreach ($recipes as $recipe) {
?>
    <tr>
        <td>  <a href="detailRecette.php?id=<?php echo $recipe['id_recette']; ?>&nom=<?php echo $recipe['nom_recette']; ?>">  <?php echo $recipe['nom_recette']; ?></a></td>
        <td><?php echo $recipe['nom_categorie']; ?></td>
        <td><?php echo $recipe['tps_preparation']; ?> minutes</td>
    </tr>
<?php
}
echo '</table>';

require_once('style.php')
?>



<!-- /*index.php*/
SELECT r.nom_recette, c.nom_categorie, r.tps_preparation
FROM recette r
INNER JOIN categorie c ON r.id_categorie = c.id_categorie
GROUP BY r.id_recette
ORDER BY r.nom_recette; -->