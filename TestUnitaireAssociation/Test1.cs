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
            Graphe refGraphe = new Graphe(3);
            refGraphe.AjouterNoeud(1, "noeud1");
            refGraphe.AjouterNoeud(2, "noeud2");
            refGraphe.AjouterLien(1, 2, 2, 2, "1", 1);


            int idNoeud = refNoeud1.GetID();
            Assert.AreEqual(1, idNoeud);


            Noeud noeud = refLien.GetNoeud(1);
            Assert.AreEqual(noeud, refNoeud1);
            


            
        }
    }
}
