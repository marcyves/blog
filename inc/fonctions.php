<?php
/**
 * 
 * Marc Augier
 * (c) 2020
 */
function debut($titre){
    global $config, $id_utilisateur;

    if(!is_dir("theme/".$config['theme'])){
        echo "<br>Erreur: dossier thème inexistant";
    }
    if(!is_dir($config['dossier_pages'])){
        echo "<br>Erreur: installation du dossier des pages";
    }else{
        if(!is_file($config['dossier_pages'].$config['accueil'].".php")){
            echo "<br>Erreur: page d'accueil inexistante";
        }
    }

    $id_utilisateur =testeConnexionUtilisateur();

?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="theme/<?php echo $config['theme']; ?>/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $titre; ?></title>
</head>
<body>
    <header>
        <h1><?php echo $titre; ?></h1>
        <p>Des news, des vraies</p>
        <?php
        menu($config['dossier_pages']);
        ?>
    </header>
    <main>
<?php
}

function testeConnexionUtilisateur(){
    /**
     * Retourne 0 si pas connecté
     * ou l'id de l'auteur si connecté
     */
    // Gestion du cookie de connexion
    if(isset($_COOKIE['utilisateur'])){
        // l'utilisateur est connecté
        if (isset($_GET['deconnexion'])){
            $id = 0;
            // On efface le cookie
            setcookie("utilisateur",$id,time()-60*5);   
        }else{
            // L'utilisateur est déjà connecté
            $id = $_COOKIE['utilisateur'];
            // On relance le cookie pour 5 minutes
            setcookie("utilisateur",$id,time()+60*5);
        }
    }else{
        // L'utilisateur n'est pas connecté
        if (isset($_GET['connexion'])){
                // L'utilisateur a demandé à se connecter
                $id = $_GET['auteur'];
                setcookie("utilisateur",$id,time()+60*5);            
        }else{
            $id = 0;
        }
    }
    return $id;
}

function menu($dir){
    global $config, $id_utilisateur;

    // Ouvre un dossier bien connu, et liste tous les fichiers
    if (is_dir($dir)) {
        if ($dh = opendir($dir)) {
            echo "<nav>";
            while (($file = readdir($dh)) !== false) {
                if (($file != ".") 
                 && ($file != "..") 
                 && ($file != $config["erreur"].".php")
                 && ($file != "connexion.php")
                ){
                    $label = substr($file,0, strlen($file)-4);
                    lienMenu($label);
                }
            }
            closedir($dh);

            if($id_utilisateur != 0 ){
                echo '<a href="?page=article&deconnexion=ok">Déconnexion</a>';
            }else{
                lienMenu("connexion");
            }
            echo "</nav>";
        }

    }
}

function lienMenu($label){
    echo '<a href="?page='.$label.'">'.ucfirst($label).'</a> ';
}

function db(){
    global $dbh, $config;

    $dbname = $config['dbname'];
    $user   = $config['user'];
    $pass   = $config['pass'];
    
    try{
        $dbh = new PDO("mysql:host=localhost;dbname=$dbname", $user, $pass);
        if ($config['mode']=="dev"){
            // Le message en mode développement
            echo "La connexion à la base de donnée est faite";
        }
        return true;
    }catch (PDOException $e) {
        if ($config['mode']=="dev"){
            // Le message en mode développement
            echo "Erreur : " . $e->getMessage() . "<br/>";
        }
        return false;
    }
}

function fin($page){
    global $dbh, $config;

    include $config['dossier_pages'].$page.".php";
?>
</main>
    <footer>
        &copy; Marc Augier
    </footer>
</body>
</html>
<?php
}