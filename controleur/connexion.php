<?php
/**
 * 
 * Marc Augier
 * (c) 2020
 */
echo "<h1>Connexion</h1>";

?>
<form>
<input type="hidden" name="page" value="article"><br>
<?php

$sql = "SELECT id, nom, prénom FROM auteur ORDER BY prénom, nom";

echo "<select name='auteur'>";
foreach ($dbh->query($sql) as $ligne) {
    echo "<option value=".$ligne['id'].">".$ligne['prénom']." ".$ligne['nom']."$tmp</option>";
}
echo "</select><br>";


echo '<input type="submit" name="cmd" value="Connexion">
</form>';
