---
marp: true
title: Learn you an oscal-cli for better security data!
theme: define
paginate: true
---

<!-- _paginate: skip -->
<!-- _class: intro -->

---

## Slides and examples


![bg right 75%](https://github.com/aj-stein-nist/oscal-cli-demo/blob/main/media/img/qrcode_presentation.png?raw=true)

You can download the slides and examples content from [github.com/aj-stein-nist/oscal-cli-demo/releases/](https://github.com/aj-stein-nist/oscal-cli-demo/releases/).

---

## Goals

- Today's presentation has the following goals.
  - Locate, download, and install oscal-cli releases
  - Use the tool for its four high-level functionalities
  - Understand architecture for advanced usage to extend or adapt those features

---

## Non-goals

- We enjoy helping our users, but we won't have time to present today on the topics below.
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

- The oscal-cli ([github.com/usnistgov/oscal-cli](https://github.com/usnistgov/oscal-cli)) is a reference software implementation with four high-level functionalities.
  - Data validator
  - Data converter
  - Data processor
  - Data modeler

---

## Setup for oscal-cli

- The oscal-cli supports mutliple operating systems.
  - Linux
  - macOS
  - Windows

---

## Setup for oscal-cli

- The only prerequisite is a Java runtime.
  - JRE or JDK 11 or newer is required.
  - We use [Eclipse Temurin](https://adoptium.net/temurin/releases/?version=11) to build our releases.

---

## Setup for oscal-cli

- Download the latest release per [the project's instructions](https://github.com/usnistgov/oscal-cli#installing).
  - [Development snapshots](https://oss.sonatype.org/content/repositories/snapshots/gov/nist/secauto/oscal/tools/oscal-cli/cli-core/)
  - [Stable releases](https://repo1.maven.org/maven2/gov/nist/secauto/oscal/tools/oscal-cli/cli-core/)
- Check GPG signature.
- Extract the latest release.
- Check the version and test the install.

---

## Functionalities of oscal-cli

- There are several key points to remember with oscal-cli.
  - The conversion and validation functionalities function the same for all models.
    - `./bin/oscal-cli $modelname convert example.xml --to=json`
    - `./bin/oscal-cli $modelname validate example.xml`
  - Data processing is specific to each model (e.g. only profile resolution at this time).
  - Data modeling is a generic sub-system (with the `oscal-cli metaschema` subcommand).

---

## Data Validation

```sh
./bin/oscal-cli ssp validate /mnt/oscal-cli-demo/content/example_ssp.json
```

```sh
./bin/oscal-cli ssp validate /mnt/oscal-cli-demo/content/example_ssp.xml
```

```sh
./bin/oscal-cli ssp validate /mnt/oscal-cli-demo/content/example_ssp.custom --as=yaml
```

---

## Interpreting Error Messages

```sh
./bin/oscal-cli ssp validate --as=xml /mnt/oscal-cli-demo/content/example_ssp_error.xml 
Validating '/mnt/oscal-cli-demo/content/example_ssp_error.xml' as XML.
Validation identified the following in file '/mnt/oscal-cli-demo/content/example_ssp_error.xml'.
[ERROR] cvc-complex-type.4: Attribute 'state' must appear on element 'implementation-status'.
[file:///mnt/oscal-cli-demo/content/example_ssp_error.xml{260,41}]
[ERROR] cvc-complex-type.4: Attribute 'state' must appear on element 'implementation-status'.
[file:///mnt/oscal-cli-demo/content/example_ssp_error.xml{260,41}]
```

---

## Data Conversion

```sh
 ./bin/oscal-cli ssp convert /mnt/oscal-cli-demo/content/example_ssp.xml --to=json
```

```sh
./bin/oscal-cli ssp convert /mnt/oscal-cli-demo/content/example_ssp.yaml --to=json
```
---

## Data Processing

```sh
./bin/oscal-cli profile resolve /mnt/oscal-cli-demo/content/example_profile.json --to=xml
```

```sh
./bin/oscal-cli profile resolve /mnt/oscal-cli-demo/content/example_profile.xml --to=json
```

---

## Data Modeling

```sh
./bin/oscal-cli metaschema generate-schema /mnt/oscal-cli-demo/content/computer_metaschema.xml --as=json
```

```sh
./bin/oscal-cli metaschema generate-schema /mnt/oscal-cli-demo/content/computer_metaschema.xml --as=xml
```

---

## Data Modeling

```sh
./bin/oscal-cli metaschema validate /mnt/oscal-cli-demo/content/computer_metaschema.xml
```

---

## Data Modeling

```sh
./bin/oscal-cli metaschema validate-content -m=/mnt/oscal-cli-demo/content/computer_metaschema.xml /mnt/oscal-cli-demo/content/computer.xml
```

```sh
./bin/oscal-cli metaschema validate-content -m=/mnt/oscal-cli-demo/content/computer_metaschema.xml /mnt/oscal-cli-demo/content/computer.json
```

---

## Architecture

- The oscal-cli software has a three-layer architecutre.
  - [metaschema-java](https://github.com/usnistgov/metaschema-java)
  - [liboscal-java](https://github.com/usnistgov/liboscal-java/)
  - [oscal-cli](https://github.com/usnistgov/oscal-cli/)

---

## Advanced Usage

- Can I use oscal-cli features in my own software? Yes.
  - Yes, use metaschema-java and liboscal-java.
  - Write your own similar or different oscal-cli alternative.

---

## Giving back to oscal-cli

- How can you help the NIST OSCAL Team with oscal-cli?
  - Use it.
  - Provide feedback at [github.com/usnistgov/oscal-cli](github.com/usnistgov/oscal-cli).
    - Document use cases
    - Report bugs (run commands with `--show-stack-trace`)
    - Request new features
  - Rinse and repeat.

---

## Conclusion and Announcements

- How to keep current and contribute to OSCAL overall?
  - Project website at [pages.nist.gov/OSCAL/](https:/pages.nist.gov/OSCAL/)
  - Code repository at [github.com/usnistgov/OSCAL/](https://github.com/usnistgov/OSCAL)
  - Contribution guidelines at [pages.nist.gov/OSCAL/contribute/](https:/pages.nist.gov/OSCAL/contribute/)
  - Contact methods at [pages.nist.gov/OSCAL/contact/](https://pages.nist.gov/OSCAL/contact/)

---
