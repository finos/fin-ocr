[![FINOS - Incubating](https://cdn.jsdelivr.net/gh/finos/contrib-toolbox@master/images/badge-incubating.svg)](https://community.finos.org/docs/governance/Software-Projects/stages/incubating) [![Contributors-Invited](https://img.shields.io/badge/Contributors-Wanted-blue)](./CONTRIBUTE.md)

# Financial Focused Optical Character Recognition (FIN-OCR)

A system for performing high quality Optical Character Recognition (OCR) with a focus on financial use cases.

## Overview

The FIN-OCR sdk is designed to handle a variety of financial document processing tasks. The sdk is capable of extracting MICR lines from check images, supporting both individual check processing and large-scale batch processing through X9 files.

### Key Features

1. **Check inclearing support**
   - FIN-OCR supports X9 files, allowing you to extract and process check images from these files efficiently. This capability is ideal for financial institutions that need to process large volumes of check images quickly and accurately.
     - To process X9 files with FIN-OCR:
       - Install and configure the [fin-ocr-cli](https://github.com/finos/fin-ocr-cli)
       - Use the CLI to extract check images from X9 files.

2. **Browser and Node.js Support**
   - **Embeddable SDK**
     FIN-OCR provides a flexible SDK that can be embedded in both browser and Node.js environments. This allows developers to integrate OCR capabilities directly into web applications or backend services.

## Repository Breakdown

The *fin-ocr-\** repositories are structured to support a wide range of use cases and implementations:

| Name | Description |
| ---- | ----------- |
| [fin-ocr](https://github.com/finos/fin-ocr) | Documentation describing the use cases, architecture, and how to get started using the *fin-ocr-\** repositories |
| [fin-ocr-sdk](https://github.com/finos/fin-ocr-sdk) | Browser-friendly and mobile-friendly typescript SDK implementing the core OCR functionality.  This SDK uses [opencv.js](https://github.com/TechStark/opencv-js) and [tesseract.js](https://tesseract.projectnaptha.com/) |
| [fin-ocr-rest](https://github.com/finos/fin-ocr-rest) | REST-ful service, which uses the [fin-ocr-sdk](https://github.com/finos/fin-ocr-sdk) |
| [fin-ocr-cli](https://github.com/finos/fin-ocr-cli) | CLI (command line interface), which uses the [fin-ocr-sdk](https://github.com/finos/fin-ocr-sdk) |
| [fin-ocr-browser](https://github.com/finos/fin-ocr-browser) | Demo browser application using the [fin-ocr-sdk](https://github.com/finos/fin-ocr-sdk)  |
| [fin-ocr-train](https://github.com/finos/fin-ocr-train) | Tools and documentation for training tesseract using real or synthetic data |

#### Use cases
The initial use case solved by this group of repositories is as follows:

* Provide a REST-ful service which takes a bank check image as input and returns (in JSON format) the routing, account, and check number from the MICR line, with a high degree of accuracy.  The initial accuracy as measured on 20000 checks is 97.81%.

It is both possible and encouraged to extend the capabilities to support additional use cases.  The *fin-ocr-\** repositories have been designed with this in mind.

For example, additional use cases might include support for:
* different media (e.g. credit card, driver's license, passport, or other document types);
* different types of applications (e.g. additional REST-ful endpoints, a mobile application, and/or a browser application);
* different ways of inputting data (e.g. device camera, video input device, or video data files);
* a learning mode in which human input is accepted as a means of dynamically improving the accuracy of the OCR engine;
* or other features.

### Exploring FIN-OCR

1. **Running the Demo:**
   - Quickly experiment with the OCR capabilities of the SDK by running the [demo](https://github.com/finos/fin-ocr-browser)
   - Features:
     - **Manual OCR Processing:** Easily perform OCR on any check image by manually uploading it within the demo.
     - **Check Scanner Simulation:** Capture video input from your device's webcam, simulating the behavior of a check scanner in banking apps. The application detects the presence of a check in the camera feed and performs OCR on the relevant portions of the check.

2. **Using the CLI:**
   - Learn how to install and use the CLI [here](https://github.com/finos/fin-ocr-cli?tab=readme-ov-file#fin-ocr-cli).
   - This is the best way to *kick the tires* so that you can see how the OCR of check images works.  You can scan a single check image, or you can test, measure the accuracy of, and debug multiple checks which have been extracted from [X9 files](https://www.frbservices.org/binaries/content/assets/crsocms/financial-services/check/setup/frb-x937-standards-reference.pdf).

3. **Running the REST Service:**
   - Learn how to install and run the REST service [here](https://github.com/finos/fin-ocr-rest?tab=readme-ov-file#fin-ocr-rest).
   - The REST service makes the SDK usable from any language, providing an easy-to-use API for performing OCR of check images.
   - The [CLI](https://github.com/finos/fin-ocr-cli?tab=readme-ov-file#fin-ocr-cli) can also function as a client to the REST service.

4. **Training Tesseract:**
   - Learn how tesseract was trained and how you can retrain tesseract for the [MICR E13B font](https://en.wikipedia.org/wiki/Magnetic_ink_character_recognition#E-13B) by looking at [MICR training with real checks](https://github.com/finos/fin-ocr-train/blob/main/real/README.md#micr-training-with-real-checks).
   - Even though training with real checks gave us the best results, also see [training tesseract with synthethic data](https://github.com/finos/fin-ocr-train/blob/main/synthetic/README.md#tesseract-auto-training).  This will be useful to train tesseract for other use cases in which a sufficient volume of real data is not available.

5. **Using the SDK Directly:**
   - View the [SDK sample code](https://github.com/finos/fin-ocr-sdk?tab=readme-ov-file#sample-code) for examples of how to use the SDK directly. This is useful for building mobile or browser applications.
   - Also, see the [browser demo application](https://github.com/finos/fin-ocr-browser?tab=readme-ov-file#fin-ocr-browser-based-demo-application) for a sample browser application.

6. **Developer's Guide:**
   - If you're a developer and want to understand the OCR processing performed by the SDK better, see the [Developer's Guide](./DEV_GUIDE.md).

## Roadmap

Whether it is improving the OCR accuracy for bank checks, adding support for other use cases, or making other enhancements or improvements, we welcome the collaboration and innovation that the open source community provides.

## Contributing

For any questions, bugs or feature requests please open an [issue](https://github.com/finos/fin-ocr/issues) For anything else please send an email to {project mailing list}.

To submit a contribution:

Fork it (<https://github.com/finos/fin-ocr/fork>)
Create your feature branch (git checkout -b feature/fooBar)
Read our contribution guidelines and Community Code of Conduct
Commit your changes (git commit -am 'Add some fooBar')
Push to the branch (git push origin feature/fooBar)
Create a new Pull Request
NOTE: Commits and pull requests to FINOS repositories will only be accepted from those contributors with an active, executed Individual Contributor License Agreement (ICLA) with FINOS OR who are covered under an existing and active Corporate Contribution License Agreement (CCLA) executed with FINOS. Commits from individuals not covered under an ICLA or CCLA will be flagged and blocked by the FINOS Clabot tool (or EasyCLA). Please note that some CCLAs require individuals/employees to be explicitly named on the CCLA.

Need an ICLA? Unsure if you are covered under an existing CCLA? Email help@finos.org

## License

Copyright 2024 Discover Financial Services

Distributed under the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0).

SPDX-License-Identifier: [Apache-2.0](https://spdx.org/licenses/Apache-2.0)

## Additional Information

* [Architectural Overview](./ARCHITECTURE.md)
* [Maintainers](./MAINTAINERS.md)
