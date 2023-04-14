DROP TABLE IF EXISTS Pays;
CREATE TABLE Pays (
  id_pays INT NOT NULL AUTO_INCREMENT,
  nom_pays VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_pays)
);

DROP TABLE IF EXISTS Ville;
CREATE TABLE Ville (
  id_ville INT NOT NULL AUTO_INCREMENT,
  nom_ville VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_ville)
);

DROP TABLE IF EXISTS Code_Postal;
CREATE TABLE Code_Postal (
  id_code_postal INT NOT NULL AUTO_INCREMENT,
  code_postal VARCHAR(10) NOT NULL,
  PRIMARY KEY (id_code_postal)
);

DROP TABLE IF EXISTS Adresse;
CREATE TABLE Adresse (
  id_adresse INT NOT NULL AUTO_INCREMENT,
  adresse VARCHAR(100) NOT NULL,
  id_pays INT NOT NULL,
  id_ville INT NOT NULL,
  id_code_postal INT NOT NULL,
  PRIMARY KEY (id_adresse),
  CONSTRAINT fk_adresse_pays FOREIGN KEY (id_pays) REFERENCES Pays(id_pays),
  CONSTRAINT fk_adresse_ville FOREIGN KEY (id_ville) REFERENCES Ville(id_ville),
  CONSTRAINT fk_adresse_code_postal FOREIGN KEY (id_code_postal) REFERENCES Code_Postal(id_code_postal)
);

DROP TABLE IF EXISTS Medecin;
CREATE TABLE Medecin (
  id_medecin INT NOT NULL AUTO_INCREMENT,
  nom VARCHAR(50) NOT NULL,
  prenom VARCHAR(50) NOT NULL,
  mail VARCHAR(100) NOT NULL,
  telephone VARCHAR(20) NOT NULL,
  id_adresse INT NOT NULL,
  PRIMARY KEY (id_medecin),
  CONSTRAINT fk_Medecin_adresse FOREIGN KEY (id_adresse) REFERENCES Adresse(id_adresse)
);

DROP TABLE IF EXISTS Certificat_Medical;
CREATE TABLE Certificat_medical (
  id_certificat_medical INT NOT NULL AUTO_INCREMENT,
  date_certificat DATE NOT NULL,
  id_medecin INT NOT NULL,
  PRIMARY KEY (id_certificat_medical),
  CONSTRAINT fk_certificat_medical_medecin FOREIGN KEY (id_medecin) REFERENCES Medecin(id_medecin)
);

DROP TABLE IF EXISTS Fournisseur;
CREATE TABLE Fournisseur (
  id_fournisseur INT NOT NULL AUTO_INCREMENT,
  nom VARCHAR(50) NOT NULL,
  numero_facture VARCHAR(20) NOT NULL,
  tel VARCHAR(20) NOT NULL,
  mail VARCHAR(100) NOT NULL,
  PRIMARY KEY (id_fournisseur)
);

DROP TABLE IF EXISTS Magasin;
CREATE TABLE Magasin (
  id_magasin INT NOT NULL AUTO_INCREMENT,
  nom VARCHAR(50) NOT NULL,
  tel VARCHAR(20) NOT NULL,
  mail VARCHAR(100) NOT NULL,
  id_fournisseur INT NOT NULL,
  PRIMARY KEY (id_magasin),
  CONSTRAINT fk_magasin_fournisseur FOREIGN KEY (id_fournisseur) REFERENCES Fournisseur(id_fournisseur)
);

DROP TABLE IF EXISTS Produit;
CREATE TABLE Produit (
  id_produit INT NOT NULL AUTO_INCREMENT,
  nom_produit VARCHAR(50) NOT NULL,
  prix FLOAT NOT NULL,
  id_magasin INT NOT NULL,
  PRIMARY KEY (id_produit),
  CONSTRAINT fk_produit_magasin FOREIGN KEY (id_magasin) REFERENCES Magasin(id_magasin)
);

DROP TABLE IF EXISTS Genre;
CREATE TABLE Genre (
  id_genre INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  sexe BOOLEAN
);

DROP TABLE IF EXISTS Parrainage;
CREATE TABLE Parrainage (
  id_parrainage INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  parrain VARCHAR(50),
  couleur_carte VARCHAR(50)
);

DROP TABLE IF EXISTS Connexion;
CREATE TABLE Connexion (
  id_connexion INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  login VARCHAR(50),
  password VARCHAR(255),
  question_secrete VARCHAR(50)
);

DROP TABLE IF EXISTS Carte_Bancaire;
CREATE TABLE Carte_Bancaire (
  id_carte_bancaire INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  code_16_chiffre VARCHAR(16),
  date_d_expiration DATE,
  cryptogramme INT
);

DROP TABLE IF EXISTS sauna;
CREATE TABLE sauna (
  id_sauna INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  sauna BOOLEAN
);

DROP TABLE IF EXISTS clim;
CREATE TABLE clim (
  id_clim INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  clim BOOLEAN
);

DROP TABLE IF EXISTS salle;
CREATE TABLE salle (
  id_salle INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  type VARCHAR(50),
  nom VARCHAR(50)
);

DROP TABLE IF EXISTS equipement;
CREATE TABLE equipement (
  id_equipement INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  type VARCHAR(50),
  nom VARCHAR(50)
);

DROP TABLE IF EXISTS Abonnement;
CREATE TABLE Abonnement (
  id_abonnement INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  type VARCHAR(50),
  prix FLOAT,
  bilan_IMC INT,
  acces_club BOOLEAN
);

DROP TABLE IF EXISTS Coach;
CREATE TABLE Coach (
  id_coach INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nom VARCHAR(50),
  prenom VARCHAR(50),
  id_abonnement INT,
  CONSTRAINT fk_coach_abonnement FOREIGN KEY (id_abonnement) REFERENCES Abonnement(id_abonnement)
);

DROP TABLE IF EXISTS Assureur;
CREATE TABLE Assureur (
  id_assureur INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nom VARCHAR(50),
  contrat VARCHAR(50),
  telephone VARCHAR(20),
  mail VARCHAR(50),
  id_adresse INT,
  CONSTRAINT fk_assureur_adresse FOREIGN KEY (id_adresse) REFERENCES adresse(id_adresse)
);

DROP TABLE IF EXISTS Club;
CREATE TABLE Club (
  id_club INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nom VARCHAR(50),
  telephone VARCHAR(20),
  mail VARCHAR(50),
  licence VARCHAR(50),
  id_sauna INT,
  id_clim INT,
  id_salle INT,
  id_equipement INT,
  id_abonnement INT,
  id_assureur INT,
  CONSTRAINT fk_club_sauna FOREIGN KEY (id_sauna) REFERENCES sauna(id_sauna),
  CONSTRAINT fk_club_clim FOREIGN KEY (id_clim) REFERENCES clim(id_clim),
  CONSTRAINT fk_club_salle FOREIGN KEY (id_salle) REFERENCES salle(id_salle),
  CONSTRAINT fk_club_equipement FOREIGN KEY (id_equipement) REFERENCES equipement(id_equipement),
  CONSTRAINT fk_club_abonnement FOREIGN KEY (id_abonnement) REFERENCES Abonnement(id_abonnement),
  CONSTRAINT fk_club_assureur FOREIGN KEY (id_assureur) REFERENCES Assureur(id_assureur)
);

DROP TABLE IF EXISTS Membre;
CREATE TABLE Membre (
  id_membre INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nom VARCHAR(50),
  prenom VARCHAR(50),
  age INT,
  horaire VARCHAR(50),
  mail VARCHAR(50),
  telephone VARCHAR(20),
  id_adresse INT,
  id_certificat_medical INT,
  id_connexion INT,
  id_carte_bancaire INT,
  id_genre INT,
  id_parrainage INT,
  id_coach INT,
  id_abonnement INT,
  id_club INT,
  id_produit INT,
  CONSTRAINT fk_membre_adresse FOREIGN KEY (id_adresse) REFERENCES adresse(id_adresse),
  CONSTRAINT fk_membre_certificat_medical FOREIGN KEY (id_certificat_medical) REFERENCES certificat_medical(id_certificat_medical),
  CONSTRAINT fk_membre_connexion FOREIGN KEY (id_connexion) REFERENCES connexion(id_connexion),
  CONSTRAINT fk_membre_carte_bancaire FOREIGN KEY (id_carte_bancaire) REFERENCES carte_bancaire(id_carte_bancaire),
  CONSTRAINT fk_membre_genre FOREIGN KEY (id_genre) REFERENCES genre(id_genre),
  CONSTRAINT fk_membre_parrainage FOREIGN KEY (id_parrainage) REFERENCES parrainage(id_parrainage),
  CONSTRAINT fk_membre_coach FOREIGN KEY (id_coach) REFERENCES coach(id_coach),
  CONSTRAINT fk_membre_abonnement FOREIGN KEY (id_abonnement) REFERENCES Abonnement(id_abonnement),
  CONSTRAINT fk_membre_club FOREIGN KEY (id_club) REFERENCES club(id_club),
  CONSTRAINT fk_membre_produit FOREIGN KEY (id_produit) REFERENCES produit(id_produit)
);