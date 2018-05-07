#!/bin/sh

echo "Installing WAS maving artifacts"
mvn install -f $WAS_POM \
   -DserverInstallationFolder=$WAS_INSTALL_DIR
