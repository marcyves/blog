-- Requête pour afficher le titre d'un article et ses categories
SELECT `titre`, nom FROM `article`
LEFT JOIN article_x_categorie ON id_article = article
LEFT JOIN categorie ON categorie = id_categorie
WHERE nom IS NOT NULL
ORDER BY titre;

-- Autre notation des JOINs
SELECT `titre`, nom FROM `article` , article_x_categorie, categorie
WHERE id_article = article AND categorie = id_categorie 
AND nom IS NOT NULL
ORDER BY titre;

-- Utilisation de GROUP BY
-- Les catégories par article
SELECT titre, count(nom) AS 'Nombre de catégories' FROM article
LEFT JOIN article_x_categorie ON id_article = article
LEFT JOIN categorie ON categorie = id_categorie
WHERE nom IS NOT NULL
GROUP BY titre
ORDER BY titre;

-- Les articles par catégorie
SELECT nom, count(titre) AS "Nombre d'articles" FROM article
LEFT JOIN article_x_categorie ON id_article = article
LEFT JOIN categorie ON categorie = id_categorie
WHERE nom IS NOT NULL
GROUP BY nom
ORDER BY nom;