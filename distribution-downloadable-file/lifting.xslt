<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0" xmlns:ccmm="https://schema.ccmm.cz/research-data/2.0" xmlns:c="https://schemas.dataspecer.com/xsd/core/" xmlns:ns0="http://purl.org/dc/terms/" xmlns:ns1="http://www.w3.org/ns/dcat#" xmlns:ns2="http://spdx.org/rdf/terms#">
  <xsl:import href="../file/lifting.xslt"/>
  <xsl:import href="../application-profile/lifting.xslt"/>
  <xsl:import href="../format/lifting.xslt"/>
  <xsl:import href="../media-type/lifting.xslt"/>
  <xsl:import href="../checksum/lifting.xslt"/>
  <xsl:import href="../access-rights/lifting.xslt"/>
  <xsl:import href="../licence-document/lifting.xslt"/>
  <xsl:import href="../checksum-algorithm/lifting.xslt"/>
  <xsl:output method="xml" version="1.0" encoding="utf-8" media-type="application/rdf+xml" indent="yes"/>
  <xsl:template match="/ccmm:distribution-downloadable-file">
    <rdf:RDF>
      <xsl:variable name="result" as="element()*">
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1762018020967-1861-7f29-8ecd"/>
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
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1762018020967-1861-7f29-8ecd">
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
      <rdf:type rdf:resource="https://model.ccmm.cz/vocabulary/ccmm#Distribution-DownloadableFile"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="ccmm:title">
        <ns0:title>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:title>
      </xsl:for-each>
      <xsl:for-each select="ccmm:access_url">
        <ns1:accessURL>
          <xsl:attribute name="rdf:resource">
            <xsl:value-of select="."/>
          </xsl:attribute>
        </ns1:accessURL>
      </xsl:for-each>
      <xsl:for-each select="ccmm:download_url">
        <ns1:downloadURL>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742235831207-776a-49bb-9ac1"/>
        </ns1:downloadURL>
      </xsl:for-each>
      <xsl:for-each select="ccmm:conforms_to">
        <ns0:conformsTo>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742235803801-3bb0-3064-a2dc"/>
        </ns0:conformsTo>
      </xsl:for-each>
      <xsl:for-each select="ccmm:format">
        <ns0:format>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1747685284971-4e81-5f45-a58b"/>
        </ns0:format>
      </xsl:for-each>
      <xsl:for-each select="ccmm:media_type">
        <ns1:mediaType>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1780471210066-be4d-9a0f-864f"/>
        </ns1:mediaType>
      </xsl:for-each>
      <xsl:for-each select="ccmm:packaging_format">
        <ns1:packageFormat>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1780471210066-be4d-9a0f-864f"/>
        </ns1:packageFormat>
      </xsl:for-each>
      <xsl:for-each select="ccmm:compression_format">
        <ns1:compressFormat>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1780471210066-be4d-9a0f-864f"/>
        </ns1:compressFormat>
      </xsl:for-each>
      <xsl:for-each select="ccmm:byte_size">
        <ns1:byteSize rdf:datatype="http://www.w3.org/2001/XMLSchema#integer">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns1:byteSize>
      </xsl:for-each>
      <xsl:for-each select="ccmm:checksum">
        <ns2:checksum>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1743669664695-1a30-486d-bbd8"/>
        </ns2:checksum>
      </xsl:for-each>
      <xsl:for-each select="ccmm:rights">
        <ns0:rights>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1747685414671-e5e1-7f82-b427"/>
        </ns0:rights>
      </xsl:for-each>
      <xsl:for-each select="ccmm:licence">
        <ns0:license>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1785943107074-47da-df8e-9e09"/>
        </ns0:license>
      </xsl:for-each>
      <xsl:for-each select="ccmm:description">
        <ns0:description>
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns0:description>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template match="@*|*"/>
</xsl:stylesheet>
