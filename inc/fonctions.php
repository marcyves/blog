<?php
/**
 * 
 * Marc Augier
 * (c) 2020
 */

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

function langueChoisie(){
    /**
     * Retourne la langue du site
     * FR ou EN
     */
    if (isset($_GET['langue'])){
        // L'utilisateur a demandé une traduction
        $langue = $_GET['langue'];
        // Il faudrait vérifier si la langue est supportée
        setcookie("langue",$langue,time()+60*5);            
    }else{
        // Gestion du cookie
        if(isset($_COOKIE['langue'])){
            $langue = $_COOKIE['langue'];
            // Il faudrait vérifier si la langue est supportée
            // On relance le cookie pour 5 minutes
            setcookie("langue",$langue,time()+60*5);
        }else{
            $langue = "FR";
        }
    }

    return $langue;
}

 function debut($titre){
    global $config, $id_utilisateur, $langue;

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
            if ($langue == "FR"){
                echo '<a class="lang" href="?langue=EN">English</a>';
            }else{
                echo '<a class="lang" href="?langue=FR">Français</a>';
            }
            ?>
        </header>
        <main>
        <div id='warped'>
                     <span class='w0'>B</span>
                     <span class='w1'>o</span>
                     <span class='w2'>n</span>
                     <span class='w3'>j</span>
                     <span class='w4'>o</span>
                     <span class='w5'>u</span>
                     <span class='w6'>r</span>
                     <span class='w7'> </span>
                     <span class='w8'>l</span>
                     <span class='w9'>e</span>
                     <span class='w10'>s</span>
                     <span class='w11'> </span>
                     <span class='w12'>a</span>
                     <span class='w13'>m</span>
                     <span class='w14'>i</span>
                     <span class='w15'>s</span>
        </div>

    <?php
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

function fin($page){
    global $dbh, $config, $langue;

    // On appelle le controleur
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

/*

Version traduction par include PHP

*/
function langue($langue, $label){

    if (file_exists("lang/$langue.php")){
        include_once "lang/$langue.php";
        if ($texte[$label]){
            $m = $texte[$label];
        }else{
            $m = "[$label]";
        }
    }else{
        $m= "[$label] langue non supportée [$langue]";
    }

    return $m;
}

/*
Version traduction par table MySQL
*/
function langueSQL($langue, $label){
    global $dbh;

    if(($langue == "FR") || ($langue == "EN")){
        /**
         * Avec marqueurs
         */
        // $sql = "SELECT texte FROM label WHERE langue = ? and label = ?";
        // $req = $dbh->prepare($sql);
        // $req->execute(array($langue, $label));
        /**
         * Avec paramètres nommés
         */
        $sql = "SELECT texte FROM label WHERE langue = :langue and label = :label";
        $req = $dbh->prepare($sql);
        $req->execute(array(":langue" => $langue, ":label" => $label));
        list($texte) = $req->fetch();
        // list est plus lisible que ceci: 
        // $texte = $req->fetch()[0];
        if($texte ==""){
            $texte = "[$label]";
        }
    }else {
        $texte = "[$label] non traduit, langue [$langue] non supportée";
    }

    return $texte;
}
/*
    Version traduction "codée en dur", directement dans PHP
*/
function languePHP($langue, $label){
    switch ($langue)
    {
        case "FR":
            switch($label){
                case "titre":
                    $texte = "Le blog traduit";
                break;
                case "liste-auteurs":
                    $texte = "Liste des auteurs";
                break;
                default:
                    $texte = "[$label] non traduit en [$langue]";
                }
        break;
        case "EN":
            switch($label){
                case "titre":
                    $texte = "The Translated Blog";
                break;
                default:
                    $texte = "[$label] non traduit en [$langue]";
            }
        break;
        default:
        $texte = "[$label] non traduit, langue [$langue] non supportée";
    }

    return $texte;
}