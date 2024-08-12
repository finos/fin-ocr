@echo off

FOR %%r IN (
    "https://github.com/discoverfinancial/fin-ocr-sdk"
    "https://github.com/discoverfinancial/fin-ocr-web"
    "https://github.com/discoverfinancial/fin-ocr-cli"
    "https://github.com/discoverfinancial/fin-ocr-browser"
    "https://github.com/discoverfinancial/fin-ocr-train"
    REM "git@github.com:discoverfinancial/fin-ocr-sdk.git"
    REM "git@github.com:discoverfinancial/fin-ocr-web.git"
    REM "git@github.com:discoverfinancial/fin-ocr-cli.git"
    REM "git@github.com:discoverfinancial/fin-ocr-browser.git"
    REM "git@github.com:discoverfinancial/fin-ocr-train.git"
) DO (
    git clone %%r
)

echo All repositories cloned successfully.
pause
