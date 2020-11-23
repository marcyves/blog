<?php
/**
 * 
 * Marc Augier
 * (c) 2020
 */
include "inc/config.php";     // Personnalisations
include "inc/fonctions.php";  // Moteur principal commun à tous les sites

if (db()){
    // La connexion BDD est ok, site normal
    if(isset($_GET['page'])){
        $page = $_GET['page'];
    }else{
        $page = $config['accueil'];
    }
}else{
    // La BDD n'est pas accessible
    // Affiche une page statique d'erreur
    $page = "erreur-bdd";
}

debut("Le Blog version 2");
fin($page);