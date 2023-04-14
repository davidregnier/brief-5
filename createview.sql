-- Vue des informations des médecins avec leur adresse complète :

CREATE VIEW vue_medecins AS
SELECT m.nom, m.prenom, m.mail, m.telephone, CONCAT(a.adresse, ', ', v.nom_ville, ', ', c.code_postal, ', ', p.nom_pays) AS adresse_complete
FROM Medecin m
JOIN Adresse a ON m.id_adresse = a.id_adresse
JOIN Ville v ON a.id_ville = v.id_ville
JOIN Code_Postal c ON a.id_code_postal = c.id_code_postal
JOIN Pays p ON a.id_pays = p.id_pays;
----
SELECT * FROM vue_medecins

-------------