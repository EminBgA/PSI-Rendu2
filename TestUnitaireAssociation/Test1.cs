using System;
using System.IO;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using GrapheAssociation;


namespace GrapheAssociation
{
    [TestClass]
    public sealed class Test1
    {
        [TestMethod]
        public void TestMethod1()
        {
            Noeud refNoeud1 = new Noeud(1, "noeud1");
            Noeud refNoeud2 = new Noeud(2, "noeud2");
            Lien refLien = new Lien(refNoeud1, refNoeud2, 2, 2, "1", 1);
            MainG refMain = new MainG();
            Graphe refGraphe = new Graphe(3);
            refGraphe.AjouterNoeud(1, "noeud1");
            refGraphe.AjouterNoeud(2, "noeud2");
            refGraphe.AjouterLien(1, 2, 2, 2, "1", 1);
            Lien[] listeLiensChemins = new Lien[1];
            listeLiensChemins[0] = refLien;

            int idNoeud = refNoeud1.GetID();
            Assert.AreEqual(1, idNoeud);


            Noeud noeud = refLien.GetNoeud(1);
            Assert.AreEqual(noeud, refNoeud1);

            string chemin = refMain.AfficherChemins(listeLiensChemins);
            string reponseAttendueListeChemins = "Metro 1 : noeud1 -> noeud2\n\n";
            Assert.AreEqual(chemin, reponseAttendueListeChemins);

            string nomSommet = refGraphe.NomSommet(refNoeud1.GetID());
            Assert.AreEqual(nomSommet, "noeud1");

            int idSommet = refGraphe.IDSommet(refNoeud2.GetNom());
            Assert.AreEqual(idSommet, 2);

            Assert.AreEqual(refGraphe.EstConnexe(), true);



        }
    }
}
