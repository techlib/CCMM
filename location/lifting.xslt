<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:gsp="http://www.opengis.net/ont/geosparql#" xmlns:gml="http://www.opengis.net/gml/3.2" version="3.0" xmlns:ccmm="https://schema.ccmm.cz/research-data/2.0" xmlns:c="https://schemas.dataspecer.com/xsd/core/" xmlns:ns0="http://www.w3.org/ns/dcat#" xmlns:ns1="http://www.w3.org/2000/01/rdf-schema#" xmlns:ns2="http://www.w3.org/ns/locn#" xmlns:ns3="https://model.ccmm.cz/vocabulary/ccmm#" xmlns:ns4="http://www.opengis.net/ont/geosparql#">
  <xsl:import href="../geometry/lifting.xslt"/>
  <xsl:import href="../related-resource/lifting.xslt"/>
  <xsl:import href="../location-relation-type/lifting.xslt"/>
  <xsl:import href="../identifier/lifting.xslt"/>
  <xsl:import href="../alternate-title/lifting.xslt"/>
  <xsl:import href="../resource-attribution/lifting.xslt"/>
  <xsl:import href="../time-reference/lifting.xslt"/>
  <xsl:import href="../resource-type/lifting.xslt"/>
  <xsl:import href="../resource-relation-type/lifting.xslt"/>
  <xsl:import href="../time-interval/lifting.xslt"/>
  <xsl:import href="../time-instant/lifting.xslt"/>
  <xsl:import href="../date-type/lifting.xslt"/>
  <xsl:import href="../organization/lifting.xslt"/>
  <xsl:import href="../person/lifting.xslt"/>
  <xsl:import href="../attributed-agent-role-type/lifting.xslt"/>
  <xsl:import href="../contact-details/lifting.xslt"/>
  <xsl:import href="../address/lifting.xslt"/>
  <xsl:import href="../identifier-scheme/lifting.xslt"/>
  <xsl:import href="../alternate-title-type/lifting.xslt"/>
  <xsl:output method="xml" version="1.0" encoding="utf-8" media-type="application/rdf+xml" indent="yes"/>
  <xsl:template match="/ccmm:location">
    <rdf:RDF>
      <xsl:variable name="result" as="element()*">
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742235167407-c0c8-51f4-be0a"/>
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
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742235167407-c0c8-51f4-be0a">
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
      <rdf:type rdf:resource="http://purl.org/dc/terms/Location"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="ccmm:bounding_box">
        <ns0:bbox>
          <xsl:call-template name="_http_003a_002f_002fwww.opengis.net_002font_002fsf_0023Envelope"/>
        </ns0:bbox>
      </xsl:for-each>
      <xsl:for-each select="ccmm:label">
        <ns1:label>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns1:label>
      </xsl:for-each>
      <xsl:for-each select="ccmm:geometry">
        <ns2:geometry>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742340936467-5d87-fae6-b5c7"/>
        </ns2:geometry>
      </xsl:for-each>
      <xsl:for-each select="ccmm:related_object">
        <ns3:hasRelatedResource>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1765909420903-5abd-5a0e-810e"/>
        </ns3:hasRelatedResource>
      </xsl:for-each>
      <xsl:for-each select="ccmm:relation_type">
        <ns3:hasType>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1747685228117-d1d5-c203-b159"/>
        </ns3:hasType>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template name="_http_003a_002f_002fwww.opengis.net_002font_002fsf_0023Envelope">
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
      <rdf:type rdf:resource="http://www.opengis.net/ont/sf#Envelope"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="ccmm:gml">
        <ns4:asGML rdf:datatype="http://www.opengis.net/ont/geosparql#gmlLiteral">
          <xsl:call-template name="gml-transform-lifting"/>
        </ns4:asGML>
      </xsl:for-each>
      <xsl:for-each select="ccmm:wkt">
        <ns4:asWKT rdf:datatype="http://www.opengis.net/ont/geosparql#wktLiteral">
          <xsl:call-template name="wkt-transform"/>
        </ns4:asWKT>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template match="@*|*"/>
</xsl:stylesheet>
