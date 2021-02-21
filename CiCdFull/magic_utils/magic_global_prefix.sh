# ------------------------------------------------
# Sets an environment variable called GLOBAL_PREFIX.
#
# If the BITBUCKET_PR_ID is set, it means that this pipeline was kicked-off by a created or update pull request.
# In this case a pull request branch hash is returned.
#
# Otherwise it means that this pipeline was kicked-off by a branch merge to ths branch.
# In this case a fancy calculation is performed to determine the name of the branch that was merged to this branch.
# A hash of that branch is returned.
#
# Q: So what?
# A: It is useful to have a consistent piece of string that ties the pull request branch with the branch that the
#    pull request was merged into. With that said, it does not matter if a pipeline was triggered by a pull request
#    or by a merge to a branch - the same hash should be set as a GLOBAL_PREFIX ensuring consistency. With this
#    information, you can, for example, refer to the same external resource.
#
# This script should be run only in bitbucket pipelines context.
#
# Q: Why bitbucket pipelines context?
# A: Because when a bitbucket pipeline runs it gets some environment variables set. For example,
#    BITBUCKET_PR_ID and BITBUCKET_BRANCH.
# ------------------------------------------------

set -e
set -o pipefail

this_script_path=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [ -z "$BITBUCKET_PR_ID" ]
then
  branch=$( source "$this_script_path/../bitbucket_utils/get_merged_pull_request_branch.sh" )
else
  branch=$BITBUCKET_BRANCH
fi

prefix=$( echo -n $branch | sha256sum )

echo DEBUG: branch: "$branch"
echo DEBUG: prefix "$prefix"

export GLOBAL_PREFIX="$prefix"
