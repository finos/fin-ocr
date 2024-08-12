# Financial Focused Optical Character Recognition (FIN-OCR)

A system for performing high quality Optical Character Recognition (OCR) with a focus on financial use cases.

## Overview

This repository documents how to use the *fin-ocr-\** family of repositories to perform OCR.

The *fin-ocr-\** repositories are as follows:

| Name | Description |
| ---- | ----------- |
| [fin-ocr](https://github.com/discoverfinancial/fin-ocr) | Documentation describing the use cases, architecture, and how to get started using the *fin-ocr-\** repositories |
| [fin-ocr-sdk](https://github.com/discoverfinancial/fin-ocr-sdk) | Browser-friendly and mobile-friendly typescript SDK implementing the core OCR functionality.  This SDK uses [opencv.js](https://github.com/TechStark/opencv-js) and [tesseract.js](https://tesseract.projectnaptha.com/) |
| [fin-ocr-web](https://github.com/discoverfinancial/fin-ocr-web) | REST-ful service, which uses the [fin-ocr-sdk](https://github.com/discoverfinancial/fin-ocr-sdk) |
| [fin-ocr-cli](https://github.com/discoverfinancial/fin-ocr-cli) | CLI (command line interface), which uses the [fin-ocr-sdk](https://github.com/discoverfinancial/fin-ocr-sdk) |
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

## Getting Started with fin-ocr

To get started with the `fin-ocr` family of repositories, follow these steps for cloning and setting up the environment on your system.

### Prerequisites

Ensure you have the following installed on your system:

- Git
- Node.js (latest stable version)
- npm (comes with Node.js)

### Clone the Repositories

To set up the `fin-ocr` family of repositories, you can use the provided scripts to clone all necessary repositories into the same directory.

#### On Linux/Mac:
1. Save the script below as `clone_repos.sh` and run it:

    ```bash
    #!/bin/bash

    repos=(
        "https://github.com/discoverfinancial/fin-ocr-sdk"
        "https://github.com/discoverfinancial/fin-ocr-web"
        "https://github.com/discoverfinancial/fin-ocr-cli"
        "https://github.com/discoverfinancial/fin-ocr-browser"
        "https://github.com/discoverfinancial/fin-ocr-train"
    )
    # remove the comments below to use ssh instead
    #repos=(
    #    "git@github.com:discoverfinancial/fin-ocr-sdk.git"
    #    "git@github.com:discoverfinancial/fin-ocr-web.git"
    #    "git@github.com:discoverfinancial/fin-ocr-cli.git"
    #    "git@github.com:discoverfinancial/fin-ocr-browser.git"
    #    "git@github.com:discoverfinancial/fin-ocr-train.git"
    #)

    for repo in "${repos[@]}"; do
        git clone "$repo"
    done

    echo "All repositories cloned successfully."
    ```

2. Run the script:

    ```bash
    chmod +x clone_repos.sh
    ./clone_repos.sh
    ```

#### On Windows:
1. Save the script below as `clone_repos.bat` and run it:

    ```bat
    @echo off

    set repos[0]=https://github.com/discoverfinancial/fin-ocr-sdk
    set repos[1]=https://github.com/discoverfinancial/fin-ocr-web
    set repos[2]=https://github.com/discoverfinancial/fin-ocr-cli
    set repos[3]=https://github.com/discoverfinancial/fin-ocr-browser
    set repos[4]=https://github.com/discoverfinancial/fin-ocr-train

    REM Uncomment the following lines to use SSH instead of HTTPS
    REM set repos[0]=git@github.com:discoverfinancial/fin-ocr-sdk.git
    REM set repos[1]=git@github.com:discoverfinancial/fin-ocr-web.git
    REM set repos[2]=git@github.com:discoverfinancial/fin-ocr-cli.git
    REM set repos[3]=git@github.com:discoverfinancial/fin-ocr-browser.git
    REM set repos[4]=git@github.com:discoverfinancial/fin-ocr-train.git

    for %%i in (0,1,2,3,4) do (
        git clone !repos[%%i]!
    )

    echo All repositories cloned successfully.
    pause
    ```

2. Double-click the script to execute.

### Setting Up Each Repository

After cloning the repositories, navigate to each repository's directory and follow the instructions in their respective README files for further setup. For example:

1. `fin-ocr-sdk`:
   - Run `npm install` to install dependencies.
   - Run `npm run build` to build the SDK.

2. `fin-ocr-web`:
   - Run `npm install` to install dependencies.
   - Run `npm run build` to build the web service.

3. `fin-ocr-cli`:
   - Run `npm install` to install dependencies.
   - Run `npm run build` to build the CLI.

4. `fin-ocr-browser`:
   - Run `npm install` to install dependencies.
   - Run `npm run build` to build the browser demo.

5. `fin-ocr-train`:
   - Follow the training instructions in the repository's README.

### Exploring the OCR System

Once you've set up the repositories, you can start exploring some of the following:

1. **Using the CLI:**
   - Learn how to install and use the CLI [here](https://github.com/discoverfinancial/fin-ocr-cli?tab=readme-ov-file#fin-ocr-cli).
   - This is the best way to *kick the tires* so that you can see how the OCR of check images works.  You can scan a single check image, or you can test, measure the accuracy of, and debug multiple checks which have been extracted from [X9 files](https://www.frbservices.org/binaries/content/assets/crsocms/financial-services/check/setup/frb-x937-standards-reference.pdf).

2. **Running the REST Service:**
  - Learn how to install and run the REST service [here](https://github.com/discoverfinancial/fin-ocr-web?tab=readme-ov-file#fin-ocr-web).
  - The REST service makes the SDK usable from any language, providing an easy-to-use API for performing OCR of check images.
  - The [CLI](https://github.com/discoverfinancial/fin-ocr-cli?tab=readme-ov-file#fin-ocr-cli) can also function as a client to the REST service.

3. **Training Tesseract:**
  - Learn how tesseract was trained and how you can retrain tesseract for the [MICR E13B font](https://en.wikipedia.org/wiki/Magnetic_ink_character_recognition#E-13B) by looking at [MICR training with real checks](https://github.com/discoverfinancial/fin-ocr-train/blob/main/real/README.md#micr-training-with-real-checks).
  - Even though training with real checks gave us the best results, also see [training tesseract with synthethic data](https://github.com/discoverfinancial/fin-ocr-train/blob/main/synthetic/README.md#tesseract-auto-training).  This will be useful to train tesseract for other use cases in which a sufficient volume of real data is not available.

4. **Using the SDK Directly:**
  - View the [SDK sample code](https://github.com/discoverfinancial/fin-ocr-sdk?tab=readme-ov-file#sample-code) for examples of how to use the SDK directly. This is useful for building mobile or browser applications.
  - Also, see the [browser demo application](https://github.com/discoverfinancial/fin-ocr-browser?tab=readme-ov-file#fin-ocr-browser-based-demo-application) for a sample browser application.

5. **Developer's Guide:**
  - If you're a developer and want to understand the OCR processing performed by the SDK better, see the [Developer's Guide](./DEV_GUIDE.md).

## Contributing

Get involved!  Our project welcomes passionate contributors.

Whether it is improving the OCR accuracy for bank checks, adding support for other use cases, or making other enhancements or improvements, we welcome the collaboration and innovation that the open source community provides.  The goal is to provide the best OCR software, for everyone, for free.

See the [Project Contribution Guide](./CONTRIBUTE.md) for more information.

## Additional Information

* [Architectural Overview](./ARCHITECTURE.md)
* [Maintainers](./MAINTAINERS.md)
