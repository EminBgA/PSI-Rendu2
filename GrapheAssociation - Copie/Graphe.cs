using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;

using SkiaSharp;
using SkiaSharp.Views.Desktop;

namespace GrapheAssociation
{
    public class Graphe
    {

        // Hello worldd

        // Ajouter des nœuds
        //private Dictionary<int, Noeud> Noeuds { get; private set; }
        private Noeud[] listeSommets;
        private List<Lien> listeLiens;
        private int[,] matriceAdjacence;
        private int numSommets;


        private Dictionary<int, List<int>> ListeAdjacence;
        private Dictionary<int, SKPoint> positions;

        public Graphe(int numNoeuds)
        {
            listeSommets = new Noeud[numNoeuds];
            listeLiens = new List<Lien>();
            this.numSommets = numNoeuds;
        }

        /// <summary>
        /// Cette fonction créer un nouveau noeud et lui assigne le numéro d'identification passé en argument.
        /// </summary>
        /// <param name="id"></param>
        public void AjouterNoeud(int id, string nom)
        {
            if (listeSommets[id] == null)
            {
                listeSommets[id] = new Noeud(id, nom);
            }
        }


        /// <summary>
        /// Cette fonction crée un lien entre deux noeuds s'il en existe pas encore un.
        /// </summary>
        /// <param name="id1"></param>
        /// <param name="id2"></param>
        public void AjouterLien(int id1, int id2, int distance, int tempsChangement, string nomMetro, int numMetro)
        {
            if (listeSommets[id1] != null && listeSommets[id2] != null)
            {
                Noeud n1 = listeSommets[id1];
                Noeud n2 = listeSommets[id2];
                if (!n1.GetVoisins().Contains(n2))//  Pour un graphe non orienté :  && !n2.GetVoisins().Contains(n1))
                {
                    n1.AjouterVoisin(n2);
                    // Pour un graphe non orienté : n2.AjouterVoisin(n1);
                    listeLiens.Add(new Lien(n1, n2, distance, tempsChangement, nomMetro, numMetro));
                }
            }
        }

        /// <summary>
        /// Cette fonction renvoie le nom du sommet ayant l'ID passé en paramètre.
        /// </summary>
        /// <param name="idSommet"></param>
        /// <returns></returns>
        public string NomSommet(int idSommet)
        {
            string rep = "";
            foreach (Noeud sommet in  listeSommets)
            {
                if (sommet != null && sommet.GetID() == idSommet)
                {
                    rep = sommet.GetNom();
                }
            }
            return rep;
        }

        /// <summary>
        /// Cette fonction renvoie l'ID du sommant ayant le nom passé en paramètre.
        /// </summary>
        /// <param name="nomSommet"></param>
        /// <returns></returns>
        public int IDSommet(string nomSommet)
        {
            int rep = 0;
            foreach (Noeud sommet in listeSommets)
            {
                if (sommet != null && sommet.GetNom() == nomSommet)
                {
                    rep = sommet.GetID();
                }
            }
            return rep;
        }

        /// <summary>
        /// Cette fonction construit la matrice adjacente à partir de la liste de tous les liens.
        /// </summary>
        public void ConstruireMatriceAdjacence()
        {
            int taille = listeSommets.Length;
            matriceAdjacence = new int[taille, taille];

            foreach (var lien in listeLiens)
            {
                int i = lien.GetNoeud(1).GetID();
                int j = lien.GetNoeud(2).GetID();
                matriceAdjacence[i, j] = 1;
                matriceAdjacence[j, i] = 1; // Graphe non orienté
            }
        }

        /// <summary>
        /// Cette fonction affiche la liste adjacente.
        /// </summary>
        public void AfficherListeAdjacence()
        {
            foreach (var noeud in listeSommets)
            {
                if (noeud != null && noeud.GetID() != 0)
                {
                   Console.WriteLine(noeud.GetID() + " : " + noeud.VoisinsToString());
                }
               
            }
        }

        /// <summary>
        /// Cette fonction affiche la matrice adjacente. 
        /// </summary>
        public void AfficherMatriceAdjacence()
        {
            for (int i = 1; i < listeSommets.Length; i++)
            {
                for (int j = 1; j < listeSommets.Length; j++)
                {
                    if (matriceAdjacence[i,j] != null)
                    {
                        Console.Write(matriceAdjacence[i, j] + " ");
                    }
                }
                Console.WriteLine();
            }
        }

        /// <summary>
        /// Cette fonction fait le parcours en largeur du graphe.
        /// </summary>
        /// <param name="noeudInitial"></param>
        /// <returns></returns>
        public bool[] ParcoursLargeur(int noeudInitial)
        {
            bool[] visites = new bool[numSommets];
            List<int> pile = new List<int>();

            pile.Add(noeudInitial);
            visites[noeudInitial] = true;

            Console.WriteLine("Parcours en Largeur:");

            while (pile.Count > 0)
            {
                int noeudCourant = pile[0];
                pile.RemoveAt(0);
                Console.Write(noeudCourant + " ");
                
                for (int i = 0; i < listeSommets[noeudCourant].GetVoisins().Count; i++)
                {
                    Noeud voisin = listeSommets[noeudCourant].GetVoisins()[i];
                    if (!visites[voisin.GetID()])
                    {
                        pile.Add(voisin.GetID());
                        visites[voisin.GetID()] = true;
                    }
                }
            }
            Console.WriteLine();
            return visites;
        }
        
        /// <summary>
        /// Cette fonction fait le parcours en profondeur du graphe.
        /// </summary>
        /// <param name="noeudInitial"></param>
        /// <returns></returns>
        public bool[] ParcoursProfondeur(int noeudInitial)
        {
            bool[] visites = new bool[numSommets];
            List<int> pile = new List<int>();

            pile.Add(noeudInitial);

            Console.WriteLine("Parcours en Profondeur:");

            while (pile.Count > 0)
            {
                int noeudCourant = pile[pile.Count - 1];
                if (!visites[noeudCourant])
                {
                    pile.RemoveAt(pile.Count - 1);
                    visites[noeudCourant] = true;
                    Console.Write(noeudCourant + " ");

                    for (int i = listeSommets[noeudCourant].GetVoisins().Count - 1; i >= 0; i--)
                    {
                        Noeud voisin = listeSommets[noeudCourant].GetVoisins()[i];
                        if (!visites[voisin.GetID()])
                        {
                            pile.Add(voisin.GetID());
                        }
                    }
                }
                else
                {
                    pile.RemoveAt(pile.Count - 1);
                }   
            }
            Console.WriteLine();
            return visites;
        }



        /// <summary>
        /// Cette fonction vérifie si le graphe est connexe.
        /// </summary>
        /// <returns></returns>
        public bool EstConnexe()
        {
            bool[] visites = new bool[numSommets];
            bool rep = true;
            visites = ParcoursProfondeur(1);

            for (int i = 1; i < numSommets; i++)
            {
                if (!visites[i])
                {
                    rep = false;
                }
                    
            }

            return rep;
        }

        /// <summary>
        /// Cette fonction vérifie si le graphe contient des cycles.
        /// </summary>
        /// <returns></returns>
        public bool ContientCycle()
        {
            bool rep = false;
            int sommetInitial = 1;
            bool[] visites = new bool[numSommets];
            List<int> pile = new List<int>();


            pile.Add(sommetInitial);


            while (pile.Count > 0)
            {
                int sommetCourant = pile[pile.Count - 1];
                if (!visites[sommetCourant])
                {
                    pile.RemoveAt(pile.Count - 1);
                    visites[sommetCourant] = true;   

                    for (int i = listeSommets[sommetCourant].GetVoisins().Count - 1; i >= 0; i--)
                    {
                        Noeud voisin = listeSommets[sommetCourant].GetVoisins()[i];
                        if (!visites[voisin.GetID()])
                        {
                            pile.Add(voisin.GetID());
                        }
                        else
                        {
                            rep = true;
                        }
                    }
                }
                else
                {
                    pile.RemoveAt(pile.Count - 1);
                }
            }
            return rep;
        }
        

        /// <summary>
        /// cette fonction calcule le temps de trajet à partir de tous les liens empruntés pendant le trajet.
        /// </summary>
        /// <param name="listeLiens"></param>
        /// <returns></returns>
        public int CalculerTempsTrajetMetro(Lien[] listeLiens)
        {
            int temps = 0;
            for (int i = 0; i < listeLiens.Length; i++)
            {
                temps += listeLiens[i].Distance();
                if (i >= 1 && listeLiens[i].GetNumMetro() != listeLiens[i - 1].GetNumMetro())
                {
                    temps += listeLiens[i].GetTempsChangement();
                }
            }
            return temps;
        }



        /// <summary>
        /// Algo de FloydWarshall pour le parcours de graphe.
        /// </summary>
        /// <param name="sommetDepart"></param>
        /// <param name="sommetArrive"></param>
        /// <returns></returns>
        public Lien[] FloydWarshall(int sommetDepart, int sommetArrive)
        {
            int maxInt = 1000; // On ne peut pas utiliser int.MaxValue car on va additionner ces variables entre elles plus tard dans le programme donc on assigne une valeur suffisemment élevée.
            int[,] distances = new int[numSommets, numSommets]; // Distance minimale entre deux sommets du graphe/
            int[,] pred = new int[numSommets, numSommets]; // Associe chaque sommet à son sommet prédécesseur.
            Lien[,] lienPred = new Lien[numSommets, numSommets]; // Associe chaque sommet à son lien prédécesseur.
            Lien[,] dernierLienUtilise = new Lien[numSommets, numSommets]; // Associe chaque lien à son lien précédent pour le temps d'attente.

            // Début : On initialise les variables
            for (int i = 0; i < numSommets; i++)
            {
                for (int j = 0; j < numSommets; j++)
                {
                    if (i == j)
                    {
                        distances[i, j] = 0;
                    }
                    else
                    {
                        distances[i, j] = maxInt;
                        pred[i, j] = 0;
                        lienPred[i, j] = null;
                        dernierLienUtilise[i, j] = null;
                    }
                }
            }
            
            foreach (Lien lien in listeLiens)
            {
                int id1 = lien.GetNoeud(1).GetID();
                int id2 = lien.GetNoeud(2).GetID();
                distances[id1, id2] = lien.Distance();
                pred[id1, id2] = id1;
                lienPred[id1, id2] = lien;
                dernierLienUtilise[id1, id2] = lien;
            }
            // Fin


            for (int k = 0; k < numSommets; k++) // Sommet intermédiaire
            {
                for (int i = 0; i < numSommets; i++) // Sommet de départ
                {
                    for (int j = 0; j < numSommets; j++) // Sommet d'arrivee
                    {
                        // Si les distances ne sont pas encore définis, alors on saute ces sommets.
                        if (distances[i, k] == maxInt || distances[k, j] == maxInt)
                        {
                            continue;
                        }
                        
                        // Début : Ajout du temps d'attente
                        int tempsAttente = 0;
                        if (dernierLienUtilise[i, k] != null && dernierLienUtilise[k, j] != null && dernierLienUtilise[i, k].GetNumMetro() != dernierLienUtilise[k, j].GetNumMetro())
                        {
                            tempsAttente += dernierLienUtilise[k, j].GetTempsChangement();
                        }
                        // Fin

                        // Si le nouveau temps / nouvelle distance est plus faible que celle actuellement utilié, on remplace les liens utilisés.
                        if (distances[i, k] + distances[k, j] + tempsAttente < distances[i, j])
                        {
                            distances[i, j] = distances[i, k] + distances[k, j] + tempsAttente;
                            pred[i, j] = pred[k, j];
                            lienPred[i, j] = lienPred[k, j];
                            dernierLienUtilise[i, j] = dernierLienUtilise[k, j];
                        }
                    }
                }
            }

            if (pred[sommetDepart, sommetArrive] == 0)
            {
                Console.WriteLine("retourne rien");
                return new Lien[0];
            }

            // Début : On retrace le chemin parcouru pour renvoyer tous les liens empruntés dans le bon ordre.
            List<Lien> liensVisites = new List<Lien>();
            var chemin = new List<Lien>();
            int sommet = sommetArrive;
            while (sommet != sommetDepart)
            {
                Lien lien = lienPred[pred[sommetDepart, sommet], sommet];
                if (lien == null) return new Lien[0];
                if (!liensVisites.Contains(lien))
                {
                    liensVisites.Add(lien);
                    chemin.Add(lien);
                    sommet = pred[sommetDepart, sommet];
                }
                else
                {
                    return new Lien[0];
                }
                
            }

            chemin.Reverse();
            return chemin.ToArray();
            // Fin
        }



        /// <summary>
        /// Algo de BellmanFord de parcours de graphe.
        /// </summary>
        /// <param name="sommetDepart"></param>
        /// <param name="sommetArrive"></param>
        /// <returns></returns>
        public Lien[] BellmanFord(int sommetDepart, int sommetArrive)
        {
            var distances = new Dictionary<int, int>(); // Les distances minimales entre deux sommets du graphe.
            var pred = new Dictionary<int, int>(); // Associe chaque sommet à son sommet précédent.
            var lienPred = new Dictionary<int, Lien>(); // Associe chaque lien à son sommet précédent.
            var dernierLienUtilise = new Dictionary<int, Lien>(); // Associe chaque lien à son lien précédent pour le temps d'attente.

            // Début : initialisation des variables
            foreach (Noeud sommet in listeSommets)
            {
                if (sommet != null)
                {
                    distances[sommet.GetID()] = int.MaxValue;
                    pred[sommet.GetID()] = 0;
                    lienPred[sommet.GetID()] = null;
                    dernierLienUtilise[sommet.GetID()] = null;
                }
            }
            distances[sommetDepart] = 0;
            // Fin

            // Début : Calcul du chemin le plus court en parcourant chaque lien numSommets fois.
            for (int i = 1; i < numSommets; i++)
            {
                foreach (Lien lien in listeLiens)
                {
                    int id1 = lien.GetNoeud(1).GetID();
                    int id2 = lien.GetNoeud(2).GetID();

                    // Début : Ajout du temps d'attente.
                    int tempsAttente = 0;
                    if (dernierLienUtilise[id1] != null && dernierLienUtilise[id1].GetNumMetro() != lien.GetNumMetro())
                    {
                        tempsAttente += lien.GetTempsChangement();
                    }
                    // Fin

                    // Si le nouveau temps / nouvelle distance est plus faible que celle actuellement utilié, on remplace les liens utilisés.
                    if (distances[id1] != int.MaxValue && distances[id1] + lien.Distance() + tempsAttente < distances[id2])
                    { 
                        distances[id2] = distances[id1] + lien.Distance();
                        pred[id2] = id1;
                        lienPred[id2] = lien; // Stocke le lien emprunté
                        dernierLienUtilise[id2] = lien;
                    }
                }
            }

            if (lienPred[sommetArrive] == null)
            {
                Console.WriteLine("retourne rien");
                return new Lien[0]; // Pas de chemin trouvé
            }

            // Début : On retrace le chemin parcouru pour renvoyer tous les liens empruntés dans le bon ordre.
            var chemin = new List<Lien>();
            int nsommet = sommetArrive;
            while (pred[nsommet] != 0)
            {
                chemin.Add(lienPred[nsommet]);
                nsommet = pred[nsommet];
            }

            chemin.Reverse();
            return chemin.ToArray();
            // Fin
        }

        /// <summary>
        /// Algo de Dijkstra de parcours de graphe.
        /// </summary>
        /// <param name="sommetDepart"></param>
        /// <param name="sommetArrive"></param>
        /// <returns></returns>
        public Lien[] Dijkstra(int sommetDepart, int sommetArrive)
        {
            var distances = new Dictionary<int, int>();  // Les distances minimiales entre chaque sommet
            var pred = new Dictionary<int, int>();  // Associe chaque sommet à son sommet prédécesseur
            var lienPred = new Dictionary<int, Lien>(); // Associe chaque sommet à son lien prédécesseur
            var dernierLienUtilise = new Dictionary<int, Lien>(); // Pour déterminer si il y a des changements de métro.
            var nonVisites = new List<int>();  // Liste des sommets pas encore visité.

            // Début : Initialisation des variables
            foreach (Noeud sommet in listeSommets)
            {
                if (sommet != null)
                {
                    distances[sommet.GetID()] = int.MaxValue; 
                    pred[sommet.GetID()] = 0;   // Le sommet d'ID 0 n'existe pas donc cela permet d'initialliser le sommet.
                    lienPred[sommet.GetID()] = null;
                    dernierLienUtilise[sommet.GetID()] = null;
                    nonVisites.Add(sommet.GetID());
                }
            }
            distances[sommetDepart] = 0;
            // Fin

            while (nonVisites.Count > 0) // Tant qu'on a pas visité tous les sommets du graphe.
            {
                int sommetDepartActuel = -1;
                int minDistance = int.MaxValue;

                // Trouver le sommet avec la plus petite distance
                foreach (int sommetID in nonVisites)
                {
                    if (distances[sommetID] < minDistance)
                    {
                        minDistance = distances[sommetID];
                        sommetDepartActuel = sommetID;
                    }
                }

                if (sommetDepartActuel == -1)
                    break; // Aucun sommet atteignable

                nonVisites.Remove(sommetDepartActuel);

                if (sommetDepartActuel == sommetArrive)  
                    break;

                // On cherche une reference au sommet à partir de son ID.
                Noeud sommetActuel = null;
                foreach (var sommet in listeSommets)
                {
                    if (sommet != null && sommet.GetID() == sommetDepartActuel)
                    {
                        sommetActuel = sommet;
                        break;
                    }
                }
                if (sommetActuel == null) continue;

                // Explorer les voisins
                foreach (Noeud voisin in sommetActuel.GetVoisins())
                {
                    int sommetID = voisin.GetID(); // ID du sommet voisin.
                    Lien lien = null;

                    // On chercher une reference au lien reliant les deux sommets à partir de l'ID du sommet de départ et son voisin
                    foreach (var l in listeLiens)
                    {
                        if (l.GetNoeud(1).GetID() == sommetDepartActuel && l.GetNoeud(2).GetID() == sommetID)
                        {
                            lien = l;
                            break;
                        }
                    }
                    if (lien == null) continue;

                    int tempsAttente = 0;
                    

                    // On vérifie si le dernier lien utilisé avait une ligne de métro différente. Si c'est la cas, on rajoute au temps d'attente le temps de changement de ligne
                    if (dernierLienUtilise[sommetActuel.GetID()] != null && dernierLienUtilise[sommetActuel.GetID()].GetNumMetro() != lien.GetNumMetro())
                    {
                        tempsAttente += lien.GetTempsChangement();
                    }

                    int nouvelleDistance = distances[sommetDepartActuel] + lien.Distance() + tempsAttente;

                    // Si le nouveau temps / nouvelle distance est plus faible que celle actuellement utilié, on remplace les liens utilisés.
                    if (nouvelleDistance < distances[sommetID])
                    {
                        distances[sommetID] = nouvelleDistance;
                        pred[sommetID] = sommetDepartActuel;
                        lienPred[sommetID] = lien; 
                        dernierLienUtilise[sommetID] = lien;
                    }
                }
            }

            // Début : On retrace le chemin parcouru pour renvoyer tous les liens empruntés dans le bon ordre.
            if (lienPred[sommetArrive] == null)
                return new Lien[0]; // Pas de chemin trouvé

            var chemin = new List<Lien>();
            int nSommet = sommetArrive;
            while (pred[nSommet] != 0)
            {
                chemin.Add(lienPred[nSommet]);
                nSommet = pred[nSommet];
            }
            chemin.Reverse();
            return chemin.ToArray();
            // FIn
        }


        /// <summary>
        /// Cette fonction crée et dessine le graphe.
        /// </summary>
        /// <param name="filename"></param>
        public void DessinerGraphe(string filename, Dictionary<string, Dictionary<string, object>> listeGares, Lien[] listeLientsEmpruntees)
        {
            // Taille de l'image
            int width = 8000;
            int height = 5000;
            
            // Calcul de la position de chaque sommet sur le graphe
            positions = CalculerPosition(width, height, listeGares);

            // Création du canvas pour le graphe
            using (var bitmap = new SKBitmap(width, height))
            using (var canvas = new SKCanvas(bitmap))
            using (var paintEdge1 = new SKPaint { Color = SKColor.Parse("#FFD600"), StrokeWidth = 30 }) // Apparence des arêtes.
            using (var paintEdge2 = new SKPaint { Color = SKColor.Parse("#0055C8"), StrokeWidth = 30 })
            using (var paintEdge3 = new SKPaint { Color = SKColor.Parse("#6ECA97"), StrokeWidth = 30 })
            using (var paintEdge3bis = new SKPaint { Color = SKColor.Parse("#9FC9AC"), StrokeWidth = 30 })
            using (var paintEdge4 = new SKPaint { Color = SKColor.Parse("#A0006E"), StrokeWidth = 30 })
            using (var paintEdge5 = new SKPaint { Color = SKColor.Parse("#FF7E2E"), StrokeWidth = 30 })
            using (var paintEdge6 = new SKPaint { Color = SKColor.Parse("#6ECEB2"), StrokeWidth = 30 })
            using (var paintEdge7 = new SKPaint { Color = SKColor.Parse("#F5A2BD"), StrokeWidth = 30 })
            using (var paintEdge7bis = new SKPaint { Color = SKColor.Parse("#6EC4E8"), StrokeWidth = 30 })
            using (var paintEdge8 = new SKPaint { Color = SKColor.Parse("#D5A5C9"), StrokeWidth = 30 })
            using (var paintEdge9 = new SKPaint { Color = SKColor.Parse("#B6BD00"), StrokeWidth = 30 })
            using (var paintEdge10 = new SKPaint { Color = SKColor.Parse("#C9910D"), StrokeWidth = 30 })
            using (var paintEdge11 = new SKPaint { Color = SKColor.Parse("#704B1C"), StrokeWidth = 30 })
            using (var paintEdge12 = new SKPaint { Color = SKColor.Parse("#007852"), StrokeWidth = 30 })
            using (var paintEdge13 = new SKPaint { Color = SKColor.Parse("#6EC4E8"), StrokeWidth = 30 })
            using (var paintEdge14 = new SKPaint { Color = SKColor.Parse("#62259D"), StrokeWidth = 30 })
            using (var paintEdge = new SKPaint { Color = SKColors.Black, StrokeWidth = 3 })
            using (var paintNode = new SKPaint { Color = SKColors.Blue, IsAntialias = true }) // Apparence des sommets.
            using (var paintNodeStart = new SKPaint { Color = SKColors.Green, IsAntialias = true }) // Apparence des sommets.
            using (var paintNodeFinish = new SKPaint { Color = SKColors.Red, IsAntialias = true }) // Apparence des sommets.
            using (var paintText = new SKPaint { Color = SKColors.Black, TextSize = 120, IsAntialias = true }) // Apparence du texte.
            {
                canvas.Clear(SKColors.White); // Remplissage du fond du canvas en blanc.

                
                // Début : dessin des arrêtes
                for (int i = 1; i < listeSommets.Length; i++)  // On accède à chaque sommet.
                {
                    if (listeSommets[i] != null)
                    {

                        for (int j = 0; j < listeSommets[i].GetVoisins().Count; j++)   // Ajout de chaque arrête.
                        {
                            bool drewLine = false;
                            foreach (Lien lien in listeLientsEmpruntees)
                            {
                                canvas.DrawLine(positions[listeSommets[i].GetID()], positions[listeSommets[i].GetVoisins()[j].GetID()], paintEdge);
                                if (listeSommets[i].GetID() == lien.GetNoeud(1).GetID() && listeSommets[i].GetVoisins()[j].GetID() == lien.GetNoeud(2).GetID())
                                {
                                    int ligneMetro = lien.GetNumMetro();
                                    switch (ligneMetro)
                                    {
                                        case 1:
                                            canvas.DrawLine(positions[listeSommets[i].GetID()], positions[listeSommets[i].GetVoisins()[j].GetID()], paintEdge1);
                                            break;
                                        case 2:
                                            canvas.DrawLine(positions[listeSommets[i].GetID()], positions[listeSommets[i].GetVoisins()[j].GetID()], paintEdge2);
                                            break;
                                        case 3:
                                            canvas.DrawLine(positions[listeSommets[i].GetID()], positions[listeSommets[i].GetVoisins()[j].GetID()], paintEdge3);
                                            break;
                                        case 4:
                                            canvas.DrawLine(positions[listeSommets[i].GetID()], positions[listeSommets[i].GetVoisins()[j].GetID()], paintEdge4);
                                            break;
                                        case 5:
                                            canvas.DrawLine(positions[listeSommets[i].GetID()], positions[listeSommets[i].GetVoisins()[j].GetID()], paintEdge5);
                                            break;
                                        case 6:
                                            canvas.DrawLine(positions[listeSommets[i].GetID()], positions[listeSommets[i].GetVoisins()[j].GetID()], paintEdge6);
                                            break;
                                        case 7:
                                            canvas.DrawLine(positions[listeSommets[i].GetID()], positions[listeSommets[i].GetVoisins()[j].GetID()], paintEdge7);
                                            break;
                                        case 8:
                                            canvas.DrawLine(positions[listeSommets[i].GetID()], positions[listeSommets[i].GetVoisins()[j].GetID()], paintEdge8);
                                            break;
                                        case 9:
                                            canvas.DrawLine(positions[listeSommets[i].GetID()], positions[listeSommets[i].GetVoisins()[j].GetID()], paintEdge9);
                                            break;
                                        case 10:
                                            canvas.DrawLine(positions[listeSommets[i].GetID()], positions[listeSommets[i].GetVoisins()[j].GetID()], paintEdge10);
                                            break;
                                        case 11:
                                            canvas.DrawLine(positions[listeSommets[i].GetID()], positions[listeSommets[i].GetVoisins()[j].GetID()], paintEdge11);
                                            break;
                                        case 12:
                                            canvas.DrawLine(positions[listeSommets[i].GetID()], positions[listeSommets[i].GetVoisins()[j].GetID()], paintEdge12);
                                            break;
                                        case 13:
                                            canvas.DrawLine(positions[listeSommets[i].GetID()], positions[listeSommets[i].GetVoisins()[j].GetID()], paintEdge13);
                                            break;
                                        case 14:
                                            canvas.DrawLine(positions[listeSommets[i].GetID()], positions[listeSommets[i].GetVoisins()[j].GetID()], paintEdge14);
                                            break;
                                        case 15:
                                            canvas.DrawLine(positions[listeSommets[i].GetID()], positions[listeSommets[i].GetVoisins()[j].GetID()], paintEdge3bis);
                                            break;
                                        case 16:
                                            canvas.DrawLine(positions[listeSommets[i].GetID()], positions[listeSommets[i].GetVoisins()[j].GetID()], paintEdge7bis);
                                            break;
                                    }
                                    
                                    drewLine = true;
                                    break;
                                }
                            }
                            
                        }
                    }
                    

                }// Fin

                // Début : dessin des sommets
                foreach (var node in positions)
                {
                    SKPoint pos = node.Value;
                    canvas.DrawCircle(pos, 20, paintNode);  // Dessin d'un cercle
                    if ((int)node.Key == listeLientsEmpruntees[0].GetNoeud(1).GetID())
                    {
                        canvas.DrawText(listeLientsEmpruntees[0].GetNoeud(1).GetNom().ToString(), pos.X + 30, pos.Y - 20, paintText); // Ajout de l'ID du sommet
                        canvas.DrawCircle(pos, 40, paintNodeStart);  // Dessin d'un cercle                
                    }
                    else if ((int)node.Key == listeLientsEmpruntees[listeLientsEmpruntees.Length - 1].GetNoeud(2).GetID())
                    {
                        canvas.DrawText(listeLientsEmpruntees[listeLientsEmpruntees.Length - 1].GetNoeud(2).GetNom().ToString(), pos.X + 30, pos.Y - 20, paintText); // Ajout de l'ID du sommet
                        canvas.DrawCircle(pos, 40, paintNodeFinish);  // Dessin d'un cercle   
                    }
                        
                }// Fin

                //Sauvegarde de l'image en format png à l'endroit souhaité.
                using (var image = SKImage.FromBitmap(bitmap))
                using (var data = image.Encode(SKEncodedImageFormat.Png, 100))
                using (var stream = File.OpenWrite(filename))
                {
                    data.SaveTo(stream);
                }

            }
        }



        /// <summary>
        /// Cette fonction calcule la position de chaque sommet sur le canvas en fonction de la longitude et de la latitude de la gare.
        /// </summary>
        /// <param name="width"></param>
        /// <param name="height"></param>
        /// <param name="listeGares"></param>
        /// <returns></returns>
        public Dictionary<int, SKPoint> CalculerPosition(int width, int height, Dictionary<string, Dictionary<string, object>> listeGares)
        {
            Dictionary<int, SKPoint> positions = new Dictionary<int, SKPoint>();

            float minLat = float.MaxValue;
            float maxLat = float.MinValue;
            float minLon = float.MaxValue;
            float maxLon = float.MinValue;

            foreach (string nomGare in listeGares.Keys)
            {
                double lat2 = (double)listeGares[nomGare]["lat"];
                float lat = (float)lat2;
                double lon2 = (double)listeGares[nomGare]["lon"];
                float lon = (float)lon2;
                if (lat < minLat) minLat = lat;
                if (lat > maxLat) maxLat = lat;
                if (lon < minLon) minLon = lon;
                if (lon > maxLon) maxLon = lon;
            }

            float scaleX = (width - 100) / (maxLon - minLon);
            float scaleY = (height - 100) / (maxLat - minLat);
            float scale = Math.Min(scaleX, scaleY);

            float offsetX = (width - (maxLon - minLon) * scaleX) / 2;
            float offsetY = (height - (maxLat - minLat) * scaleY) / 2;

            foreach(string nomGare in listeGares.Keys)
            {
                int id = IDSommet(nomGare);
                double x2 = ((double)listeGares[nomGare]["lon"] - minLon) * scaleX + 0;
                float x = (float )x2;
                double y2 = height - ((double)listeGares[nomGare]["lat"] - minLat) * scaleY + 0;
                float y = (float )y2;
                positions[id] = new SKPoint(x, y);
            }

            return positions;

        }




    }
}
