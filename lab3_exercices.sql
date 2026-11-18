-- 1.Ouvrages récents : récupérez les trois ouvrages les plus récemment ajoutés
SELECT * FROM ouvrage ORDER BY id DESC LIMIT 3;
-- 2.Auteurs à nom long : listez les auteurs dont le nom comporte au moins cinq caractères
SELECT * FROM auteur WHERE CHAR_LENGTH(nom) >= 5;
-- 3.Abonnés hors domaine : trouvez tous les abonnés dont l'email ne provient pas de example.com ni de test.org
SELECT nom, email FROM abonne WHERE email NOT LIKE '%@example.com' AND email NOT LIKE '%@test.org';
-- 4.Emprunts en retard : les emprunts dont la date de fin prévue est antérieure à aujourd'hui et dont date_retour_effective est NULL.
SELECT * FROM emprunt WHERE date_fin_prevue < CURDATE() AND date_retour_effective IS NULL;
-- 5.Statistiques par auteur : pour chaque auteur, indiquez le nombre total d'ouvrages et le nombre d'ouvrages disponibles.
SELECT a.id, a.nom, 
COUNT(o.id) AS total_ouvrages,
 SUM(CASE WHEN o.disponible = TRUE THEN 1 ELSE 0 END) AS disponibles FROM auteur a JOIN ouvrage o ON a.id = o.auteur_id GROUP BY a.id, a.nom;