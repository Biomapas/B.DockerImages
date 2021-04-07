# ------------------------------------------------
# Uploads a package either to PyPi or Gemfury depending
# on a supplied parameter (GEMFURY or PYPI).
# ------------------------------------------------

upload_path="$1"
upload_destination="$2"

# In case of Gemfury.
if [ "$upload_destination" = "GEMFURY" ]; then
  if [ -n "$GEMFURY_AUTH_W" ] && [ -n "$GEMFURY_ACCOUNT" ]; then
    twine upload "$upload_path" --repository-url "https://push.fury.io/$GEMFURY_ACCOUNT/" -u $GEMFURY_AUTH_W -p "" --verbose
  else
    echo "Upload destination was indicated as Gemfury, however necessary credentials not set."
    exit 1
  fi

  exit 0
fi

# In case of PYPI.
if [ "$upload_destination" = "PYPI" ]; then
  if [ -n "$PYPI_USERNAME" ] && [ -n "$PYPI_PASSWORD" ]; then
    twine upload "$upload_path" -u "$PYPI_USERNAME" -p "$PYPI_PASSWORD" --verbose
  else
    echo "Upload destination was indicated as PyPi, however necessary credentials not set."
    exit 1
  fi

  exit 0
fi

echo "Unspecified or unsupported upload destination."
exit 1
