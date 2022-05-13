#!/bin/sh
git clone https://github.com/msitt/blpapi-python
cd blpapi-python
git checkout 516f966b55d3a73dbb95df7ac212e50b9f407193
cp -r examples ..
cd ..
rm -rf blpapi-python
pip3 install --upgrade --index-url=https://bcms.bloomberg.com/pip/simple blpapi
