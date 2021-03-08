# ------------------------------------------------
# Simply runs npm install command.
# ------------------------------------------------

echo "Running npm install..."

npm install --loglevel verbose --no-save

echo "Npm installation has finished successfully!"
echo "Listing all npm dependencies..."

npm list
