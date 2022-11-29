# ------------------------------------------------
# Tries to install current python package and all dependencies specified in requirements.txt file.
#
# However, this is no ordinary script because it takes into consideration two things:
#
#   1) Gemfury repositories.
#      If Gemfury-related credentials are given, installs dependencies from there.
#
#   2) Current bitbucket branch.
#      If the current branch is not master - a regular installation is being performed.
#      Otherwise pre-releases are installed.
#
# This script should be run only in bitbucket pipelines context.
#
# Q: Why bitbucket pipelines context?
# A: Because when a bitbucket pipeline runs it gets some environment variables set. For example, BITBUCKET_BRANCH.
# ------------------------------------------------

set -e
set -o pipefail

# Pip installation arguments.
args=("--upgrade" "--upgrade-strategy" "eager" "--use-deprecated=legacy-resolver")

# For those who are using Gemfury private repositories, add GEMFURY_AUTH_R and GEMFURY_ACCOUNT environment variables.
if [ -n "$GEMFURY_AUTH_R" ] && [ -n "$GEMFURY_ACCOUNT" ]; then
  args+=("--extra-index-url=https://$GEMFURY_AUTH_R@pypi.fury.io/$GEMFURY_ACCOUNT/")
fi

if [[ $@ == *"--pre"* ]]; then
  args+=("--pre")
fi

pip install -r requirements.txt "${args[@]}"

pip list
