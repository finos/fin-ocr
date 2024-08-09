# Translation: Use Tesseract and OpenCV with a pluggable architecture

* Status: accepted
* Deciders: Keith Smith
* Date: 2023-09-07

## Context and Problem Statement

There are two phases required to perform Optical Character Recognition:
* preprocessing - this includes things like removing noise, performing skew correction, and locating the text to be translated in the next phase;
* translation - this phase takes the preprocessed image and returns the text that was found on the image.

So what do we use for the translation phase?

## Decision Drivers

* High degree of accuracy
* Widely used and mature
* Supported in javascript
* Free opensource with appropriate license
* Works as an embedded library
* Browser and mobile friendly
* As light weight as possible

## Considered Options

1. Tesseract
2. Google Cloud Vision API (not embedded or lightweight)
3. Scikit-Image (python but not javascript)
4. Keras-OCR (very heavy weight and requires GPU)

## Decision Outcome

Chosen option: Use both Tesseract and a custom-built OpenCV-based translator

### Positive Consequences

* Pluggable translator architecture, for future extensibility
* Increased accuracy with multiple translators
* Multiple translator for increasing accuracy
* Widely used and mature
* Javascript/typescript API wrappering native code
* Free opensource with good license
* Browser and mobile friendly
* Relatively light-weight

### Negative Consequences

* Multiple translators can be confusing
* Tesseract is not well documented

### Tesseract

* Pro: Meets all of the requirements.  Does better with signature overlap than the custom-built translator alone.
* Con: Was not simple to train, and not well-documented.

### OpenCV

* Pro: Well understood and extensible, and can learn dynamically.
* Con: Doesn't handle signature overlap at all.

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
