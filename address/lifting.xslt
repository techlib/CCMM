<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0" xmlns:ccmm="https://schema.ccmm.cz/research-data/2.0" xmlns:c="https://schemas.dataspecer.com/xsd/core/" xmlns:ns0="http://www.w3.org/2000/01/rdf-schema#" xmlns:ns1="http://www.w3.org/ns/locn#">
  <xsl:output method="xml" version="1.0" encoding="utf-8" media-type="application/rdf+xml" indent="yes"/>
  <xsl:template match="/ccmm:address">
    <rdf:RDF>
      <xsl:variable name="result" as="element()*">
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742288744053-1c9b-5b71-be90"/>
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
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742288744053-1c9b-5b71-be90">
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
      <rdf:type rdf:resource="http://www.w3.org/ns/locn#Address"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="ccmm:label">
        <ns0:label>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:label>
      </xsl:for-each>
      <xsl:for-each select="ccmm:full_address">
        <ns1:fullAddress>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns1:fullAddress>
      </xsl:for-each>
      <xsl:for-each select="ccmm:po_box">
        <ns1:poBox>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns1:poBox>
      </xsl:for-each>
      <xsl:for-each select="ccmm:thoroughfare">
        <ns1:thoroughfare>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns1:thoroughfare>
      </xsl:for-each>
      <xsl:for-each select="ccmm:locator_designator">
        <ns1:locatorDesignator>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns1:locatorDesignator>
      </xsl:for-each>
      <xsl:for-each select="ccmm:locator_name">
        <ns1:locatorName>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns1:locatorName>
      </xsl:for-each>
      <xsl:for-each select="ccmm:address_area">
        <ns1:addressArea>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns1:addressArea>
      </xsl:for-each>
      <xsl:for-each select="ccmm:post_name">
        <ns1:postName>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns1:postName>
      </xsl:for-each>
      <xsl:for-each select="ccmm:administrative_unit_level_1">
        <ns1:adminUnitL1>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns1:adminUnitL1>
      </xsl:for-each>
      <xsl:for-each select="ccmm:administrative_unit_level_2">
        <ns1:adminUnitL2>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns1:adminUnitL2>
      </xsl:for-each>
      <xsl:for-each select="ccmm:post_code">
        <ns1:postCode>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns1:postCode>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template match="@*|*"/>
</xsl:stylesheet>
