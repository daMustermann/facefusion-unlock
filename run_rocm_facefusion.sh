#!/bin/bash
set -e
source .venv_facefusion/bin/activate
# Verify GPU version with 'rocminfo' and adjust if needed
export HSA_OVERRIDE_GFX_VERSION=10.3.0
export HIP_VISIBLE_DEVICES=0
python facefusion.py
