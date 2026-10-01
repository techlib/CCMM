<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sp="http://www.w3.org/2005/sparql-results#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:gsp="http://www.opengis.net/ont/geosparql#" xmlns:gml="http://www.opengis.net/gml/3.2" version="3.0" xmlns:ccmm="https://schema.ccmm.cz/research-data/2.0" xmlns:c="https://schemas.dataspecer.com/xsd/core/">
  <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>
  <xsl:param name="subj" select="'s'"/>
  <xsl:param name="pred" select="'p'"/>
  <xsl:param name="obj" select="'o'"/>
  <xsl:variable name="type" select="'http://www.w3.org/1999/02/22-rdf-syntax-ns#type'"/>
  <xsl:function name="c:id-key">
    <xsl:param name="node"/>
    <xsl:value-of select="concat(namespace-uri($node),'|',local-name($node),'|',string($node))"/>
  </xsl:function>
  <xsl:template match="/sp:sparql">
    <xsl:for-each-group select="sp:results/sp:result[sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;http://www.w3.org/ns/locn#Geometry&#34;]" group-by="c:id-key(sp:binding[@name=$subj]/*[1])">
      <xsl:apply-templates select="current-group()[1]"/>
    </xsl:for-each-group>
  </xsl:template>
  <xsl:template match="sp:result[sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;http://www.w3.org/ns/locn#Geometry&#34;]">
    <ccmm:geometry>
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742340936467-5d87-fae6-b5c7">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$subj]/*"/>
        </xsl:with-param>
      </xsl:call-template>
    </ccmm:geometry>
  </xsl:template>
  <xsl:template match="@xml:lang">
    <xsl:copy-of select="."/>
  </xsl:template>
  <xsl:template match="sp:literal">
    <xsl:apply-templates select="@*"/>
    <xsl:value-of select="."/>
  </xsl:template>
  <xsl:template match="sp:uri">
    <xsl:value-of select="."/>
  </xsl:template>
  <xsl:template name="wkt-transform-lowering">
    <xsl:param name="value"/>
    <xsl:variable name="trimmed" select="replace(string($value), '^\s+|\s+$','')"/>
    <xsl:choose>
      <xsl:when test="starts-with($trimmed, '&#60;')">
        <xsl:variable name="srsRaw" select="substring-before($trimmed, ' ')"/>
        <xsl:variable name="srs" select="replace($srsRaw, '^&#60;(.*)&#62;$','$1')"/>
        <xsl:attribute name="srsName">
          <xsl:value-of select="$srs"/>
        </xsl:attribute>
        <xsl:value-of select="replace(substring-after($trimmed, ' '), '^\s+|\s+$','')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$trimmed"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="gml-transform-lowering">
    <xsl:param name="value"/>
    <xsl:param name="wrapper-name" select="''"/>
    <xsl:choose>
      <xsl:when test="normalize-space($wrapper-name) != ''">
        <xsl:variable name="fragment" select="parse-xml-fragment(concat('&#60;wrapper&#62;', string($value), '&#60;/wrapper&#62;'))/*/*[1]"/>
        <xsl:copy-of select="$fragment/@*"/>
        <xsl:copy-of select="$fragment/node()"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="fragment" select="parse-xml-fragment(concat('&#60;wrapper&#62;', string($value), '&#60;/wrapper&#62;'))/*/node()"/>
        <xsl:copy-of select="$fragment"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742340936467-5d87-fae6-b5c7">
    <xsl:param name="id"/>
    <xsl:param name="no_iri" select="false()"/>
    <xsl:variable name="id_test">
      <xsl:value-of select="c:id-key($id/*)"/>
    </xsl:variable>
    <xsl:if test="not($no_iri)">
      <xsl:for-each select="$id/sp:uri">
        <ccmm:iri>
          <xsl:value-of select="."/>
        </ccmm:iri>
      </xsl:for-each>
    </xsl:if>
    <xsl:for-each-group select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;http://www.w3.org/2000/01/rdf-schema#label&#34;]" group-by="c:id-key(sp:binding[@name=$obj]/*[1])">
      <xsl:for-each select="current-group()[1]">
        <ccmm:label>
          <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
        </ccmm:label>
      </xsl:for-each>
    </xsl:for-each-group>
    <xsl:for-each-group select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;http://www.opengis.net/ont/geosparql#asGML&#34;]" group-by="c:id-key(sp:binding[@name=$obj]/*[1])">
      <xsl:for-each select="current-group()[1]">
        <ccmm:gml>
          <xsl:call-template name="gml-transform-lowering">
            <xsl:with-param name="value">
              <xsl:value-of select="sp:binding[@name=$obj]/sp:literal"/>
            </xsl:with-param>
          </xsl:call-template>
        </ccmm:gml>
      </xsl:for-each>
    </xsl:for-each-group>
    <xsl:for-each-group select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;http://www.opengis.net/ont/geosparql#asWKT&#34;]" group-by="c:id-key(sp:binding[@name=$obj]/*[1])">
      <xsl:for-each select="current-group()[1]">
        <ccmm:wkt>
          <xsl:call-template name="wkt-transform-lowering">
            <xsl:with-param name="value">
              <xsl:value-of select="sp:binding[@name=$obj]/sp:literal"/>
            </xsl:with-param>
          </xsl:call-template>
        </ccmm:wkt>
      </xsl:for-each>
    </xsl:for-each-group>
  </xsl:template>
  <xsl:template match="@*|*"/>
</xsl:stylesheet>
