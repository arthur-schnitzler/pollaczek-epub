# bin/bash

# get pollaczek-data

rm -rf editions
wget https://github.com/arthur-schnitzler/pollaczek-data/archive/refs/heads/main.zip
unzip main.zip

mv pollaczek-data-main/data/editions editions/
rm main.zip
rm -rf ./pollaczek-data-main
