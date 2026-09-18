<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sp="http://www.w3.org/2005/sparql-results#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0" xmlns:ccmm="https://schema.ccmm.cz/research-data/2.0" xmlns:c="https://schemas.dataspecer.com/xsd/core/">
  <xsl:import href="../related-resource/lowering.xslt"/>
  <xsl:import href="../licence-document/lowering.xslt"/>
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
    <xsl:for-each-group select="sp:results/sp:result[sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;http://www.w3.org/ns/dcat#DataService&#34;]" group-by="c:id-key(sp:binding[@name=$subj]/*[1])">
      <xsl:apply-templates select="current-group()[1]"/>
    </xsl:for-each-group>
  </xsl:template>
  <xsl:template match="sp:result[sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;http://www.w3.org/ns/dcat#DataService&#34;]">
    <ccmm:data_service>
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742341134353-4364-b792-b174">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$subj]/*"/>
        </xsl:with-param>
      </xsl:call-template>
    </ccmm:data_service>
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
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742341134353-4364-b792-b174">
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
    <xsl:for-each-group select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;http://purl.org/dc/terms/title&#34;]" group-by="c:id-key(sp:binding[@name=$obj]/*[1])">
      <xsl:for-each select="current-group()[1]">
        <ccmm:label>
          <xsl:apply-templates select="sp:binding[@name=$obj]/sp:literal"/>
        </ccmm:label>
      </xsl:for-each>
    </xsl:for-each-group>
    <xsl:for-each-group select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;http://www.w3.org/ns/dcat#endpointURL&#34;]" group-by="c:id-key(sp:binding[@name=$obj]/*[1])">
      <xsl:for-each select="current-group()[1]">
        <ccmm:endpoint_url>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1765909420903-5abd-5a0e-810e">
            <xsl:with-param name="id">
              <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
            </xsl:with-param>
          </xsl:call-template>
        </ccmm:endpoint_url>
      </xsl:for-each>
    </xsl:for-each-group>
    <xsl:for-each-group select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;http://purl.org/dc/terms/license&#34;]" group-by="c:id-key(sp:binding[@name=$obj]/*[1])">
      <xsl:for-each select="current-group()[1]">
        <ccmm:licence>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1785943107074-47da-df8e-9e09">
            <xsl:with-param name="id">
              <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
            </xsl:with-param>
          </xsl:call-template>
        </ccmm:licence>
      </xsl:for-each>
    </xsl:for-each-group>
  </xsl:template>
  <xsl:template match="@*|*"/>
</xsl:stylesheet>
