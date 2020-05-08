#!/bin/bash

# The main entrypoint to the container
# Load global aliases
source /root/.bashrc

# Make sure apache webroot exists
ensure_dir "$APACHE_WEBROOT"

# Used as a hook to run the bootstrap script of our dev container
if [ -f "/opt/dev/bootstrap.sh" ]; then
  source /opt/dev/bootstrap.sh
fi

# Run project specific bootstrap if required
if [ -f "/opt/bootstrap.sh" ]; then
  source /opt/bootstrap.sh
fi

# Set the correct permissions for the files
set_permissions

# Run the main process
apache2-foreground