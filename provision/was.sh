#!/bin/sh

INSTALL_MANAGER_PATH=/home/vagrant/InstallationManager

echo "Installing IBM Installation Manager"
mkdir $INSTALL_MANAGER_PATH
unzip /vagrant/external/IBMInstallationManager.zip -d $INSTALL_MANAGER_PATH

cd $INSTALL_MANAGER_PATH
./installc -log /vagrant/logs/ibmim_log.txt -acceptLicense
cd /opt/IBM/InstallationManager/eclipse

echo "Creating IBM Credentials"
./tools/imutilsc saveCredential \
    -url http://www.ibm.com/software/repositorymanager/entitled/repository.xml \
    -secureStorageFile $INSTALL_MANAGER_PATH/secure_storage_file \
    -userName $IBM_ID \
    -userPassword $IBM_PASS \
    -preferences com.ibm.cic.common.core.preferences.ssl.nonsecureMode=true

echo "Installing Websphere"
./IBMIM \
    input $IBMIM_INPUT_FILE \
    --launcher.ini silent-install.ini \
    -log /vagrant/logs/was_install_log.txt \
    -acceptLicense \
    -secureStorageFile $INSTALL_MANAGER_PATH/secure_storage_file \
    -showProgress \
    -ShowVerboseProgress

