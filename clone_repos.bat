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
