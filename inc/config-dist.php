<?php
/**
 * 
 * Marc Augier
 * (c) 2020
 */

// Installation du 'framework'
$config['dossier_pages'] = "controleur/";
$config['theme']         = "base";
$config['accueil']       = "auteur";
$config['erreur']       = "erreur-bdd";

// dev pour avoir les messages d'information
$config['mode']          = "prod"; 

// Base de données
$config['dbname']        = "blog";
$config['user']          = "<utilisateur MySQL>";
$config['pass']          = "<mot de passe MySQL>";
