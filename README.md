# Czech Core Metadata Model specification

This repository contains the specification of the Czech Core Metadata Model for description of research data and technical artefacts such as XML and JSON schemas. Vocabulary and profiles were modelled in and technical artifacts and specification was generated from the tool [DataSpecer](https://dataspecer.com/).
Release changes are described in [RELEASE_NOTES](RELEASE_NOTES.md).
DataSpecer generates a schema diagram.
![CCMM schema diagram](d19697d9-b1fe-427a-874b-0a537119a6e7.svg)

For the documentation and publication purposes were created GitHub pages, published in [http://ccmm.cz/](http://ccmm.cz/). Each section contains link to the published specifications.

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

[Metadata samples in XML](https://github.com/techlib/CCMM/tree/main/_metadata-samples/xml) are provided. For example, there is a sample on air quality data with links and a relation to existing resources, introducing most of the use cases users may encounter.

The file [`dataset-mini.xml`](https://github.com/techlib/CCMM/blob/main/_metadata-samples/xml/dataset-mini.xml) provides a minimal valid CCMM dataset example showing only mandatory and conditionally mandatory elements.

## Lifting and lowering

Each class folder ocntains lifting and lowering files, that may be used to enrich the xml data based on the XSD schema by the semantics.

## JSON schema

From the version 2.0.0, JSON schemas and JSON-LD contexts are generated for each class.

## Dataspecer project

[Project to open in DataSpecer](https://github.com/techlib/CCMM/blob/main/Czech%20Core%20Metadata%20Model-backup.zip) is also part of the repository. You may import it into your instance of Dataspecer.
