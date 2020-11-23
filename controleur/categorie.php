<?php

echo "<h2>Liste des catégories</h2>";

$sql = "SELECT nom, count(id_article) AS compteur FROM categorie 
LEFT JOIN article_X_categorie ON id_categorie = categorie
LEFT JOIN article ON id_article = article
GROUP BY nom ORDER BY nom";

echo "<ol type='a'>";
foreach ($dbh->query($sql) as $ligne) {
    echo "<li>".$ligne['nom']." (".$ligne['compteur'].")</li>";
}
echo "</ol>";


// Debug
if ($dbh->errorInfo()[0] != 0){
    echo "<h3>Erreur SQL : ".$dbh->errorInfo()[1]." ".$dbh->errorInfo()[2]."</h3>";
}

?>