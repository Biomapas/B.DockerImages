# ------------------------------------------------
# Uploads a package either to PyPi or Gemfury.
# ------------------------------------------------

if [ -n "$GEMFURY_AUTH_W" ] && [ -n "$GEMFURY_ACCOUNT" ]
then
  # For those who are using Gemfury.
  twine upload dist/* --repository-url "https://push.fury.io/$GEMFURY_ACCOUNT/" -u $GEMFURY_AUTH_W -p "" --verbose
else
  # For those who are using PyPi.
  twine upload dist/* -u "$PYPI_USERNAME" -p "$PYPI_PASSWORD" --verbose
fi
