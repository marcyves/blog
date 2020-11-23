<?php

if(isset($_GET['article'])){

    $id = $_GET['article'];
    $sql = "SELECT titre, texte, nom, prénom 
            FROM article, auteur 
            WHERE id = auteur AND id_article = :id_art";

    $req = $dbh->prepare($sql);

    if ($req->execute(array('id_art' => $id))){
        if ($req->rowCount()>0){
            $article = $req->fetch();       
            echo "<h2>Détail d'un article</h2>";
            echo "<h3>".$article['titre']."</h3>
            <p>"
            .$article['texte']."
            </p>
            <i>".$article['prénom']." ".$article['nom']."</i>";
        }else{
            echo "<h2>Pas de détail disponible</h2>";
        }
    }else{
        echo "<h2>Requête invalide</h2>";
    }
    // Debug
    if ($dbh->errorInfo()[0] != 0){
        echo "<h3>Erreur SQL : ".$dbh->errorInfo()[1]." ".$dbh->errorInfo()[2]."</h3>";
    }
}else{
    echo "<h2>Liste des articles version 2</h2>";

    $sql = "SELECT id_article, nom, prénom, titre FROM article, auteur WHERE id = auteur ORDER BY titre";

    echo "<ol type='a'>";
    foreach ($dbh->query($sql) as $ligne) {
        echo "<li><a href='?page=article&article=".$ligne['id_article']."'>".$ligne['titre']."</a> (".$ligne['prénom']." ".$ligne['nom'].")</li>";
    }
    echo "</ol>";
}

?>