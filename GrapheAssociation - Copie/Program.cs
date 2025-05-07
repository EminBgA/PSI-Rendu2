using System;
using System.IO;
using System.Collections.Generic;
using System.Diagnostics;
using System.Runtime.CompilerServices;
using Microsoft.VisualBasic.FileIO;
using System.ComponentModel.DataAnnotations;
using System.Text;
using System.Globalization;


namespace GrapheAssociation
{
    internal class Program
    {

        

        static void Main(string[] args)
        {
           
            MainG refMain = new MainG();

            double latDepart = 48.056613;
            double lonDepart = 2.63222;
            double latArrivee = 48.44366;
            double lonArrivee = 2.68563;

            int gareDepart = 287;
            int gareArrivee = 111;

            // Pour utilise les coordonnees, il faut mettre les gare à 0. gareDepart = 0 et gareArrivee = 0

            Console.WriteLine(refMain.TrouverCheminLePlusCourt(latDepart, lonDepart, latArrivee, lonArrivee, gareDepart, gareArrivee));
            refMain.AfficherCarte();
            
        }





    }
}
