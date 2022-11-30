set -e
set -o pipefail

# For situations where pre-release versions of python libraries is required, a --pre flag can be provided.
# This script also adds a suffix to the package version that is deployed into GEMFURY.
args=("")
if [[ $@ == *"--pre"* ]]; then
  args+=("--pre")
  echo ".dev" >>VERSION
fi

# If a virtual environment directory is already present, simply source it.
if [ -d "./venv" ]; then
  source venv/bin/activate
# However, if virtual environment is not present, create it, and then source it.
else
  source /usr/local/python_utils/new_venv.sh
  /usr/local/magic_utils/magic_pip_install.sh "${args[@]}"
fi

python setup.py sdist
/usr/local/python_utils/twine_upload.sh "dist/*" "GEMFURY"
