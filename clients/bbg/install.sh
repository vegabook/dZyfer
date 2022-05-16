#!/bin/sh
rm -rf blpapi-python

git clone https://github.com/msitt/blpapi-python
cd blpapi-python
git checkout 516f966b55d3a73dbb95df7ac212e50b9f407193
cp -r examples ..
cd ..
rm -rf blpapi-python
pip3 install --upgrade --index-url=https://bcms.bloomberg.com/pip/simple blpapi

cd examples
#touch __init__.py
cd demoapps
#touch __init__.py
cd blpapi_import_helper
#touch __init__.py
cd ../snippets
#touch __init__.py
cd ../util
#touch __init__.py
