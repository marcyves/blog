<?php

echo "<h1>Ecrire un nouvel article</h1>";

print_r($_GET);

if (isset($_GET['cmd'])){
    if($_GET['cmd'] == 'Enregistrer'){
        $sql ="INSERT INTO article(id_article, titre, texte, auteur) VALUES(NULL, :titre, :texte, :auteur);";

        $req = $dbh->prepare($sql);
        $req->execute(array('titre' => $_GET['titre'], 'texte' => $_GET['texte'], 'auteur' => $_GET['auteur']));

        echo "<h2>Nouvel article enregistré</h2>";

    }
}

?>
<form>
<input type="hidden" name="page" value="ecrire"><br>
<input type="text" placeholder="Titre de l'article" name="titre"><br>
    <textarea name="texte"></textarea><br>
    <?php

$sql = "SELECT id, nom, prénom FROM auteur ORDER BY prénom, nom";

echo "<select name='auteur'>";
foreach ($dbh->query($sql) as $ligne) {
    echo "<option value=".$ligne['id'].">".$ligne['prénom']." ".$ligne['nom']."$tmp</option>";
}
echo "</select><br>";


echo '<input type="submit" name="cmd" value="Enregistrer">
</form>';
