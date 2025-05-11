#!/bin/bash
set -e
python3 -m venv .venv_facefusion --system-site-packages=false
source .venv_facefusion/bin/activate
pip install --upgrade pip
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/rocm6.0
pip install -r requirements.txt --no-deps
echo "Verifying ROCm support..."
python -c "import torch; print(f'ROCm available: {torch.cuda.is_available()}')"
