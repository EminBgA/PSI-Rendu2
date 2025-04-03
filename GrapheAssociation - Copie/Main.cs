﻿using Microsoft.VisualBasic.FileIO;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GrapheAssociation
{
    internal class Main
    {
        private List<Dictionary<string, object>> listeLignes;
        private Dictionary<string, Dictionary<string, object>> listeGares;
        private List<int> listeSommets;
        private List<string> listeNomSommets;
        private int numSommets;
        private double longitudeDepart;
        private double latitudeDepart;
        private double longitudeArrivee;
        private double latitudeArrivee;
        private int gareDepart;
        private int gareArrivee;
        Lien[] listeLien;
        Graphe graphe;


        public Main()
        {
            string chemin = Directory.GetParent(Directory.GetCurrentDirectory()).Parent.FullName;
            string filePathLignes = Path.Combine(chemin, @"metro_paris_temps.csv");
            string filePathGares = Path.Combine(chemin, @"metro_paris_gares2.csv");

            listeLignes = new List<Dictionary<string, object>>();
            listeGares = new Dictionary<string, Dictionary<string, object>>();

            listeLignes = LireFichierCSVLignes(filePathLignes);
            listeSommets = GetSommets(listeLignes);
            listeNomSommets = GetNoms(listeLignes);
            numSommets = listeSommets.Count;

            listeGares = LireFichierCSVGares(filePathGares);

            graphe = new Graphe(listeSommets.Max() + 1);

            for (int i = 0; i < listeSommets.Count; i++)
            {
                graphe.AjouterNoeud(listeSommets[i], listeNomSommets[i]);
            }

            for (int i = 0; i < listeLignes.Count; i++)
            {
                if ((int)listeLignes[i]["idP"] != 0)
                {
                    graphe.AjouterLien((int)listeLignes[i]["idP"], (int)listeLignes[i]["id"], (int)listeLignes[i]["tempsStations"], (int)listeLignes[i]["tempsCorrespondance"], (string)listeLignes[i]["nomMetro"], (int)listeLignes[i]["numMetro"]);//(int)listeStations[i]["tempsStation"]);
                }
            }
        }



        public string TrouverCheminLePlusCourt(double latDepart, double lonDepart, double latArrivee, double lonArrivee)
        {
            int gareDepart = TrouverGarePlusProche(lonDepart, latDepart, listeNomSommets, listeGares, listeLignes);
            int gareArrivee = TrouverGarePlusProche(lonArrivee, latArrivee, listeNomSommets, listeGares, listeLignes);

            string rep = "Départ : " + graphe.NomSommet(gareDepart) + "\nArrivée : " + graphe.NomSommet(gareArrivee) + "\n\n";

            Lien[] listeLiensDijkstra = graphe.Dijkstra(gareDepart, gareArrivee);
            int tempsDijkstra = graphe.CalculerTempsTrajetMetro(listeLiensDijkstra);
            Lien[] listeLiensBellmanFord = graphe.BellmanFord(gareDepart, gareArrivee);
            int tempsBellmanFord = graphe.CalculerTempsTrajetMetro(listeLiensBellmanFord);
            Lien[] listeLiensFloydWarshall = graphe.FloydWarshall(gareDepart, gareArrivee);
            int tempsFloydWarshall = graphe.CalculerTempsTrajetMetro(listeLiensFloydWarshall);
            int tempsTrajet = 0;
            if (tempsFloydWarshall != 0 && tempsFloydWarshall <= tempsDijkstra && tempsFloydWarshall <= tempsBellmanFord)
            {
                tempsTrajet = tempsFloydWarshall;
                listeLien = listeLiensFloydWarshall;
            }
            else if (tempsBellmanFord <= tempsDijkstra && tempsBellmanFord <= tempsFloydWarshall)
            {
                tempsTrajet = tempsBellmanFord;
                listeLien = listeLiensBellmanFord;
            }
            else
            {
                tempsTrajet = tempsDijkstra;
                listeLien = listeLiensDijkstra;
            }
            rep += AfficherChemins(listeLien);
            rep += "Temps de trajet : " + graphe.CalculerTempsTrajetMetro(listeLien) + " min\n\n";
            
            return rep;
        }

        public void AfficherCarte()
        {
            string chemin = Directory.GetParent(Directory.GetCurrentDirectory()).Parent.FullName;
            string filePathLignes = Path.Combine(chemin, @"metro_paris_temps.csv");
            string filePathGares = Path.Combine(chemin, @"metro_paris_gares2.csv");
            filePathLignes = Path.Combine(chemin, @"graphe.png");
            graphe.DessinerGraphe(filePathLignes, listeGares);
            FileStream file = File.Open(filePathLignes, FileMode.Open, FileAccess.Write, FileShare.None);
            Process.Start(new ProcessStartInfo(filePathLignes) { UseShellExecute = true });
        }



        public void AfficherGares(Lien[] listeLien)
        {
            int numMetro = 0;
            string nomMetro = "";
            int gareDepart = 0;
            string nomDepart = "";
            int gareArrivee = 0;
            string nomArrivee = "";
            foreach (Lien lien in listeLien)
            {
                if (numMetro == 0)
                {
                    numMetro = lien.GetNumMetro();
                    nomMetro = lien.GetNomMetro();
                    gareDepart = lien.GetNoeud(1).GetID();
                    nomDepart = lien.GetNoeud(1).GetNom();
                    Console.Write(nomMetro + " : " + nomDepart);
                }
                if (lien.GetNumMetro() != numMetro)
                {
                    Console.WriteLine();
                    numMetro = lien.GetNumMetro();
                    nomMetro = lien.GetNomMetro();
                    gareDepart = lien.GetNoeud(1).GetID();
                    nomDepart = lien.GetNoeud(1).GetNom();
                    Console.Write(nomMetro + " : " + nomDepart);
                    Console.Write(" -> " + lien.GetNoeud(2).GetNom());
                }
                else
                {
                    Console.Write(" -> " + lien.GetNoeud(2).GetNom());
                }
                gareArrivee = lien.GetNoeud(2).GetID();
                nomArrivee = lien.GetNoeud(2).GetNom();
            }
        }

        public string AfficherChemins(Lien[] listeLien)
        {
            int numMetro = 0;
            string nomMetro = "";
            int gareDepart = 0;
            string nomDepart = "";
            int gareArrivee = 0;
            string nomArrivee = "";
            string rep = "";
            foreach (Lien lien in listeLien)
            {
                if (numMetro == 0)
                {
                    numMetro = lien.GetNumMetro();
                    nomMetro = lien.GetNomMetro();
                    gareDepart = lien.GetNoeud(1).GetID();
                    nomDepart = lien.GetNoeud(1).GetNom();
                }
                else if (lien.GetNumMetro() != numMetro)
                {
                    rep += ("Metro " + nomMetro + " : " + nomDepart + " -> " + nomArrivee) + "\n";
                    gareDepart = lien.GetNoeud(1).GetID();
                    nomDepart = lien.GetNoeud(1).GetNom();
                    numMetro = lien.GetNumMetro();
                    nomMetro = lien.GetNomMetro();

                }
                gareArrivee = lien.GetNoeud(2).GetID();
                nomArrivee = lien.GetNoeud(2).GetNom();
            }
            rep += ("Metro " + nomMetro + " : " + nomDepart + " -> " + nomArrivee) + "\n\n";
            return rep;
        }

        public List<Dictionary<string, object>> LireFichierCSVLignes(string filePath)
        {
            List<Dictionary<string, object>> listeStations = new List<Dictionary<string, object>>();
            //using (TextFieldParser parser = new TextFieldParser(filePath))
            using (StreamReader sr = new StreamReader(filePath, Encoding.UTF8))
            using (TextFieldParser parser = new TextFieldParser(sr))
            {
                parser.TextFieldType = FieldType.Delimited;
                parser.SetDelimiters(",");
                while (!parser.EndOfData)
                {
                    string[] fields = parser.ReadFields();
                    foreach (string field in fields)
                    {
                        String[] elements = field.Split(';');
                        if (elements[0] != "" && double.TryParse(elements[0], out _))
                        {
                            //Console.WriteLine(elements[0]);
                            int idStation = Convert.ToInt32(elements[0]);
                            if (listeStations.Count <= idStation)
                            {
                                while (listeStations.Count <= idStation)
                                {
                                    listeStations.Add(new Dictionary<string, object>());
                                    listeStations[(listeStations.Count) - 1]["id"] = 0;
                                }
                            }
                            else
                            {
                                listeStations.Add(new Dictionary<string, object>());
                            }
                            idStation = listeStations.Count - 1;
                            listeStations[idStation]["id"] = Convert.ToInt32(elements[0]);
                            listeStations[idStation]["nom"] = elements[1];
                            if (double.TryParse(elements[2], out _))
                            {
                                listeStations[idStation]["idP"] = Convert.ToInt32(elements[2]);
                            }
                            else
                            {
                                listeStations[idStation]["idP"] = 0;
                            }
                            if (double.TryParse(elements[3], out _))
                            {
                                listeStations[idStation]["idS"] = Convert.ToInt32(elements[3]);
                            }
                            else
                            {
                                listeStations[idStation]["idS"] = 0;
                            }
                            listeStations[idStation]["tempsStations"] = Convert.ToInt32(elements[4]);
                            listeStations[idStation]["tempsCorrespondance"] = Convert.ToInt32(elements[5]);
                            listeStations[idStation]["nomMetro"] = elements[6];
                            listeStations[idStation]["numMetro"] = Convert.ToInt32(elements[7]);
                        }

                    }
                }
            }
            for (int i = 0; i < listeStations.Count; i++)
            {
                if ((int)listeStations[i]["id"] == 0)
                {
                    listeStations.RemoveAt(i);
                    i--;
                }
            }


            return listeStations;
        }

        public Dictionary<string, Dictionary<string, object>> LireFichierCSVGares(string filePath)
        {
            Dictionary<string, Dictionary<string, object>> listeStations = new Dictionary<string, Dictionary<string, object>>();
            using (StreamReader sr = new StreamReader(filePath, Encoding.UTF8))
            using (TextFieldParser parser = new TextFieldParser(sr))
            {
                parser.TextFieldType = FieldType.Delimited;
                parser.SetDelimiters(",");
                while (!parser.EndOfData)
                {
                    string[] fields = parser.ReadFields();
                    foreach (string field in fields)
                    {
                        String[] elements = field.Split(';');
                        if (elements[0] != "" && double.TryParse(elements[0], out _))
                        {
                            listeStations[elements[2]] = new Dictionary<string, object>();
                            listeStations[elements[2]]["lon"] = Convert.ToDouble(elements[3], CultureInfo.InvariantCulture);
                            listeStations[elements[2]]["lat"] = Convert.ToDouble(elements[4], CultureInfo.InvariantCulture);
                        }
                    }
                }
            }
            return listeStations;
        }

        public List<int> GetSommets(List<Dictionary<string, object>> listeStations)
        {
            List<int> allStationID = new List<int>();
            for (int i = 0; i < listeStations.Count; i++)
            {
                if ((int)listeStations[i]["id"] != 0 && allStationID.Contains((int)listeStations[i]["id"]) == false)
                {
                    allStationID.Add((int)listeStations[i]["id"]);
                }
            }
            return allStationID;
        }

        public List<string> GetNoms(List<Dictionary<string, object>> listeStations)
        {
            List<string> allStationID = new List<string>();
            for (int i = 0; i < listeStations.Count; i++)
            {
                if ((int)listeStations[i]["id"] != 0 && allStationID.Contains((string)listeStations[i]["nom"]) == false)
                {
                    allStationID.Add((string)listeStations[i]["nom"]);
                }
            }
            return allStationID;
        }

        public int TrouverGarePlusProche(double longitude, double latitude, List<string> listeNomGares, Dictionary<string, Dictionary<string, object>> listeGares, List<Dictionary<string, object>> listeLignes)
        {
            string nomGarePlusProche = "";
            double distanceMin = double.MaxValue;

            foreach (string nomGare in listeNomGares)
            {
                double radLatAdresse = latitude * (Math.PI / 180.0);
                double radLonAdresse = longitude * (Math.PI / 180.0);
                double radLatGare = Convert.ToDouble(listeGares[nomGare]["lat"]) * (Math.PI / 180.0);
                double radLonGare = Convert.ToDouble(listeGares[nomGare]["lon"]) * (Math.PI / 180.0);
                double dLat = radLatGare - radLatAdresse;
                double dLon = radLonGare - radLonAdresse;
                double a = Math.Pow(Math.Sin(dLat / 2), 2) + Math.Cos(radLatAdresse) * Math.Cos(radLatGare) * Math.Pow(Math.Sin(dLon / 2), 2);
                double c = 2 * Math.Atan2(Math.Sqrt(a), Math.Sqrt(1 - a));
                double distance = 6371.0 * c;
                if (distance < distanceMin)
                {
                    distanceMin = distance;
                    nomGarePlusProche = nomGare;
                }
            }

            int rep = 0;

            foreach (var ligne in listeLignes)
            {
                if ((string)ligne["nom"] == nomGarePlusProche)
                {
                    rep = (int)ligne["id"];
                }
            }
            return rep;
        }


        /// <summary>
        /// Cette fonction transforme le fichier MTX fourni en tableau de tableau de int.
        /// </summary>
        /// <param name="filePath"></param>
        /// <returns></returns>
        public List<int[]> LireFichierMTX(string filePath)
        {
            List<int[]> valeurs = new List<int[]>();

            try
            {
                using (StreamReader sr = new StreamReader(filePath))
                {
                    string ligne;
                    bool debutDonnees = false;
                    while ((ligne = sr.ReadLine()) != null)
                    {
                        if (ligne.StartsWith("%")) continue;

                        string[] parties = ligne.Split(' ', StringSplitOptions.RemoveEmptyEntries);

                        if (!debutDonnees)
                        {
                            debutDonnees = true;

                        }
                        else
                        {
                            int[] triplet = new int[2]
                            {
                            int.Parse(parties[0]),
                            int.Parse(parties[1]),
                            };

                            valeurs.Add(triplet);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Erreur lors de la lecture du fichier : {ex.ToString()}");
            }

            return valeurs;
        }

        /// <summary>
        /// Cette fonction renvoie le nombre de noeuds inscrit sur le fichier MTX.
        /// </summary>
        /// <param name="filePath"></param>
        /// <returns></returns>
        public int GetNombreNoeuds(string filePath)
        {
            List<int[]> valeurs = new List<int[]>();
            int num = 0;
            try
            {
                using (StreamReader sr = new StreamReader(filePath))
                {
                    string ligne;
                    bool debutDonnees = false;
                    while ((ligne = sr.ReadLine()) != null)
                    {
                        if (ligne.StartsWith("%")) continue;

                        string[] parties = ligne.Split(' ', StringSplitOptions.RemoveEmptyEntries);

                        if (!debutDonnees)
                        {
                            debutDonnees = true;
                            num = int.Parse(parties[0]);
                        }

                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Erreur lors de la lecture du fichier : {ex.ToString()}");
            }

            return num;
        }
    }
}
