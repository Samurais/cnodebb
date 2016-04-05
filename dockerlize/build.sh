#! /bin/bash 
###########################################
# Build Client Image for songni
###########################################

# constants
baseDir=$(cd `dirname "$0"`;pwd)

## Get app version
## CIT_ID=`git rev-parse HEAD` # long version
CIT_ID=`cd $baseDir && git log --pretty=format:'%h' -n 1` # short version

# functions

# main 
[ -z "${BASH_SOURCE[0]}" -o "${BASH_SOURCE[0]}" = "$0" ] || return
cd $baseDir/..

eval "$(docker-machine env docker-default)"

docker build --build-arg CNODEBB_CIT_ID=$CIT_ID \
    --build-arg CNODEBB_ROLE=application \
    --force-rm=true \
    --tag arrking/cnodebb:$CIT_ID \
    --file="Dockerfile.cnodebb" .

docker tag -f arrking/cnodebb:$CIT_ID arrking/cnodebb:latest
