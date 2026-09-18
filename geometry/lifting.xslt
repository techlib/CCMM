<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:gsp="http://www.opengis.net/ont/geosparql#" xmlns:gml="http://www.opengis.net/gml/3.2" version="3.0" xmlns:ccmm="https://schema.ccmm.cz/research-data/2.0" xmlns:c="https://schemas.dataspecer.com/xsd/core/" xmlns:ns0="http://www.w3.org/2000/01/rdf-schema#" xmlns:ns1="http://www.opengis.net/ont/geosparql#">
  <xsl:output method="xml" version="1.0" encoding="utf-8" media-type="application/rdf+xml" indent="yes"/>
  <xsl:template match="/ccmm:geometry">
    <rdf:RDF>
      <xsl:variable name="result" as="element()*">
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742340936467-5d87-fae6-b5c7"/>
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
  <xsl:template name="wkt-transform">
    <xsl:choose>
      <xsl:when test="@srsName">
        <xsl:value-of select="concat('&#60;', replace(@srsName, '^\s+|\s+$',''), '&#62;', ' ', replace(string(.), '^\s+|\s+$',''))"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="replace(string(.), '^\s+|\s+$','')"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="gml-transform-lifting">
    <xsl:param name="wrapper-name" select="''"/>
    <xsl:choose>
      <xsl:when test="normalize-space($wrapper-name) != ''">
        <xsl:variable name="wrapped-gml">
          <xsl:element name="{$wrapper-name}">
            <xsl:copy-of select="@*|node()"/>
          </xsl:element>
        </xsl:variable>
        <xsl:value-of select="serialize($wrapped-gml, map{'method':'xml','omit-xml-declaration':true(),'indent':false()})"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="serialize(node(), map{'method':'xml','omit-xml-declaration':true(),'indent':false()})"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742340936467-5d87-fae6-b5c7">
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
      <rdf:type rdf:resource="http://www.w3.org/ns/locn#Geometry"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="ccmm:label">
        <ns0:label>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:label>
      </xsl:for-each>
      <xsl:for-each select="ccmm:gml">
        <ns1:asGML rdf:datatype="http://www.opengis.net/ont/geosparql#gmlLiteral">
          <xsl:call-template name="gml-transform-lifting"/>
        </ns1:asGML>
      </xsl:for-each>
      <xsl:for-each select="ccmm:wkt">
        <ns1:asWKT rdf:datatype="http://www.opengis.net/ont/geosparql#wktLiteral">
          <xsl:call-template name="wkt-transform"/>
        </ns1:asWKT>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template match="@*|*"/>
</xsl:stylesheet>
