SET SQL_SAFE_UPDATES = 0;  #enlever la protection des données 
SET SQL_SAFE_UPDATES = 1;  #protéger les données (on ne peut pas supprimer les données d'une table via la commande DELETE FROM table)

#insertion de données dans la table utilisateur(ne pas toucher)
#INSERT INTO utilisateur (Id_Utilisateur, Mot_de_Passe) VALUES ('Durand94', 'pohello23');
#INSERT INTO utilisateur (Id_Utilisateur, Mot_de_Passe) VALUES ('AdliBB', '14ell13');
#INSERT INTO utilisateur (Id_Utilisateur, Mot_de_Passe) VALUES ('Beubeu4', '2o213');
#INSERT INTO utilisateur (Id_Utilisateur, Mot_de_Passe) VALUES ('Marc92', 'zXB2lo');
#INSERT INTO utilisateur (Id_Utilisateur, Mot_de_Passe) VALUES ('Cyril23', 'fdazdo3');
#INSERT INTO utilisateur (Id_Utilisateur, Mot_de_Passe) VALUES ('Eminem1', '2dkéeo3');
#INSERT INTO utilisateur (Id_Utilisateur, Mot_de_Passe) VALUES ('Bertand2', '4nzs13');
#INSERT INTO utilisateur (Id_Utilisateur, Mot_de_Passe) VALUES ('AliceM', 'a1b2c3d4');
#INSERT INTO utilisateur (Id_Utilisateur, Mot_de_Passe) VALUES ('JulienD', 'j5k6l7m8');
#INSERT INTO utilisateur (Id_Utilisateur, Mot_de_Passe) VALUES ('ClaireL', 'c9d0e1f2');
#INSERT INTO utilisateur (Id_Utilisateur, Mot_de_Passe) VALUES ('ThomasR', 't3u4v5w6');
#INSERT INTO utilisateur (Id_Utilisateur, Mot_de_Passe) VALUES ('MarieG', 'm7n8o9p0');
#INSERT INTO utilisateur (Id_Utilisateur, Mot_de_Passe) VALUES ('PaulM', 'p2q3r4s5');
#INSERT INTO utilisateur (Id_Utilisateur, Mot_de_Passe) VALUES ('SophieL', 's6t7u8v9');
#INSERT INTO utilisateur (Id_Utilisateur, Mot_de_Passe) VALUES ('LucasD', 'l1m2n3o4');
#INSERT INTO utilisateur (Id_Utilisateur, Mot_de_Passe) VALUES ('EmmaG', 'e5f6g7h8');
#INSERT INTO utilisateur (Id_Utilisateur, Mot_de_Passe) VALUES ('AntoineR', 'a9b0c1d2');
DELETE FROM utilisateur;


#insertion de données dans la table client(ne pas toucher)
#INSERT INTO client (IdClient, NomC, PrénomC, AdresseC, TelephoneC , EmailC, regimeAlC, Id_Utilisateur) VALUES ('CL0', 'Durand', 'Medhy', 'rue du colisée', '12348653', 'Mdurand@gmail.com','halal','Durand94');
#INSERT INTO client (IdClient, NomC, PrénomC, AdresseC, TelephoneC , EmailC, regimeAlC, Id_Utilisateur) VALUES ('CL1', 'Adli', 'Bouzguenda', 'rue de Rivoli', '12314853', 'Abouzguenda@gmail.com','halal','AdliBB');
#INSERT INTO client (IdClient, NomC, PrénomC, AdresseC, TelephoneC, EmailC, regimeAlC, Id_Utilisateur)
#VALUES ('CL2', 'Lemoine', 'Benoit', 'rue de la République', '12345698', 'benoit.lemoine@example.com', 'végétarien', 'Beubeu4');
#INSERT INTO client (IdClient, NomC, PrénomC, AdresseC, TelephoneC, EmailC, regimeAlC, Id_Utilisateur)
#VALUES ('CL3', 'Dubois', 'Marc', 'avenue de la Liberté', '87654322', 'marc.dubois@example.com', 'sans gluten', 'Marc92');
#INSERT INTO client (IdClient, NomC, PrénomC, AdresseC, TelephoneC, EmailC, regimeAlC, Id_Utilisateur)
#VALUES ('CL4', 'Garnier', 'Cyril', 'boulevard de la Victoire', '12398765', 'cyril.garnier@example.com', 'halal', 'Cyril23');
#INSERT INTO client (IdClient, NomC, PrénomC, AdresseC, TelephoneC, EmailC, regimeAlC, Id_Utilisateur)
#VALUES ('CL5', 'Roche', 'Emi ', 'rue de la Paix', '55512365', 'emin.roche@example.com', 'rien', 'Eminem1');
#INSERT INTO client (IdClient, NomC, PrénomC, AdresseC, TelephoneC, EmailC, regimeAlC, Id_Utilisateur)
#VALUES ('CL6', 'Fournier', 'Bertrand', 'avenue des Champs', '98765433', 'bertrand.fournier@example.com', 'rien', 'Bertand2');
#INSERT INTO client (IdClient, NomC, PrénomC, AdresseC, TelephoneC, EmailC, regimeAlC, Id_Utilisateur)
#VALUES ('CL7', 'Dupont', 'Lucas', 'rue de la Victoire', '12345680', 'lucas.dupont@example.com', 'rien', 'LucasD');
#INSERT INTO client (IdClient, NomC, PrénomC, AdresseC, TelephoneC, EmailC, regimeAlC, Id_Utilisateur)
#VALUES ('CL8', 'Garnier', 'Emma', 'boulevard de la Paix', '87654325', 'emma.garnier@example.com', 'végétalien', 'EmmaG');
#INSERT INTO client (IdClient, NomC, PrénomC, AdresseC, TelephoneC, EmailC, regimeAlC, Id_Utilisateur)
#VALUES ('CL9', 'Roche', 'Antoine', 'avenue des Champs', '98765436', 'antoine.roche@example.com', 'sans lactose', 'AntoineR');
DELETE FROM client;


#insertion de données dans la table cusinier(ne pas toucher)
#INSERT INTO cuisinier (IdCuisinier, NomP, prenomP, AdresseP, telephoneP, EmailP, spécialités, Id_Utilisateur)
#VALUES ('CU1', 'Martin', 'Alice', 'rue de la République', '12345679', 'alice.martin@example.com', 'cuisine française', 'AliceM');
#INSERT INTO cuisinier (IdCuisinier, NomP, prenomP, AdresseP, TelephoneP, EmailP, spécialités, Id_Utilisateur)
#VALUES ('CU2', 'Dupont', 'Julien', 'avenue de la Victoire', '87654323', 'julien.dupont@example.com', 'pâtisserie', 'JulienD');
#INSERT INTO cuisinier (IdCuisinier, NomP, prenomP, AdresseP, TelephoneP, EmailP, spécialités, Id_Utilisateur)
#VALUES ('CU3', 'Lefèvre', 'Claire', 'boulevard de la Paix', '12398766', 'claire.lefevre@example.com', 'cuisine italienne', 'ClaireL');
#INSERT INTO cuisinier (IdCuisinier, NomP, prenomP, AdresseP, TelephoneP, EmailP, spécialités, Id_Utilisateur)
#VALUES ('CU4', 'Rousseau', 'Thomas', 'rue de la République', '55512366', 'thomas.rousseau@example.com', 'cuisine asiatique', 'ThomasR');
#INSERT INTO cuisinier (IdCuisinier, NomP, prenomP, AdresseP, TelephoneP, EmailP, spécialités, Id_Utilisateur)
#VALUES ('CU5', 'Gauthier', 'Marie', 'avenue des Champs', '98765434', 'marie.gauthier@example.com', 'cuisine végétarienne', 'MarieG');
#INSERT INTO cuisinier (IdCuisinier, NomP, prenomP, AdresseP, TelephoneP, EmailP, spécialités, Id_Utilisateur)
#VALUES ('CU6', 'Moreau', 'Paul', 'rue de la Victoire', '12345670', 'paul.moreau@example.com', 'cuisine méditerranéenne', 'PaulM');
#INSERT INTO cuisinier (IdCuisinier, NomP, prenomP, AdresseP, TelephoneP, EmailP, spécialités, Id_Utilisateur)
#VALUES ('CU7', 'Lemoine', 'Sophie', 'boulevard de la Paix', '87654324', 'sophie.lemoine@example.com', 'cuisine fusion', 'SophieL');
DELETE FROM cuisinier;


#insertion de données dans la table commande
-- Commande pour Medhy Durand (halal)
INSERT INTO Commande (IdCommande, IdClient) VALUES ('CM00', 'CL01');

-- Commande pour Adli Bouzguenda (halal)
INSERT INTO Commande (IdCommande, IdClient)VALUES ('CM01', 'CL01');

-- Commande pour Benoit Lemoine (végétarien)
INSERT INTO Commande (IdCommande, IdClient) VALUES ('CM02', 'CL02');

-- Commande pour Marc Dubois (sans gluten)
INSERT INTO Commande (IdCommande, IdClient) VALUES ('CM03', 'CL03');

-- Commande pour Cyril Garnier (halal)
INSERT INTO Commande (IdCommande, IdClient)VALUES ('CM04', 'CL04');

-- Commande pour Emin Roche (rien)
INSERT INTO Commande (IdCommande, IdClient) VALUES ('CM05', 'CL05');

-- Commande pour Bertrand Fournier (rien)
INSERT INTO Commande (IdCommande, IdClient) VALUES ('CM06', 'CL06');

-- Commande pour Lucas Dupont (rien)
INSERT INTO Commande (IdCommande, IdClient) VALUES ('CM07', 'CL07');

-- Commande pour Emma Garnier (végétalien)
INSERT INTO Commande (IdCommande, IdClient) VALUES ('CM08', 'CL08');

-- Commande pour Antoine Roche (sans lactose)
INSERT INTO Commande (IdCommande, IdClient) VALUES ('CM09', 'CL09');

DELETE FROM Commande;

#insertion de données dans la table plat
-- Plats pour Alice Martin (cuisine française)
INSERT INTO Plat (Id_Plat, NomP, DateFabP, typeP, DateP, Prix, Nationalité, Rég_ali, IngrP, Nb_portionsP, photoP, IDCuisinier)
VALUES ('P01', 'Ratatouille', '2023-10-01 10:00:00', 'Plat principal', '2023-10-01 12:00:00', 12.50, 'Française', 'végétarien', 'légumes', 4, NULL, 'CU01');

INSERT INTO Plat (Id_Plat, NomP, DateFabP, typeP, DateP, Prix, Nationalité, Rég_ali, IngrP, Nb_portionsP, photoP, IDCuisinier)
VALUES ('P02', 'Coq au vin', '2023-10-02 10:00:00', 'Plat principal', '2023-10-02 12:00:00', 18.00, 'Française', 'rien', 'poulet, vin', 2, NULL, 'CU01');

INSERT INTO Plat (Id_Plat, NomP, DateFabP, typeP, DateP, Prix, Nationalité, Rég_ali, IngrP, Nb_portionsP, photoP, IDCuisinier)
VALUES ('P03', 'Soupe à l’oignon', '2023-10-04 10:00:00', 'Entrée', '2023-10-04 12:00:00', 7.50, 'Française', 'végétarien', 'oignons, bouillon', 4, NULL, 'CU01');

-- Plats pour Marc Dubois (pâtisserie)
INSERT INTO Plat (Id_Plat, NomP, DateFabP, typeP, DateP, Prix, Nationalité, Rég_ali, IngrP, Nb_portionsP, photoP, IDCuisinier)
VALUES ('P04', 'Tarte aux fruits', '2023-10-01 08:00:00', 'Dessert', '2023-10-01 14:00:00', 8.00, 'Française', 'sans gluten', 'fruits, farine sans gluten', 6, NULL, 'CU01');

INSERT INTO Plat (Id_Plat, NomP, DateFabP, typeP, DateP, Prix, Nationalité, Rég_ali, IngrP, Nb_portionsP, photoP, IDCuisinier)
VALUES ('P05', 'Éclair au chocolat', '2023-10-02 08:00:00', 'Dessert', '2023-10-02 14:00:00', 6.50, 'Française', 'sans gluten', 'pâte sans gluten, chocolat', 6, NULL, 'CU01');

INSERT INTO Plat (Id_Plat, NomP, DateFabP, typeP, DateP, Prix, Nationalité, Rég_ali, IngrP, Nb_portionsP, photoP, IDCuisinier)
VALUES ('P06', 'Macarons', '2023-10-03 08:00:00', 'Dessert', '2023-10-03 14:00:00', 5.00, 'Française', 'sans gluten', 'amandes, sucre', 12, NULL, 'CU01');

INSERT INTO Plat (Id_Plat, NomP, DateFabP, typeP, DateP, Prix, Nationalité, Rég_ali, IngrP, Nb_portionsP, photoP, IDCuisinier)
VALUES ('P07', 'Mille-feuille', '2023-10-04 08:00:00', 'Dessert', '2023-10-04 14:00:00', 7.00, 'Française', 'sans gluten', 'pâte feuilletée sans gluten, crème', 6, NULL, 'CU01');

INSERT INTO Plat (Id_Plat, NomP, DateFabP, typeP, DateP, Prix, Nationalité, Rég_ali, IngrP, Nb_portionsP, photoP, IDCuisinier)
VALUES ('P08', 'Tarte au citron meringuée', '2023-10-05 08:00:00', 'Dessert', '2023-10-05 14:00:00', 6.00, 'Française', 'sans gluten', 'pâte sans gluten, citron', 8, NULL, 'CU01');

-- Plats pour Claire Lefèvre (cuisine italienne)
INSERT INTO Plat (Id_Plat, NomP, DateFabP, typeP, DateP, Prix, Nationalité, Rég_ali, IngrP, Nb_portionsP, photoP, IDCuisinier)
VALUES ('P09', 'Pizza Margherita', '2023-10-01 11:00:00', 'Plat principal', '2023-10-01 13:00:00', 10.00, 'Italienne', 'végétarien', 'tomates, mozzarella', 2, NULL, 'CU03');

INSERT INTO Plat (Id_Plat, NomP, DateFabP, typeP, DateP, Prix, Nationalité, Rég_ali, IngrP, Nb_portionsP, photoP, IDCuisinier)
VALUES ('P10', 'Lasagnes végétariennes', '2023-10-02 11:00:00', 'Plat principal', '2023-10-02 13:00:00', 13.50, 'Italienne', 'végétarien', 'pâtes, légumes', 4, NULL, 'CU03');

INSERT INTO Plat (Id_Plat, NomP, DateFabP, typeP, DateP, Prix, Nationalité, Rég_ali, IngrP, Nb_portionsP, photoP, IDCuisinier)
VALUES ('P11', 'Spaghetti aux légumes', '2023-10-04 11:00:00', 'Plat principal', '2023-10-04 13:00:00', 11.00, 'Italienne', 'végétarien', 'spaghetti, légumes', 3, NULL, 'CU03');

INSERT INTO Plat (Id_Plat, NomP, DateFabP, typeP, DateP, Prix, Nationalité, Rég_ali, IngrP, Nb_portionsP, photoP, IDCuisinier)
VALUES ('P12', 'Risotto aux champignons', '2023-10-03 11:00:00', 'Plat principal', '2023-10-03 13:00:00', 14.50, 'Italienne', 'végétarien', 'riz, champignons', 2, NULL, 'CU03');

INSERT INTO Plat (Id_Plat, NomP, DateFabP, typeP, DateP, Prix, Nationalité, Rég_ali, IngrP, Nb_portionsP, photoP, IDCuisinier)
VALUES ('P13', 'Bruschetta', '2023-10-05 11:00:00', 'Entrée', '2023-10-05 13:00:00', 8.50, 'Italienne', 'végétarien', 'pain, tomates', 6, NULL, 'CU03');

-- Plats pour Thomas Rousseau (cuisine asiatique)
INSERT INTO Plat (Id_Plat, NomP, DateFabP, typeP, DateP, Prix, Nationalité, Rég_ali, IngrP, Nb_portionsP, photoP, IDCuisinier)
VALUES ('P14', 'Sushi végétarien', '2023-10-01 09:00:00', 'Entrée', '2023-10-01 12:30:00', 15.00, 'Japonaise', 'végétarien', 'riz, légumes', 8, NULL, 'CU04');

INSERT INTO Plat (Id_Plat, NomP, DateFabP, typeP, DateP, Prix, Nationalité, Rég_ali, IngrP, Nb_portionsP, photoP, IDCuisinier)
VALUES ('P15', 'Ramen végétarien', '2023-10-02 09:00:00', 'Plat principal', '2023-10-02 12:30:00', 14.00, 'Japonaise', 'végétarien', 'nouilles, légumes', 1, NULL, 'CU04');

INSERT INTO Plat (Id_Plat, NomP, DateFabP, typeP, DateP, Prix, Nationalité, Rég_ali, IngrP, Nb_portionsP, photoP, IDCuisinier)
VALUES ('P16', 'Curry vert végétarien', '2023-10-04 09:00:00', 'Plat principal', '2023-10-04 12:30:00', 13.50, 'Thaïlandaise', 'végétarien', 'légumes, lait de coco', 2, NULL, 'CU04');

INSERT INTO Plat (Id_Plat, NomP, DateFabP, typeP, DateP, Prix, Nationalité, Rég_ali, IngrP, Nb_portionsP, photoP, IDCuisinier)
VALUES ('P17', 'Pad Thaï végétarien', '2023-10-03 09:00:00', 'Plat principal', '2023-10-03 12:30:00', 13.00, 'Thaïlandaise', 'végétarien', 'nouilles de riz, légumes', 1, NULL, 'CU04');

INSERT INTO Plat (Id_Plat, NomP, DateFabP, typeP, DateP, Prix, Nationalité, Rég_ali, IngrP, Nb_portionsP, photoP, IDCuisinier)
VALUES ('P18', 'Nouilles sautées aux légumes', '2023-10-05 09:00:00', 'Plat principal', '2023-10-05 12:30:00', 12.00, 'Chinoise', 'végétarien', 'nouilles, légumes', 2, NULL, 'CU04');

-- Plats pour Marie Gauthier (cuisine végétarienne)
INSERT INTO Plat (Id_Plat, NomP, DateFabP, typeP, DateP, Prix, Nationalité, Rég_ali, IngrP, Nb_portionsP, photoP, IDCuisinier)
VALUES ('P19', 'Quinoa aux légumes', '2023-10-01 10:30:00', 'Plat principal', '2023-10-01 12:45:00', 14.00, 'Internationale', 'végétarien', 'quinoa, légumes', 3, NULL, 'CU05');

INSERT INTO Plat (Id_Plat, NomP, DateFabP, typeP, DateP, Prix, Nationalité, Rég_ali, IngrP, Nb_portionsP, photoP, IDCuisinier)
VALUES ('P20', 'Curry de légumes', '2023-10-02 10:30:00', 'Plat principal', '2023-10-02 12:45:00', 15.00, 'Indienne', 'végétarien', 'légumes, épices', 2, NULL, 'CU05');

INSERT INTO Plat (Id_Plat, NomP, DateFabP, typeP, DateP, Prix, Nationalité, Rég_ali, IngrP, Nb_portionsP, photoP, IDCuisinier)
VALUES ('P21', 'Chili sin carne', '2023-10-04 10:30:00', 'Plat principal', '2023-10-04 12:45:00', 12.50, 'Mexicaine', 'végétarien', 'haricots, épices', 4, NULL, 'CU05');

INSERT INTO Plat (Id_Plat, NomP, DateFabP, typeP, DateP, Prix, Nationalité, Rég_ali, IngrP, Nb_portionsP, photoP, IDCuisinier)
VALUES ('P22', 'Salade de lentilles', '2023-10-03 10:30:00', 'Entrée', '2023-10-03 12:45:00', 10.00, 'Internationale', 'végétarien', 'lentilles, légumes', 4, NULL, 'CU05');

INSERT INTO Plat (Id_Plat, NomP, DateFabP, typeP, DateP, Prix, Nationalité, Rég_ali, IngrP, Nb_portionsP, photoP, IDCuisinier)
VALUES ('P23', 'Tajine de légumes', '2023-10-05 10:30:00', 'Plat principal', '2023-10-05 12:45:00', 13.00, 'Marocaine', 'végétarien', 'légumes, épices', 3, NULL, 'CU05');

-- Plats pour Paul Moreau (cuisine méditerranéenne)
INSERT INTO Plat (Id_Plat, NomP, DateFabP, typeP, DateP, Prix, Nationalité, Rég_ali, IngrP, Nb_portionsP, photoP, IDCuisinier)
VALUES ('P24', 'Salade grecque', '2023-10-01 11:30:00', 'Entrée', '2023-10-01 13:15:00', 9.50, 'Grecque', 'sans lactose', 'légumes, olives', 4, NULL, 'CU06');

INSERT INTO Plat (Id_Plat, NomP, DateFabP, typeP, DateP, Prix, Nationalité, Rég_ali, IngrP, Nb_portionsP, photoP, IDCuisinier)
VALUES ('P25', 'Couscous aux légumes', '2023-10-02 11:30:00', 'Plat principal', '2023-10-02 13:15:00', 12.00, 'Marocaine', 'végétarien', 'couscous, légumes', 3, NULL, 'CU06');

INSERT INTO Plat (Id_Plat, NomP, DateFabP, typeP, DateP, Prix, Nationalité, Rég_ali, IngrP, Nb_portionsP, photoP, IDCuisinier)
VALUES ('P26', 'Paella végétarienne', '2023-10-04 11:30:00', 'Plat principal', '2023-10-04 13:15:00', 14.00, 'Espagnole', 'végétarien', 'riz, légumes', 4, NULL, 'CU06');

INSERT INTO Plat (Id_Plat, NomP, DateFabP, typeP, DateP, Prix, Nationalité, Rég_ali, IngrP, Nb_portionsP, photoP, IDCuisinier)
VALUES ('P27', 'Tapenade', '2023-10-03 11:30:00', 'Entrée', '2023-10-03 13:15:00', 8.00, 'Française', 'végétarien', 'olives, câpres', 6, NULL, 'CU06');

INSERT INTO Plat (Id_Plat, NomP, DateFabP, typeP, DateP, Prix, Nationalité, Rég_ali, IngrP, Nb_portionsP, photoP, IDCuisinier)
VALUES ('P28', 'Bruschetta', '2023-10-05 11:30:00', 'Entrée', '2023-10-05 13:15:00', 8.50, 'Italienne', 'végétarien', 'pain, tomates', 6, NULL, 'CU06');

-- Plats pour Sophie Lemoine (cuisine fusion)
INSERT INTO Plat (Id_Plat, NomP, DateFabP, typeP, DateP, Prix, Nationalité, Rég_ali, IngrP, Nb_portionsP, photoP, IDCuisinier)
VALUES ('P29', 'Bowl végétalien', '2023-10-01 09:30:00', 'Plat principal', '2023-10-01 12:15:00', 15.50, 'Internationale', 'végétalien', 'riz, légumes', 1, NULL, 'CU07');

INSERT INTO Plat (Id_Plat, NomP, DateFabP, typeP, DateP, Prix, Nationalité, Rég_ali, IngrP, Nb_portionsP, photoP, IDCuisinier)
VALUES ('P30', 'Poke bowl végétalien', '2023-10-02 09:30:00', 'Plat principal', '2023-10-02 12:15:00', 16.00, 'Hawaïenne', 'végétalien', 'riz, légumes', 1, NULL,'CU07');

INSERT INTO Plat (Id_Plat, NomP, DateFabP, typeP, DateP, Prix, Nationalité, Rég_ali, IngrP, Nb_portionsP, photoP, IDCuisinier)
VALUES ('P31', 'Tacos végétaliens', '2023-10-04 09:30:00', 'Plat principal', '2023-10-04 12:15:00', 11.00, 'Mexicaine', 'végétalien', 'tortillas, légumes', 2, NULL, 'CU07');

INSERT INTO Plat (Id_Plat, NomP, DateFabP, typeP, DateP, Prix, Nationalité, Rég_ali, IngrP, Nb_portionsP, photoP, IDCuisinier)
VALUES ('P32', 'Sushi burrito végétarien', '2023-10-03 09:30:00', 'Plat principal', '2023-10-03 12:15:00', 14.50, 'Japonaise', 'végétarien', 'riz, légumes', 1, NULL, 'CU07');

INSERT INTO Plat (Id_Plat, NomP, DateFabP, typeP, DateP, Prix, Nationalité, Rég_ali, IngrP, Nb_portionsP, photoP, IDCuisinier)
VALUES ('P33', 'Salade de quinoa et fruits', '2023-10-05 09:30:00', 'Entrée', '2023-10-05 12:15:00', 13.00, 'Internationale', 'végétalien', 'quinoa, fruits', 2, NULL,'CU07');
DELETE FROM Plat;



#INSERT INTO evaluer (IdClient, IDCuisinier, Note, commentaire) (ne pas toucher)
#('CL1', 'CU3', 4, 'Les éclairs au chocolat étaient trop secs.'),
#('CL3', 'CU5', 5, 'Le sushi végétarien n’était pas frais.'),
#('CL7', 'CU6', 2, 'Le quinoa aux légumes était fade et mal cuit.'),
#('CL0', 'CU7', 4, 'La paella végétarienne manquait de goût.'),
#('CL6', 'CU5', 3, 'Le bowl végétalien était trop acide.'),
#('CL8', 'CU2', 5, 'La soupe à l’oignon était trop salée et trop liquide.'),
#('CL2', 'CU3', 4, 'La tarte au citron meringuée était trop sucrée.'),
#('CL5', 'CU7', 3, 'Les lasagnes végétariennes étaient sèches et sans saveur.'),
#('CL1', 'CU6', 4, 'Le curry de légumes était trop épicé et mal équilibré.'),
#('CL4', 'CU7', 3, 'La salade grecque manquait de fraîcheur.'),
#('CL7', 'CU2', 4, 'Le coq au vin était trop cuit et sec.'),
#('CL0', 'CU3', 3, 'Les macarons étaient durs et sans goût.'),
#('CL2', 'CU6', 3, 'Le chili sin carne était trop liquide.'),
#('CL9', 'CU5', 4, 'Le sushi burrito végétarien était mal roulé.');


#insertion de données dans la table livrer
INSERT INTO livrer (IDCuisinier, IdCommande, Distance_, CheminOpt, Statut)
VALUES
('CU01', 'CM01', NULL, '', 'livré'),
('CU03', 'CM02', NULL, '', 'non livré'),
('CU04', 'CM03', NULL, '', 'non livré'),
('CU04', 'CM04', NULL, '', 'livré'),
('CU07', 'CM05', NULL, '', 'livré'),
('CU07', 'CM06', NULL, '', 'non livré'),
('CU02', 'CM08', NULL, '', 'livré'),
('CU03', 'CM09', NULL, '', 'non livré');
  #on n'ecrit pas encore tout ce qui concerne les adresses
DELETE FROM livrer;



#insertion de données dans la table constituer_de
INSERT INTO constituer_de_(Id_Plat, IdCommande)
VALUES
('P01', 'CM01'), ('P02', 'CM01'), ('P03', 'CM01'), ('P04', 'CM03'), ('P05', 'CM03'),   #La commande 1 est constitué du plat 1,2 et 18
('P06','CM04'), ('P07', 'CM04'), ('P08', 'CM05'), ('P09', 'CM06'), ('P10', 'CM06'),  #La commande 2 est constitué du plat 3 et 19....
('P11', 'CM07'), ('P12', 'CM07'), ('P13', 'CM08'), ('P14', 'CM09'), ('P15', 'CM09'),
('P16', 'CM09'), ('P17', 'CM09'), ('P18', 'CM01'), ('P19', 'CM02'), ('P20', 'CM03');
DELETE FROM constituer_de_;

#insertion de données dans la table evaluer
INSERT INTO evaluer (IdClient, IDCuisinier, Note, commentaire)
VALUES
('CL01', 'CU02', 9, 'Le coq au vin était délicieux, bien assaisonné!'),
('CL04', 'CU03', 7, 'La tarte aux fruits était bonne, mais un peu trop sucrée.'),
('CL07', 'CU05', 6, 'Le ramen végétarien manquait un peu de saveur.'),
('CL01', 'CU06', 10, 'Le quinoa aux légumes était incroyable, très bien cuit!'),
('CL06', 'CU07', 9, 'La paella végétarienne était délicieuse et copieuse.'),
('CL08', 'CU05', 8, 'Le bowl végétalien était frais et savoureux.'),
('CL05', 'CU03', 9, 'Les macarons étaient parfaits, texture idéale!'),
('CL09', 'CU07', 8, 'Les lasagnes végétariennes étaient très bonnes, bien équilibrées.'),
('CL01', 'CU05', 6, 'Le curry vert végétarien était bon mais trop épicé.'),
('CL04', 'CU06', 10, 'Le curry de légumes était parfait, plein de saveurs!'),
('CL03', 'CU07', 9, 'La salade grecque était fraîche et bien assaisonnée.'),
('CL02', 'CU02', 7, 'La ratatouille était bonne mais un peu trop cuite.'),
('CL06', 'CU03', 9, 'Le mille-feuille était excellent, très léger.'),
('CL08', 'CU07', 8, 'Le risotto aux champignons était crémeux et savoureux.'),
('CL02', 'CU05', 7, 'Les nouilles sautées aux légumes étaient bonnes mais un peu fades.'),
('CL05', 'CU06', 10, 'Le chili sin carne était incroyable, très épicé!');
DELETE FROM evaluer;


# Requêtes:

SELECT * FROM utilisateur;                  
SELECT * FROM client ORDER BY nomC ASC;
SELECT * FROM cuisinier ORDER BY nomP ASC;
SELECT * FROM Commande;
SELECT * FROM Plat ORDER By prix ASC;     
SELECT * FROM evaluer;
SELECT * FROM livrer;
SELECT * FROM constituer_de;

SELECT Id_Utilisateur          #Les utilisateurs qui sont à la fois des clients et des cuisiniers
FROM utilisateur
WHERE Id_Utilisateur IN (SELECT Id_Utilisateur FROM cuisinier)
  AND Id_Utilisateur IN (SELECT Id_Utilisateur FROM client);
  
SELECT count(*) as Nb_Utilisateur FROM utilisateur;  #on compte le nombre de données de chaque table
SELECT count(*) as Nb_Client FROM client;
SELECT count(*) as Nb_cuisinier FROM cuisinier;
SELECT count(*) as Nb_Commande FROM commande;
SELECT count(*) as Nb_Plat FROM Plat;
SELECT count(*) as Nb_evaluation FROM evaluer;
SELECT count(*)  FROM livrer;
SELECT count(*)  FROM constituer_de;

SELECT AVG(Note) as Moyenne_Note FROM evaluer;   #moyenne de toutes les notes

SELECT Count(*) as Nb_commande_livré FROM livrer WHERE Statut='livré';   # nb de commande ayant le statut "livré"
SELECT Count(*) as Nb_bonne_evaluation FROM evaluer WHERE Note IN(7,8,9,10);  # nb d'évaluation considéré comme satisfaisante

SELECT * FROM client WHERE regimeAlC='halal' ORDER BY nomC ASC;  #affiche tous les clients ayant comme regime alimentaire halal

SELECT * FROM Plat WHERE typeP='Plat principal' ORDER By nomP ASC; #affiche tous les plats principaux proposés 
SELECT * FROM Plat WHERE Rég_ali='végétalien' OR Rég_ali='végétarien' ORDER By nomP ASC;
SELECT * FROM Plat WHERE Nationalité='Italienne' ORDER By nomP ASC;
SELECT * FROM Plat WHERE IngrP LIKE '%riz%' ORDER By nomP ASC;      #affiche tous les plats contenant du riz
SELECT * FROM Plat WHERE IngrP LIKE '%légumes%' ORDER By nomP ASC;


SELECT c.IdClient, NomC, PrénomC, SUM(p.prix) AS AchatCumulés       #afficher les clients par montants des achats cumulés
FROM Client c
JOIN Commande cmd ON c.IdClient = cmd.IdClient
JOIN constituer_de_ cd ON cmd.IdCommande = cd.IdCommande
JOIN Plat p ON cd.Id_Plat = p.Id_Plat
GROUP BY c.IdClient
ORDER BY AchatCumulés ASC;

SELECT AVG(prix) as MoyennePrixCommande FROM Commande com     #moyenne des prix des commandes 
JOIN constituer_de_ cd ON com.IdCommande=cd.IdCommande
JOIN Plat p ON cd.Id_Plat = p.Id_Plat
ORDER BY MoyennePrixCommande ASC;

SELECT IdClient, Nationalité FROM commande com         #liste des commandes pour chaque client selon la nationalité des plats
JOIN constituer_de_ cd ON com.IdCommande=cd.IdCommande
JOIN Plat p ON cd.Id_Plat=p.Id_Plat
WHERE idClient='CL1'                   # preciser cette ligne pour un client précis
ORDER BY IdClient ASC; 

SELECT IdCommande, Nationalité FROM constituer_de_ cd       
JOIN Plat p ON cd.Id_Plat=p.Id_Plat;
                                   
SELECT Idcommande, NomP, Nationalité FROM constituer_de_ cd        #liste des commandes et repas triés par la nationalité du plat
JOIN Plat p ON cd.Id_Plat=p.Id_Plat
WHERE Idcommande IN ( SELECT idcommande FROM commande WHERE idCLient='CL1');

SELECT IdClient FROM Client WHERE IdClient IN ( SELECT idClient FROM commande WHERE IdCommande IN( SELECT IdCommande FROM livrer WHERE Statut='livré'));

SELECT DISTINCT c.idClient               # Liste des clients livrés par un cuisinier en particulier
FROM Client c
JOIN Commande cmd ON c.idClient = cmd.idClient
JOIN Livrer l ON cmd.idCommande = l.IdCommande
JOIN Cuisinier cu ON l.IDCuisinier = cu.IDCuisinier
WHERE cu.IDCuisinier = 'CU7'
  AND l.Statut = 'livré';
                                   
SELECT IdCommande, CheminOpt FROM livrer WHERE Statut='non livré' AND IdCuisinier='CU3';   # Liste des commandes que les cuisiniers ont à livrer
select MAX(IdClient) AS IdClient from client;