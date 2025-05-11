# FaceFusion ROCm Edition

[![ROCm Version](https://img.shields.io/badge/ROCm-6.0-blue)](https://rocm.docs.amd.com)
[![Python 3.10+](https://img.shields.io/badge/Python-3.10%2B-green)](https://python.org)
![License](https://img.shields.io/badge/license-MIT-green)

![FaceFusion Preview](https://raw.githubusercontent.com/facefusion/facefusion/master/.github/preview.png?sanitize=true)

## Table of Contents
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Execution](#execution)
- [GPU Configuration](#gpu-configuration)

## Prerequisites
- Ubuntu 24.04
- ROCm 6.0+ installed
- Python 3.10+
- AMD GPU with ROCm support ([compatibility list](https://rocm.docs.amd.com/en/latest/release/gpu_os_support.html))

## Environment Management
The installation script creates an isolated `.venv_facefusion` environment to prevent conflicts with other Python projects.

## Installation

```bash
# Convert line endings if transferring from Windows
sudo apt install dos2unix -y
dos2unix setup_rocm_facefusion.sh run_rocm_facefusion.sh

# Make scripts executable
chmod +x setup_rocm_facefusion.sh run_rocm_facefusion.sh

# Install dependencies
./setup_rocm_facefusion.sh
```

## Execution

```bash
# Start the application
./run_rocm_facefusion.sh
```

## GPU Configuration
The default configuration assumes AMD Radeon RX 6000/7000 series GPUs. For other architectures:

1. Check your GPU version:
```bash
rocminfo | grep gfx
```

2. Update `HSA_OVERRIDE_GFX_VERSION` in run_rocm_facefusion.sh with your value

Verify ROCm detection in the setup output:
```bash
grep "ROCm available:" setup_rocm_facefusion.sh -A 1 | tail -n 1
# Should output: ROCm available: True
```
This will activate the virtual environment and launch FaceFusion with the default `run` command.

**.gitignore Recommendation:**
```gitignore
.venv_facefusion/
```

## Key Commands
```bash
# Interactive mode
python facefusion.py run

# Batch processing
python facefusion.py batch-run --input-dir inputs/ --output-dir outputs/

# List available GPUs
rocminfo | grep -i 'gfx\|Name'
```

## Documentation
For advanced usage and technical details, visit the [FaceFusion ROCm Documentation](https://docs.facefusion.io/rocm-edition).
