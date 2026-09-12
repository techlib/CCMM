<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:gsp="http://www.opengis.net/ont/geosparql#" xmlns:gml="http://www.opengis.net/gml/3.2" version="3.0" xmlns:ccmm="https://schema.ccmm.cz/research-data/2.0" xmlns:c="https://schemas.dataspecer.com/xsd/core/" xmlns:ns0="https://model.ccmm.cz/vocabulary/ccmm#" xmlns:ns1="http://www.w3.org/ns/adms#" xmlns:ns2="http://www.w3.org/ns/dcat#" xmlns:ns3="http://purl.org/dc/terms/" xmlns:ns4="http://www.w3.org/ns/prov#" xmlns:ns5="https://w3id.org/tib/datacite/property/" xmlns:ns6="http://www.opengis.net/ont/geosparql#">
  <xsl:import href="../metadata-record/lifting.xslt"/>
  <xsl:import href="../identifier/lifting.xslt"/>
  <xsl:import href="../alternate-title/lifting.xslt"/>
  <xsl:import href="../resource-attribution/lifting.xslt"/>
  <xsl:import href="../time-reference/lifting.xslt"/>
  <xsl:import href="../resource-type/lifting.xslt"/>
  <xsl:import href="../language-system/lifting.xslt"/>
  <xsl:import href="../access-rights/lifting.xslt"/>
  <xsl:import href="../subject/lifting.xslt"/>
  <xsl:import href="../description/lifting.xslt"/>
  <xsl:import href="../location/lifting.xslt"/>
  <xsl:import href="../funding-reference/lifting.xslt"/>
  <xsl:import href="../related-resource/lifting.xslt"/>
  <xsl:import href="../distribution-data-service/lifting.xslt"/>
  <xsl:import href="../distribution-downloadable-file/lifting.xslt"/>
  <xsl:import href="../validation-result/lifting.xslt"/>
  <xsl:import href="../provenance-activity/lifting.xslt"/>
  <xsl:import href="../file/lifting.xslt"/>
  <xsl:import href="../application-profile/lifting.xslt"/>
  <xsl:import href="../format/lifting.xslt"/>
  <xsl:import href="../media-type/lifting.xslt"/>
  <xsl:import href="../checksum/lifting.xslt"/>
  <xsl:import href="../licence-document/lifting.xslt"/>
  <xsl:import href="../checksum-algorithm/lifting.xslt"/>
  <xsl:import href="../data-service/lifting.xslt"/>
  <xsl:import href="../documentation/lifting.xslt"/>
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
  <xsl:import href="../geometry/lifting.xslt"/>
  <xsl:import href="../location-relation-type/lifting.xslt"/>
  <xsl:import href="../description-type/lifting.xslt"/>
  <xsl:import href="../subject-scheme/lifting.xslt"/>
  <xsl:import href="../repository/lifting.xslt"/>
  <xsl:output method="xml" version="1.0" encoding="utf-8" media-type="application/rdf+xml" indent="yes"/>
  <xsl:template match="/ccmm:dataset">
    <rdf:RDF>
      <xsl:variable name="result" as="element()*">
        <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742339877323-9dcc-6a36-988a"/>
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
  <xsl:template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742339877323-9dcc-6a36-988a">
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
      <rdf:type rdf:resource="http://www.w3.org/ns/dcat#Dataset"/>
      <xsl:copy-of select="$arc"/>
      <xsl:for-each select="ccmm:metadata_identification">
        <ns0:isDescribedBy>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742339770114-2bc2-3bdc-a309"/>
        </ns0:isDescribedBy>
      </xsl:for-each>
      <xsl:for-each select="ccmm:identifier">
        <ns1:identifier>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1779978617597-db2c-0cbc-9b17"/>
        </ns1:identifier>
      </xsl:for-each>
      <xsl:for-each select="ccmm:version">
        <ns2:version rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns2:version>
      </xsl:for-each>
      <xsl:for-each select="ccmm:title">
        <ns3:title rdf:datatype="http://www.w3.org/2001/XMLSchema#string">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns3:title>
      </xsl:for-each>
      <xsl:for-each select="ccmm:alternate_title">
        <ns0:hasAlternateTitle>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742340187136-c36a-9f4c-b745"/>
        </ns0:hasAlternateTitle>
      </xsl:for-each>
      <xsl:for-each select="ccmm:qualified_attribution">
        <ns4:qualifiedAttribution>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1782311692513-fbfd-95df-9c5a"/>
        </ns4:qualifiedAttribution>
      </xsl:for-each>
      <xsl:for-each select="ccmm:publication_year">
        <ns5:publicationYear rdf:datatype="http://www.w3.org/2001/XMLSchema#gYear">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns5:publicationYear>
      </xsl:for-each>
      <xsl:for-each select="ccmm:time_reference">
        <ns0:hasTimeReference>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1762083331490-ea8b-4a3a-bd65"/>
        </ns0:hasTimeReference>
      </xsl:for-each>
      <xsl:for-each select="ccmm:resource_type">
        <ns3:type>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1747685065285-430a-9d52-9477"/>
        </ns3:type>
      </xsl:for-each>
      <xsl:for-each select="ccmm:primary_language">
        <ns0:hasPrimaryLanguage>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1747685830295-de50-b2ac-bb47"/>
        </ns0:hasPrimaryLanguage>
      </xsl:for-each>
      <xsl:for-each select="ccmm:other_language">
        <ns0:hasOtherLanguage>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1747685830295-de50-b2ac-bb47"/>
        </ns0:hasOtherLanguage>
      </xsl:for-each>
      <xsl:for-each select="ccmm:access_rights">
        <ns3:accessRights>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1747685414671-e5e1-7f82-b427"/>
        </ns3:accessRights>
      </xsl:for-each>
      <xsl:for-each select="ccmm:subject">
        <ns5:subject>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742338662847-61c1-8d4b-b552"/>
        </ns5:subject>
      </xsl:for-each>
      <xsl:for-each select="ccmm:keyword">
        <ns2:keyword rdf:datatype="http://www.w3.org/1999/02/22-rdf-syntax-ns#langString">
          <xsl:apply-templates select="@*"/>
          <xsl:value-of select="."/>
        </ns2:keyword>
      </xsl:for-each>
      <xsl:for-each select="ccmm:description">
        <ns5:description>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1751275345825-1b14-9c39-8e40"/>
        </ns5:description>
      </xsl:for-each>
      <xsl:for-each select="ccmm:location">
        <ns3:spatial>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742235167407-c0c8-51f4-be0a"/>
        </ns3:spatial>
      </xsl:for-each>
      <xsl:for-each select="ccmm:funding_reference">
        <ns5:fundingReference>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742235374506-6369-b2fd-b1bf"/>
        </ns5:fundingReference>
      </xsl:for-each>
      <xsl:for-each select="ccmm:related_resource">
        <ns3:relation>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1765909420903-5abd-5a0e-810e"/>
        </ns3:relation>
      </xsl:for-each>
      <xsl:for-each select="ccmm:distribution">
        <ns2:distribution>
          <xsl:variable name="type" select="resolve-QName(@xsi:type,.)"/>
          <xsl:variable name="types" as="element()*">
            <ccmm:distribution_data_service/>
            <ccmm:distribution_downloadable_file/>
          </xsl:variable>
          <xsl:choose>
            <xsl:when test="$type=node-name($types[1])">
              <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1762011714325-a238-e785-9c3d"/>
            </xsl:when>
            <xsl:when test="*[node-name(.) = node-name($types[1])]">
              <xsl:for-each select="*[node-name(.) = node-name($types[1])]">
                <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1762011714325-a238-e785-9c3d"/>
              </xsl:for-each>
            </xsl:when>
            <xsl:when test="$type=node-name($types[2])">
              <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1762018020967-1861-7f29-8ecd"/>
            </xsl:when>
            <xsl:when test="*[node-name(.) = node-name($types[2])]">
              <xsl:for-each select="*[node-name(.) = node-name($types[2])]">
                <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1762018020967-1861-7f29-8ecd"/>
              </xsl:for-each>
            </xsl:when>
          </xsl:choose>
        </ns2:distribution>
      </xsl:for-each>
      <xsl:for-each select="ccmm:validation_result">
        <ns0:hasValidationResult>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1742288707998-704b-3f0e-8e1a"/>
        </ns0:hasValidationResult>
      </xsl:for-each>
      <xsl:for-each select="ccmm:generated_by">
        <ns4:wasGeneratedBy>
          <xsl:call-template name="_https_003a_002f_002fofn.gov.cz_002fclass_002f1783430654863-c2ef-c58b-8bb9"/>
        </ns4:wasGeneratedBy>
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
        <ns6:asGML rdf:datatype="http://www.opengis.net/gml/3.2#BoundingShapeType">
          <xsl:call-template name="gml-transform-lifting"/>
        </ns6:asGML>
      </xsl:for-each>
      <xsl:for-each select="ccmm:wkt">
        <ns6:asWKT rdf:datatype="http://www.opengis.net/ont/geosparql#wktLiteral">
          <xsl:call-template name="wkt-transform"/>
        </ns6:asWKT>
      </xsl:for-each>
    </rdf:Description>
  </xsl:template>
  <xsl:template match="@*|*"/>
</xsl:stylesheet>
