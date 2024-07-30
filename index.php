<?php
try {
    // On se connecte à MySQL
    $mysqlClient = new PDO('mysql:host=localhost;dbname=recettes;charset=utf8', 'root', '');
} catch (Exception $e) {
    // En cas d'erreur, on affiche un message et on arrête tout
    die('Erreur : ' . $e->getMessage());
}
// Si tout va bien, on peut continuer

// On récupère tout le contenu de la table recipes
// $sqlQuery = 'SELECT nom_recette, id_recette FROM recette';
$sqlQuery = 'SELECT r.nom_recette, c.nom_categorie, r.tps_preparation
FROM recette r
INNER JOIN categorie c ON r.id_categorie = c.id_categorie
GROUP BY r.id_recette
ORDER BY r.nom_recette';
$recipesStatement = $mysqlClient->prepare($sqlQuery);
$recipesStatement->execute();
$recipes = $recipesStatement->fetchAll();

// On affiche chaque recette une à une
echo '<table border="1" style="border-collapse: collapse;">';
echo '<tr><th>Recette</th> <th>Catégorie</th> <th>Temps de préparation</th></tr>';
foreach ($recipes as $recipe) {
?>
    <tr>
        <td><?php echo $recipe['nom_recette']; ?></td>
        <td><?php echo $recipe['nom_categorie']; ?></td>
        <td><?php echo $recipe['tps_preparation']; ?></td>
    </tr>
<?php
echo '</table>';
}
?>