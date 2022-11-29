set -e
set -o pipefail

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
