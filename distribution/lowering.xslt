<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sp="http://www.w3.org/2005/sparql-results#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0" xmlns:ccmm="https://schema.ccmm.cz/research-data/2.0" xmlns:c="https://schemas.dataspecer.com/xsd/core/">
  <xsl:import href="../distribution-data-service/lowering.xslt"/>
  <xsl:import href="../distribution-downloadable-file/lowering.xslt"/>
  <xsl:import href="../file/lowering.xslt"/>
  <xsl:import href="../application-profile/lowering.xslt"/>
  <xsl:import href="../format/lowering.xslt"/>
  <xsl:import href="../media-type/lowering.xslt"/>
  <xsl:import href="../checksum/lowering.xslt"/>
  <xsl:import href="../access-rights/lowering.xslt"/>
  <xsl:import href="../licence-document/lowering.xslt"/>
  <xsl:import href="../checksum-algorithm/lowering.xslt"/>
  <xsl:import href="../data-service/lowering.xslt"/>
  <xsl:import href="../documentation/lowering.xslt"/>
  <xsl:import href="../related-resource/lowering.xslt"/>
  <xsl:import href="../identifier/lowering.xslt"/>
  <xsl:import href="../alternate-title/lowering.xslt"/>
  <xsl:import href="../resource-attribution/lowering.xslt"/>
  <xsl:import href="../time-reference/lowering.xslt"/>
  <xsl:import href="../resource-type/lowering.xslt"/>
  <xsl:import href="../resource-relation-type/lowering.xslt"/>
  <xsl:import href="../time-interval/lowering.xslt"/>
  <xsl:import href="../time-instant/lowering.xslt"/>
  <xsl:import href="../date-type/lowering.xslt"/>
  <xsl:import href="../organization/lowering.xslt"/>
  <xsl:import href="../person/lowering.xslt"/>
  <xsl:import href="../attributed-agent-role-type/lowering.xslt"/>
  <xsl:import href="../contact-details/lowering.xslt"/>
  <xsl:import href="../address/lowering.xslt"/>
  <xsl:import href="../identifier-scheme/lowering.xslt"/>
  <xsl:import href="../alternate-title-type/lowering.xslt"/>
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
    <xsl:for-each-group select="sp:results/sp:result[sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;https://model.ccmm.cz/vocabulary/ccmm#Distribution-DataService&#34;]" group-by="c:id-key(sp:binding[@name=$subj]/*[1])">
      <xsl:apply-templates select="current-group()[1]"/>
    </xsl:for-each-group>
    <xsl:for-each-group select="sp:results/sp:result[sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;https://model.ccmm.cz/vocabulary/ccmm#Distribution-DownloadableFile&#34;]" group-by="c:id-key(sp:binding[@name=$subj]/*[1])">
      <xsl:apply-templates select="current-group()[1]"/>
    </xsl:for-each-group>
  </xsl:template>
  <xsl:template match="sp:result[sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;https://model.ccmm.cz/vocabulary/ccmm#Distribution-DataService&#34;]">
    <ccmm:distribution_data_service>
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1762011714325-a238-e785-9c3d">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$subj]/*"/>
        </xsl:with-param>
      </xsl:call-template>
    </ccmm:distribution_data_service>
  </xsl:template>
  <xsl:template match="sp:result[sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;https://model.ccmm.cz/vocabulary/ccmm#Distribution-DownloadableFile&#34;]">
    <ccmm:distribution_downloadable_file>
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1762018020967-1861-7f29-8ecd">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$subj]/*"/>
        </xsl:with-param>
      </xsl:call-template>
    </ccmm:distribution_downloadable_file>
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
  <xsl:template match="@*|*"/>
</xsl:stylesheet>
