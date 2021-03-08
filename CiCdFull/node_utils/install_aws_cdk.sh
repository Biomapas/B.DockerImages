# ------------------------------------------------
# Installs AWS CDK tool. You can supply AWS CDK version
# by either giving it as an argument or setting a
# GLOBAL_AWS_CDK_VERSION global environment variable.
# ------------------------------------------------

set -e
set -o pipefail

aws_cdk_version="$1"

if [ -z "$aws_cdk_version" ]
then

  if [ -z "$GLOBAL_AWS_CDK_VERSION" ]
  then
    aws_cdk_version="latest"
  else
    aws_cdk_version="$GLOBAL_AWS_CDK_VERSION"
  fi

fi

echo "Installing aws-cdk@$aws_cdk_version globally and locally..."

npm install -g "aws-cdk@$aws_cdk_version" --no-save
npm install --prefix . "aws-cdk@$aws_cdk_version" --no-save

echo "Installation of aws-cdk@$aws_cdk_version was successful!"
