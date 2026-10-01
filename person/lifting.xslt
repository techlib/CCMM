<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0" xmlns:ccmm="https://schema.ccmm.cz/research-data/2.0" xmlns:c="https://schemas.dataspecer.com/xsd/core/" xmlns:ns0="http://www.w3.org/ns/adms#" xmlns:ns1="http://xmlns.com/foaf/0.1/" xmlns:ns2="http://www.w3.org/2006/vcard/ns#" xmlns:ns3="http://www.w3.org/ns/dcat#" xmlns:ns4="https://model.ccmm.cz/vocabulary/ccmm#">
  <xsl:import href="../identifier/lifting.xslt"/>
  <xsl:import href="../contact-details/lifting.xslt"/>
  <xsl:import href="../organization/lifting.xslt"/>
  <xsl:import href="../address/lifting.xslt"/>
  <xsl:import href="../identifier-scheme/lifting.xslt"/>
  <xsl:output method="xml" version="1.0" encoding="utf-8" media-type="application/rdf+xml" indent="yes"/>
  <xsl:template match="/ccmm:person">
    <rdf:RDF>
      <xsl:variable name="result" as="element()*">
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1762017242451-3954-d430-aa66"/>
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
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1762017242451-3954-d430-aa66">
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
      <rdf:type rdf:resource="http://www.w3.org/ns/prov#Person"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="ccmm:identifier">
        <ns0:identifier>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1779978617597-db2c-0cbc-9b17"/>
        </ns0:identifier>
      </xsl:for-each>
      <xsl:for-each select="ccmm:name">
        <ns1:name>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns1:name>
      </xsl:for-each>
      <xsl:for-each select="ccmm:given_name">
        <ns2:given-name>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns2:given-name>
      </xsl:for-each>
      <xsl:for-each select="ccmm:family_name">
        <ns2:family-name>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns2:family-name>
      </xsl:for-each>
      <xsl:for-each select="ccmm:contact_point">
        <ns3:contactPoint>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742234373952-7a86-df18-a582"/>
        </ns3:contactPoint>
      </xsl:for-each>
      <xsl:for-each select="ccmm:affiliation">
        <ns4:hasAffiliation>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1744871355397-62d0-acf0-af09"/>
        </ns4:hasAffiliation>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template match="@*|*"/>
</xsl:stylesheet>
