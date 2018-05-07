#!/bin/sh

echo "Creating DefaultProfile from default template"
cd /opt/IBM/WebSphere/AppServer
./bin/manageprofiles.sh -create -profileName DefaultProfile -profileTemplate ./profileTemplates/default
./bin/wasservice.sh -add DefaultProfile \
   -serverName server1 \
   -profilePath /opt/IBM/WebSphere/AppServer/profiles/DefaultProfile \
   -wasHome /opt/IBM/WebSphere/AppServer

/etc/init.d/DefaultProfile_was.init start
./bin/wsadmin.sh -lang jython -f /vagrant/config/was_config.py

