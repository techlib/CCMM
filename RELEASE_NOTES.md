CHANGELOG
---------------------------------------
### 2026-08-28 - Profiling CCMM to DCAT-AP
* profiling properties through DCAT-AP (instead of final resources)
* respecting cardinalities of DCAT-AP
* dividing subjects to subjects (from controlled vocabulary) and keyword (plain string)
* reprofiling of distributions according to the DCAT-AP
* attaching licenses and access rights directly to specific classes (and removing terms of use class)
* changed relationship to attribution (between resource and agent)
* creator and publisher roles are mandatory for dataset attribution (bugfix)
* new language properties for primary/other language
* namespaces changed to version 1.2
* repository has mandatory attribution with publisher role
* added provenance activity to describe origin of dataset, removed provenance statement
* datacite was reprofiled to official datacite linked data representation
* added JSON schema and JSON-LD contexts
* added abstract and introduction into the specification

### 2026-02-27 - minor changes
* added SHACL file
* added configuration for generating structure in extensions
* added ttl representation of classes
* cleaning deprecated artifactsa from older versions of Dataspecer

### 2025-12-18 - Official release 1.1.0
* minor changes in definitions, cardinalities and profiled classes of multiple CCMM classes,
* added more samples,
* enhanced extensibility,
* changes in hierarchy of abstract classes in XSD,
* removing anonynous types from XSD,
* handling multilinguality.

### 2025-12-12 - Minor changes
* added optional attribute to identifier

### 2025-11-21 - Minor changes
* identified problems in XSD generation in Dataspecer, solved manually
* sample XML files edited to be valid according to the 1.1.0 XSDs

### 2025-10-21 - Minor changes
* solved issues from milestone 1.1.0

### 2025-09-02 - Minor changes
* changing order of elements in XML and XSD

### 2025-08-04 - Minor release 1.0.1
* published sample XML metadata file
* minor changes in structure (added label etc.)
* updated representation of abstract geometry in location
* XSDs under namespace https://schema.ccmm.cz/research-data/1.1


### 2025-07-25 - Minor changes, bug fixes
* XSD schemas got namespaces
* bug fixes

### 2025-06-30 - Official release 1.0.0
* base IRI changed to https://model.ccmm.cz/research-data/
* definitions and usage notes updated and synced for the best possible understanding of end-users
* fixed minor issues 
* enhanced support for spatial representations 
* support for both date and date time 
* JSON schema is not supported at the time due to the technical issues


### 2025-05-20 - Major release
* probably last publication before official release
* compact use of indentifiers and agents
* codelists as separate classes
* detailed attributes for address (according to INSPIRE core location ontology)
* minor bug fixes

### 2025-04-24 - Bug fixes
* bugs forcing users to edit XSD partially fixed

### 2025-04-22 - Major release
* XSDs generated from DataSpecer
* Specification and artifacts generated from Dataspecer https://github.com/mff-uk/dataspecer/commit/51d46a9d87ab5e5258299e548664b7d97a51dc51
* resolving issues regarding MD content
* CCMM profiled newly from CCMM vocabulary (available from here: https://EOSC-CZ.github.io/CCMM-V/en/model.owl.ttl)

### 2025-04-03 - Minor changes
* resolving GH issues
* minor changes in content

### 2025-03-19 - Minor changes
* Changes in data and structures in order to fulfil requirements of Invenio
* Manual changes in XSDs 

### 2025-03-08 - Initial release
* Imported CCMM specification with XSD artifacts generated from DataSpecer 
