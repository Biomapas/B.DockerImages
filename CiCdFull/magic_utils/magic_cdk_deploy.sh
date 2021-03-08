# ------------------------------------------------
# Prepares fresh environment and executed AWS CDK deploy command.
# ------------------------------------------------

set -e
set -o pipefail

source /usr/local/python_utils/new_venv.sh
/usr/local/node_utils/install_aws_cdk.sh
/usr/local/magic_utils/magic_pip_install.sh
source /usr/local/python_utils/clean_python.sh

./node_modules/aws-cdk/bin/cdk bootstrap
./node_modules/aws-cdk/bin/cdk deploy "*"
