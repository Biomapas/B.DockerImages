# ------------------------------------------------
# Returns the name of the branch that was merged to the current branch via pull-request.
#
# This script can only be used in a bitbucket pipelines context and only when the pipeline
# was triggered by a merge from a pull request.
#
# Q: Why bitbucket pipelines context?
# A: Because when a bitbucket pipeline runs it gets some environment variables set. For example,
#    BITBUCKET_BRANCH on which the pipeline is run, BITBUCKET_COMMIT which kicked off the pipeline,
#    BITBUCKET_WORKSPACE and BITBUCKET_REPO_SLUG in which this pipeline runs.
# ------------------------------------------------

import os

import requests

# All of these environment variables are presented to you in bitbucket_utils pipelines context.
# Read more: https://support.atlassian.com/bitbucket-cloud/docs/variables-and-secrets/.
current_branch = os.environ['BITBUCKET_BRANCH']
current_commit = os.environ['BITBUCKET_COMMIT']
current_workspace = os.environ['BITBUCKET_WORKSPACE']
current_repository = os.environ['BITBUCKET_REPO_SLUG']

# Do not provide your real password here. Use app password.
# Read more: https://support.atlassian.com/bitbucket-cloud/docs/app-passwords/.
bitbucket_username = os.environ['BITBUCKET_USERNAME']
bitbucket_password = os.environ['BITBUCKET_PASSWORD']

# We are calling Bitbucket API get pull requests endpoint.
# Documentation: https://developer.atlassian.com/bitbucket/api/2/reference/resource/repositories/%7Bworkspace%7D/%7Brepo_slug%7D/pullrequests#get.
response = requests.get(
    url=(
        f'https://api.bitbucket.org/2.0/repositories/'
        f'{current_workspace}/{current_repository}/pullrequests?'
        f'state=MERGED'
    ),
    auth=(bitbucket_username, bitbucket_password)
)

# According to documentation, these error responses are possible.
if response.status_code in [401, 404]:
    raise Exception('Unauthenticated or resources non-existent.')

merged_pull_requests = response.json()['values']
debug = []

for request in merged_pull_requests:
    merge_hash = request['merge_commit']['hash']
    destination_branch = request['destination']['branch']['name']
    source_branch = request['source']['branch']['name']

    debug.append(f'{source_branch}, {destination_branch}, {merge_hash}')

    if current_commit.startswith(merge_hash):
        if destination_branch == current_branch:
            print(source_branch)
            exit(0)

debug = '\n'.join(debug)

raise Exception(
    f'Pull request source branch could not be found. '
    f'Did you forget about pull requests? '
    f'Context: Current branch: {current_branch}, Debug data:\n{debug}.'
)
