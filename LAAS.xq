document{
  <html>
  <head>
    <title>Résumé des requêtes xquery</title>
  </head>
  <body>
    <equipes>Nombre équipes de Recherche : {count(doc("LAAS-IC.xml")//EquipeDeRecherche)} 
    </equipes>
     <prod>Nombre de productions scientifiques : {count(doc("LAAS-IC.xml")//productionsScientifiques/child::*)} 
    </prod>
    <revues>Nombre de revues : {count(doc("LAAS-IC.xml")//Revue)} </revues>
   
    <theses>Titre des thèses :
      {for $these in doc("LAAS-IC.xml")//theses
      return <br>{string($these/child::*/@titre)}</br>}
    </theses>
    <respo>Reponsable du thème IC
      {for $i in doc("LAAS-IC.xml")//Theme
        where $i/@acronyme = "IC"
        return concat($i/responsable/@nom, " ", $i/responsable/@prenom)}
    </respo>
  </body>
</html>
}