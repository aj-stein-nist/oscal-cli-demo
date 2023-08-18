---
marp: true
theme: define
paginate: true
---

# What is oscal-cli? How do I use it?

<!-- _paginate: skip -->
<!-- _class: intro -->

---

## Introduction

---

## Goals

Today's presentation has the following goals.
- Locate, download, and install oscal-cli releases
- Use the tool for its four high-level features
- Understand architecture for advanced usage to extend or adapt those features

---

## Non-goals

We enjoy helping our users, but we won't have time to present today on the topics below.
- Setup of oscal-cli prerequisities
- Writing Java to extend or adapt oscal-cli
- Advanced OSCAL usage patterns with or without the oscal-cli

---

## Who is this for?

  - Software developers
  - System engineers
  - Technologists
  - Others welcome (but more to learn)

---

## What is OSCAL?

"OSCAL is a set of formats expressed in XML, JSON, and YAML. These formats provide machine-readable representations of control catalogs, control baselines, system security plans, and assessment plans and results."

\- [OSCAL's website](https://pages.nist.gov/OSCAL/)

---

## What is oscal-cli?

- OSCAL is a set of data formats.
- Software uses data formats.
- So what kind of software is oscal-cli?

---

## What is oscal-cli?

The oscal-cli ([github.com/usnistgov/oscal-cli](https://github.com/usnistgov/oscal-cli)) is a reference software implementation with four high-level functionalities.

- Data validator
- Data converter
- Data processor
- Data modeler

---

## Setup for oscal-cli

It supports mutliple operating systems.
- Linux
- macOS
- Windows

---

## Setup for oscal-cli

The only prerequisite is a Java runtime.
- JRE or JDK 11 or newer is required.
- We use [Eclipse Temurin](https://adoptium.net/temurin/releases/?version=11) to build our releases.

---

## Setup for oscal-cli

- Download the latest release per [the project's instructions](https://github.com/usnistgov/oscal-cli#installing).
  - [Development snapshots](https://oss.sonatype.org/content/repositories/snapshots/gov/nist/secauto/oscal/tools/oscal-cli/cli-core/)
  - [Stable releases](https://repo1.maven.org/maven2/gov/nist/secauto/oscal/tools/oscal-cli/cli-core/)
- Extract the latest release.
- Check the version and test the install.

---

## Features of oscal-cli

There several key points to remember with oscal-cli.
- The conversion and validation features function the same for all models.
  - `./bin/oscal-cli $modelname convert example.xml --to=json`
  - `./bin/oscal-cli $modelname validate example.xml`
- Data processing is specific to each model (e.g. only profile resolution at this time).
- Data modeling is a generic sub-system (with the `oscal-cli metaschema` subcommand).

---

## Data Validation

```
./bin/oscal-cli ssp validate example-ssp.json
```

```
./bin/oscal-cli ssp validate example-ssp.xml
```

```
./bin/oscal-cli ssp validate example-ssp.custom --as=yaml
```


---

## Data Conversion

```
 ./bin/oscal-cli ssp convert example-ssp.xml --to=json
```

```
./bin/oscal-cli ssp convert example-ssp.yaml --to=json
```
---

## Data Processing

```
./bin/oscal-cli profile resolve example_profile.json --to=xml
```

```
./bin/oscal-cli profile resolve example_profile.xml --to=json
```

---

## Data Modeling

```
./bin/oscal-cli metaschema generate-schema computer-metaschema.xml --as=json
```

```
./bin/oscal-cli metaschema generate-schema computer-metaschema.xml --as=xml
```

---

## Data Modeling

```
./bin/oscal-cli metaschema validate computer_metaschema.xml --as=xml
```

---

## Data Modeling

```
./bin/oscal-cli metaschema validate-content -m=computer_metaschema.xml computer.xml
```

```
./bin/oscal-cli metaschema validate-content -m=computer_metaschema.xml computer.json
```

---

## Architecture

The oscal-cli software has a three-layer architecutre.
- [metaschema-java](https://github.com/usnistgov/metaschema-java)
- [liboscal-java](https://github.com/usnistgov/liboscal-java/)
- [oscal-cli](https://github.com/usnistgov/oscal-cli/)

---

## Advanced Usage

Can I use oscal-cli features in my own software? Yes.
- Yes, use metaschema-java and liboscal-java.
- Write your own similar or different oscal-cli alternative.

---

## Giving back to oscal-cli

How can you help the NIST OSCAL Team with oscal-cli?
- Use it.
- Provide feedback at [github.com/usnistgov/oscal-cli](github.com/usnistgov/oscal-cli).
  - Document use cases
  - Report bugs (run commands with `--show-stack-trace`)
  - Request new features
- Rinse and repeat.

---

## Conclusion and Announcements

- How to keep current and contribute?
  - Project website at [pages.nist.gov/OSCAL/](https:/pages.nist.gov/OSCAL/)
  - Code repository at [github.com/usnistgov/OSCAL/](https://github.com/usnistgov/OSCAL)
  - Contribution guidelines at [pages.nist.gov/OSCAL/contribute/](https:/pages.nist.gov/OSCAL/contribute/)
  - Contact methods at [pages.nist.gov/OSCAL/contact/](https://pages.nist.gov/OSCAL/contact/)

---

<style>
  section {
    font-size: 1.2em;
  }
  h1 {
    font-size: 3em;
  }
  h2 {
    font-size: 2em;
  }
  blockquote {
    color: #FF8C00;
    font-weight: bold;
    font-style: italic;
    font-size: 1.5em;
  }
  header {
    color: #333;
    font-weight: bold;
    font-size: 1.5em;
    background-color: #fff;
    width: 100%;
    left:0;
    top:0;
    padding:10px;
  }
</style>
