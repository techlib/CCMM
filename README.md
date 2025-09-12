# Czech Core Metadata Model specification

This repository contains the specification of the Czech Core Metadata Model for research data description modelled in and generated from DataSpecer.
Changes are described in [RELEASE_NOTES](RELEASE_NOTES.md).
DataSpecer generates a schema diagram in bad resolution; therefore, we generated a diagram image in better quality.
![CCMM schema diagram](CCMM-model.png)

The structure of the repository is as follows. For the documentation and publication purposes were created GitHub pages. In each section, there is a link to the published specifications.

The CCMM model is licensed under [CC BY](https://creativecommons.org/licenses/by/4.0/) license.

## cs

Directory /cs contains Czech version of CCMM Application Profile specification. Specification is available on [https://techlib.github.io/CCMM/cs/](https://techlib.github.io/CCMM/cs/).

## en

Directory /en contains English version of CCMM Application Profile specification. Specification is available on [https://techlib.github.io/CCMM/en/](https://techlib.github.io/CCMM/en/).

## XSD representation

The root directory also contains all structured artifacts generated from Dataspecer. There are many subdirectories, one per each element of the data structures. 

Each subdirectory contains structured models formalized in XSD (schema.xsd). The root element for the whole profile is **Dataset**

|Root element|XSD schema|
| - | - | 
|Dataset|[https://techlib.github.io/CCMM/dataset/schema.xsd](https://techlib.github.io/CCMM/dataset/schema.xsd)|

## Sample XML

On [this link](https://github.com/techlib/CCMM/blob/main/ccmm_sample.xml) is located sample XML representation of CCMM metadata. Sample refers to made up air quality data with links and relation to existing resources, introducing most of the usecases that users may encounter.

## Dataspecer project

[Project to open in DataSpecer](https://github.com/techlib/CCMM/blob/main/Czech%20Core%20Metadata%20Model-backup.zip) is also part of the repository. You may import it into your instance of Dataspecer.

## Dataspcer XSD inconsistency

Dataspecer still does not support some features and has some known bugs In the meantime, after generating XSD files from datasoecer, the following changes must be done manually:
1. in license-document, add element iri
    ```
     <xs:sequence>
      <xs:element minOccurs="0" name="iri" type="xs:anyURI"/>
      <xs:element minOccurs="0" maxOccurs="unbounded" name="label" sawsdl:modelReference="http://www.w3.org/2000/01/rdf-schema#label">
        <xs:annotation>
          <xs:documentation xml:lang="en">
            label - Label of the license document.
          </xs:documentation>
        </xs:annotation>
        <xs:complexType>
          <xs:simpleContent>
            <xs:extension base="xs:string">
              <xs:attribute ref="xml:lang" use="required"/>
            </xs:extension>
          </xs:simpleContent>
        </xs:complexType>
      </xs:element>
    </xs:sequence>
    ```

1. in geometry, add gml namespace, import gml, change gml element to ref=gml:AbstractFeature and add srsName to wkt
    ```
    xmlns:gml="http://www.opengis.net/gml/3.2"
    ```

   ``` 
   <xs:import namespace="http://www.opengis.net/gml/3.2"
      schemaLocation="http://schemas.opengis.net/gml/3.2.1/gml.xsd"/>
   ```

   ```
   <xs:element minOccurs="0" maxOccurs="unbounded" ref="gml:AbstractGeometry"
       sawsdl:modelReference="http://www.opengis.net/ont/geosparql#asGML">
       <xs:annotation>
         <xs:documentation xml:lang="en">GML - Representation of
               geometry object as GML Literal.</xs:documentation>
       </xs:annotation>
   </xs:element>
   ```

   ```   
   <xs:element minOccurs="0" maxOccurs="unbounded" name="wkt"
   sawsdl:modelReference="http://www.opengis.net/ont/geosparql#asWKT">
       <xs:annotation>
         <xs:documentation xml:lang="en"> WKT - Representation of geometry
           object as WKT Literal.</xs:documentation>
       </xs:annotation>
       <xs:complexType>
         <xs:simpleContent>
           <xs:extension base="xs:string">
             <xs:attribute name="srsName" type="xs:anyURI" use="optional"/>
           </xs:extension>
         </xs:simpleContent>
       </xs:complexType>
    </xs:element>
    ```
1. in location, add gml namespace, import gml and change bounding-box type to gml:EnvelopeType
   ```
   xmlns:gml="http://www.opengis.net/gml/3.2"
   ```

   ``` 
   <xs:import namespace="http://www.opengis.net/gml/3.2"
      schemaLocation="http://schemas.opengis.net/gml/3.2.1/gml.xsd"/>
   ```

   ```
   <xs:element minOccurs="0" maxOccurs="unbounded" name="bounding_box" type="gml:EnvelopeType"
    sawsdl:modelReference="http://www.w3.org/ns/dcat#bbox">
     <xs:annotation>
       <xs:documentation xml:lang="en"> bounding box - Bounding box of the location geometry.
       </xs:documentation>
     </xs:annotation>
   </xs:element>
   ```

## HTML structure view

The HTML structure view is a web page for fast and convenient browsing of the CCMM metadata model structure. The tree is generated directly from CCMM data using the [generate_html_tree.py](https://github.com/FZU-AV-CR/pyCCMM/blob/master/tools/generate_html_tree.py) tool from the pyCCMM library. The output is published at: https://fzu-av-cr.github.io/pyCCMM/xsd_dataset_full.html.

This view allows interactive expansion and navigation of XSD elements (elements, attributes, groups, occurrences, etc.) and serves as a convenient tool when working with CCMM.

## pyCCMM library

[pyCCMM](https://github.com/FZU-AV-CR/pyCCMM) is a Python module/library that helps to programmatically generate CCMM metadata XML files and work with them (e.g., gradual metadata filling, validation, saving to file). The library is developed by the Institute of Physics of the Czech Academy of Sciences and is available in a separate repository: https://github.com/FZU-AV-CR/pyCCMM.

