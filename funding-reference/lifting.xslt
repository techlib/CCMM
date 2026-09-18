<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0" xmlns:ccmm="https://schema.ccmm.cz/research-data/2.0" xmlns:c="https://schemas.dataspecer.com/xsd/core/" xmlns:ns0="https://w3id.org/tib/datacite/property/" xmlns:ns1="https://model.ccmm.cz/vocabulary/ccmm#">
  <xsl:import href="../organization/lifting.xslt"/>
  <xsl:import href="../person/lifting.xslt"/>
  <xsl:import href="../identifier/lifting.xslt"/>
  <xsl:import href="../contact-details/lifting.xslt"/>
  <xsl:import href="../address/lifting.xslt"/>
  <xsl:import href="../identifier-scheme/lifting.xslt"/>
  <xsl:output method="xml" version="1.0" encoding="utf-8" media-type="application/rdf+xml" indent="yes"/>
  <xsl:template match="/ccmm:funding_reference">
    <rdf:RDF>
      <xsl:variable name="result" as="element()*">
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742235374506-6369-b2fd-b1bf"/>
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
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742235374506-6369-b2fd-b1bf">
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
      <rdf:type rdf:resource="https://w3id.org/tib/datacite/class/FundingReference"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="ccmm:local_identifier">
        <ns0:awardNumber>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:awardNumber>
      </xsl:for-each>
      <xsl:for-each select="ccmm:award_title">
        <ns0:awardTitle>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:awardTitle>
      </xsl:for-each>
      <xsl:for-each select="ccmm:funding_program">
        <ns1:fundingProgram rdf:datatype="http://www.w3.org/2001/XMLSchema#anyURI">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns1:fundingProgram>
      </xsl:for-each>
      <xsl:for-each select="ccmm:funder">
        <ns0:funderIdentifier>
          <xsl:variable name="type" select="resolve-QName(@xsi:type,.)"/>
          <xsl:variable name="types" as="element()*">
            <ccmm:organization/>
            <ccmm:person/>
          </xsl:variable>
          <xsl:choose>
            <xsl:when test="$type=node-name($types[1])">
              <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1744871355397-62d0-acf0-af09"/>
            </xsl:when>
            <xsl:when test="*[node-name(.) = node-name($types[1])]">
              <xsl:for-each select="*[node-name(.) = node-name($types[1])]">
                <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1744871355397-62d0-acf0-af09"/>
              </xsl:for-each>
            </xsl:when>
            <xsl:when test="$type=node-name($types[2])">
              <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1762017242451-3954-d430-aa66"/>
            </xsl:when>
            <xsl:when test="*[node-name(.) = node-name($types[2])]">
              <xsl:for-each select="*[node-name(.) = node-name($types[2])]">
                <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1762017242451-3954-d430-aa66"/>
              </xsl:for-each>
            </xsl:when>
          </xsl:choose>
        </ns0:funderIdentifier>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template match="@*|*"/>
</xsl:stylesheet>
