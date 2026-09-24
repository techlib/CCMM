<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sp="http://www.w3.org/2005/sparql-results#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="2.0" xmlns:ccmm="https://schema.ccmm.cz/research-data/2.0" xmlns:c="https://schemas.dataspecer.com/xsd/core/">
  <xsl:import href="../organization/lowering.xslt"/>
  <xsl:import href="../person/lowering.xslt"/>
  <xsl:import href="../attributed-agent-role-type/lowering.xslt"/>
  <xsl:import href="../identifier/lowering.xslt"/>
  <xsl:import href="../contact-details/lowering.xslt"/>
  <xsl:import href="../address/lowering.xslt"/>
  <xsl:import href="../identifier-scheme/lowering.xslt"/>
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
    <xsl:for-each-group select="sp:results/sp:result[sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;http://www.w3.org/ns/prov#Attribution&#34;]" group-by="c:id-key(sp:binding[@name=$subj]/*[1])">
      <xsl:apply-templates select="current-group()[1]"/>
    </xsl:for-each-group>
  </xsl:template>
  <xsl:template match="sp:result[sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;http://www.w3.org/ns/prov#Attribution&#34;]">
    <ccmm:resource_attribution>
      <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1782311692513-fbfd-95df-9c5a">
        <xsl:with-param name="id">
          <xsl:copy-of select="sp:binding[@name=$subj]/*"/>
        </xsl:with-param>
      </xsl:call-template>
    </ccmm:resource_attribution>
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
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1782311692513-fbfd-95df-9c5a">
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
    <xsl:for-each-group select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;http://www.w3.org/ns/prov#agent&#34;]" group-by="c:id-key(sp:binding[@name=$obj]/*[1])">
      <xsl:for-each select="current-group()[1]">
        <ccmm:attributed_agent>
          <xsl:choose>
            <xsl:when test="//sp:result[sp:binding[@name=$subj]/*[c:id-key(.) = c:id-key(current()/sp:binding[@name=$obj]/*)] and sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;http://www.w3.org/ns/org#Organization&#34;]">
              <ccmm:organization>
                <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1744871355397-62d0-acf0-af09">
                  <xsl:with-param name="id">
                    <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
                  </xsl:with-param>
                </xsl:call-template>
              </ccmm:organization>
            </xsl:when>
            <xsl:when test="//sp:result[sp:binding[@name=$subj]/*[c:id-key(.) = c:id-key(current()/sp:binding[@name=$obj]/*)] and sp:binding[@name=$pred]/sp:uri/text()=$type and sp:binding[@name=$obj]/sp:uri/text()=&#34;http://www.w3.org/ns/prov#Person&#34;]">
              <ccmm:person>
                <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1762017242451-3954-d430-aa66">
                  <xsl:with-param name="id">
                    <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
                  </xsl:with-param>
                </xsl:call-template>
              </ccmm:person>
            </xsl:when>
          </xsl:choose>
        </ccmm:attributed_agent>
      </xsl:for-each>
    </xsl:for-each-group>
    <xsl:for-each-group select="//sp:result[sp:binding[@name=$subj]/*[$id_test = c:id-key(.)] and sp:binding[@name=$pred]/sp:uri/text()=&#34;http://www.w3.org/ns/dcat#hadRole&#34;]" group-by="c:id-key(sp:binding[@name=$obj]/*[1])">
      <xsl:for-each select="current-group()[1]">
        <ccmm:role>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1782312422764-790c-7c4c-9803">
            <xsl:with-param name="id">
              <xsl:copy-of select="sp:binding[@name=$obj]/*"/>
            </xsl:with-param>
          </xsl:call-template>
        </ccmm:role>
      </xsl:for-each>
    </xsl:for-each-group>
  </xsl:template>
  <xsl:template match="@*|*"/>
</xsl:stylesheet>
