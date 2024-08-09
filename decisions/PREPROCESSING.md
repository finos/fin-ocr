# Preprocessing: Use OpenCV 

* Status: accepted
* Deciders: Keith Smith
* Date: 2023-09-07

## Context and Problem Statement

There are two phases required to perform Optical Character Recognition:
* preprocessing - this includes things like removing noise, performing skew correction, and locating the text to be translated in the next phase;
* translation - this phase takes the preprocessed image and returns the text that was found on the image.

So what do we use for the image preprocessing phase?

## Decision Drivers

* Widely used and mature
* Supported in javascript
* Free opensource with appropriate license
* Works as an embedded library
* Browser and mobile friendly
* As light weight as possible

## Considered Options

1. OpenCV
2. Google Cloud Vision API (not embedded or lightweight)
3. Scikit-Image (python but not javascript)
4. Keras-OCR (very heavy weight and requires GPU)

## Decision Outcome

Chosen option: OpenCV

### Positive Consequences

* Rich functionality
* Widely used and mature
* Javascript/typescript API wrappering native code
* Free opensource with good license
* Browser and mobile friendly
* Relatively light-weight

### Negative Consequences

* Wrappers native code.  Depending on the platform required and size restraints for browser and mobile, OpenCV may require a custom build.

## Pros and Cons of the Options

2. Google Cloud Vision API (not embedded or lightweight)
3. Scikit-Image (python but not javascript)
4. Keras-OCR (very heavy weight and requires GPU)

### OpenCV

* Pro: Meets all of the requirements
* Con: Wrappers native code, so depending on the platform required, it may require custom builds to minimize and optimize for browser and/or mobile.

### Google Cloud Vision API 

* Pro: Didn't evaluate accuracy due to not meeting embedded requirement
* Con: not embedded and not lightweight

### Scitkit-Image

* Pro: Seems to be light-weight and used a good bit
* Con: Not available in javascript

### Keras-OCR

* Pro: Reported as being accurate
* Con: Extremely heavy-weight and requires GPUs

## Links

None
