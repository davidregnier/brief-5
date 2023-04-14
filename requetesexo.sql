-- Trouver les noms des médecins, les adresses et les pays où ils pratiquent et les dates de leurs certificats médicaux.

SELECT Medecin.nom, Medecin.prenom, Adresse.adresse, Pays.nom_pays, Certificat_medical.date_certificat
FROM Medecin
JOIN Adresse ON Medecin.id_adresse = Adresse.id_adresse
JOIN Pays ON Adresse.id_pays = Pays.id_pays
JOIN Certificat_medical ON Medecin.id_medecin = Certificat_medical.id_medecin;

--------------------------------------

-- Trouver les noms des villes où se trouvent des médecins ayant délivré des certificats médicaux avant le 2 avril 2023, ainsi que le nombre de médecins dans chaque ville.

SELECT Ville.nom_ville, COUNT(Medecin.id_medecin) AS nb_medecins
FROM Medecin
JOIN Adresse ON Medecin.id_adresse = Adresse.id_adresse
JOIN Ville ON Adresse.id_ville = Ville.id_ville
JOIN Certificat_medical ON Medecin.id_medecin = Certificat_medical.id_medecin
WHERE Certificat_medical.date_certificat < '2023-04-02'
GROUP BY Ville.nom_ville;


-- Trouver le médecin traitant ayant le plus grand nombre de certificats médicaux délivrés

SELECT md.*
FROM Medecin md
INNER JOIN Certificat_medical cm ON md.id_medecin = cm.id_medecin
WHERE md.id_medecin = (
  SELECT id_medecin
  FROM Certificat_medical
  GROUP BY id_medecin
  ORDER BY COUNT(*) DESC
  LIMIT 1
);
