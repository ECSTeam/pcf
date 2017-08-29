#!/bin/bash -ex

# get "pcf" script required command line utilities

# echo "installing sudo"
# apt-get install sudo

# echo "install ruby"
# apt-get -y install ruby-full

# BOSH
# echo "installing bosh"
# gem install bosh_cli --no-ri --no-rdoc

curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary" | tar -zx -C /usr/local/bin
# curl -L 'https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64' -o /usr/local/bin/jq && chmod +x /usr/local/bin/jq

# CF
# echo "installing cf"
# wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add -
# echo "deb http://packages.cloudfoundry.org/debian stable main" | tee /etc/apt/sources.list.d/cloudfoundry-cli.list
# apt-get -y update
# apt-get -y install cf-cli

# UAAC
echo "installing uaac"
gem install cf-uaac

jq
echo "installing jq"
apt-get install jq

# Do something useful

echo "running tests"
cmd=./pcf-repo/pcf

$cmd alias test-name -n $OPSMAN_HOST -u $OPSMAN_USERNAME -p $OPSMAN_PASSWORD -o $CF_ORG -s $CF_SPACE

$cmd target test-name
$cmd targets
