#!/bin/bash

# Usage: ./test_build.sh [2|3]
# Builds package and tests wheel in python 2 and 3
# Add 2 or 3 to test a particular version of python

python setup.py sdist bdist_wheel

FILE=`ls -1 dist/*.whl | tail -n 1`
echo "Verifying build of $FILE"


if [ -z "$1" ] || [ "$1" -eq "3" ]; then
    echo "# Installing virtualenv for Python 3"
    rm -rf 3-sdist  # ensure clean state if ran repeatedly
    virtualenv -p python3 3-sdist
    3-sdist/bin/pip3 install $FILE
    3-sdist/bin/python3 -c'from benchit import BenchIt; b = BenchIt(); b.display()'
fi
