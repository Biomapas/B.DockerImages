# ------------------------------------------------
# Prepares a new fresh environment by creating a new python
# virtual environment and installing aws cdk tool. Sets a consistent
# global prefix that is used to deploy consistent test infrastructures.
# And lastly executes tests.
# ------------------------------------------------

set -e
set -o pipefail

path_to_tests="$1"

# If a virtual environment directory is already present, simply source it.
if [ -d "./venv" ]; then
  source venv/bin/activate
# However, if virtual environment is not present, create it, and then source it.
else
  source /usr/local/python_utils/new_venv.sh
  /usr/local/magic_utils/magic_pip_install.sh
fi

/usr/local/node_utils/install_aws_cdk.sh
source /usr/local/magic_utils/magic_global_prefix.sh
source /usr/local/python_utils/clean_python.sh

pytest "$path_to_tests"
