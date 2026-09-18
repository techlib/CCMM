<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0" xmlns:ccmm="https://schema.ccmm.cz/research-data/2.0" xmlns:c="https://schemas.dataspecer.com/xsd/core/" xmlns:ns0="http://purl.org/dc/terms/" xmlns:ns1="http://www.w3.org/2004/02/skos/core#" xmlns:ns2="https://w3id.org/tib/datacite/property/" xmlns:ns3="https://model.ccmm.cz/vocabulary/ccmm#">
  <xsl:import href="../subject-scheme/lifting.xslt"/>
  <xsl:output method="xml" version="1.0" encoding="utf-8" media-type="application/rdf+xml" indent="yes"/>
  <xsl:template match="/ccmm:subject">
    <rdf:RDF>
      <xsl:variable name="result" as="element()*">
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742338662847-61c1-8d4b-b552"/>
      </xsl:variable>
      <xsl:for-each select="$result">
        <xsl:copy>
          <xsl:call-template name="remove-top"/>
        </xsl:copy>
      </xsl:for-each>
      <xsl:for-each select="$result//top-level/node()">
        <xsl:copy>
          <xsl:call-template name="remove-top"/>
        </xsl:copy>
      </xsl:for-each>
    </rdf:RDF>
  </xsl:template>
  <xsl:template match="@xml:lang">
    <xsl:copy-of select="."/>
  </xsl:template>
  <xsl:template name="remove-top">
    <xsl:for-each select="@*">
      <xsl:copy/>
    </xsl:for-each>
    <xsl:for-each select="node()[not(. instance of element(top-level))]">
      <xsl:copy>
        <xsl:call-template name="remove-top"/>
      </xsl:copy>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742338662847-61c1-8d4b-b552">
    <xsl:param name="arc" select="()"/>
    <xsl:param name="no_iri" select="false()"/>
    <rdf:Description>
      <xsl:apply-templates select="@*"/>
      <xsl:variable name="id">
        <id>
          <xsl:choose>
            <xsl:when test="ccmm:iri and not($no_iri)">
              <xsl:attribute name="rdf:about">
                <xsl:value-of select="ccmm:iri"/>
              </xsl:attribute>
            </xsl:when>
            <xsl:otherwise>
              <xsl:attribute name="rdf:nodeID">
                <xsl:value-of select="generate-id()"/>
              </xsl:attribute>
            </xsl:otherwise>
          </xsl:choose>
        </id>
      </xsl:variable>
      <xsl:copy-of select="$id//@*"/>
      <rdf:type rdf:resource="https://w3id.org/tib/datacite/class/Subject"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="ccmm:title">
        <ns0:title>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:title>
      </xsl:for-each>
      <xsl:for-each select="ccmm:definition">
        <ns1:definition>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns1:definition>
      </xsl:for-each>
      <xsl:for-each select="ccmm:classification_code">
        <ns2:classificationCode>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns2:classificationCode>
      </xsl:for-each>
      <xsl:for-each select="ccmm:subject_scheme">
        <ns3:inSubjectScheme>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742288726417-ccc4-1d84-8bc2"/>
        </ns3:inSubjectScheme>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template match="@*|*"/>
</xsl:stylesheet>
