<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sp="http://www.w3.org/2005/sparql-results#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0" xmlns:ccmm="https://schema.ccmm.cz/research-data/2.0" xmlns:c="https://schemas.dataspecer.com/xsd/core/">
  <xsl:import href="../time-interval/lowering.xslt"/>
  <xsl:import href="../time-instant/lowering.xslt"/>
  <xsl:import href="../date-type/lowering.xslt"/>
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
    <xsl:for-each-group select="sp:results/sp:result[sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;https://model.ccmm.cz/vocabulary/ccmm#TimeReference&#34;]" group-by="c:id-key(sp:binding[@name=$subj]/*[1])">
      <xsl:apply-templates select="current-group()[1]"/>
    </xsl:for-each-group>
  </xsl:template>
  <xsl:template match="sp:result[sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;https://model.ccmm.cz/vocabulary/ccmm#TimeReference&#34;]">
    <ccmm:time_reference>
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1762083331490-ea8b-4a3a-bd65">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$subj]/*"/>
        </xsl:with-param>
      </xsl:call-template>
    </ccmm:time_reference>
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
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1762083331490-ea8b-4a3a-bd65">
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
    <xsl:for-each-group select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;http://www.w3.org/2006/time#hasTime&#34;]" group-by="c:id-key(sp:binding[@name=$obj]/*[1])">
      <xsl:for-each select="current-group()[1]">
        <ccmm:temporal_representation>
          <xsl:choose>
            <xsl:when test="//sp:result[sp:binding[@name=$subj]/*[c:id-key(.) = c:id-key(current()/sp:binding[@name=$obj]/*)] and sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;http://www.w3.org/2006/time#Interval&#34;]">
              <ccmm:time_interval>
                <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1750713556573-db1c-483c-bcb7">
                  <xsl:with-param name="id">
                    <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
                  </xsl:with-param>
                </xsl:call-template>
              </ccmm:time_interval>
            </xsl:when>
            <xsl:when test="//sp:result[sp:binding[@name=$subj]/*[c:id-key(.) = c:id-key(current()/sp:binding[@name=$obj]/*)] and sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;http://www.w3.org/2006/time#Instant&#34;]">
              <ccmm:time_instant>
                <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1750713474658-dd87-9fe9-a4ab">
                  <xsl:with-param name="id">
                    <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
                  </xsl:with-param>
                </xsl:call-template>
              </ccmm:time_instant>
            </xsl:when>
          </xsl:choose>
        </ccmm:temporal_representation>
      </xsl:for-each>
    </xsl:for-each-group>
    <xsl:for-each-group select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://model.ccmm.cz/vocabulary/ccmm#hasType&#34;]" group-by="c:id-key(sp:binding[@name=$obj]/*[1])">
      <xsl:for-each select="current-group()[1]">
        <ccmm:date_type>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1747684797448-9d6c-a945-a0af">
            <xsl:with-param name="id">
              <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
            </xsl:with-param>
          </xsl:call-template>
        </ccmm:date_type>
      </xsl:for-each>
    </xsl:for-each-group>
    <xsl:for-each-group select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;https://w3id.org/tib/datacite/property/dateInformation&#34;]" group-by="c:id-key(sp:binding[@name=$obj]/*[1])">
      <xsl:for-each select="current-group()[1]">
        <ccmm:date_information>
          <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
        </ccmm:date_information>
      </xsl:for-each>
    </xsl:for-each-group>
  </xsl:template>
  <xsl:template match="@*|*"/>
</xsl:stylesheet>
