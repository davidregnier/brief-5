-- j'ai oublié la creation de la relation entre les table adresse et club , je m'en suis rendu compte au moments d'inserer des données a la table CLUB

-- Ajoute la colonne id_adresse à la table Club
ALTER TABLE Club ADD COLUMN id_adresse INT NOT NULL;

-- Ajoute la contrainte de clé étrangère à la colonne id_adresse de la table Club
ALTER TABLE Club ADD CONSTRAINT fk_club_adresse FOREIGN KEY (id_adresse) REFERENCES Adresse(id_adresse);