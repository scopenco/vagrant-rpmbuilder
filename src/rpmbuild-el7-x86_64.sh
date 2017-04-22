#!/bin/bash
#===============================================================================
#
#          FILE:  rpm-build.sh
# 
#   DESCRIPTION:  create rpm and sync to repo
# 
#        AUTHOR:  Andrei Skopenko andrei@skopenko.net
#===============================================================================

PATH=/sbin:/usr/sbin:/bin:/usr/bin:/usr/local/sbin:/usr/local/bin
set -e
export LC_ALL=C
BUILD_PATH="$HOME/rpmbuild"
MOCK_ENV="epel-7-x86_64"
RESULT_PATH="/var/lib/mock/$MOCK_ENV/result"

#-----------------------------------------------------------------------
#  Check running by root
#-----------------------------------------------------------------------
if [ "$(id -u)" == "0" ]; then
   echo "build.sh should not be run as root" 1>&2
   exit 1
fi

#-----------------------------------------------------------------------
#  Check number of command line arguments
#-----------------------------------------------------------------------
if [ $# -lt 1 ];then
    echo -e "\n\tUsage:  ${0##/*/} path_to_file.spec [sync]\n"
    exit 1
fi

#-----------------------------------------------------------------------
#  Sync files to Artifactory
#-----------------------------------------------------------------------
sync_files()
{
    echo done
}

SPEC_FILE="$1"
if [ ! -f $SPEC_FILE ]; then
    echo "$SPEC_FILE not found!"
    exit 1
fi

SPEC_SYNC="$2"
if [[ $SPEC_SYNC == sync ]]; then
    sync_files
    exit 0
fi

set -x
#-----------------------------------------------------------------------
#  create rpmbuild env
#-----------------------------------------------------------------------
mkdir -p  $BUILD_PATH/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
cat >> ~/.rpmmacros << END
%_topdir %(echo \$HOME)/rpmbuild
%el7 1
%rhel 7
END

#-----------------------------------------------------------------------
#  build rpms
#-----------------------------------------------------------------------
spectool -g -C $BUILD_PATH/SOURCES/ $SPEC_FILE
rsync -aqz $(dirname $SPEC_FILE)/ $BUILD_PATH/SOURCES/
if [ -d $RESULT_PATH ]; then
    find $RESULT_PATH -type f | xargs rm -rf
fi
/usr/bin/mock --clean -r $MOCK_ENV
/usr/bin/mock -r $MOCK_ENV --buildsrpm --spec $SPEC_FILE --sources $BUILD_PATH/SOURCES --no-clean
/usr/bin/mock -r $MOCK_ENV --rebuild --no-clean $RESULT_PATH/*.src.rpm
