#!/bin/bash


#
# Install Openshift CLI 
#

curl -k `sed 's/api/downloads-openshift-console.apps/' <<< $BRIDGE_API_ADDRESS | sed 's|:6443|/amd64/linux/oc.tar|'` -o oc.tar   
tar -xvf oc.tar
cp ./oc /usr/bin/oc

#
# login and patch
#

export NO_HEADLESS=true && export CHROME_VERSION=$(/usr/bin/google-chrome-stable --version)

oc login -u kubeadmin -p $BRIDGE_KUBEADMIN_PASSWORD $BRIDGE_API_ADDRESS
oc apply -f /src/console/frontend/integration-tests/data/htpasswd-secret.yaml
oc patch oauths cluster --patch "$(cat /src/console/frontend/integration-tests/data/patch-htpasswd.yaml)" --type=merge


#
# Run Tests
#
yarn run test-cypress-devconsole-headless
