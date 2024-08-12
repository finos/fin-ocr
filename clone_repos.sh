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
