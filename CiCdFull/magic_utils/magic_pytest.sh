# ------------------------------------------------
# Prepares a new fresh environment by creating a new python
# virtual environment and installing aws cdk tool. Sets a consistent
# global prefix that is used to deploy consistent test infrastructures.
# And lastly executes tests.
# ------------------------------------------------

set -e
set -o pipefail

path_to_tests="$1"

source /usr/local/python_utils/new_venv.sh
/usr/local/node_utils/install_aws_cdk.sh
/usr/local/magic_utils/magic_pip_install.sh
source /usr/local/magic_utils/magic_global_prefix.sh
source /usr/local/python_utils/clean_python.sh

pytest "$path_to_tests"
