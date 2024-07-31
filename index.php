<?php
try {
    $mysqlClient = new PDO('mysql:host=localhost;dbname=exo_recettes;charset=utf8', 'root', '');
} catch (Exception $e) {
    die('Erreur : ' . $e->getMessage());
}

$sqlQuery = 'SELECT r.nom_recette, c.nom_categorie, r.tps_preparation
FROM recette r
INNER JOIN categorie c ON r.id_categorie = c.id_categorie
GROUP BY r.id_recette
ORDER BY r.nom_recette';
$recipesStatement = $mysqlClient->prepare($sqlQuery);
$recipesStatement->execute();
$recipes = $recipesStatement->fetchAll();

// $minute = "";
// if($recipe['tps_preparation' > 1]){
//     $minute = "minutes";           
// }
// else {
//     $minute = "minute";
// }


echo '<table border="1" style="border-collapse: collapse; text-align: center;">';
echo '<tr><th>Recette</th> <th>Catégorie</th> <th>Temps de préparation</th></tr>';
foreach ($recipes as $recipe) {
?>
    <tr>
        <td><?php echo $recipe['nom_recette']; ?></td>
        <td><?php echo $recipe['nom_categorie']; ?></td>
        <td><?php echo $recipe['tps_preparation']; ?> minutes</td>
    </tr>
<?php
}
echo '</table>';
?>