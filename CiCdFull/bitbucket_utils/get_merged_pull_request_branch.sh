# ------------------------------------------------
# Calls a python script to retrieve the name of the branch
# that was merged to the current branch via pull-request.
# It acts simply as a wrapper.
# ------------------------------------------------

set -e
set -o pipefail

this_script_path=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
result=$( python3 $this_script_path/get_merged_pull_request_branch.py )

echo $result
