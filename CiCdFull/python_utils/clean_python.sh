# ------------------------------------------------
# Cleans current directory from python-based garbage like:
# python bytecode, pycache, builds, etc.
# ------------------------------------------------

# Ask python to not produce pycache.
export PYTHONDONTWRITEBYTECODE=1

# Find all python caches and metadata files. Delete all of them.
find . -type f -name "*.py[co]" -delete
find . -type d -name "__pycache__" -exec rm -rf {} +
find . -type d -name "*.egg-info" -exec rm -rf {} +

# This removal of dist-info directories can actually break some of the libraries.
# Try not to delete them.
# find . -type d -name "*.dist-info" -exec rm -rf {} +
