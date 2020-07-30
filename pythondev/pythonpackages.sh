#!/bin/bash
/usr/bin/python3 -m pip install -U pylint --user
/usr/bin/python3 -m pip install -U black --user
/usr/bin/python3 -m pip install -U autopep8 --user
/usr/bin/python3 -m pip install -U mypy bandit pylama prospector yapf --user
