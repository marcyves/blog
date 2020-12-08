<?php
/**
 * 
 * Marc Augier
 * (c) 2020
 */

echo "<h2>".langue($langue,"liste-auteurs")."</h2>";

// Cette requête affiche uniquement les auteurs aui ont écrit un article
$sql = "SELECT A.nom, prénom, count(R.id_article) AS compte 
        FROM auteur A, article R 
        WHERE A.id = auteur
        GROUP BY A.nom, prénom ORDER BY prénom, nom";

// Cette requête affiche tous les auteurs
$sql = "SELECT A.nom, prénom, count(R.id_article) AS compte 
        FROM auteur A 
        LEFT JOIN article R ON A.id = auteur
        GROUP BY A.nom, prénom ORDER BY prénom, nom LIMIT 0,20";

echo "<ol type='1'>";
foreach ($dbh->query($sql) as $ligne) {
    if ($ligne['compte']==0){
        $tmp = "";
    }else{
        $tmp = " (".$ligne['compte'].")";
    }
    echo "<li>".$ligne['prénom']." ".$ligne['nom']."$tmp</li>";
}
echo "</ol>";

// Debug
if ($dbh->errorInfo()[0] != 0){
    echo "<h3>Erreur SQL : ".$dbh->errorInfo()[1]." ".$dbh->errorInfo()[2]."</h3>";
}

?>