# ------------------------------------------------
# Checks whether the given "from" branch is the current branch
# and whether the given "to" branch is the PR destination branch.
#
# This script can only be used in a bitbucket pipelines context
# and only when the pipeline was triggered by a pull request because of necessary
# $BITBUCKET_BRANCH and $BITBUCKET_PR_DESTINATION_BRANCH environment values.
# ------------------------------------------------

set -e
set -o pipefail

from_branch=$1
to_branch=$2

current_pr_branch=$BITBUCKET_BRANCH
pr_destination_branch=$BITBUCKET_PR_DESTINATION_BRANCH

if [ "$from_branch" = "$current_pr_branch" ] && [ "$to_branch" == "$pr_destination_branch" ]
then
  echo 1
else
  echo 0
fi
