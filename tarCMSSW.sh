#!/bin/bash

outdir=$(realpath $1)

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

if [[ ! $1 ]]
then
echo "USAGE: tarCMSSW.sh <output dir> \nMust be run from a CMSSW environment"
exit
fi

if [[ $CMSSW_VERSION == "" ]]
then
echo "Must be run in CMSSW environment"
exit -2
fi
if [ ! -d $outdir ]
then
echo "Output directory must exists"
exit -1
fi


targetfile=$outdir/$CMSSW_VERSION.tar
excludefile=$SCRIPT_DIR/tarCMSSW_exclude_fromtar.txt 

if [ -e $targetfile ]
then
echo "${targetfile} already exists, exit."
exit
fi


echo "Creating tarball for ${CMSSW_VERSION}. This can take about half an hour or more"

cd $CMSSW_RELEASE_BASE
cd ..

tar -X $excludefile -chf $targetfile $CMSSW_VERSION

echo "Tarball for ${CMSSW_VERSION} created at ${targetfile}"
