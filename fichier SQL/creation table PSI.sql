DROP DATABASE IF EXISTS plateforme;
CREATE DATABASE IF NOT EXISTS plateforme;

DROP TABLE IF EXISTS Utilisateur;
CREATE TABLE Utilisateur(
   Id_Utilisateur VARCHAR(50),
   Mot_de_Passe VARCHAR(50),
   PRIMARY KEY(Id_Utilisateur)
);

DROP TABLE IF EXISTS client;
CREATE TABLE client(
   IdClient VARCHAR(10),
   NomC VARCHAR(50),
   PrénomC VARCHAR(50),
   LatitudeC VARCHAR(50),
   LongitudeC VARCHAR(50),
   TelephoneC LONG,
   EmailC VARCHAR(50),
   regimeAlC VARCHAR(50),      
   Id_Utilisateur VARCHAR(50) NOT NULL,
   PRIMARY KEY(IdClient),
   UNIQUE(Id_Utilisateur),
   FOREIGN KEY(Id_Utilisateur) REFERENCES Utilisateur(Id_Utilisateur)
);

DROP TABLE IF EXISTS cuisinier;
CREATE TABLE cuisinier(
   IDCuisinier VARCHAR(10),
   nomP VARCHAR(50),
   prenomP VARCHAR(50),
   LatitudeP VARCHAR(50),
   LongitudeP VARCHAR(50),
   adresseP VARCHAR(50),
   telephoneP LONG,
   emailP VARCHAR(50),
   spécialités VARCHAR(50),
   Id_Utilisateur CHAR(50) NOT NULL,
   PRIMARY KEY(IDCuisinier),
   UNIQUE(Id_Utilisateur),
   FOREIGN KEY(Id_Utilisateur) REFERENCES Utilisateur(Id_Utilisateur)
);

DROP TABLE IF EXISTS commande;
CREATE TABLE Commande(
   IdCommande VARCHAR(10),
   IdClient VARCHAR(10),
   dateComm DATETIME,
   PRIMARY KEY(IdCommande),
   FOREIGN KEY(IdClient) REFERENCES Client(IdClient)
);
#ALTER TABLE commande ADD dateComm DATETIME;   #type datetime: YYYY-MM-DD HH:MM:SS

#ALTER TABLE client MODIFY COLUMN LatitudeC DECIMAL(9,6);
#ALTER TABLE client MODIFY COLUMN LongitudeC DECIMAL(9,6);
#ALTER TABLE cuisinier MODIFY COLUMN LatitudeP DECIMAL(9,6);
#ALTER TABLE cuisinier MODIFY COLUMN LongitudeP DECIMAL(9,6);

CREATE TABLE Plat(
   Id_Plat VARCHAR(10),
   NomP CHAR(50),
   DateFabP DATETIME,
   typeP VARCHAR(50),
   DateP DATETIME,
   Prix DECIMAL(15,2),
   Nationalité CHAR(50),
   Rég_ali CHAR(50),
   IngrP VARCHAR(50),
   Nb_portionsP INT,
   photoP BLOB,            #type de données binaires
   IDCuisinier VARCHAR(10),
   PRIMARY KEY(Id_Plat),
   FOREIGN KEY(IDCuisinier) REFERENCES Cuisinier(IDCuisinier)
);
DROP TABLE Plat;

CREATE TABLE constituer_de_(
   Id_Plat VARCHAR(10),
   IdCommande VARCHAR(10),
   PRIMARY KEY(Id_Plat, IdCommande),
   FOREIGN KEY(Id_Plat) REFERENCES Plat(Id_Plat),
   FOREIGN KEY(IdCommande) REFERENCES Commande(IdCommande)
);
DROP TABLE constituer_de_;

DROP TABLE IF EXISTS evaluer;
CREATE TABLE evaluer(
   IdClient VARCHAR(10),
   IDCuisinier VARCHAR(10),
   Note INT,
   commentaire VARCHAR(500),
   PRIMARY KEY(IdClient, IDCuisinier),
   FOREIGN KEY(IdClient) REFERENCES Client(IdClient),
   FOREIGN KEY(IDCuisinier) REFERENCES Cuisinier(IDCuisinier)
);

DROP TABLE IF EXISTS livrer;
CREATE TABLE livrer(
   IDCuisinier VARCHAR(10),
   IdCommande VARCHAR(10),
   AdresseDep VARCHAR(50),
   AdresseArr VARCHAR(50),
   Distance_ DECIMAL(15,2),
   CheminOpt VARCHAR(900),
   Statut VARCHAR(50),
   PRIMARY KEY(IDCuisinier, IdCommande),
   FOREIGN KEY(IDCuisinier) REFERENCES Cuisinier(IDCuisinier),
   FOREIGN KEY(IdCommande) REFERENCES Commande(IdCommande)
);

DESCRIBE client;


