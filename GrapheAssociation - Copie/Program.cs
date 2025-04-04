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
           
            Main refMain = new Main();

            Console.WriteLine(refMain.TrouverCheminLePlusCourt(48.056613, 2.63222, 48.44366, 2.68563));
            refMain.AfficherCarte();
            
        }





    }
}
