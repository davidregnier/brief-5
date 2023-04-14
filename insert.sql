-- les pays
INSERT INTO Pays (nom_pays) VALUES
('France'),
('Allemagne'),
('Espagne'),
('Italie'),
('Royaume-Uni'),
('Pays-Bas'),
('Belgique'),
('Portugal'),
('Suisse'),
('Suède');

-- les villes
INSERT INTO Ville (nom_ville) VALUES
('Paris'),
('Berlin'),
('Madrid'),
('Rome'),
('Londres'),
('Amsterdam'),
('Bruxelles'),
('Lisbonne'),
('Genève'),
('Stockholm');

-- les codes_postaux
INSERT INTO Code_Postal (code_postal) VALUES
('75001'),
('75002'),
('75003'),
('75004'),
('75005'),
('75006'),
('75007'),
('75008'),
('75009'),
('75010');

INSERT INTO Adresse (adresse, id_pays, id_ville, id_code_postal) VALUES
('6 Rue de la Tisonnière', 1, 1, 9),
('Busch 12', 6, 6, 1),
('La Frétière', 1, 1, 9),
('12 Rue de la Paix', 1, 1, 1),
('45 Rue du Faubourg Saint-Honoré', 1, 1, 8),
('25 Rue des Francs-Bourgeois', 1, 1, 3),
('7 Rue de Rivoli', 1, 1, 4),
('30 Rue du Bac', 1, 1, 7),
('27 Rue Saint-Guillaume', 1, 1, 6),
('14 Rue de Castiglione', 4, 4, 5);

INSERT INTO Medecin (nom, prenom, mail, telephone, id_adresse) VALUES
('Duggan', 'Agatha', 'A.Dug@gmail.com', '+33 6 78 54 32 89', 1),
('Jonas', 'Karim', 'karim.jonas@gmail.com', '+45 13 46 79 82', 2),
('Martinez', 'Sacha', 'Samar@hotmail.com', '+336 11 56 84 93', 3),
('Dubois', 'Nathalie', 'nathalie.dubois@gmail.com', '+33 6 12 34 56 78', 4),
('Smith', 'John', 'john.smith@gmail.com', '+44 20 1234 5678', 5),
('Müller', 'Hans', 'hans.mueller@gmail.com', '+49 30 1234 5678', 6),
('Janssen', 'Liesbeth', 'liesbeth.janssen@gmail.com', '+31 6 12 34 56 78', 7),
('Lefèvre', 'Sophie', 'sophie.lefevre@gmail.com', '+32 2 123 45 67', 8),
('García', 'Juan', 'juan.garcia@gmail.com', '+34 91 123 45 67', 9),
('Lopes', 'Marta', 'marta.lopes@gmail.com', '+351 91 234 56 78', 10);

INSERT INTO Certificat_medical (date_certificat, id_medecin)
VALUES
('2023-04-01', 1),
('2023-03-28', 2),
('2023-03-29', 3),
('2023-04-02', 4),
('2023-03-31', 5),
('2023-04-03', 6),
('2023-04-05', 7),
('2023-04-07', 8),
('2023-04-06', 9),
('2023-04-04', 10);

-- plus le temps pour etre creatif ^^
INSERT INTO Fournisseur (nom, numero_facture, tel, mail) VALUES
('Fournisseur 1', '123456', '01 23 45 67 89', 'fournisseur1@mail.com'),
('Fournisseur 2', '789012', '06 12 34 56 78', 'fournisseur2@mail.com'),
('Fournisseur 3', '345678', '02 34 56 78 90', 'fournisseur3@mail.com'),
('Fournisseur 4', '901234', '03 45 67 89 01', 'fournisseur4@mail.com'),
('Fournisseur 5', '567890', '05 67 89 01 23', 'fournisseur5@mail.com');

INSERT INTO Magasin (nom, tel, mail, id_fournisseur) VALUES
('Magasin 1', '01 23 45 67 89', 'magasin1@mail.com', 1),
('Magasin 2', '06 12 34 56 78', 'magasin2@mail.com', 2),
('Magasin 3', '02 34 56 78 90', 'magasin3@mail.com', 3),
('Magasin 4', '03 45 67 89 01', 'magasin4@mail.com', 4),
('Magasin 5', '05 67 89 01 23', 'magasin5@mail.com', 5);

INSERT INTO Produit (nom_produit, prix, id_magasin) VALUES
('Produit 1', 10.99, 1),
('Produit 2', 9.99, 2),
('Produit 3', 8.99, 3),
('Produit 4', 11.99, 4),
('Produit 5', 7.99, 5);

INSERT INTO Genre (sexe) VALUES (1),(0),(1),(0),(1);

INSERT INTO Parrainage (parrain, couleur_carte) VALUES
('John Doe', 'red'),
('Jane Smith', 'red'),
('Bob Brown', 'red'),
('Alice Jones', 'red'),
('Tom Wilson', 'red');

INSERT INTO Connexion (login, password, question_secrete) VALUES
('johndoe123', 'Gertrude', 'le nom de ma grand mere?'),
('janesmith456', 'bleue', 'ma couleur favorite'),
('bobbrown789', 'pat', 'le nom de mon chien'),
('alicejones012', 'titanic', 'mon film préférée'),
('tomwilson345', 'tacos', 'plat favori');

INSERT INTO Carte_Bancaire (code_16_chiffre, date_d_expiration, cryptogramme) VALUES
('1234567890123456', '2024-12-31', 123),
('9876543210987654', '2023-06-30', 456),
('1111222233334444', '2025-09-30', 789),
('5555666677778888', '2024-03-31', 234),
('9999000011112222', '2023-11-30', 567);

INSERT INTO sauna (sauna) VALUES (1),(0),(1),(0),(1);

INSERT INTO clim (clim) VALUES (1),(0),(1),(0),(1);

INSERT INTO salle (type, nom) VALUES
('musculation', 'Salle de musculation A'),
('cardio', 'Salle de cardio B'),
('danse', 'Salle de danse C'),
('yoga', 'Salle de yoga D'),
('natation', 'Piscine E');

INSERT INTO equipement (type, nom) VALUES
('musculation', 'Barres de poids libres'),
('musculation', 'Machines à poulies'),
('cardio', 'Tapis de course'),
('cardio', 'Vélos elliptiques'),
('danse', 'Miroirs'),
('danse', 'Barres de ballet'),
('yoga', 'Tapis de yoga'),
('yoga', 'Bloc de yoga'),
('natation', 'Maillots de bain'),
('natation', 'Lunettes de natation');

INSERT INTO Abonnement (type, prix, bilan_IMC, acces_club) VALUES
('VIP', 200, 1, 1),
('premium version internationa', 175, 1, 1),
('Premium', 150, 1, 1),
('cycliste international', 150, 1, 0),
('cycliste d’eau douce', 100, 0, 1),
('le muscle est partout', 150, 0, 1),
('membre international', 135, 1, 1),
('brain-l fit international', 130, 0, 1),
('b less-fit', 125, 1, 1),
('membre', 100, 0, 1),
('coach', 50, 1, 1);

INSERT INTO Assureur (nom, contrat, telephone, mail, id_adresse) VALUES
('Allianz', 'Contrat 1', '01 02 03 04 05', 'contact@allianz.fr', 1),
('AXA', 'Contrat 2', '01 02 03 04 06', 'contact@axa.fr', 2);

INSERT INTO Club (nom, telephone, mail, licence, id_sauna, id_clim, id_salle, id_equipement, id_abonnement, id_assureur, id_adresse)
VALUES ('L.Santos mountain park', '01 02 03 04 07', 'contact@cluba.com', 'A-1234', 1, 1, 1, 1, 1, 1,2),
('Fleeca fit', '01 02 03 04 08', 'contact@clubb.com', 'B-5678', 2, 2, 2, 3, 3, 1,4),
('Diamond goal', '01 02 03 04 09', 'contact@clubc.com', 'C-9101', 3, 3, 3, 4, 4, 2,9);

INSERT INTO Coach (nom, prenom, id_abonnement) VALUES
('Dupont', 'Jean', 11),
('Martin', 'Julie', 11);

-- et la derniere ....!!!

INSERT INTO Membre (nom, prenom, age, horaire, mail, telephone, id_adresse, id_certificat_medical, id_connexion, id_carte_bancaire, id_genre, id_parrainage, id_coach, id_abonnement, id_club, id_produit) VALUES 
('Martin', 'Jean', 35, '9h-12h', 'jean.martin@example.com', '+33123456789', 1, 1, 1, 1, 1, 1, 1, 3, 1, 1),
('Durand', 'Sophie', 27, '14h-18h', 'sophie.durand@example.com', '+33765432198', 2, 2, 2, 2, 2, 2, 1, 1, 2, 2),
('Lefebvre', 'Antoine', 45, '8h-10h', 'antoine.lefebvre@example.com', '+33678901234', 3, 3, 3, 3, 1, 3, 2, 2, 3, 5),
('Leroy', 'Caroline', 29, '18h-20h', 'caroline.leroy@example.com', '+33654321098', 4, 4, 4, 4, 2, 4, 1, 3, 2, 4),
('Moreau', 'Pierre', 33, '12h-14h', 'pierre.moreau@example.com', '+33123456789', 5, 5, 5, 5, 1, 5, 1, 2, 1, 1);
