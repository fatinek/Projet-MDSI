<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns="http://www.w3.org/1999/xhtml">

  <xsl:template match="/">
    <html>
      <head>
        <title> Description des différents thèmes </title>
      </head>
      <body>
          <xsl:for-each select="//Theme">
            <p><b>Acronyme : </b> <xsl:value-of select="@acronyme"/></p>
            <p><b>Description : </b> <xsl:value-of select="@description"/></p>
            <!-- Equipe de recherche -->
            <blockquote>
              <xsl:for-each select=".//EquipeDeRecherche">
                <p><b>Nom : </b> <xsl:value-of select="@nom"/></p>
                <p><b>Acronyme : </b> <xsl:value-of select="@acronyme"/></p>
                <p><b>Membres : </b></p>
                  <blockquote>
                    <xsl:for-each select=".//membre">
                      <xsl:for-each select="attribute::*">
                        <p> <xsl:value-of select="name(.)"/> :  <xsl:value-of select="."/> </p>
                      </xsl:for-each>
                    </xsl:for-each>
                    <p> <b> Thèses : </b> </p>

                    <xsl:for-each select="./theses/child::*">
                      <xsl:for-each select="attribute::*">
                        <p> <xsl:value-of select="name(.)"/> :  <xsl:value-of select="."/> </p>
                      </xsl:for-each>
                      <p> <b> Encadrants : </b>
                        <xsl:for-each select=".//Encadrants">
                            <xsl:value-of select="@nom"/> -
                        </xsl:for-each>
                      </p>
                    </xsl:for-each>

                    <p> <b> Responsable : </b> <xsl:value-of select="./responsable/@nom"/></p>
                  </blockquote>
              </xsl:for-each>

              <!-- Projet de recherche -->
              <xsl:for-each select=".//ProjetDeRecherche">
                <p> <b> Projets de recherche : </b> </p>
                <blockquote>
                  <xsl:for-each select="attribute::*">
                    <p> <xsl:value-of select="name(.)"/> :  <xsl:value-of select="."/> </p>
                  </xsl:for-each>
                  <p> <b> Partenaires participants : </b> </p>
                  <xsl:for-each select=".//PartenairesParticipants">
                    <blockquote>
                      <xsl:for-each select="attribute::*">
                        <p> <xsl:value-of select="name(.)"/> :  <xsl:value-of select="."/> </p>
                      </xsl:for-each>
                    </blockquote>
                  </xsl:for-each>
                  <p> <b> Porteur : </b> <xsl:value-of select="./porteur/@nom"/></p>
                </blockquote>
              </xsl:for-each>
              <p> <b> Evenements : </b></p>
              <blockquote>
                <xsl:for-each select=".//Evenements/child::*">
                  <b><xsl:value-of select="name(.)"/> :</b>
                  <blockquote>
                    <xsl:for-each select="./attribute::*">
                      <p> <xsl:value-of select="name(.)"/> :  <xsl:value-of select="."/> </p>
                    </xsl:for-each>
                  </blockquote>
                </xsl:for-each>
              </blockquote>
              <p> <b> Responsable : </b> <xsl:value-of select="./responsable/@nom"/></p>
            </blockquote>

          </xsl:for-each>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="Theme">
    <xsl:apply-templates/>
  </xsl:template>

</xsl:stylesheet>
