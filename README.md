# Financial Focused Optical Character Recognition (FIN-OCR)

A system for performing high quality Optical Character Recognition (OCR) with a focus on financial use cases.

## Overview

This repository documents how to use the *fin-ocr-\** family of repositories to perform OCR.

The *fin-ocr-\** repositories are as follows:

| Name | Description |
| ---- | ----------- |
| [fin-ocr](https://github.com/discoverfinancial/fin-ocr) | Documentation describing the use cases, architecture, and how to get started using the *fin-ocr-\** repositories |
| [fin-ocr-sdk](https://github.com/discoverfinancial/fin-ocr-sdk) | Browser-friendly and mobile-friendly typescript SDK implementing the core OCR functionality, using opencv and tesseract |
| [fin-ocr-web](https://github.com/discoverfinancial/fin-ocr-web) | REST-ful service using the [fin-ocr-sdk](https://github.com/discoverfinancial/fin-ocr-sdk) |
| [fin-ocr-cli](https://github.com/discoverfinancial/fin-ocr-cli) | CLI (command line interface) using the [fin-ocr-sdk](https://github.com/discoverfinancial/fin-ocr-sdk) |
| [fin-ocr-browser](https://github.com/discoverfinancial/fin-ocr-browser) | Demo browser application using the [fin-ocr-sdk](https://github.com/discoverfinancial/fin-ocr-sdk) to scan check images from a webcam | 
| [fin-ocr-train](https://github.com/discoverfinancial/fin-ocr-train) | Tools and documentation for training tesseract using real or synthetic data |

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

## Getting Started

In order to get started, choose from the following options.

1. Learn how to install and use the CLI [here](https://github.com/discoverfinancial/fin-ocr-cli?tab=readme-ov-file#fin-ocr-cli).

   This is the best way to *kick the tires* so that you can see how the OCR of check images works.  You can scan a single check image, or you can test, measure the accuracy of, and debug multiple checks which have been extracted from [X9 files](https://www.frbservices.org/binaries/content/assets/crsocms/financial-services/check/setup/frb-x937-standards-reference.pdf).

2. Learn how to install and run the REST service [here](https://github.com/discoverfinancial/fin-ocr-web?tab=readme-ov-file#fin-ocr-web).

   The REST service makes the SDK usable from any language.  It provides an easy-to-use REST API to perform OCR of check images.  The [CLI](https://github.com/discoverfinancial/fin-ocr-cli?tab=readme-ov-file#fin-ocr-cli) can also function as a client to the REST service as described [here](https://github.com/discoverfinancial/fin-ocr-cli?tab=readme-ov-file#how-to-use-the-cli-as-a-client-for-the-rest-service).
   
3. Learn how tesseract was trained and how you can retrain tesseract for the [MICR E13B font](https://en.wikipedia.org/wiki/Magnetic_ink_character_recognition#E-13B) by looking at [MICR training with real checks](https://github.com/discoverfinancial/fin-ocr-train/blob/main/real/README.md#micr-training-with-real-checks).

   And even though training with real checks gave us the best results, also see [training tesseract with synthethic data](https://github.com/discoverfinancial/fin-ocr-train/blob/main/synthetic/README.md#tesseract-auto-training).  This will be useful to train tesseract for other use cases in which a sufficient volume of real data is not available.

4. Learn how to use the SDK directly by viewing the [SDK sample code](https://github.com/discoverfinancial/fin-ocr-sdk?tab=readme-ov-file#sample-code).  The SDK is used by both the [CLI](https://github.com/discoverfinancial/fin-ocr-cli?tab=readme-ov-file#fin-ocr-cli) and the [REST service](https://github.com/discoverfinancial/fin-ocr-web?tab=readme-ov-file#fin-ocr-web), but you may want to use it directly for another use case such as building a mobile or browser application.  Also, see the [browser demo application](https://github.com/discoverfinancial/fin-ocr-browser?tab=readme-ov-file#fin-ocr-browser-based-demo-application) for a sample browser application.

5. If you are a developer and want to understand the OCR processing that is performed by the [SDK](https://github.com/discoverfinancial/fin-ocr-sdk) better, see the [Developer's Guide](./DEV_GUIDE.md).

## Contributing

Get involved!  Our project welcomes passionate contributors.

Whether it is improving the OCR accuracy for bank checks, adding support for other use cases, or making other enhancements or improvements, we welcome the collaboration and innovation that the open source community provides.  The goal is to provide the best OCR software, for everyone, for free.

See the [Project Contribution Guide](./CONTRIBUTE.md) for more information.

## Additional Information

* [Architectural Overview](./ARCHITECTURE.md)
* [Maintainers](./MAINTAINERS.md)
