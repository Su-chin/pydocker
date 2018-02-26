#!/bin/sh -eu

USERNAME={root}
PROJECTNAME={todo}
BASE_PATH=`dirname $0`
userid=`id --user`
DOCKERFILE=${BASE_PATH}/Dockerfile
IMAGENAME=$PROJECTNAME
ARG_UID="--build-arg uid=${userid}"
ARG_USERNAME="--build-arg username=${USENAME}"
ARG_PROJECTNAME="--build-arg project=${PROJECTNAME}"
DOCKER_DEBUG=""
NAMESPACE=`whoami`
DOCKERTAG=""

if [ ${userid} -lt 500 ] ; then
	uid=""
fi

while getopts t:dr OPT
do
	case $OPT in
		d)
			IMAGENAME=${IMAGENAME}_test
			DOCKER_DEBUG="-build-arg debug=-d"
			;;
		t) DOCKERTAG=":$OPTARG" ;;
	esac
done

#django
docker build ${ARG_UID} ${ARG_PROJECTNAME} ${ARG_USERNAME} ${DOCKER_DEBUG} -t ${NAME} ${NAMESPACE}/${IMAGENAME}${DOCKERTAG} --force-rm -f ${DOCKERFILE} ${BASE_PATH}../..