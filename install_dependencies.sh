#!/bin/bash
git submodule init
git submodule update
uv venv .venv --seed --python 3.12
uv pip install --upgrade pip
uv pip install setuptools wheel # --seed not working in some cases
VLLM_USE_PRECOMPILED=1 uv pip install --editable . -vv --torch-backend auto
