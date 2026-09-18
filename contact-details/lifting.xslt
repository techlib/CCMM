<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0" xmlns:ccmm="https://schema.ccmm.cz/research-data/2.0" xmlns:c="https://schemas.dataspecer.com/xsd/core/" xmlns:ns0="https://model.ccmm.cz/vocabulary/ccmm#" xmlns:ns1="http://www.w3.org/2006/vcard/ns#">
  <xsl:import href="../address/lifting.xslt"/>
  <xsl:output method="xml" version="1.0" encoding="utf-8" media-type="application/rdf+xml" indent="yes"/>
  <xsl:template match="/ccmm:contact_details">
    <rdf:RDF>
      <xsl:variable name="result" as="element()*">
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742234373952-7a86-df18-a582"/>
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
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742234373952-7a86-df18-a582">
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
      <rdf:type rdf:resource="http://www.w3.org/2006/vcard/ns#Kind"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="ccmm:data_box">
        <ns0:dataBox>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:dataBox>
      </xsl:for-each>
      <xsl:for-each select="ccmm:email">
        <ns0:email>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:email>
      </xsl:for-each>
      <xsl:for-each select="ccmm:phone">
        <ns0:phone>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:phone>
      </xsl:for-each>
      <xsl:for-each select="ccmm:address">
        <ns1:hasAddress>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742288744053-1c9b-5b71-be90"/>
        </ns1:hasAddress>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template match="@*|*"/>
</xsl:stylesheet>
