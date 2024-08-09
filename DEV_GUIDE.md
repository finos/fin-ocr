# FIN OCR DEVELOPER'S GUIDE

This document is a developer's guide for the fin-ocr repositories.

It provides a tutorial to guide you through the following tasks:
1. [How to set up your developer environment](#how-to-set-up-your-developer-environment)
1. [How to determine the reason for a check mismatch](#how-to-determine-the-reason-for-a-check-mismatch)
1. [How to train and test with a new tesseract traineddata file](#how-to-train-and-test-with-a-new-tesseract-traineddata-file)
1. [How to improve the accuracy of the opencv translator](#how-to-improve-the-accuracy-of-the-opencv-translator)

### How to set up your developer environment

Clone the following repositories into the same parent directory:
* [SDK](https://github.com/discoverfinancial/fin-ocr-sdk)
* [CLI](https://github.com/discoverfinancial/fin-ocr-cli)

Let **SDK-DIR** refer to the local SDK cloned directory and **CLI-DIR** refer to the local CLI cloned directory.

Build the SDK by executing `npm run build` in the SDK-DIR directory.

Build and install the CLI by executing `npm run build && npm install -g .` in the CLI-DIR directory.

Make sure the CLI installed successfully by executing the `ocr` command.  You should see a usage message similar to the following:
```
 $ ocr
Usage: ocr check scan <path-to-check-image>
           check test <checkNum> [<numChecks>]
           check debug <comma-separated-list-of-check-nums>
           check preprocess <output-dir> <checkNum> [<numChecks>]
           buildFiles [<dir>]
```

### How to determine the reason for a check mismatch

This section provides a tutorial to help you determine the reason for a sample check mismatch.  See the check at `CLI-DIR/data/check-1.tiff` that we will debug.  

> NOTE: At the time of writing this documentation, this check is not correctly OCR'ed.  As the SDK improves, this mismatch may no longer occur; however, this will still serve as a useful debugging example.

From your CLI-DIR directory, execute the following command:
```
CHECKS_DIR=./data/checks ocr check test 1
```

Note that the `CHECKS_DIR` environment variable points to the `./data/checks` directory which contains the file `check-1.tiff` and the ground truth in `check-1.json`.

You will see that a mismatch occurs for this check from the following lines of output (assuming SDK improvements have not already fixed this):
```
...
2024-07-30T11:41:43.897Z inf cli Check 1: match=false (0.00%)
2024-07-30T11:41:43.898Z inf cli Mismatches: [1]
...
```

Next, use the following command to determine why the mismatch occurred.
```
CHECKS_DIR=./data/checks ocr check debug 1
```

> NOTE: If there were multiple checks to debug at the same time, you could provide a comma-separated list of check numbers as was logged by the `ocr check test` command.

The output from the `ocr check debug` command includes the following:
```
...
2024-07-30T11:23:07.746Z inf ocr-sdk Scanning check 1
2024-07-30T11:23:10.618Z inf cli Debug images are available at html/debugImages.html
```

Open the file `html/debugImages.html` in your browser
and then click on `check 1`.  This will take you to an HTML page containing a sequence of images (e.g. 1 through 67) which demonstrate the steps taken by the SDK when performing OCR on the check image.

The first image is the original image being processed.

If you scroll to the bottom, you'll see the "MICR" line that was located.

> NOTE: See the [architecture diagram](https://github.com/discoverfinancial/fin-ocr/blob/main/ARCHITECTURE.md) and note that the "Core OCR" process occurs in two phases: first a preprocessing phase and second the translation phase.

If the MICR line was not properly located, then the problem occurred in the preprocessing phase, so you'll want to look at previous images to determine why the location logic failed.  For example, in this case, the MICR line includes extra noise to the left of the first MICR character as well as to the right of the last MICR character.  This tells us to look at previous images which reveals that the wavy background lines which are in the original image have been accentuated and confused the location logic.

If the MICR line was correctly located but one or both of the translators failed, then the problem occurred in one of the translators, which tells us where to focus.

### How to train and test with a new tesseract traineddata file

See [training tesseract](https://github.com/discoverfinancial/fin-ocr-train?tab=readme-ov-file#training-tesseract) for tools and information regarding how to train tesseract.  Once training is complete, you will want to test the accuracy with your new traineddata file to see if it has improved.

In your CLI-DIR, you'll see a `set-td` script.  You can use this to set the path to the newly generated `micr-e13b.traineddata` file as follows:
```
set-td "<path-to-the-traineddata-file>"
```

This simply sets a symbolic link in the current directory to this file so that the CLI can find and use it.  You may then use the `ocr check test` command to re-measure the accuracy.  In this case, it is recommended that you test with only the tesseract translator by using the OCR_TRANSLATORS environment variable as follows:
```
OCR_TRANSLATORS=tesseract ocr check test ...
```
This allows you to measure the accuracy using only tesseract and can therefore help to isolate the level of improvement or degredation when using the new traineddata file.

### How to improve the accuracy of the opencv translator

Suppose that the opencv translator correctly locates a specific character but it incorrectly translates that character.  You can improve the accuracy of the opencv translator to recognize that character as follows.

1. Add two files to the [cli corrections directory](https://github.com/discoverfinancial/fin-ocr-cli/tree/main/files/corrections).  The prefix of these two files must be the same and the suffices must be '.tif' and '.ct', respectively.

   For example, the file `check-2-char-18.tif` contains the TIFF image of the character which the opencv translator incorrectly translated, and the file `check-2-char-18.ct` contains "7:1" where "7" is the character that is on the `check-2-char-18.tif` image and "1" is the number of contours in the character.

2. From the CLI-DIR directory, run the following command:
   ```
   ocr buildFiles ../fin-ocr-sdk/src
   ```

   This builds a new version of the `fin-ocr-sdk/src/files.ts` containing the new image and ground truth file.

3. From your SDK-DIR directory, rebuild the SDK as follows:
   ```
   npm run build
   ```

4. From your CLI-DIR directory, rebuild and reinstall the ocr command as follows:
   ```
   npm run build
   npm install -g .
   ```

5. You may now retry the `ocr check debug` and `ocr check test` commands to further debug and/or to re-measure the accuracy, respectively.