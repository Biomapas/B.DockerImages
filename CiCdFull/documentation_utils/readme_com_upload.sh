# ------------------------------------------------
# Uploads Swagger (OpenAPI) documentation to readme.com website.
#
# The script accepts 3 variables (that must be set):
#   1. Api specification ID (which can be found within readme.com account).
#   2. Api Key (which can be found within readme.com account).
#   1. Specification file (auto-generated or manually created Swagger-OpenAPI documentation file).
# ------------------------------------------------

set -e
set -o pipefail

api_specification_id="$1"
api_key="$2"
specification_file="$3"

username_password=$( printf "%s" "${api_key}:" | base64 )
basic_auth="Basic $username_password"

curl --request PUT \
     --url "https://dash.readme.com/api/v1/api-specification/$api_specification_id" \
     --header "Accept: application/json" \
     --header "Authorization: $basic_auth" \
     --header "Content-Type: multipart/form-data" \
     --form "spec=@$specification_file"
